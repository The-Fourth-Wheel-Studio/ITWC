import os
import re

def process_gd_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    # Vérification et ajout de _scriptName dans la déclaration (après extends et class_name)
    script_name_already_present = False
    script_name = os.path.basename(file_path)

    # Trouver l'endroit où insérer la déclaration après `extends` ou `class_name`
    insert_index = 0
    class_found = False
    for i, line in enumerate(lines):
        trimmed_line = line.strip()
        if trimmed_line.startswith("class_name ") or trimmed_line.startswith("extends "):
            insert_index = i + 1  # Insérer après la dernière occurrence de class_name ou extends
            class_found = True

    # Vérifier si _scriptName est déjà présent dans ce script
    for line in lines:
        if line.strip().startswith("static var _scriptName : String ="):
            script_name_already_present = True
            break

    # Ajouter _scriptName si il n'est pas déjà présent et qu'on a trouvé class_name ou extends
    if not script_name_already_present and class_found:
        lines.insert(insert_index, f'static var _scriptName : String = "{script_name}"\n')
        print(f"Added _scriptName in {file_path} after class_name or extends")

    # Gérer les appels MKUtil.print() en ajoutant _scriptName avant la dernière parenthèse fermante
    for i, line in enumerate(lines):
        # Chercher les lignes qui commencent par MKUtil.print
        if line.strip().startswith("MKUtil.print"):
            # Trouver l'index de la dernière parenthèse fermante
            open_parentheses = 0
            close_parentheses = 0
            for idx, char in enumerate(line):
                if char == '(':
                    open_parentheses += 1
                elif char == ')':
                    close_parentheses += 1
                if open_parentheses == close_parentheses:
                    last_parenthesis_idx = idx
                    break

            # Extraire la partie entre les parenthèses
            start_idx = line.index('(') + 1
            end_idx = last_parenthesis_idx
            args = line[start_idx:end_idx].strip()

            # Vérifier si _scriptName est déjà un argument
            if "_scriptName" not in args:
                # Ajouter _scriptName comme second argument juste avant la dernière parenthèse fermante
                if args:
                    new_args = f'{args}, _scriptName'
                else:
                    new_args = '_scriptName'

                # Construire la nouvelle ligne avec _scriptName ajouté
                new_line = line[:start_idx] + new_args + line[end_idx:]
                lines[i] = new_line
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
