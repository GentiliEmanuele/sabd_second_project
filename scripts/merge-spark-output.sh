#!/bin/bash

output="merged.csv"
first=1

for dir in task_*; do
  if [ -d "$dir" ]; then
    csvfile=$(find "$dir" -maxdepth 1 -name "*.csv" | head -n 1)
    if [ -f "$csvfile" ]; then
      cat "$csvfile" >> "$output"
    fi
  fi
done

echo "File uniti in $output"
