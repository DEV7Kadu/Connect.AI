#!/bin/bash

# Set TERM variable if not set
if [ -z "$TERM" ]; then
    export TERM=xterm-256color
fi

# Reset
Color_Off='\033[0m'       # Text Reset

# Green Colors
Green='\033[0;32m'         # Green
Light_Green='\033[1;32m'   # Light Green

# Function to center and color text
print_centered() {
    local input="$1"
    local color="$2"
    local term_width=$(tput -T xterm-256color cols)
    local text_width=${#input}

    # Strip color codes for width calculation
    local stripped_input=$(echo -e "$input" | sed 's/\x1b\[[0-9;]*m//g')
    local stripped_width=${#stripped_input}

    # Calculate padding
    local pad_width=$(( (term_width - stripped_width) / 2 ))
    local padding=$(printf '%*s' "$pad_width")

    # Print with color and padding
    echo -e "${padding}${color}${input}${Color_Off}"
}

# Define BANNER_ART here
BANNER_ART="

   / __ \/ ____/ |  / /__  / //_//   |  / __ \/ / / /
  / / / / __/  | | / /  / / ,<  / /| | / / / / / / / 
 / /_/ / /___  | |/ /  / / /| |/ ___ |/ /_/ / /_/ /  
/_____/_____/  |___/  /_/_/ |_/_/  |_/_____/\____/   
                                                     "

print_banner() {
    # Clear the screen
    clear

    # Print banner art line by line, centered with animation
    while IFS= read -r line; do
        print_centered "$line" "$Blue"
        sleep 0.1
    done <<< "$BANNER_ART"

    # Print information text, centered
    print_centered "Whaticket Plus" "$Light_Green"
    print_centered "Compartilhar, vender ou fornecer essa solução" "$Light_Green"
    print_centered "sem autorização é crime previsto no artigo 184" "$Light_Green"
    print_centered "do código penal que descreve a conduta criminosa" "$Light_Green"
    print_centered "de infringir os direitos autorais da Whaticket Plus." "$Light_Green"
    print_centered "PIRATEAR ESSA SOLUÇÃO É CRIME." "$Light_Green"
    print_centered "© Whaticket Plus" "$Light_Green"

    # Ensure the color settings are reset
    echo -e "$Color_Off"
}

# Call the function print_banner here, if necessary
print_banner