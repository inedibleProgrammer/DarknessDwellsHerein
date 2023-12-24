#!/bin/bash

# Output file
output_file="Combined.lua"

# LaunchLua file -- the main map file
launch_lua="DarknessDwellsHerein.lua"

# Remove existing output file
rm -f "$output_file"

# Concatenate all src .lua files
for file in src/*.lua; do
    [ -e "$file" ] || continue
    cat "$file" >> "$output_file"
    echo "" >> "$output_file"  # Add a newline between files
done

# Concatenate all test .lua files
for file in test/*.lua; do
    [ -e "$file" ] || continue
    cat "$file" >> "$output_file"
    echo "" >> "$output_file"  # Add a newline between files
done



# Make sure the actual LaunchLua() function is at the end, so it can call
# all of the init functions
cat "$launch_lua" >> "$output_file"

echo "Concatenation complete. Output saved to: $output_file"
