#!/bin/bash

input_dir=$1
output_dir=$2

copy_files() {
    local from_dir=$1
    local to_dir=$2
    local count=0

    for file in "$from_dir"/*; do
        if [ -f "$file" ]; then
            count=$((count+1))
            cp "$file" "$to_dir/$(basename $file)_$count"
        elif [ -d "$file" ]; then
            copy_files "$file" "$to_dir"
        fi
    done
}

copy_files "$input_dir" "$output_dir"
