#!/bin/bash


if ! command -v obabel &> /dev/null; then
    echo "Open Babel is not installed. Please install it first."
    exit 1
fi

input_dir="Path to inputfile"
output_dir="path to outputfile"


mkdir -p "$output_dir"


for file in "$input_dir"/*.sdf; do
    filename=$(basename "$file")
    base="${filename%.*}"
    
    obabel -isdf "$file" -opdbqt -O "$output_dir/$base.pdbqt"
    
    echo "Converted $file to $output_dir/$base.pdbqt"
done

echo "Conversion complete."
