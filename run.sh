#!/bin/bash

echo -e "\n[$(date)]"

git pull && for folder_name in */ ; do
    if [ -d "$folder_name" ]; then
        echo "Processing $folder_name folder..."
        cd "$folder_name" && /usr/local/bin/mdbook build && {
            if [ "$folder_name" = "welcome/" ]; then
                export dest="/www/wwwroot/www.crescb.com/"
            else
                export dest="/www/wwwroot/www.crescb.com/$folder_name"
            fi
        }
        if [ ! -d "$dest" ]; then
            mkdir -p "$dest"
        fi
        cp -r ./book/* $dest && cp ../favicon.png $dest/favicon.png && rm -rf $dest/favicon.svg ./index.html ./index.md book && cd ..
    fi
done && git status
