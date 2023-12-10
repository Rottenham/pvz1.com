#!/bin/bash

git pull && for folder_name in */ ; do
    if [ -d "$folder_name" ]; then
        echo "Processing $folder_name folder..."
        cd "$folder_name" && mdbook build && {
            if [ "$folder_name" = "welcome/" ]; then
                cp -r ./book/* /www/wwwroot/www.crescb.com/
            else
                cp -r ./book/* /www/wwwroot/www.crescb.com/"$folder_name"
            fi
        } && rm -rf book && cd ..
    fi
done