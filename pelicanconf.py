#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Pupil Labs Development Team'
SITENAME = u'Pupil Labs'
SITEURL = ''

PATH = 'content'
PAGE_PATHS = ['pages']

# Replace blog index with static index
INDEX_SAVE_AS = 'blog/index.html'

ARTICLE_PATHS = ['articles']
ARTICLE_URL = 'blog/{date:%Y}-{date:%m}-{date:%d}-{slug}'
ARTICLE_SAVE_AS = 'blog/{date:%Y}-{date:%m}-{date:%d}-{slug}/index.html'

TIMEZONE = 'UTC'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Links
LINKS = (('Pupil Github', 'https://github.com/pupil-labs/pupil'),)

# Menu Items
MENUITEMS = [('Pupil','pupil'),('Store','store'),('Cart','cart')]


# Social widget
# SOCIAL = (('You can add links in your config file', '#'),
#           ('Another social link', '#'),)

DEFAULT_PAGINATION = 4

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

IGNORE_FILES = ['_v1.0']

# Theme
THEME = "themes/pupil-labs-theme"

# Plugins
PLUGIN_PATHS = ["pelican-plugins"]
PLUGINS = ['assets']

# Webassets settings
ASSET_BUNDLES = (('styles', ['css/main.styl'], {'filters': ['stylus','autoprefixer','cssmin'],'output': 'css/style.min.css'}),) 
ASSET_CONFIG = (('AUTOPREFIXER_BROWSERS', ['last 2 versions']),)
# ASSET_SOURCE_PATHS = ('vendor/css','scss',)

# Google Analytics ID
GA_ID = u'UA-40856943-1'
