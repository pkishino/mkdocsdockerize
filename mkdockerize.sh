#!/bin/bash
set -e

if [ "$1" = 'produce' ]; then
	echo "to be implemented"
elif ["$1" = 'serve' ]; then
	echo "to be implemented"
elif ["$1" = 'help' ]; then
	echo "Available commands are 'serve' (serve a packaged site) and 'produce' (package a site) "
fi