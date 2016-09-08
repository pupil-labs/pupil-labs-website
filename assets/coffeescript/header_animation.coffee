headerOpacityHome = ()->
  navbar_height = $('#Header').outerHeight()
  transform = navbar_height * 2
  did_scroll = false
  did_resize = false
  last_scroll_top = 0

  # gets called on document load
  # console.log $(window).width()
  if $(window).width() < 768
    $("#Header").removeClass("Header-bkg-transparent").addClass("Header-bkg-opaque")
  else
    $("#Header").removeClass("Header-bkg-opaque").addClass("Header-bkg-transparent")

  # require resize event
  $(window).resize (event)=>
    did_resize = true

  $(window).scroll (event)=>
    did_scroll = true

  has_resized = ()=>
    st = $(this).scrollTop()
    bkg_img_height = $(".Background-img-top").height()
    within_container = st <= bkg_img_height

    if $(window).width() < 768
      $("#Header").removeClass("Header-bkg-transparent").addClass("Header-bkg-opaque")
    else if within_container
      # if header within bkg img then make transparent
      $("#Header").removeClass("Header-bkg-opaque").addClass("Header-bkg-transparent")
    else
      # do nothing
      return

  has_scrolled = ()=>
    if $(window).width() < 768
      return
      
    st = $(this).scrollTop()
    bkg_img_height = $("div[class^='Background-img-top']").height()
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
      did_scroll = false
    if did_resize
      has_resized()
      did_resize = false
  ,100

set_active_nav_link = ()->
  current_path = window.location.href
  for link in $(".Header-nav-item")
    $(link).removeClass("Header-nav-active")
    if link.href is current_path
      $(link).addClass("Header-nav-active")


$(document).ready ->
  if $("#Home").length > 0 or $("#Pupil").length > 0 or $("#VR-AR").length > 0 or $("#About").length > 0 or $("#Jobs").length > 0 or $("#Blog").length > 0
    # on load make the header transparent
    headerOpacityHome()
  else
    $("#Header").removeClass("Header-bkg-transparent").addClass("Header-bkg-opaque")

  set_active_nav_link()