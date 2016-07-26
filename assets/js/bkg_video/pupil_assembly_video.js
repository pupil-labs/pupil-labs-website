'use strict';

let options = {
  videoEl: document.querySelector('#background_video'),
  container: document.querySelector('body'),
  resize: true,
  autoplay: true,
  isMobile: window.matchMedia('(max-width: 768px)').matches,
  playButton: document.querySelector('#play'),
  pauseButton: document.querySelector('#pause'),
  src: [
    {
      src: '../media/videos/assembly.mp4',
      type: 'video/mp4'
    }
  ],
  onLoad: ()=>{
    console.log("hiding video cover");
    document.querySelector('#video_cover').style.display = 'none';
  }
}

var bv = new Bideo(options)