blur_up = ()->
  placeholder = document.querySelector('.img-placeholder')
  img_small = document.querySelector('.img-small')
  img_large_div = document.querySelector('.img-large')

  # background image will always load because it is inlined
  if placeholder and img_small
    img_large = new Image()
    img_large.src = img_large_div.dataset.src
    # img_large_div = document.createElement('div')
    img_large.onload = ()->

      # img_large_div.classList.add 'Background-img--full-wh', 'img-large'
      # img_large_div.style.backgroundImage = "url('"+img_large.src+"');"
      $('.img-large').css('background-image', 'url(' + img_large.src + ')');
      img_large_div.classList.add('img-loaded')
      
      # remove b64 bkg image only if img_large is fully loaded
  img_large_div.addEventListener "transitionend", (e) =>
    img_small.style.removeProperty('background-image')


$(document).ready ->
  blur_up()
