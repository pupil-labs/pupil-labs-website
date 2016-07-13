hideHeaderOnScroll = ()->
  did_scroll = false
  last_scroll_top = 0
  delta = 40
  navbar_height = $('.Header-container').outerHeight()
  console.log "navbar_height: #{ navbar_height }"

  $(window).scroll (event)=>
    did_scroll = true

  has_scrolled = ()=>
    st = $(this).scrollTop()
    console.log "scroll top position: #{ st }"

    if Math.abs(last_scroll_top - st) < delta
      # if we move less than delta early return (do nothing)
      return

    # if st < $('.Header').outerHeight()
      # reveal everything 
      # $('.Header-container').removeClass('Header-container-show').removeClass('Header-container-hide')
      # coordinates = "translate3d(0px,"+st+"px,0px)"
      # $('.Header-container').css("transform",coordinates)
    else if st > last_scroll_top and st > navbar_height
      console.log "scrolling down past header --> hide everything"
      $('.Header-container').removeClass('Header-container-show').addClass('Header-container-hide')
    else if st + $(window).height() < $(document).height()
      console.log "show nav tabs --> document height: #{ $(document).height() } \n window height: #{ $(window).height() }"
      $(".Header-container").removeClass('Header-container-hide').removeClass('Header-container-show')

    last_scroll_top = st    
  
  setInterval ->
    if did_scroll
      has_scrolled()
      did_scroll = false
  ,250

$(document).ready ->
  hideHeaderOnScroll()
