import os
import re

def add_script_name_to_gd_file(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    script_name = os.path.basename(file_path).replace('.gd', '')

    # Vérifier si la ligne avec _scriptName existe déjà
    script_name_line = f"static var _scriptName : String = \"{script_name}\""
    if any(script_name_line in line for line in lines):
        return

    header_added = False
    new_lines = []
    header_end_index = -1

    # Parcourir les lignes du fichier pour trouver le header et déterminer où insérer _scriptName
    for i, line in enumerate(lines):
        if not header_added:
            stripped_line = line.strip()
            
            # Vérifier si l'une des composantes du header est présente
            if stripped_line.startswith('@icon') or stripped_line.startswith('@tool') or stripped_line.startswith('extends') or stripped_line.startswith('class_name'):
                new_lines.append(line)
                header_end_index = i  # Garder une trace de la dernière ligne du header
            elif stripped_line == "":
                # Si une ligne vide est rencontrée après le header, ajouter _scriptName ici
                if header_end_index != -1:
                    new_lines.append(f"static var _scriptName : String = \"{script_name}\"\n")
                    header_added = True
                new_lines.append(line)
            else:
                new_lines.append(line)
        else:
            new_lines.append(line)

    # Si le header n'a pas été trouvé, ajouter _scriptName en haut
    if not header_added:
        new_lines.insert(0, f"static var _scriptName : String = \"{script_name}\"\n")

    # Modifier les appels MKUtil.print(v) pour y ajouter _scriptName
    for i, line in enumerate(new_lines):
        if 'MKUtil.print(' in line:
            # Ajouter _scriptName avant la dernière parenthèse fermante
            new_lines[i] = re.sub(r'(MKUtil\.print\([^\)]*)\)', r'\1, _scriptName)', line)

    # Écrire les modifications dans le fichier
    with open(file_path, 'w') as file:
        file.writelines(new_lines)

def scan_and_modify_files(root_dir):
    for root, dirs, files in os.walk(root_dir):
        for file in files:
            if file.endswith('.gd'):
                file_path = os.path.join(root, file)
                add_script_name_to_gd_file(file_path)

# Exécution du script sur le répertoire courant
scan_and_modify_files(os.getcwd())
