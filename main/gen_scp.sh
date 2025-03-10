#!/usr/bin/env bash

# count=0
for file in $1/*.wav
do
    echo $(basename -s .wav ${file}) ${file} >> $2
    # echo $count ${file} >> $2
    # count=$(($count+1))
done


#!/usr/bin/env bash

# # 检查参数数量
# if [ "$#" -ne 2 ]; then
#     echo "Usage: $0 input_directory output_file"
#     exit 1
# fi

# # 检查输入目录是否存在
# if [ ! -d "$1" ]; then
#     echo "Error: Input directory does not exist: $1"
#     exit 1
# fi

# # 循环处理输入目录中的所有 WAV 文件
# for file in "$1"/*.wav; do
#     # 检查文件是否存在
#     if [ -f "$file" ]; then
#         # 提取文件名（不包括 .wav 扩展名）
#         filename=$(basename -s .wav "$file")
#         # 将文件名和完整路径写入输出文件
#         echo "$filename $file" >> "$2"
#     else
#         echo "Warning: $file is not a regular file, skipping..."
#     fi
# done