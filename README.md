# Darkness Dwells Herein

This is my custom map for warcraft 3


# Building

With a bash interpreter, run `build.sh`

`build.sh` concatenates all src/.lua and test/.lua files into one file, `Combined.lua`. Copy and paste the contents of `Combined.lua` into the wc3 editor and make sure there is a gui trigger that can call the function `LaunchLua()`




# Run Tests

Make sure `UNIT_TESTS` is set to `true` in DarknessDwellsHerein.lua before running `build.sh`. Then, run lua on `Combined.lua`



