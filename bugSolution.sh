#!/bin/bash

# This script demonstrates a solution to the race condition bug.
# It uses the 'wait' command to ensure that the background write operation completes before reading the file.

# Create a temporary file
tmpfile=$(mktemp)

# Write to the file in the background
echo "Hello, world!" > "$tmpfile" &

# Wait for the background process to finish
wait

# Read from the file
content=$(cat "$tmpfile")

# Print the content
echo "Content: $content"

# Clean up
rm "$tmpfile"