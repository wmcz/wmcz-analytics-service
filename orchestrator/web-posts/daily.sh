#!/bin/bash

mkdir /tmp/$$
echo /tmp/$$

# Download the dataset from WMCZ's server
wget -O /tmp/$$/data.tar.gz https://files.wikimedia.cz/datasets/web-posts/data.tar.gz
cd /tmp/$$
tar xzf data.tar.gz

# Publish the result
mkdir -p ~/public_html/datasets/periodic/web-posts
rm -rf ~/public_html/datasets/periodic/web-posts/monthly
mv /tmp/$$/web-posts ~/public_html/datasets/periodic/web-posts/monthly
mv /tmp/$$/data.tar.gz ~/public_html/datasets/periodic/web-posts/monthly

cat > ~/public_html/datasets/periodic/web-posts/monthly/README << EOF
This directory contains web-posts dataset that is updated daily. It contains the following data tables:

* news_web: News published by Wikimedia Czech Republic on wikimedia.cz
* news_tags: Tag/news assignment for WMCZ news
* news_category: Category/news assignment for WMCZ news
* blogposts: blogposts released at blog.wikimedia.cz

Documentation: <TODO>
EOF

zcat ~/public_html/datasets/periodic/web-posts/monthly/wmcz_web_posts_p.sql.gz | mysql -h tools-db s53887__wmcz_web_posts_p

rm -rf /tmp/$$
