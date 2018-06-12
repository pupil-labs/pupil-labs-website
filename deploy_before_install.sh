#!/bin/bash
set -ev

if [[npm -v!= 3* ]]; then npm i -g npm@3; fi

if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
	echo -e "Host collectivecreature.org\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
	cat ~/.ssh/config
	openssl aes-256-cbc -K $encrypted_72cb34722471_key -iv $encrypted_72cb34722471_iv -in DEPLOY_KEY.enc -out DEPLOY_KEY -d
fi