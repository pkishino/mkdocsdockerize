#!/bin/bash

echo "produce test started"
#simple test to check that the site was compressed and file is created
docker run -v $CI_PROJECT_DIR/test/test-site:/page --rm $CI_REGISTRY_IMAGE:latest produce | gzip -9 >test.tar.gz
if [ ! -f "test.tar.gz" ]; then
	exit 1
fi


