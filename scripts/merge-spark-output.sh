#!/bin/bash

result_folder=.
declare -A headers
headers=( 
  ["ranking"]="print_id,batch_id,tile_id,saturated,p1,d1,p2,d2,p3,d3,p4,d4,p5,d5"
  ["saturated"]="print_id,batch_id,tile_id,saturated"
  ["outliers"]="print_id,batch_id,tile_id,saturated,outliers"
)
folders=("ranking" "saturated" "outliers")

for folder in "${folders[@]}"; do
    input_dir="$result_folder/$folder"
    output_file="$result_folder/${folder}.txt"

    if [ -d "$input_dir" ]; then
        echo "Processing $folder..."
        echo "${headers[$folder]}" > "$output_file"

        # Unisce tutti i .txt del folder, ignorando eventuali file già uniti
        find "$input_dir" -maxdepth 1 -type f -name "*.txt" ! -name "${folder}.txt" -exec cat {} + >> "$output_file"

        echo "Merged output with header saved to $output_file"
    else
        echo "Directory $input_dir not found. Skipping."
    fi
done

