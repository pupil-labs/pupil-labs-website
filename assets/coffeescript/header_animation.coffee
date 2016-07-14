hideHeaderOnScroll = ()->
  did_scroll = false
  last_scroll_top = 0
  delta = 50
  navbar_height = $('#Header').outerHeight()

  $(window).scroll (event)=>
    did_scroll = true

  has_scrolled = ()=>
    st = $(this).scrollTop()

    if Math.abs(last_scroll_top - st) < delta
      # if we move less than delta early return (do nothing)
      return

    else if st > last_scroll_top and st > navbar_height
      $('#Header').removeClass('Header-container-show').addClass('Header-container-hide')
    else if st + $(window).height() < $(document).height()
      $('#Header').removeClass('Header-container-hide').removeClass('Header-container-show')

    last_scroll_top = st    
  
  setInterval ->
    if did_scroll
      has_scrolled()
      did_scroll = false
  ,250

$(document).ready ->
  hideHeaderOnScroll()
