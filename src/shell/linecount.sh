#!/bin/bash
# Count lines with a ;, ), or }, and let that count be named Lines
Lines=$(grep '[;)}]' *.c | wc -l)

# Now count how many lines there are in a directory listing; name it Files.
Files=$(ls *.c |wc -l)

# Arithmetic expansion is a double-paren
# In bash, the remainder is truncated; more on this later.
echo lines = $Lines
echo files = $Files
echo lines/file = $(($Lines/$Files))

# Or, use those variables in a here script
# By settig scale=3, answers are printed to 3 decimal places
# (Or use bc -l (ell), which sets scale=20)
bc << ---
scale=3
$Lines/$Files
---