--- 
title: New docs website 
date: Mon Mar 27 2017 17:44:45 GMT+0200 (CEST) 
author: Pupil Dev Team 
subtitle: 'We have transitioned docs to docs.pupil-labs.com' 
featured_img_thumb: '' 
---

<img src="../../../../media/images/blog/pupil-docs-web.png" class='Feature-image u-padBottom--2' alt="Pupil Docs Website">

All Pupil documentation - user docs, developer docs, and more - are now at [docs.pupil-labs.com](https://docs.pupil-labs.com "Pupil docs"). 

## Github wiki --> docs.pupil-labs.com

Why did we decide to transition away from a Github wiki to our own static docs website?  

Github wikis are great because they there is very little overhead for both maintainers and contributors. You can get started quickly and focus on editing content without worring about hosting, markdown parsing, or styling. These conveniences come with some comprimises. With a Github wiki you are not allowed to: embed videos, add your own css, declare any inline styles, or use javascript. You are constrained to basic HTML and whatever styling is provided by Github flavored markdown.  

Github wikis are stored as git repos. This is great, because you can track changes, make branches, tag versions, and do whatever else you want to do with git's powers. But, the wiki git repo is immediately visible to users/contributors from the Github web interface. This means that you can not make issues, make PRs, publish releases, visualize forks, etc. 

In short, we felt ourselves outgrowing the constraints of the Github powered wikis and wanted to be able to have a docs site that could satisfy the following desires:

- Markdown - Continue writing content in markdown.
- Versioning - Host multiple versions and branches of docs. Version tags should be synchronized with Pupil version tags. The `master` branch should always be the most current development branch.
- Content vs Logic - Separate the docs content from the website generation logic and styling. Changes in style or website generation should be separate from docs. 
- Style - Have full control of styles, be able to embed videos, call APIs, etc. 
- Single page - Everything in one place; all docs on a single page. At first this may seem overwhelming, but enables one to easiliy `cmd + F` to find anything. 
- Github - Leverage the full power of Github's existing tools to visualize and track changes, make issues, assign tasks, show forks, etc.

## Editing docs

Anyone can edit content. Just make a fork of the [pupil-docs](https://github.com/pupil-labs/pupil-docs "pupil-docs repo") repo, edit, and make a PR. 

## Pupil Docs Website

To generate the website we are using [`Hugo`](https://gohugo.io/ "Hugo - Static site generator") - static site generator written in `Go`. Hugo is fast and has a lot of nice built-in functions.

The css, javascript, and layout template files are isolated as a fork of the [docuapi theme](https://github.com/pupil-labs/docuapi), which in turn uses [Slate](https://github.com/lord/slate) to generate the table of contents, search functionality, and all base css styles. 

The `docuapi` theme and our content repo that holds all markdown files are both submodules of pupil-docs-website. The structure looks like this:

```
/pupil-docs-website - github.com/pupil-labs/pupil-docs-website
|-- content - github.com/pupil-labs/pupil-docs
|-- themes
|	`-- docuapi - github.com/pupil-labs/docuapi
```  

## Versioning

Hugo supports multiple languages of content by adding a language suffix for each file. Typical usage of this feature would look like this: `introduction.en.md` for English language content and `introduction.de.md` for that same content in German. Names of languages and their order or "weight" are defined in Hugo's `config.toml` file. In the above example, Hugo would create a subdirectory for each non-default language such that `example.com/` could be the English language website and `example.com/de/` would host the German language website. 

We (ab)use the multi-language feature so that we can build docs tags and branches. The most recent/current branch is always `master`. Here's an example:

- docs.pupil-labs.com/ - the most recent "stable" tag e.g. `v0.9.3`
- docs.pupil-labs.com/v092 
- docs.pupil-labs.com/v091  
- docs.pupil-labs.com/master - the master branch - always the most recent changes to docs

To support this workflow we have written a script runs before we build the static site - [`tag.sh`](https://github.com/pupil-labs/pupil-docs-website/blob/master/scripts/tag.sh). This script gets the most recent X number of tags and specified branches, renames files with their tag or branch name (e.g. `introduction.master.md` or `introduction.v093.md`), and updates the hugo `config.toml` file with the appropriate language settings.

## CI

We use [travis-ci](https://travis-ci.org/pupil-labs/pupil-docs-website "pupil-docs-website - travis-ci") to build and deploy the website with each change.

We wrote a [custom hook](https://github.com/pupil-labs/pupil-docs/blob/master/scripts/webhook.sh) so that every time a commit is made to the `pupil-docs` repository it will trigger a build for `pupil-docs-website`.  

## Next steps

We are happy with this transition, but also realize that it is a big shift for the community. There is still a lot to do, and we need help from the community to help us continue to improve docs. 

You can help by forking `pupil-docs`, making pull requests, making issues on either [pupil-docs](https://github.com/pupil-labs/pupil-docs), [pupil-docs-website](https://github.com/pupil-labs/pupil-docs-website), or [docuapi](https://github.com/pupil-labs/docuapi). 

