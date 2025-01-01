#!/bin/bash
FOLDER=fluidd
REPO=https://github.com/fluidd-core/fluidd/releases/latest
function get_latest_release_version {
    curl --silent  "https://api.github.com/repos/fluidd-core/fluidd/releases/latest" | jq -r .tag_name
}


echo "Kingroon KP3S Pro V2 Fluidd updating script"

if [ ! -d "$FOLDER" ]; then
  echo "Fluid '$FOLDER' does not exist."
  exit 1
fi

current=$(cat $FOLDER/.version)
latest=$(get_latest_release_version)
echo "Instaled version is $current"
echo "Latest version is $latest"

read -p "Do you really want to update your fluidd? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    read -p "Do you want to backup current version? (y/n)" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        date=$(date '+%Y-%m-%d')
        backup_dir="fluidd_backup_$date"
        echo "Backing to $backup_dir"
        mv $FOLDER $backup_dir
    else
        echo "Removing current dir"
        rm -rf $FOLDER
    fi
    echo Downloading latest version...
    mkdir $FOLDER
    cd $FOLDER
    wget -q -O fluidd.zip https://github.com/fluidd-core/fluidd/releases/latest/download/fluidd.zip
    unzip fluidd.zip
    rm fluidd.zip
    echo "Restating nginx (you may enter password)..."
    sudo service nginx restart
fi