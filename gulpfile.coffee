# load all required libraries
gulp = require "gulp"
gutil = require "gulp-util"
# add delete util

# plugins - server 
livereload = require "gulp-livereload"

# plugins - site
wintersmith = require "run-wintersmith"
stylus = require "gulp-stylus"
prefixer = require "gulp-autoprefixer"
coffee = require "gulp-coffee"


css = ()->
  gulp.src "assets/stylus/main.styl"
  .pipe stylus
      compress: true
  .pipe prefixer
      browsers: "last 2 versions"
      cascade: true # prettify browser prefixes
      remove: true # remove un-needed prefixes
  .pipe gulp.dest "contents/css"
  .pipe livereload()

js = ()->
  gulp.src "assets/coffeescript/main.coffee"
  .pipe coffee(
    bare: false
    )
  .pipe gulp.dest "contents/js"
  .pipe livereload()

gulp.task "preview", ->
    wintersmith.preview()

gulp.task "css", ->
  css()

gulp.task "js", ->
  js()
# watch tasks watch folders and call functions defined above on change
gulp.task 'watch', ['css', 'js', 'preview'], ->
  livereload.listen()

  gulp.watch "assets/coffeescript/**", ->
    js()
    console.log "Coffeescript file changed. Compiling and reloading..."

  gulp.watch "assets/stylus/**", ->
    css()
    console.log "Stylus file changed. Compiling and reloading..."

  # gulp.watch "templates/**", ->
  #   jade()
  #   console.log "Template file changed. Compiling and reloading..."

