import os

def add_script_name_to_file(file_path):
    with open(file_path, 'r+') as file:
        lines = file.readlines()
        script_name_added = False
        print_argument_added = False
        class_name_found = False

        for i, line in enumerate(lines):
            # Vérifier si class_name a été trouvé pour un placement correct de _scriptName
            if 'class_name' in line:
                class_name_found = True

            # Ajouter la variable _scriptName après extends ou class_name
            if not script_name_added and (class_name_found or 'extends' in line):
                if 'class_name' in line or 'extends' in line:
                    lines.insert(i + 1, f"static var _scriptName : String = \"{os.path.basename(file_path)}\"\n")
                    script_name_added = True
            
            # Ajouter _scriptName à MKUtil.print(v) s'il n'est pas déjà présent
            if 'MKUtil.print(' in line and '_scriptName' not in line:
                line = line.rstrip()  # Supprimer les espaces à la fin de la ligne
                line = line.rstrip(')')  # Enlever la parenthèse fermante pour la modifier
                line += f', _scriptName )\n'  # Ajouter _scriptName avant la parenthèse fermante
                lines[i] = line

        # Sauvegarder les modifications dans le fichier
        file.seek(0)
        file.writelines(lines)

def scan_directory_for_gd_files(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.gd'):
                file_path = os.path.join(root, file)
                add_script_name_to_file(file_path)

if __name__ == '__main__':
    current_directory = os.getcwd()
    scan_directory_for_gd_files(current_directory)
