#!/usr/bin/env bash

DESKTOP_DIRS=(
    "$HOME/.local/share/applications"
    "/usr/share/applications"
    "/usr/local/share/applications"
)

entries=()
declare -A desktop_map

for dir in "${DESKTOP_DIRS[@]}"; do
    if [[ -d "$dir" ]]; then
        while IFS= read -r -d '' file; do
            name=$(grep -m1 -i "^Name=" "$file" | cut -d= -f2)
            exec_line=$(grep -m1 -i "^Exec=" "$file" | cut -d= -f2 | cut -d' ' -f1)
            [ -n "$name" ] && entries+=("$name") && desktop_map["$name"]="$exec_line"
        done < <(find "$dir" -name "*.desktop" -print0)
    fi
done

choice=$(printf "%s\n" "${entries[@]}" | rofi -dmenu -i -p "Launch/Search:")

if [[ -n "$choice" && -n "${desktop_map[$choice]}" ]]; then
    nohup ${desktop_map[$choice]} > /dev/null 2>&1 &
else
    if [[ -n "$choice" ]]; then
        query=$(echo "$choice" | sed 's/ /+/g')
        if [[ "$choice" =~ ^http.* ]]; then
            xdg-open "${query}"
        elif [[ "$choice" =~ ^www\.* ]] then
            xdg-open "https://${query}"
        else
            xdg-open "https://search.brave.com/search?q=${query}"
        fi
    fi
fi
