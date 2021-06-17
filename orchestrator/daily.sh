#!/bin/bash

scriptdir="`dirname \"$0\"`"
cd $scriptdir

bash wmcz-reports/daily.sh
bash dashboard-data/daily.sh
