(()=>{
  let options = {
    videoEl: document.querySelector('#background-video'),
    container: document.querySelector('#Oculus-addon-cup-video-container'),
    resize: true,
    autoplay: true,
    isMobile: window.matchMedia('(max-width: 768px)').matches,
    playButton: document.querySelector('#play'),
    pauseButton: document.querySelector('#pause'),
    src: [
      {
        src: '../media/videos/oculus_addon_cup.mp4',
        type: 'video/mp4'
      }
      // {
      //   src: 'assembly.webm',
      //   type: 'video/webm;codecs="vp8, vorbis"'
      // }
    ],
    onLoad: ()=>{
      console.log("hiding video cover");
      document.querySelector('#video_cover').style.display = 'none';
    }
  }

  var bv = new Bideo(options)
})()