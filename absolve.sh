#!/bin/bash -euo pipefail

# Check if any dependency is present in the tree
if ! cargo tree --format "none_of_you_are_free_of_{p}" 2>/dev/null | grep -q "none_of_you_are_free_of_"; then
    echo -e "\033[38;2;255;255;255;48;2;0;0;0m free of \033[38;2;255;255;255;48;2;255;105;180m syn \033[38;2;255;255;255;48;2;0;0;0m\033[0m"
else
    echo -e "\033[1;31m❌ 'syn' found in dependency tree. Here's what's using 'syn':\033[0m"

    # Loop over major versions of syn
    for version in 1 2; do
        if cargo tree -i "syn@$version" -e features > /dev/null 2>&1; then
            echo -e "\033[1;33mSyn version $version.x:\033[0m"
            cargo tree -i "syn@$version" -e features
            echo
        fi
    done

    exit 1
fi
