# Pupil Labs Website
[![Build Status](https://travis-ci.org/pupil-labs/pupil-labs-website.svg?branch=dev)](https://travis-ci.org/pupil-labs/pupil-labs-website)

### Dependencies

1. Install `node`
1. Install `npm`
1. Install `gulp` globally with `npm install -g gulp`

### Packages
1. Install local packakages `npm install`. Packages are defined in package.json

### Preview 
1. `cd pupil-labs-website`
1. `gulp` 

The default gulp task will run a webserver on localhost:3000. Checkout `gulpfile.coffee` for more commands

### New Blog Post
1. `cd pupil-labs-website`
1. `gulp newPost title "Post Title"`

This will create a folder in `contents/articles` with a skeleton `.md` file with the title and current date. Check out `gulpfile.coffee` to see more argv options for `newPost`