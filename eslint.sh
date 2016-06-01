#!/bin/bash

hfold 'Install node'
node_url=https://nodejs.org/dist/v6.2.0/node-v6.2.0-linux-x64.tar.xz
node_dir=$(basename $node_url .tar.xz)

curl -sO "$node_url"
tar xf $(basename "$node_url")

PATH=$HOME/$node_dir/bin:$PATH
export PATH
hfold --end

hfold 'Install project node modules'
cd ~/repositories/"${REPO_NAME}:?Don't know which repository to deploy, check the environment}"
npm install
hfold --end

hfold 'Lint the project'
npm run -s lint
hfold --end
