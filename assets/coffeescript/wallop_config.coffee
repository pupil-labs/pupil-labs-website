loadWallopSlider = ()->
  wallop_element = document.querySelector('.Wallop')
  slider = new Wallop wallop_element
  # setup touch events
  hammertime = new Hammer wallop_element
  hammertime.get('swipe').set({ direction: Hammer.DIRECTION_HORIZONTAL })

  # if $(window).width() < 767
  #   $("#slider").addClass("Wallop--slide").removeClass("Wallop--fade")

  $(document).keydown((eventObject)=> 
    if eventObject.which is 37 
      # left arrow
      slider.previous()
    else if eventObject.which is 39
      # right arrow
      slider.next()
  )
 

  if $(window).width() < 768
    # only enable swipe on small screens (touch devices)
    hammertime.on 'swipeleft', (eventObject)->
      slider.next()
    hammertime.on 'swiperight', (eventObject)->
      slider.previous()

  pagination_dots = Array.prototype.slice.call(document.querySelectorAll('.Wallop-dot'))
  text_points = Array.prototype.slice.call(document.querySelectorAll('.Wallop-txt'))

  add_listener = (el,i)->
    el.addEventListener 'click', ()->
      slider.goTo(i)

  add_listener(dot_el, idx) for dot_el,idx in pagination_dots

  slider.on 'change', (event)=>
    $('.Wallop-dot').removeClass('Wallop-dot--current')
    $(pagination_dots[event.detail.currentItemIndex]).addClass('Wallop-dot--current')
    $('.Wallop-txt').removeClass('Wallop-txt--current').addClass('Wallop-txt--hidden')
    $(text_points[event.detail.currentItemIndex]).removeClass('Wallop-txt--hidden').addClass('Wallop-txt--current')

  autoplay = (interval)=>
    last_time = 0

    frame = (timestamp)=>
      console.log "called frame"
      update = timestamp - last_time >= interval
      if update
        console.log update
        slider.next()
        last_time = timestamp

      requestAnimationFrame(frame)
    requestAnimationFrame(frame)

  if wallop_element.dataset.autoplay
    console.log "autoplay"
    # something
    autoplay(500)

$(document).ready ->
  if $("#Pupil").length > 0 or $("#VR-AR").length > 0
    loadWallopSlider()

