# load all required libraries
gulp = require "gulp"
gutil = require "gulp-util"

# node filesystem 
fs = require('fs')

# parse command line args
minimist = require 'minimist' 
browserSync = require("browser-sync")
reload = browserSync.reload

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
uncss = require "gulp-uncss"
clean = require "gulp-clean"
rev = require 'gulp-rev'
rev_replace = require 'gulp-rev-replace'

# =================================================================                      
# high level tasks
# =================================================================                      
gulp.task "build", (cb)->
  return runSequence  ['build:clean', 'css:clean', 'js:clean'],
                      'css:build:all',
                      'js:build:all',
                      'build_wintersmith', cb


gulp.task 'default', ['build'], ->
  # preview with browserSync
  browserSync.init({server: "build", port:3000})
  gulp.watch "assets/**/*.{js,coffee}", ['js:preview']
  gulp.watch "./assets/stylus/**/*.styl", ['css:preview']


gulp.task "build:clean", ->
  return gulp.src('./build',{read:false})
          .pipe(clean())

gulp.task "build_log", ->
  return gutil.log gutil.colors.white.bgBlue("Build..."), "Complete"

# =================================================================                      
# css build tasks
# =================================================================                      


gulp.task "css:build", ->
  return gulp.src "./assets/stylus/main.styl"
        .pipe stylus
            compress: true
        .pipe prefixer
            browsers: ["last 2 versions"]
            cascade: true # prettify browser prefixes
            remove: true # remove un-needed prefixes
        .pipe rev()
        .pipe gulp.dest "./contents/css"
        .pipe rev.manifest()
        .pipe gulp.dest "./assets/rev_manifest"


gulp.task "css:ref", ->
  return gulp.src "./templates/includes/head.jade", {base: "./"}
          .pipe rev_replace( { manifest: gulp.src("assets/rev_manifest/rev-manifest.json"), replaceInExtensions: ['.jade']} )
          .pipe gulp.dest "./"

gulp.task "css:clean", ->
  return gulp.src("./contents/css/*.css", {read: false})
        .pipe clean()


gulp.task "css:build:all", (cb)->
  return runSequence "css:clean",
                      "css:build", 
                      "css:ref",
                      cb

gulp.task "css:preview", ->
  return gulp.src "./assets/stylus/main.styl"
        .pipe stylus
            compress: false
        .pipe prefixer
            browsers: ["last 2 versions"]
            cascade: true # prettify browser prefixes
            remove: true # remove un-needed prefixes
        .pipe rev()
        .pipe gulp.dest "./build/css"

  

# =================================================================                      
# js build tasks
# =================================================================                      

gulp.task "js:sidenav:build", ->
  return gulp.src "./assets/js/sidenav/*.js"
      .pipe babel(presets: ['es2015'])
      .pipe concat "sidenav.js"
      .pipe uglify()
      .pipe rev() 
      .pipe gulp.dest "./contents/js"
      .pipe rev.manifest()
      .pipe gulp.dest "./assets/rev_manifest"

gulp.task "js:sidenav:preview", ->
  return gulp.src "./assets/js/sidenav/*.js"
      .pipe babel(presets: ['es2015'])
      .pipe concat "sidenav.js"
      .pipe rev() 
      .pipe gulp.dest "./build/js"

gulp.task "js:sidenav:ref", ->
  return gulp.src "./templates/includes/js.jade"
          .pipe rev_replace( { manifest: gulp.src("assets/rev_manifest/rev-manifest.json"), replaceInExtensions: ['.jade']} )
          .pipe gulp.dest "./"
    
gulp.task "js:video:build", ->
  return gulp.src "./assets/js/bkg_video/*.js"
      .pipe babel(presets: ['es2015'])
      .pipe concat "bkg_video.js"
      .pipe uglify()
      .pipe rev() 
      .pipe gulp.dest "./contents/js"
      .pipe rev.manifest()
      .pipe gulp.dest "./assets/rev_manifest"

gulp.task "js:video:preview", ->
  return gulp.src "./assets/js/bkg_video/*.js"
      .pipe babel(presets: ['es2015'])
      .pipe concat "bkg_video.js"
      .pipe rev() 
      .pipe gulp.dest "./build/js"

gulp.task "js:video:ref", ->
  return gulp.src "./templates/vr-ar.jade"
          .pipe rev_replace( { manifest: gulp.src("assets/rev_manifest/rev-manifest.json"), replaceInExtensions: ['.jade']} )
          .pipe gulp.dest "./"

gulp.task "js:coffee:build", ->
  return gulp.src "./assets/coffeescript/*.coffee"
        .pipe coffee(
          bare: true
          )
        .pipe concat "main.js"
        .pipe uglify()
        .pipe rev() 
        .pipe gulp.dest "./contents/js"
        .pipe rev.manifest()
        .pipe gulp.dest "./assets/rev_manifest"

gulp.task "js:coffee:preview", ->
  return gulp.src "./assets/coffeescript/*.coffee"
        .pipe coffee(
          bare: true
          )
        .pipe concat "main.js"
        .pipe rev() 
        .pipe gulp.dest "./build/js"

gulp.task "js:coffee:ref", ->
  return gulp.src "./templates/includes/js.jade"
          .pipe rev_replace( { manifest: gulp.src("assets/rev_manifest/rev-manifest.json"), replaceInExtensions: ['.jade']} )
          .pipe gulp.dest "./"
  

gulp.task "js:clean", ->
  return gulp.src("./contents/js/*.js", {read: false})
        .pipe clean()


gulp.task "js:build:all", (cb)->
  return runSequence "js:clean",
              "js:sidenav:build",
              "js:sidenav:ref",
              "js:video:build",
              "js:video:ref",
              "js:coffee:build",
              "js:coffee:ref",
              cb

gulp.task "js:preview", (cb)->
  return runSequence "js:clean",
              "js:sidenav:preview",
              "js:video:preview",
              "js:coffee:preview",
              cb

# =================================================================                      
# image min tasks
# =================================================================                      

gulp.task 'image_min', ->
  options = {
    resize: [1440,1440],
    quality: 80,
    progressive: true,
    compressionLevel: 6,
    sequentialRead: true,
    trellisQuantisation: false
  }

  return gulp.src('build/media/images/**/*.{jpg,png}',{base: './'})
    .pipe(plumber())
    .pipe(image_min(options))
    .pipe(gulp.dest('./'))


# =================================================================                      
# site compile tasks
# =================================================================                      


gulp.task "generate_sitemap", ->
  return gulp.src('./build/**/*.html')
        .pipe(
          sitemap
            siteUrl: 'https://pupil-labs.com')
        .pipe gulp.dest('./')


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



gulp.task "build_wintersmith", (cb)->
  knownOpts = 
    boolean: ['dev','staging','production']

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
  if not opts.dev and not opts.staging and not opts.production
    wintersmith.settings.configFile = 'config.json'
    wintersmith.build ->
      gutil.log "Successfully built wintersmith for --> local dev."
      cb()


# =================================================================                      
# utils
# =================================================================                      


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


# =================================================================                      
# experiments
# =================================================================                      


gulp.task "css_clean", ->
  return gulp.src('build/css/main.css')
    .pipe(uncss(
      html: ['build/**/*.html'],
      ignore: [
                new RegExp('^.no-touch.*'),
                new RegExp('\.Header*(.)\S+'),
                new RegExp('^.js-side-nav*'),
                new RegExp('^.side-nav*'),
                new RegExp('\.logotype*(.)\S+')
                new RegExp('\.cart-*(.)\S+')
                new RegExp('\.no-touch*(.)\S+')
                new RegExp('\.Wallop.*(.)\S+')
                new RegExp('\.Store*(.)\S+')
                new RegExp('\.Add*(.)\S+')
                new RegExp('\.Button*(.)\S+')
                new RegExp('\.Grid-*(.)\S+')
                new RegExp('\.Aligner-*(.)\S+')
                new RegExp('\.TechSpecs-*(.)\S+')
                ]))
      .pipe(gulp.dest('build/css'))

