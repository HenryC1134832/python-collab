from deepdiff import DeepDiff
import json

def json_diff(file1_path, file2_path):
    with open(file1_path, 'r') as file1, open(file2_path, 'r') as file2:
        data1 = json.load(file1)
        data2 = json.load(file2)
    
    diff = DeepDiff(data1, data2, ignore_order=True)
    return diff

# Usage
differences = json_diff('denoiser/egs/debug/tr/clean.json', 'denoiser/egs/debug/tr/noisy.json')
print("Differences:", differences)

# import json

# def are_json_files_identical(file1_path, file2_path):
#     with open(file1_path, 'r') as file1, open(file2_path, 'r') as file2:
#         data1 = json.load(file1)
#         data2 = json.load(file2)
#     return data1 == data2

# # Usage
# result = are_json_files_identical('denoiser/egs/debug/tr/clean.json', 'denoiser/egs/debug/tr/noisy.json')
# print("Files are identical" if result else "Files are different")