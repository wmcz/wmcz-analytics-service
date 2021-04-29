#!/bin/bash

scriptdir="`dirname \"$0\"`"
cd $scriptdir

bash web-posts/daily.sh
bash dashboard-data/daily.sh
