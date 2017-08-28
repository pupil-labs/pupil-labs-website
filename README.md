# Pupil Labs Website
[![Build Status](https://travis-ci.org/pupil-labs/pupil-labs-website.svg?branch=master)](https://travis-ci.org/pupil-labs/pupil-labs-website)

### Dependencies

1. Install `node` & `yarn` (*note* on macOS `brew install yarn` will also install `node`)
1. Add `yarn` to your PATH path according to [yarn docs](https://yarnpkg.com/en/docs/install) (*note* for fish shell users edit config.fish with `set -gx PATH $PATH $HOME/.config/yarn/global/node_modules/.bin`)
1. Install `gulp` globally - `yarn global add gulp` 

### Setup Packages
1. If you just cloned the repo, install packages by running `yarn`. 

### Adding Packages
Packages are listed in `package.json`

Add new dependencies - `yarn add <package name>`
Add new *dev* dependencies - `yarn add --dev <package name>`

### Preview 
1. `cd pupil-labs-website`
1. `gulp`

The default gulp task will run a webserver on localhost:3000. Checkout `gulpfile.coffee` for more commands

### New Blog Post
1. `cd pupil-labs-website`
1. `gulp newPost --title "Post Title"`

This will create a folder in `contents/articles` with a skeleton `.md` file with the title and current date. Check out `gulpfile.coffee` to see more argv options for `newPost`