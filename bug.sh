#!/bin/bash

# This script demonstrates a race condition bug.
# It attempts to create a file and then immediately read it, but the read operation might fail if the file hasn't been completely written yet.

# Create a temporary file
tmpfile=$(mktemp)

# Write to the file in the background
echo "Hello, world!" > "$tmpfile" &

# Immediately try to read from the file
content=$(cat "$tmpfile")

# Print the content (might be empty or partial)
echo "Content: $content"

# Clean up
rm "$tmpfile"