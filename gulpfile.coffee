# load all required libraries
gulp = require "gulp"
gutil = require "gulp-util"

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
imagemin = require "gulp-imagemin"
pngquant = require "imagemin-pngquant"


css = ()->
  gulp.src "assets/stylus/main.styl"
  .pipe stylus
      compress: true
  .pipe prefixer
      browsers: ["last 2 versions"]
      cascade: true # prettify browser prefixes
      remove: true # remove un-needed prefixes
  .pipe gulp.dest "contents/css"
  .pipe livereload()


js = ()->
  gulp.src "assets/coffeescript/*.coffee"
  .pipe coffee(
    bare: true
    )
  .pipe concat "main.js"
  .pipe uglify()
  .pipe gulp.dest "contents/js"
  .pipe livereload()

gulp.task "newPost", ->
  date = new Date()
  y = date.getFullYear()
  m = date.getMonth()+1 # yes...js months are 0 based
  folderDate =  y + "-" + ("0" + m).slice(-2)
  knownOpts = 
    string: 'title'
    defaults: folderDate
  opts = if process.argv.length > 1 then minimist process.argv.slice(2), knownOpts else {'title':null}
  fileTitle = if opts.title then "_"+opts.title.replace(/\s+/g, '-').toLowerCase() else ""
  humanTitle = opts.title
  postTitle = folderDate + fileTitle

  postDir = "contents/articles/" + "#{ postTitle }" 
  try
    fs.mkdirSync postDir 
  catch e
    if e.code == 'EEXIST'
      gutil.log gutil.colors.white.bgRed("Warning: "), "Directory already exists at path:", gutil.colors.white.bgRed("#{ e.path }"),  "\nTry an alternate title with gulp newPost --title 'my post title'"
    return

  postHeader = "---\n
                title: #{ humanTitle }\n
                date: #{ date }\n
                author: Pupil Dev Team\n
                ---"
  fs.writeFile postDir+"/index.md", postHeader 
  gutil.log gutil.colors.white.bgBlue("Success! "), "New post created at", gutil.colors.white.bgBlue("#{ postDir }")    

gulp.task "image_min", ->
  gulp.src('build/media/images/**/*')
  .pipe(
    imagemin
      optimizationLevel: 2
      progressive: true
      use: [pngquant()])
  .pipe gulp.dest('build/media/images')

gulp.task "preview", ->
    wintersmith.settings.configFile = 'config.json'
    wintersmith.preview()

gulp.task "build_wintersmith", ->
  knownOpts = 
    boolean: ['dev','staging','production']
  # opts = if process.argv.length > 1 then minimist process.argv.slice(2), knownOpts else {'dev':true}
  opts = minimist process.argv.slice(2), knownOpts
  if opts.dev
    wintersmith.settings.configFile = 'config.json'
    wintersmith.build ->
      gutil.log "Successfully built wintersmith for local dev."
  if opts.staging
    wintersmith.settings.configFile = 'config_staging.json'
    wintersmith.build ->
      gutil.log "Successfully built wintersmith for staging."
  if opts.production 
    wintersmith.settings.configFile = 'config_production.json'
    wintersmith.build ->
    gutil.log "Successfully built wintersmith for production."

gulp.task "css", ->
  css()

gulp.task "js", ->
  js()

gulp.task "build", ['css','js','build_wintersmith','image_min'], ->
  gutil.log gutil.colors.white.bgBlue("Build..."), "Complete"


# watch tasks watch folders and call functions defined above on change
gulp.task 'default', ['css', 'js', 'preview'], ->
  livereload.listen()

  gulp.watch "assets/coffeescript/**", ->
    js()
    gutil.log gutil.colors.white.bgBlue("Coffeescript file changed."), "Compiling and reloading..."

  gulp.watch "assets/stylus/**", ->
    css()
    gutil.log gutil.colors.white.bgBlue("Stylus file changed."), "Compiling and reloading..."

  # gulp.watch "templates/**", ->
  #   jade()
  #   gutil.log "Template file changed. Compiling and reloading..."

