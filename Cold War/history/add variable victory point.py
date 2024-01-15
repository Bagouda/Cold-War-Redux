import os
import re

def process_state_files(directory):
    for filename in os.listdir(directory):
        print(filename)
        process_file(os.path.join(directory, filename))

def process_file(filepath):
    with open(filepath, 'r') as file:
        content = file.readlines()
        print(filepath)

    history_block_start = None
    set_variable_exists = False
    for i, line in enumerate(content):
        if re.match(r'\s*history\s*=\s*\{', line):
            history_block_start = i
        if 'set_variable = { victory_point' in line and history_block_start is not None:
            set_variable_exists = True
            break

    if history_block_start is not None and not set_variable_exists:
        victory_points = re.findall(r'victory_points = \{\s*(\d+)\s*(\d+)', ''.join(content[history_block_start:]))
        total_victory_points = sum(int(vp[1]) for vp in victory_points)

        if total_victory_points > 0:
            indentation = ' ' * (len(content[history_block_start]) - len(content[history_block_start].lstrip()))
            content.insert(history_block_start + 1, f"{indentation}\tset_variable = {{ victory_point = {total_victory_points} }}\n")

            with open(filepath, 'w') as file:
                file.writelines(content)

# Replace 'your_directory_path' with the path to the directory containing the state files
process_state_files('states')
