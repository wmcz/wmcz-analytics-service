#!/bin/bash

scriptdir="`dirname \"$0\"`"
cd $scriptdir

bash benes-datasets/daily.sh
bash dashboard-data/daily.sh
