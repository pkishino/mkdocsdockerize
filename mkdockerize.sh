#!/bin/bash
set -e

if [ "$1" = 'produce' ]; then
	echo "to be implemented"
elif [ "$1" = 'serve' ]; then
	exec mkdocs serve --dev-addr=0.0.0.0:8000
else
	echo "Available commands are 'serve' (serve a packaged site) and 'produce' (package a site) "
fi