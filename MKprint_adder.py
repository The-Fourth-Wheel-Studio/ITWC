import os
import re

def process_gd_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    # Vérifier si _scriptName est déjà présent dans le script
    script_name_already_present = False
    for line in lines:
        if line.strip().startswith("static var _scriptName : String ="):
            script_name_already_present = True
            break

    # Récupérer le nom du fichier
    script_name = os.path.basename(file_path)

    # Trouver l'endroit où insérer la ligne après `class_name` et `extends`
    insert_index = 0
    class_found = False
    for i, line in enumerate(lines):
        trimmed_line = line.strip()
        if trimmed_line.startswith("class_name ") or trimmed_line.startswith("extends "):
            insert_index = i + 1  # Insérer après la dernière occurrence de class_name ou extends
            class_found = True

    # Vérification de l'héritage : si le script hérite d'une autre classe, on doit gérer _scriptName en conséquence
    parent_class = None
    for line in lines:
        if line.strip().startswith("extends "):
            parent_class = line.strip().split(" ")[1]
            break

    if parent_class:
        # Vérifier si _scriptName existe déjà dans la classe parente
        parent_file = os.path.join(os.getcwd(), f"{parent_class}.gd")
        if os.path.exists(parent_file):
            with open(parent_file, 'r', encoding='utf-8') as parent_f:
                parent_lines = parent_f.readlines()
                parent_has_script_name = any("static var _scriptName" in parent_line for parent_line in parent_lines)
                if parent_has_script_name:
                    # Si la classe parente a _scriptName, ne pas ajouter dans l'enfant
                    print(f"The member '_scriptName' already exists in parent class {parent_class}. Overriding in {file_path}.")
                else:
                    # Si la classe parente n'a pas _scriptName, on peut l'ajouter dans l'enfant
                    if not script_name_already_present:
                        lines.insert(insert_index, f'static var _scriptName : String = "{script_name}"\n')
                        print(f"Added _scriptName in {file_path}")
            return  # Nous avons déjà fait le travail pour la classe parente, pas besoin de continuer ici

    # Ajouter la ligne _scriptName si elle n'est pas déjà présente dans ce script
    if not script_name_already_present:
        lines.insert(insert_index, f'static var _scriptName : String = "{script_name}"\n')
        print(f"Added _scriptName in {file_path}")

    # Modifier les appels à MKUtil.print() pour inclure _scriptName comme second argument
    for i, line in enumerate(lines):
        match = re.search(r'MKUtil\.print\((.*?)\)', line)
        if match:
            args = match.group(1).strip()

            # Vérifier si _scriptName est déjà un argument
            if "_scriptName" not in args:
                # Préparer une version propre des arguments pour ajouter _scriptName comme second argument
                args_list = args.split(",")
                args_list = [arg.strip() for arg in args_list]

                # Si plus d'un argument est trouvé, on l'ajoute en tant que dernier argument
                if len(args_list) > 1:
                    new_args = f'{args}, _scriptName'
                else:
                    # Dans le cas où il y a une seule expression, on concatène "_scriptName" à la fin
                    new_args = f'{args}, _scriptName'

                # Remplacer l'ancien appel avec le nouveau format
                lines[i] = line.replace(args, new_args)
                print(f"Updated MKUtil.print in {file_path}: {new_args}")

    # Réécrire le fichier avec les modifications
    with open(file_path, 'w', encoding='utf-8') as f:
        f.writelines(lines)
        print(f"Written updated content to {file_path}")

def scan_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".gd"):
                process_gd_file(os.path.join(root, file))

if __name__ == "__main__":
    current_directory = os.getcwd()  # Utiliser le dossier courant
    scan_directory(current_directory)
    print("Modification terminée !")
