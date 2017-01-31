#!/bin/bash

bg_atual=$(gsettings get org.gnome.desktop.background picture-uri)
cur_path=$(readlink -f $(dirname $0))
url_image=$(node $cur_path/index.js)
file_name="images/$(date '+%d-%m-%Y').jpg"
new_path="file://$(readlink -f $cur_path)/${file_name}"

# Create the `images/` folder, if it can
if [ ! -d "${cur_path}/images" ] ; then mkdir "${cur_path}/images" || exit 1 ; fi

# Download the 'Image Of The Day'
wget $url_image -O "${cur_path}/${file_name}" || { echo 'Imposible to download file' && exit 2; }

# Try set the new
gsettings set org.gnome.desktop.background picture-uri $new_path || gsettings set org.gnome.desktop.background picture-uri $bg_atual
