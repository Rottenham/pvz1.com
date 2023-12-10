#!/bin/bash

git pull && for folder_name in */ ; do
    if [ -d "$folder_name" ]; then
        echo "Processing $folder_name folder..."
        cd "$folder_name" && mdbook build && {
            if [ "$folder_name" = "welcome/" ]; then
                export dest="/www/wwwroot/www.crescb.com/"
            else
                export dest="/www/wwwroot/www.crescb.com/$folder_name"
            fi
        } && cp -r ./book/* $dest && rm -f $dest/favicon.svg && cp ../favicon.png $dest/favicon.png && rm -rf book && cd ..
    fi
done