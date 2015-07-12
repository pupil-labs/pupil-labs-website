# load all required libraries
gulp = require "gulp"
gutil = require "gulp-util"
# add delete util

# node filesystem 
fs = require('fs')

# parse command line args
minimist = require('minimist') 

# plugins - server 
livereload = require "gulp-livereload"

# plugins - site
wintersmith = require "run-wintersmith"
stylus = require "gulp-stylus"
prefixer = require "gulp-autoprefixer"
coffee = require "gulp-coffee"
concat = require "gulp-concat"
uglify = require "gulp-uglify"


css = ()->
  gulp.src "assets/stylus/main.styl"
  .pipe stylus
      compress: true
  .pipe prefixer
      browsers: ["last 2 versions"]
      cascade: true # prettify browser prefixes
      remove: false # remove un-needed prefixes
  .pipe gulp.dest "contents/css"
  .pipe livereload()


js = ()->
  gulp.src "assets/coffeescript/*.coffee"
  .pipe coffee(
    bare: true
    )
  .pipe concat "main.js"
  # .pipe uglify()
  .pipe gulp.dest "contents/js"
  .pipe livereload()

gulp.task "newPost", ->
  date = new Date()
  y = date.getFullYear()
  m = date.getMonth()+1 # yes...js months are 0 based
  folderDate =  y + "-" + ("0" + m).slice(-2)
  opts = minimist process.argv.slice(2) 
  postTitle = folderDate + "_" + opts.title 

  postDir = "contents/articles/" + "#{ postTitle }" 
  fs.mkdir postDir
  postHeader = "---\n
                title: #{ opts.title }\n
                date: #{ date }\n
                ---"
  fs.writeFile postDir+"/index.md", postHeader      

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

  gulp.watch "contents/store/products/products.json", ->
    copyProductJSON()
    console.log "Product list changed. Copying file to coffeescript asset."
  # gulp.watch "templates/**", ->
  #   jade()
  #   console.log "Template file changed. Compiling and reloading..."

