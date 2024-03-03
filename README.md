#!/bin/bash

# Check if Open Babel is installed
if ! command -v obabel &> /dev/null; then
    echo "Open Babel is not installed. Please install it first."
    exit 1
fi

# Directory containing the .sdf files
input_dir="Path to inputfile"

# Directory where you want to save the .pdbqt files
output_dir="path to outputfile"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Iterate through each .sdf file in the input directory
for file in "$input_dir"/*.sdf; do
    filename=$(basename "$file")
    base="${filename%.*}"
    
    # Convert .sdf to .pdbqt
    obabel -isdf "$file" -opdbqt -O "$output_dir/$base.pdbqt"
    
    echo "Converted $file to $output_dir/$base.pdbqt"
done

echo "Conversion complete."
