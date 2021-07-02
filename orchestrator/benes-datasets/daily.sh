#!/bin/bash

mkdir /tmp/$$
echo /tmp/$$

for dataset in website other; do
	# download dataset from WMCZ server
	wget -O /tmp/$$/$dataset.tar.gz https://files.wikimedia.cz/datasets/$dataset.tar.gz

	cd /tmp/$$
	tar xzf $dataset.tar.gz

	# publish the data
	rm -rf ~/public_html/datasets/periodic/$dataset
	mkdir -p ~/public_html/datasets/periodic/$dataset
	mv $dataset ~/public_html/datasets/periodic/$dataset/daily
	mv $dataset.tar.gz ~/public_html/datasets/periodic/$dataset/daily.tar.gz
done

rm -rf /tmp/$$
