Pupil Labs Website
==================
Check out the live site at [www.pupil-labs.com](http://pupil-labs.com)

## Dependencies

*Python*
  + [Pelican](https://github.com/getpelican/pelican) - `pip install pelican`
  + [Markdown](https://github.com/waylan/Python-Markdown) - `pip install markdown`
  + [Fabric](http://www.fabfile.org/) - `pip install Fabric`
  + [WebAssets](https://github.com/miracle2k/webassets/) - `pip install webassets`
  + [cssmin](http://github.com/zacharyvoase/cssmin) - `pip install cssmin`

*Node*
Some WebAssets pacakges require node libs - we will be working with `stylus` for css preprocessing and `autoprefixer` to acommodate older browsers. 
  + Install node - `brew install node` 
  + [Stylus](https://learnboost.github.io/stylus/) - `npm install -g stylus` 
  + [Autoprefixer](https://github.com/postcss/autoprefixer) - `npm install -g autoprefixer`
  + [CoffeeScript](http://coffeescript.org/) - `npm install -g coffeescript`
  + [UglifyJS](https://github.com/mishoo/UglifyJS) - `npm install -g uglifyjs`

## Build Instructions
  
  + `fab build`
  + `fab serve`
    + Open browser and go to `localhost:8000`
    + If you want to serve on a different port you can pass the port as an argument e.g. `fab serve:3000` 

## Deployment Instructions
... coming soon

## Theme development
... coming soon