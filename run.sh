#!/bin/bash

git pull && for nm in */ ; do
    if [ -d "$nm" ]; then
        echo "Processing $nm folder..."
        cd "$nm" && mdbook build && {
            if [ "$nm" = "welcome/" ]; then
                cp -r ./$nm/* /www/wwwroot/www.crescb.com/
            else
                cp -r ./$nm/* /www/wwwroot/www.crescb.com/"$nm"
            fi
        } && rm -rf "$nm" && cd ..
        echo "Processing $nm folder completed."
    fi
done