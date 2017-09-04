(function() { 
  var instances = plyr.setup({
    controls: ["play-large", "fullscreen"],
    showPosterOnEnd: true
  });
})();

const ua = window.navigator.userAgent;
const iOS = (/(iPad|iPhone)/i);
const test = iOS.test(ua);

function fls() {
  let header = document.getElementById("Header");
  if (header.style.zIndex === '0') {
        header.style.zIndex = '2';
  } else {
        header.style.zIndex = '0';
  }
};

document.addEventListener("DOMContentLoaded", function() {
  if ( test == false ) {
    let btn = document.getElementsByTagName("button")[6];
    btn.addEventListener("click", fls);
  }
});