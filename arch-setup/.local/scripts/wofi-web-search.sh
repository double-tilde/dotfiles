#!/usr/bin/env bash

query=$(wofi --show dmenu -p "Search:")

# If query is not empty
if [ -n "$query" ]; then
    encoded_query=$(echo "$query" | jq -sRr @uri)

    # Open the search in your browser (using xdg-open for default browser)
    xdg-open "https://search.brave.com/search?q=$encoded_query"
fi
