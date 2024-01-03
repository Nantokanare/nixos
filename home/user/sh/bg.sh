#!/run/current-system/sw/bin/sh

# It is needed to make nitrogen work correctly
export DISPLAY=":0"

# Defining the directory with wallpapers
BG_DIR=$HOME/Media/Wallpaper

# Getting date of the creation of the current_bg_image.jpg (used in the nitrogen configuration)
BG_IMAGE_DATE=$(ls -l --time-style=full-iso "${BG_DIR}"/current_bg_image.jpg | awk '{print $6}')

# Getting current date
TODAY=$(date -I)

# Checking, if dates differ, then we randomly select new wallpaper
if [ "${BG_IMAGE_DATE}" != "${TODAY}" ]
then
    # Removing of the old symlink
    [ -f "${BG_DIR}"/current_bg_image.jpg ] && rm "${BG_DIR}"/current_bg_image.jpg 

    # Feeding random generator with the date in seconds (UNIX time)
    RANDOM=$$$(date +%s)

    # Generating list of all wallpapers in the directory
    BG_LIST=("${BG_DIR}"/*.jpg)

    # Counting total number of files
    BG_NUM=$(ls -1 "${BG_DIR}" | wc -l)

    # Randomly select some number from the total number of wallpapers
    SELECTED_BG=$(( $RANDOM % ${BG_NUM} ))

    # Creating new symbolic link to the selected wallpaper with the name "current_bg_image.jpg" 
    ln -s "${BG_LIST[$SELECTED_BG]}" "${BG_DIR}"/current_bg_image.jpg 

    # refreshing wallpaper image
    nitrogen --restore > /dev/null 2>&1 &
fi
