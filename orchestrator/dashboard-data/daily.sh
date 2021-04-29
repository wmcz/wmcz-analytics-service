#!/bin/bash

mkdir /tmp/$$
echo /tmp/$$

# Generate the dataset
python3 ~/datasets-generator/dashboard-users/generate_dashboard_users.py /tmp/$$

# Publish the result
mkdir -p ~/public_html/datasets/periodic/dashboard-data/daily
cp /tmp/$$/courses.tsv ~/public_html/datasets/periodic/dashboard-data/daily/wmcz_outreach_dashboard_courses.tsv
cp /tmp/$$/coursesUsers.tsv ~/public_html/datasets/periodic/dashboard-data/daily/wmcz_outreach_dashboard_courses_users.tsv

cat > ~/public_html/datasets/periodic/dashboard-data/daily/README << EOF
This directory contains dashboard-data dataset that is updated daily. It contains the following data tables:

* wmcz_outreach_dashboard_courses
* wmcz_outreach_dashboard_courses_users

If you are intereted in edits made by course participants, please see the monthly version.

Documentation: <TODO>
EOF

rm -rf /tmp/$$
