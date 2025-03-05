import os
import re

def process_gd_file(file_path):
	with open(file_path, 'r', encoding='utf-8') as f:
		lines = f.readlines()

	# Vérifier si _scriptName est déjà présent
	for line in lines:
		if line.strip().startswith("var _scriptName : String ="):
			script_name_already_present = True
			break
	else:
		script_name_already_present = False

	# Récupérer le nom du fichier
	script_name = os.path.basename(file_path)

	# Trouver l'endroit où insérer la ligne après `class_name` et/ou `extends`
	insert_index = 0
	for i, line in enumerate(lines):
		trimmed_line = line.strip()
		if trimmed_line.startswith("class_name ") or trimmed_line.startswith("extends "):
			insert_index = i + 1  # Insérer après la dernière occurrence trouvée

	# Ajouter la ligne _scriptName si elle n'est pas déjà présente
	if not script_name_already_present:
		lines.insert(insert_index, f'static var _scriptName : String = "{script_name}"\n')

	# Modifier les appels à MKUtil.print() pour inclure _scriptName comme second argument
	for i, line in enumerate(lines):
		match = re.search(r'MKUtil\.print\((.*?)\)', line)
		if match:
			args = match.group(1).strip()

			# Vérifier si _scriptName est déjà un argument
			if "_scriptName" not in args:
				# Préparer une version propre des arguments pour ajouter _scriptName comme second argument
				# Nous devons repérer correctement les concaténations et les arguments multiples
				args_list = args.split(",")
				args_list = [arg.strip() for arg in args_list]

				# Si plus d'un argument est trouvé, on l'ajoute en tant que dernier argument
				if len(args_list) > 1:
					new_args = f'{args}, _scriptName'
				else:
					# Dans le cas où il y a une seule expression, on concatène "_scriptName" à la fin
					# Vérifier si l'expression est une concaténation avec "+" et s'assurer que _scriptName soit ajouté correctement
					new_args = f'" : " + {args}, _scriptName'

				# Remplacer l'ancien appel avec le nouveau format
				lines[i] = line.replace(args, new_args)

	# Réécrire le fichier avec les modifications
	with open(file_path, 'w', encoding='utf-8') as f:
		f.writelines(lines)

def scan_directory(directory):
	for root, _, files in os.walk(directory):
		for file in files:
			if file.endswith(".gd"):
				process_gd_file(os.path.join(root, file))

if __name__ == "__main__":
	current_directory = os.getcwd()  # Utiliser le dossier courant
	scan_directory(current_directory)
	print("Modification terminée !")
