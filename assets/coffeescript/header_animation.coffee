hideHeaderOnScroll = ()->
  did_scroll = false
  last_scroll_top = 0
  delta = 5
  navbar_height = $('.Header').outerHeight()

  $(window).scroll (event)=>
    did_scroll = true

  has_scrolled = ()=>
    st = $(this).scrollTop()
    if Math.abs(last_scroll_top - st) <= delta
      return

    if st > last_scroll_top and st > navbar_height
      $('.Header').removeClass('Header-show').addClass('Header-hide')
    else if st + $(window).height() < $(document).height()
      $(".Header").removeClass('Header-hide').addClass('Header-show')

    last_scroll_top = st    
  
  setInterval ->
    if did_scroll
      has_scrolled()
      did_scroll = false
  ,250

$(document).ready ->

  hideHeaderOnScroll()
