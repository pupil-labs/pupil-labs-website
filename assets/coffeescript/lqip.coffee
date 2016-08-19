blur_up = ()->
  placeholder = document.querySelector('.img-placeholder')
  img_small = document.querySelector('.img-small')

  # background image will always load because it is inlined
  if placeholder and img_small
    img_large = new Image()
    img_large.src = placeholder.dataset.src
    img_large_div = document.createElement('div')
    img_large.onload = ()->

      img_large_div.classList.add 'Background-img--full-wh', 'img-large'
      # img_large_div.style.backgroundImage = "url('"+img_large.src+"');"
      $('.img-large').css('background-image', 'url(' + img_large.src + ')');
      img_large_div.classList.add 'img-loaded'

    placeholder.appendChild(img_large_div)



# window.onload = function() {
  
#   var placeholder = document.querySelector('.placeholder'),
#       small = placeholder.querySelector('.img-small')
  
#   // 1: load small image and show it
#   var img = new Image();
#   img.src = small.src;
#   img.onload = function () {
#    small.classList.add('loaded');
#   };
  
#   // 2: load large image
#   var imgLarge = new Image();
#   imgLarge.src = placeholder.dataset.large; 
#   imgLarge.onload = function () {
#     imgLarge.classList.add('loaded');
#   };
#   placeholder.appendChild(imgLarge);
# }

$(document).ready ->
  blur_up()
