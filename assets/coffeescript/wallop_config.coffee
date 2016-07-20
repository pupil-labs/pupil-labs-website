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


$(document).ready ->
  if $("#Home").length > 0 or $("#Pupil").length > 0
    loadWallopSlider()

