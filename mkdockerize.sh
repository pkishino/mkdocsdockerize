#!/bin/bash

# Build and output to stdout
# As the resulting static generated site does not include the mkdocs.yml and docs folder
# these are added to the site folder before compression
# otherwise the standalone compressed folder will not be useable with mkdocs
if [ "$1" = 'produce' ]; then
	mkdocs build
	rsync -a --exclude='site' . site/
# Optionally set name for root folder
	if [ ! -z "$2" ]; then
		exec tar -cvf - $2
	else
		exec tar -cvf - site
	fi

# This will take over the process and serve the page
# Exiting the process will stop and kill the container
elif [ "$1" = 'serve' ]; then
	# if we supply a filename it will try to untar and use this
	if [ -f "$2" || -f "$2.tar.gz" ]; then
		file=($basename $2 .tar.gz)
		tar -zxvf $file.tar.gz --strip-components=1
	fi
	#if project contains valid yml we serve it
	if [ -f "mkdocs.yml" ]; then
		exec mkdocs serve --dev-addr=0.0.0.0:8000
	else
		echo "not a valid mkdocs project"
	fi
else
	echo "Available commands are 'serve' (serve a packaged site) and 'produce' (package a site) "
fi