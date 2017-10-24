dist: list

help:
	echo "make help        - Print this help"
	echo "make customer    - Make jpegs and generate base64 images to a json file"

list:
	node ./imgmin.js
	node ./base64.js

.PHONY: dist help list  
.SILENT: dist help list 
