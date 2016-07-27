loadWallopSlider = ()->
  wallop_home = document.querySelector('.Wallop')
  slider = new Wallop wallop_home
  # setup touch events
  hammertime = new Hammer wallop_home
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

  add_listener = (el,i)->
    el.addEventListener 'click', ()->
      slider.goTo(i)

  add_listener(dot_el, idx) for dot_el,idx in pagination_dots

  slider.on 'change', (event)=>
    $('.Wallop-dot').removeClass('Wallop-dot--current')
    $(pagination_dots[event.detail.currentItemIndex]).addClass('Wallop-dot--current')

$(document).ready ->
  if $("#Home").length > 0 or $("#Pupil").length > 0 or $("#VR-AR").length > 0
    loadWallopSlider()

