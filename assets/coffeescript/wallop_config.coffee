loadWallopSlider = (page_id)->
  if page_id is "Home"
    wallop_home = document.querySelector('.Wallop')
    slider = new Wallop wallop_home



$(document).ready ->
  if $("#Home").length > 0
    loadWallopSlider("Home")