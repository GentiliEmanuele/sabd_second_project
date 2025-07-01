#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <result_folder_name>"
    echo "Example: $0 <benchmark id>"
    exit 1
fi
parent="results"
result_folder="$parent/$1"
declare -A headers
headers=( 
  ["ranking"]="print_id,batch_id,tile_id,saturated,p1,d1,p2,d2,p3,d3,p4,d4,p5,d5"
  ["centroids"]="print_id,batch_id,tile_id,saturated,centroids"
  ["saturated"]="print_id,batch_id,tile_id,saturated"
  ["outliers"]="print_id,batch_id,tile_id,saturated,outliers"
)
folders=("ranking" "centroids" "saturated" "outliers")

for folder in "${folders[@]}"; do
    subdir=$(find "$result_folder/$folder" -maxdepth 2 -type d -name "20*" | head -n 1)
    output_file="$result_folder/$folder.csv"
    if [ -d "$subdir" ]; then
        echo "Processing $folder..."
        echo "${headers[$folder]}" > "$output_file"
        cat "$subdir"/part-* >> "$output_file"
        echo "Merged output with header saved to $output_file"
    else
        echo "No valid subdirectory found for $folder. Skipping."
    fi
done