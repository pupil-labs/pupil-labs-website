// es6 port of https://github.com/rishabhp/bideo.js

'use strict';

class Bideo {
  constructor (opt) {
    this.videoEl = opt.videoEl;
    this.resize = opt.resize || false;
    this.isMobile = opt.isMobile || false;
    this.autoplay = opt.autoplay || false;
    this.onLoad = opt.onLoad;
    this.src = opt.src;
    this.container = opt.container;
    // this._addSources = this._addSources.bind(this);    
    this._addSources();

    this._addEventListeners = this._addEventListeners.bind(this); 
    this._resize = this._resize.bind(this);
    this._canPlay = this._canPlay.bind(this);

    this._addEventListeners();
  }

  _addEventListeners () {
    // this.videoEl.addEventListener('loadedmetadata', this._resize, false);
    this.videoEl.addEventListener('canplay', this._canPlay);
    if (this.resize === true){
      window.addEventListener('resize', this._resize, false);
    }

  }

  _addSources () {
    let source = document.createElement('source');

    for (let sObj of this.src) {
      for (let k in sObj){
        // console.log(k +" - "+sObj[k]);
        source.setAttribute(k, sObj[k]);    
      }
    }

    this.videoEl.appendChild(source);
  }

  _canPlay () {
    // console.log("called canPlay");
    if (this.isMobile === false){
      this.onLoad();
      if(this.autoplay === true){
        // console.log(this.videoEl);
        this.videoEl.play();
      }
    }
  }


  _resize () {
    if ('object-fit' in document.body.style) {
      return;
    }
    // everything below this line is a fallback
    // for browsers that do not support object-fit
    // console.log("object-fit not supported");
    let w = this.videoEl.videoWidth;
    let h = this.videoEl.videoHeight;
    let videoRatio = (w/h).toFixed(4);

    let container = this.container;
    let containerStyles = window.getComputedStyle(container);
    let minW = parseFloat( containerStyles.getPropertyValue('width') );
    let minH = parseFloat( containerStyles.getPropertyValue('height') );

    if (containerStyles.getPropertyValue('box-sizing') !== 'border-box'){
      let paddingTop = parseFloat(containerStyles.getPropertyValue('padding-top'));
      let paddingBottom = parseFloat(containerStyles.getPropertyValue('padding-bottom'));
      let paddingLeft = parseFloat(containerStyles.getPropertyValue('padding-left'));
      let paddingRight = parseFloat(containerStyles.getPropertyValue('padding-right'));
      
      minW += paddingLeft + paddingRight;
      minH += paddingTop + paddingBottom;
    }

    let widthRatio = minW / w;
    let heightRatio = minH / h;
    var new_width, new_height;

    if (widthRatio > heightRatio) {
      new_width = minW;
      new_height = Math.ceil( new_width/ videoRatio );
    } else {
      new_height = minH;
      new_width = Math.ceil(new_height * videoRatio);
    }

    this.videoEl.style.width = new_width + 'px';
    this.videoEl.style.height = new_height + 'px';
  }

}