#!/bin/bash

for parentDir in */; do
    echo ""
    if [ -d "$parentDir" ] && [ "$parentDir" != 'workbench/' ]; then
        echo "Checking parent directory: $parentDir"

        cd "$parentDir"
        for childDir in */; do
            echo ""
            echo "- Check child directory: $childDir"

            cd "$childDir"
            # echo "$(ls -la)"
            if [ -d "vendor/" ]; then
              echo "-- Removing vendor directory"
              rm -rf vendor
            else
              echo "-- No vendor directory found"
            fi

            if [ -d "build/" ]; then
              echo "-- Removing build directory"
              rm -rf build
            else
              echo "-- No build directory found"
            fi

            if [ -f "composer.lock" ]; then
              echo "-- Removing composer.lock file"
              rm composer.lock
            else
              echo "-- No composer.lock file found"
            fi

            cd ..
        done

        cd ..
    fi
done



