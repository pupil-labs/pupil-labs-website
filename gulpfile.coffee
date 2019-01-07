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
clean = require "gulp-clean"
rev = require 'gulp-rev'
rev_replace = require 'gulp-rev-replace'
webp = require 'gulp-webp'
size = require 'gulp-size'
rename = require 'gulp-rename'
imgResize = require 'gulp-image-resize'

# =================================================================
# high level tasks
# =================================================================
gulp.task "build", (cb)->
  return runSequence  ['build:clean', 'js:clean'],
                      ['css:build','js:build'],
                      'build_wintersmith',
                      ['css:rev','js:rev'],
                      'ref:all',
                      'rev:clean',
                       cb

gulp.task "preview", (cb)->
  return runSequence  ['build:clean', 'js:clean'],
                      ['css:build','js:build', 'webp:make'],
                      'build_wintersmith',
                      cb


gulp.task 'default', ['preview'], ->
  # preview with browserSync
  browserSync.init({server: "build", port:3000})
  gulp.watch "./assets/**/*.{js,coffee}", ['js:build:preview']
  gulp.watch "./assets/stylus/**/*.styl", ['css:build:preview']
  gulp.watch "./templates/**/*.jade", ['preview:jade']
  gulp.watch "./contents/**/*.md", ['preview:md']


gulp.task 'browsersync', (cb)->
  return browserSync.init({server: "build", port:3000})

gulp.task "build:clean", ->
  return gulp.src('./build',{read:false})
          .pipe(clean())

gulp.task "build_log", ->
  return gutil.log gutil.colors.white.bgBlue("Build..."), "Complete"

gulp.task 'preview:jade', ['build_wintersmith'], reload
gulp.task 'preview:md', ['build_wintersmith'], reload

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
        .pipe gulp.dest "./contents/css"

gulp.task "css:build:preview", ["css:build"], ->
  return gulp.src "./contents/css/main.css"
          .pipe gulp.dest "./build/css"

gulp.task "css:rev", ->
  return gulp.src "./build/css/main.css"
        .pipe rev()
        .pipe gulp.dest "./build/css"
        .pipe rev.manifest({base: "./assets/rev_manifest", merge:true})
        .pipe gulp.dest "assets/rev_manifest"


gulp.task "css:ref", ->
  return gulp.src "./build/**/index.html"
          .pipe rev_replace( { manifest: gulp.src("assets/rev_manifest/rev-manifest.json") } )
          .pipe gulp.dest "./"


gulp.task "css:clean", ->
  return gulp.src("./contents/css/*.css", {read: false})
        .pipe clean()


# =================================================================
# js build tasks
# =================================================================

gulp.task "js:sidenav:build", ->
  return gulp.src "./assets/js/sidenav/*.js"
      .pipe babel(presets: ['es2015'])
      .pipe concat "sidenav.js"
      .pipe uglify()
      .pipe gulp.dest "contents/js"

gulp.task "js:cart_animate:build", ->
  return gulp.src "./assets/js/cart_animation/*.js"
      .pipe babel(presets: ['es2015'])
      .pipe concat "cart_animate.js"
      .pipe uglify()
      .pipe gulp.dest "contents/js"

gulp.task "js:video:build", ->
  return gulp.src "./assets/js/bkg_video/*.js"
      .pipe babel(presets: ['es2015'])
      .pipe concat "bkg_video.js"
      .pipe uglify()
      .pipe gulp.dest "contents/js"

gulp.task "js:plyr:build", ->
  return gulp.src "./assets/js/plyr/*.js"
      .pipe babel(presets: ['es2015'])
      .pipe concat "plyr.js"
      .pipe uglify()
      .pipe gulp.dest "contents/js"

gulp.task "js:autocomplete:build", ->
  return gulp.src "./assets/js/autocomplete/*.js"
      .pipe babel(presets: ['es2015'])
      .pipe concat "autocomplete.js"
      .pipe uglify()
      .pipe gulp.dest "contents/js"

gulp.task "js:coffee:build", ->
  return gulp.src "./assets/coffeescript/*.coffee"
        .pipe coffee(
          bare: true
          )
        .pipe concat "main.js"
        .pipe uglify()
        .pipe gulp.dest "contents/js"


gulp.task "js:clean", ->
  return gulp.src("./contents/js/*.js", {read: false})
        .pipe clean()


gulp.task "js:build", (cb)->
  return runSequence "js:clean",
              "js:sidenav:build",
              "js:cart_animate:build",
              "js:video:build",
              "js:plyr:build",
              "js:autocomplete:build",
              "js:coffee:build",
              cb

gulp.task "js:build:preview", ["js:build"], ->
  return gulp.src "./contents/js/*.js"
          .pipe gulp.dest "./build/js"

gulp.task "js:rev", ->
  return gulp.src "./build/js/*.js"
        .pipe rev()
        .pipe gulp.dest "./build/js"
        .pipe rev.manifest({base: "./", merge:true})
        .pipe gulp.dest "assets/rev_manifest"

# =================================================================
# update all refs
# =================================================================


gulp.task "ref:all", ->
  return gulp.src "./build/**/*.html", {base: "./"}
          .pipe rev_replace( { manifest: gulp.src("./assets/rev_manifest/rev-manifest.json") } )
          .pipe gulp.dest "./"

gulp.task "rev:clean", ->
  # cleans pre-rev files
  return gulp.src ["./build/css/main.css","./build/js/main.js","./build/js/bkg_video.js","./build/js/sidenav.js"]
        .pipe clean()

# =================================================================
# image min tasks
# =================================================================

gulp.task 'image_min', ->
  options = {
    resize: [1440,1440],
    quality: 85,
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
# lazyload & webp tasks
# =================================================================

gulp.task "img:make", (cb)->
  return runSequence  'webp:make',
                      'img:make:previews'
                      cb

gulp.task "img:clean", (cb)->
  return runSequence  'jpeg:format',
                      'jpeg:clean'
                      cb

gulp.task "jpeg:clean", ->
  return gulp.src('contents/media/images/**/*.{jpeg}',{read:false})
          .pipe(clean())

gulp.task "jpeg:format", ->
  return gulp.src('contents/media/images/**/*.{jpeg}',{base: './'})
    .pipe plumber()
    .pipe imgResize({format: 'jpg'})
    .pipe(gulp.dest('./'))

gulp.task 'img:make:previews', ->
  options = {
    resize: [20,20],
    quality: 85,
    progressive: true,
    compressionLevel: 6,
    sequentialRead: true,
    trellisQuantisation: false
  }

  return gulp.src('./build/media/images/**/*.{jpg,png}',{base: './'})
    .pipe(plumber())
    .pipe(image_min(options))
    .pipe rename
      suffix: '_preview'
    .pipe(gulp.dest('./'))

gulp.task 'webp:make', ->
  return gulp.src('./contents/media/images/**/*.{jpg,png}',{base: './'})
    .pipe plumber()
    .pipe size()
    .pipe webp
      quality: 95
    .pipe size()
    .pipe gulp.dest('./')

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
    .pipe(gulp.dest("./build/media/graphics/web/favicons/"))



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

  postHeader = "---
              \ntitle: #{ humanTitle }
              \ndate: #{ date }
              \nauthor: Pupil Dev Team
              \nsubtitle: ''
              \nfeatured_img_thumb: ''
              \n---"
  fs.writeFile postDir+"/index.md", postHeader
  gutil.log gutil.colors.white.bgBlue("Success! "), "New post created at", gutil.colors.white.bgBlue("#{ postDir }")


# =================================================================
# experiments
# =================================================================

gulp.task "css:clean", ->
  return gulp.src('build/css/*.css')
    .pipe(uncss(
      html: ['build/*/*.html', 'build/index.html', "!build/blog"]
      report: true
      ignore: [
                new RegExp('^.no-touch.*')
                new RegExp('^.Header.*')
                new RegExp('^.js-side-nav*')
                new RegExp('^.side-nav*')
                new RegExp('\.logotype*(.)\S+')
                new RegExp('^.cart-.*')
                new RegExp('^.Cart--t.*')
                new RegExp('^.CartItem-.*')
                new RegExp('^.Cart-r.*')
                new RegExp('\.no-touch*(.)\S+')
                new RegExp('\.Wallop.*(.)\S+')
                new RegExp('^.Wallop.*')
                new RegExp('^.Store.*')
                new RegExp('\.Add*(.)\S+')
                new RegExp('\.Button*(.)\S+')
                new RegExp('\.Grid-*(.)\S+')
                new RegExp('^.Aligner-*(.)\S+')
                new RegExp('^.Aligner-item--stretchHeight-bottom')
                new RegExp('^.TechSpecs-.*')
                new RegExp('^.Feature-video.*')
                new RegExp('^.Grid-cell.*')
                new RegExp('^.Grid--cart.*')
                new RegExp('^.LicenseSpecs.*')
                new RegExp('^.Blog-nav.*')
                new RegExp('^.loading.*')
                new RegExp('^.parsley-.*')
                new RegExp('^.datalist.*')
                new RegExp('^li.active.*')
                new RegExp('^.lazyloaded.*')
                new RegExp('^.img-large--webp.*')
                new RegExp('^.img-small--webp.*')
                new RegExp('^.animated.*')
                new RegExp('^.pulse.*')
                new RegExp('^.plyr.*')
                new RegExp('^.autocomplete.*')
               ]))
    .pipe(gulp.dest('build/css'))
