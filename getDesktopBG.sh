#!/bin/bash

nat_geo_page_url=https://www.nationalgeographic.com/photo-of-the-day/

get_image_url() {
    html_content=$( wget -q -O- $nat_geo_page_url )
    meta_og_image=$( grep -o -E '<meta ([^>]*)property="og:image"([^>]*)>' <<< $html_content )
    content_value=$( grep -o -E 'content="(.*)"' <<< $meta_og_image) 
    image_url=$( sed -E 's/content="(.*)"/\1/' <<< $content_value )
    echo $image_url
}

current_background=$( gsettings get org.gnome.desktop.background picture-uri )
current_path=$( readlink -f $( dirname $0 ) )
file_name="images/$( date '+%d-%m-%Y' ).jpg"
new_path="file://$( readlink -f $current_path )/${file_name}"
image_url=$( get_image_url )

# Create the `images/` folder, if it can
if [ ! -d "${current_path}/images" ] ;
    then mkdir "${current_path}/images" || exit 1 ;
fi

# Download the 'Photo Of The Day'
wget $image_url -O "${current_path}/${file_name}"
if [ $? -gt 0 ] ;
    then echo 'Imposible to download file' && exit 2 ;
fi

# Try set the new
gsettings set org.gnome.desktop.background picture-uri $new_path || gsettings set org.gnome.desktop.background picture-uri $current_background
