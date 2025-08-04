#!/usr/bin/env bash

# Default paths for .desktop files
DESKTOP_DIRS=(
    "$HOME/.local/share/applications"
    "/usr/share/applications"
    "/usr/local/share/applications"
)

# Collect all .desktop file names and readable names
entries=()
declare -A desktop_map

for dir in "${DESKTOP_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        while IFS= read -r -d '' file; do
            name=$(grep -m1 -i "^Name=" "$file" | cut -d= -f2)
            exec_line=$(grep -m1 -i "^Exec=" "$file" | cut -d= -f2 | cut -d' ' -f1)
            [ -n "$name" ] && entries+=("$name") && desktop_map["$name"]="$exec_line"
        done < <(find "$dir" -name "*.desktop" -print0)
    fi
done

# Launch rofi-wayland
choice=$(printf "%s\n" "${entries[@]}" | rofi -dmenu -i -p "Launch/Search:")

# Check if a match was made
if [[ -n "$choice" && -n "${desktop_map["$choice"]}" ]]; then
    # Run the matched command
    nohup ${desktop_map["$choice"]} >/dev/null 2>&1 &
else
	if [ -n "$query" ]; then
		# If no app matched, search using Brave Search
    	query=$(echo "$choice" | sed 's/ /+/g')
    	xdg-open "https://search.brave.com/search?q=${query}" &
	fi
fi
