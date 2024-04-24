#!/bin/bash

MapName="Darkness Dwells Herein"
Version="Alpha"

# Output file
output_file="Combined.lua"

# LaunchLua file -- the main file
launch_lua="DarknessDwellsHerein.lua"

# Generated File -- contains application details
generated_file="src/MapInfo.lua"

# Remove existing generated file
rm -f "$generated_file"

# Remove existing output file
rm -f "$output_file"


# Generate the MapInfo file
git_commit=$(git rev-parse HEAD)
map_file="\
-- This is a generated file
local MapInfo = {}
MapInfo.name = \"$MapName\"
MapInfo.version = \"$Version\"
MapInfo.commit = \"$git_commit\"
"

echo "${map_file}" > $generated_file

# Concatenate all src .lua files
for file in src/*.lua; do
    [ -e "$file" ] || continue
    cat "$file" >> "$output_file"
    echo "" >> "$output_file"  # Add a newline between files
done

# Concatenate all mock .lua files
for file in test/mock/*.lua; do
    [ -e "$file" ] || continue
    cat "$file" >> "$output_file"
    echo "" >> "$output_file"  # Add a newline between files
done

# Concatenate all unit test .lua files
for file in test/unit/*.lua; do
    [ -e "$file" ] || continue
    cat "$file" >> "$output_file"
    echo "" >> "$output_file"  # Add a newline between files
done


# Concatenate all integration test .lua files
for file in test/integration/*.lua; do
    [ -e "$file" ] || continue
    cat "$file" >> "$output_file"
    echo "" >> "$output_file"  # Add a newline between files
done




# Make sure the actual LaunchLua() function is at the end, so it can call
# all of the init functions
cat "$launch_lua" >> "$output_file"

echo "Concatenation complete. Output saved to: $output_file"

# Static analysis
luacheck .

# If tests are enabled, they will run. If tests are not enabled, then nothing happens
lua $output_file



