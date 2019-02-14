#!/bin/bash
set -ev
if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
	echo 'Setting up deployment keys'
	ls -al ~/.ssh/
	mv DEPLOY_KEY ~/.ssh/id_rsa
	chmod 700 ~/.ssh
	chmod 600 ~/.ssh/*
	eval `ssh-agent -s`
	ssh-add ~/.ssh/id_rsa
	echo 'Pushing to server'
	rsync -azhv --exclude "*.DS_Store" --exclude "*.git" --exclude "*.gitignore" build/ $SERVER_PROD
fi
