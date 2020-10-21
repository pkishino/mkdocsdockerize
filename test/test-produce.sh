#!/bin/bash
set -e

#simple test to check that the site was compressed and file is created
docker run -v $(pwd)/test-site:/page --rm pkishino/mkdocsdockerize produce | gzip -9 >test.tar.gz
if [ ! -f "test.tar.gz" ]; then
	exit 1
fi



