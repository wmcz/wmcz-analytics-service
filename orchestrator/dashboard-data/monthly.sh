#!/bin/bash

mkdir /tmp/$$
echo /tmp/$$

# Download the dataset from WMF analytics cluster
wget -O /tmp/$$/data.tar.gz https://analytics.wikimedia.org/published/datasets/one-off/wmcz/dashboard-data/data.tar.gz
cd /tmp/$$
tar xzf data.tar.gz

# Publish the result
rm -rf ~/public_html/datasets/periodic/dashboard-data/monthly
mv /tmp/$$/data ~/public_html/datasets/periodic/dashboard-data/monthly
mv /tmp/$$/data.tar.gz ~/public_html/datasets/periodic/dashboard-data/monthly

cat > ~/public_html/datasets/periodic/dashboard-data/monthly/README << EOF
This directory contains dashboard-data dataset that is updated monthly. It contains the following data tables:

* wmcz_outreach_dashboard_courses
* wmcz_outreach_dashboard_courses_users
* wmcz_outreach_dashboard_edits

The first two data tables are also available on daily basis, please see ../daily if you're interested.

Documentation: <TODO>
EOF

rm -rf /tmp/$$
