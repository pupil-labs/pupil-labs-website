# credit: https://github.com/acdlite/andrewphilipclark.com/blob/master/plugins/blog.coffee

module.exports = (env, callback) ->

  defaults =
    postsDir: 'articles' # directory containing blog posts
    template: 'article.jade'
    filenameTemplate: '/blog/:year-:month/:title/index.html'

  # assign defaults for any option not set in the config file
  options = env.config.blog or {}
  for key, value of defaults
    options[key] ?= defaults[key]

  getArticles = (contents) ->
    # helper that returns a list of articles found in *contents*
    # note that each article is assumed to have its own directory in the articles directory
    articles = contents[options.postsDir]._.directories.map (item) -> item.index
    # skip articles that do not have a template associated
    articles = articles.filter (item) -> item.template isnt 'none'
    # sort article by date
    articles.sort (a, b) -> b.date - a.date
    return articles

  class BlogPostsPages extends env.plugins.MarkdownPage
    ### DRYer subclass of MarkdownPage ###

    getTemplate: ->
      @metadata.template or options.template or super()

    getFilenameTemplate: ->
      @metadata.filenameTemplate or options.filenameTemplate or super()

  # register the plugin
  prefix = if options.postsDir then options.postsDir + '/' else ''
  env.registerContentPlugin 'posts', prefix + '**/*.*(markdown|mkd|md)', BlogPostsPages

  env.helpers.getArticles = getArticles

  # done!
  callback()