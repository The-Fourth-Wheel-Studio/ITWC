import os
import re

def add_script_name_to_gd_file(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    script_name = os.path.basename(file_path).replace('.gd', '')

    script_name_line = f"static var _scriptName : String = \"{script_name}\""
    if any(script_name_line in line for line in lines):
        return

    header_added = False
    new_lines = []
    header_end_index = -1

    for i, line in enumerate(lines):
        if not header_added:
            stripped_line = line.strip()

            if stripped_line.startswith('@icon') or stripped_line.startswith('@tool') or stripped_line.startswith('extends') or stripped_line.startswith('class_name'):
                new_lines.append(line)
                header_end_index = i
            elif stripped_line == "":
                if header_end_index != -1:
                    new_lines.append(f"static var _scriptName : String = \"{script_name}\"\n")
                    header_added = True
                new_lines.append(line)
            else:
                new_lines.append(line)
        else:
            new_lines.append(line)

    if not header_added:
        new_lines.insert(0, f"static var _scriptName : String = \"{script_name}\"\n")

    for i, line in enumerate(new_lines):
        if 'MKUtil.print(' in line:
            new_lines[i] = re.sub(r'(MKUtil\.print\([^\)]*)\)', r'\1, _scriptName)', line)

    with open(file_path, 'w') as file:
        file.writelines(new_lines)

def scan_and_modify_files(root_dir):
    for root, dirs, files in os.walk(root_dir):
        for file in files:
            if file.endswith('.gd'):
                file_path = os.path.join(root, file)
                add_script_name_to_gd_file(file_path)

scan_and_modify_files(os.getcwd())
