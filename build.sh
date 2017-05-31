#!/bin/bash

python2 make_tools.py
virtualenv -p /usr/bin/python2 package-venv
(
source package-venv/bin/activate
pip install -r requirements.txt --target packages
find packages -name \*.pyc -delete
find packages -name \*.dist-info -exec rm -Rf '{}' \;

cp adb.zip adb-standalone.zip
(
	cd packages
	zip -r ../adb-standalone.zip *
)
)


