#!/bin/bash

output_file="whole_python_code.txt"
rm -f "$output_file"

git ls-files --cached --others --exclude-standard -- "*.py" | while read -r file; do
    echo "$file" >> "$output_file"
    echo -e "\n" >> "$output_file"
    cat "$file" >> "$output_file"
    echo -e "\n\n" >> "$output_file"
done

echo "Output written to $output_file."
