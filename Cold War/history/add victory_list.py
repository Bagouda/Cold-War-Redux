import os
import re

def process_state_files(directory):
    for filename in os.listdir(directory):
        print(filename)
        process_file(os.path.join(directory, filename))
        print(f'Computed {filename}')

def process_file(filepath):
    with open(filepath, 'r') as file:
        content = file.readlines()

    history_block_start = None
    for i, line in enumerate(content):
        if re.match(r'\s*history\s*=\s*\{', line):
            history_block_start = i
            break

    if history_block_start is not None:
        victory_points = re.findall(r'victory_points\s*=\s*\{\s*(\d+)\s*(\d+)', ''.join(content))
        sorted_victory_points = sorted(victory_points, key=lambda x: int(x[1]))

        # Adding 'add_to_array' lines for each victory point
        for vp in sorted_victory_points:
            province = vp[0]
            indentation = ' ' * (len(content[history_block_start]) - len(content[history_block_start].lstrip()))
            add_to_array_line = f"{indentation}\tadd_to_array = {{ list_victory_point = {province} }}\n"
            content.insert(history_block_start + 1, add_to_array_line)

        with open(filepath, 'w') as file:
            file.writelines(content)

# Replace 'your_directory_path' with the path to the directory containing the state files
process_state_files('states')
