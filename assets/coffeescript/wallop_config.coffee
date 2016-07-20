loadWallopSlider = (page_id)->
  if page_id is "Home"
    wallop_home = document.querySelector('.Wallop')
    slider = new Wallop wallop_home
    # setup touch events
    hammertime = new Hammer wallop_home
    hammertime.get('swipe').set({ direction: Hammer.DIRECTION_HORIZONTAL })

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
        slider.previous()
      hammertime.on 'swiperight', (eventObject)->
        slider.next()


$(document).ready ->
  if $("#Home").length > 0
    loadWallopSlider("Home")

