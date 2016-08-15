# load all required libraries
gulp = require "gulp"
gutil = require "gulp-util"

# node filesystem 
fs = require('fs')
del = require('del')

# parse command line args
minimist = require('minimist') 

# plugins - server 
livereload = require "gulp-livereload"

# plugins - site
wintersmith = require "run-wintersmith"
stylus = require "gulp-stylus"
prefixer = require "gulp-autoprefixer"
coffee = require "gulp-coffee"
babel = require "gulp-babel"
concat = require "gulp-concat"
uglify = require "gulp-uglify"
sitemap = require "gulp-sitemap"
favicons = require "gulp-favicons"
runSequence = require "run-sequence"
plumber = require 'gulp-plumber'
image_min = require 'gulp-sharp-minimal'
# size = require 'gulp-size'

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

js_sideNav = ()->
  gulp.src "assets/js/sidenav/*.js"
    .pipe babel(presets: ['es2015'])
    .pipe concat "sidenav.js"
    .pipe uglify()
    .pipe gulp.dest "contents/js"
    .pipe livereload();

js_bkgVideo = ()->
  gulp.src "assets/js/bkg_video/*.js"
    .pipe babel(presets: ['es2015'])
    .pipe concat "pupil_video.js"
    .pipe uglify()
    .pipe gulp.dest "contents/js"
    .pipe livereload();


jscoffee = ()->
  gulp.src "assets/coffeescript/*.coffee"
  .pipe coffee(
    bare: true
    )
  .pipe concat "main.js"
  .pipe uglify()
  .pipe gulp.dest "contents/js"
  .pipe livereload();

js = ()->
  js_bkgVideo()
  js_sideNav()
  jscoffee()

gulp.task "newPost", ->
  knownOpts = 
    string: ['title','date']
    defaults: {date: folderDate, title: 'untitled'}
  opts = if process.argv.length > 1 then minimist process.argv.slice(2), knownOpts else {'title':null}
  fileTitle = if opts.title then "_"+opts.title.replace(/\s+/g, '-').toLowerCase() else ""
  humanTitle = opts.title
  date = if not isNaN(Date.parse(opts.date)) then new Date(opts.date) else new Date()
  y = date.getFullYear()
  m = date.getMonth()+1 # yes...js months are 0 based
  folderDate =  y + "-" + ("0" + m).slice(-2)  
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
               subtitle: \n
               ---"
  fs.writeFile postDir+"/index.md", postHeader 
  gutil.log gutil.colors.white.bgBlue("Success! "), "New post created at", gutil.colors.white.bgBlue("#{ postDir }")    


gulp.task 'image_min', ->
  options = {
    resize: [1440,1440],
    quality: 60,
    progressive: true,
    compressionLevel: 6,
    sequentialRead: true,
    trellisQuantisation: false
  }

  return gulp.src('build/media/images/**/*.{jpg,png}',{base: './'})
    .pipe(plumber())
    .pipe(image_min(options))
    .pipe(gulp.dest('./'))

gulp.task "generate_sitemap", ->
  gulp.src('build/**/*.html')
  .pipe(
    sitemap
      siteUrl: 'https://pupil-labs.com')
  .pipe gulp.dest('build')

gulp.task "generate_favicons", ->
  return gulp.src("./build/media/graphics/favicon_base.png")
    .pipe(
      favicons
        appName: "Pupil Labs"
        appDescription: "Pupil Labs Website"
        developerName: "Pupil Labs Dev Team"
        developerURL: "https://github.com/pupil-labs/pupil-labs-website"
        background: "#38ea92"
        path: "build/media/graphics/web/favicons/"
        display: "standalone"
        orientation: "portrait"
        version: 2.0
        logging: false
        html: "build/index.html"
        pipeHTML: true
        replace: true
    )
    .on("error", gutil.log)
    .pipe(gulp.dest(".build/media/graphics/web/favicons/"))


gulp.task "preview", ->
    wintersmith.settings.configFile = 'config.json'
    wintersmith.preview()

gulp.task "build_wintersmith", (cb)->
  knownOpts = 
    boolean: ['dev','staging','production']
  # opts = if process.argv.length > 1 then minimist process.argv.slice(2), knownOpts else {'dev':true}
  opts = minimist process.argv.slice(2), knownOpts
  if opts.dev
    wintersmith.settings.configFile = 'config.json'
    wintersmith.build ->
      gutil.log "Successfully built wintersmith for --> local dev."
      cb()
  if opts.staging
    wintersmith.settings.configFile = 'config_staging.json'
    wintersmith.build ->
      gutil.log "Successfully built wintersmith for --> staging."
      cb()
  if opts.production 
    wintersmith.settings.configFile = 'config_production.json'
    wintersmith.build ->
      gutil.log "Successfully built wintersmith for --> production."
      cb()

gulp.task "css", ->
  return css()

gulp.task "js", ->
  return js()

gulp.task "build_clean", ->
  return del('build/')

gulp.task "build_log", ->
  return gutil.log gutil.colors.white.bgBlue("Build..."), "Complete"

gulp.task "build", (cb)->
  runSequence 'build_clean',
               ['css','js'],
               'build_wintersmith',cb

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
