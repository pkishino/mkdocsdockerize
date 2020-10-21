#!/bin/bash
set -e

#simple test to check if the test page is up and available
docker run -d -p 8000:8000 -v $(pwd)/test-site:/page --rm pkishino/mkdocsdockerize serve
exit=$(curl --write-out '%{http_code}' --silent --output /dev/null localhost:8000)
if [ $exit !== '200' ];then
	exit 1
fi

