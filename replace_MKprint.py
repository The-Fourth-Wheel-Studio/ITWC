import os
import re

def replace_script_name_in_file(file_path):
    with open(file_path, "r", encoding="utf-8") as file:
        lines = file.readlines()

    updated_lines = []
    pattern = re.compile(r"^\s*static\s+var\s+_scriptName\s*:\s*String\s*=\s*(.+)")
    found_mkutil_print = any(re.search(r"MKUtil\.print\s*\(", line) for line in lines)
    print(file, found_mkutil_print)

    for line in lines:
        match = pattern.match(line)
        if match:
            if found_mkutil_print:
                value = match.group(1).strip()
                updated_lines.append(f"const _scriptName : String = {value}\n")
            else:
                updated_lines.append("\n")
            # Sinon, on ne réécrit pas la ligne (elle est supprimée)
        else:
            updated_lines.append(line)

    with open(file_path, "w", encoding="utf-8") as file:
        file.writelines(updated_lines)

def process_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".gd"):
                file_path = os.path.join(root, file)
                replace_script_name_in_file(file_path)

if __name__ == "__main__":
    process_directory(os.getcwd())
