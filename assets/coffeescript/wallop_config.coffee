loadWallopSlider = (page_id)->
  if page_id is "Home"
    wallop_home = document.querySelector('.Wallop')
    slider = new Wallop wallop_home
    if slider
        $(document).keydown((eventObject)=> 
            if eventObject.which is 37 
                # left arrow
                slider.previous()
            else if eventObject.which is 39
                # right arrow
                slider.next()
        )
            

$(document).ready ->
  if $("#Home").length > 0
    loadWallopSlider("Home")

