# hideHeaderOnScroll = ()->
#   did_scroll = false
#   last_scroll_top = 0
#   delta = 50
#   navbar_height = $('#Header').outerHeight()

#   $(window).scroll (event)=>
#     did_scroll = true

#   has_scrolled = ()=>
#     st = $(this).scrollTop()

#     if Math.abs(last_scroll_top - st) < delta
#       # if we move less than delta early return (do nothing)
#       return

#     else if st > last_scroll_top and st > navbar_height
#       $('#Header').removeClass('Header-container-show').addClass('Header-container-hide')
#     else if st + $(window).height() < $(document).height()
#       $('#Header').removeClass('Header-container-hide').removeClass('Header-container-show')

#     last_scroll_top = st    
  
#   setInterval ->
#     if did_scroll
#       has_scrolled()
#       did_scroll = false
#   ,250

headerOpacityHome = ()->
  navbar_height = $('#Header').outerHeight()
  transform = navbar_height * 2
  did_scroll = false
  last_scroll_top = 0


  if $(window).width() < 768
    $("#Header").addClass("Header-bkg-opaque")
    return
  else
    $("#Header").addClass("Header-bkg-transparent")


  $(window).scroll (event)=>
      did_scroll = true

  has_scrolled = ()=>
    st = $(this).scrollTop()
    bkg_img_height = $('.Background-img--full-wh').height()
    offset = 20
    navbar_pos = bkg_img_height - (offset + navbar_height)
    within_container = st < navbar_pos

    if within_container
      # add transparent class remove opaque class
      # $("#Header").css('background-color', 'rgba(255,255,255,0.0)')
      $("#Header").addClass("Header-bkg-transparent").removeClass("Header-bkg-opaque")
    else 
      # remove transparent class add opaque class
      $("#Header").addClass("Header-bkg-opaque").removeClass("Header-bkg-transparent")

    last_scroll_top = st

  setInterval ->
    if did_scroll
      has_scrolled()
      dis_scroll = false
  ,100

$(document).ready ->
  if $("#Home").length > 0
    # on load make the header transparent
    headerOpacityHome()