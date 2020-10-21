#!/bin/bash

echo "serve test started"
#simple test to check if the test page is up and available
docker run -d -p 8000:8000 -v $CI_PROJECT_DIR/test/test-site:/page --rm $CI_REGISTRY_IMAGE:latest serve
#need to wait for service to be up
sleep 5
exit=$(curl --write-out '%{http_code}' --silent --output /dev/null docker:8000)
if [ $exit != '200' ];then
	exit 1
fi
