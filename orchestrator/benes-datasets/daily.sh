#!/bin/bash

mkdir /tmp/$$
echo /tmp/$$

for dataset in website other; do
	# download dataset from WMCZ server
	wget -O /tmp/$$/$dataset.tar.gz https://files.wikimedia.cz/datasets/$dataset.tar.gz
	wget -O /tmp/$$/$dataset.sql.gz https://files.wikimedia.cz/datasets/$dataset.sql.gz

	cd /tmp/$$
	tar xzf $dataset.tar.gz

	# publish the data
	rm -rf ~/public_html/datasets/periodic/$dataset
	mkdir -p ~/public_html/datasets/periodic/$dataset
	mv $dataset ~/public_html/datasets/periodic/$dataset/daily
	mv $dataset.tar.gz ~/public_html/datasets/periodic/$dataset/daily.tar.gz

	# load data to Toolforge's database
	zcat /tmp/$$/$dataset.sql.gz | mysql s53887__wmcz_${dataset}_p
done

rm -rf /tmp/$$
