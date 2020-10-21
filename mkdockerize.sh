#!/bin/bash
set -e

# Build and output to stdout
if [ "$1" = 'produce' ]; then
	mkdocs build
# Optionally create site.tar.gz in page directory
	if [ "$2" = 'local' ]; then
		tar -zcvf site.tar.gz site
	fi
	exec tar -zcvf - site
# This will take over the process and serve the page
# Exiting the process will stop and kill the container
elif [ "$1" = 'serve' ]; then
	exec mkdocs serve --dev-addr=0.0.0.0:8000
else
	echo "Available commands are 'serve' (serve a packaged site) and 'produce' (package a site) "
fi