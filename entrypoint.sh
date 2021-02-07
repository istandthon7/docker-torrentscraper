#!/bin/bash

./scraperInstaller.py
chmod o+w config/Movie.txt
chmod o+w config/setting.json
chmod o+w config/TVShow.json
chmod o+w transmission_script/torrent_done.sh
chmod o+x transmission_script/*.py transmission_script/*.sh

if [ -z "$1" ]; then
    ./scraperInstaller.py && tail -f /dev/null
else
    exec "$@"
fi
