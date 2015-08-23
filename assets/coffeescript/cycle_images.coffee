cycleImages = (counter,imgSrcs)->
  $("img[id='Feature-image--configurable']").fadeOut 1000, =>
    $("img[id='Feature-image--configurable']").attr('src',imgSrcs[counter]).fadeIn(1000)

_preloadImages = (imageUrls)->
  for url in imageUrls
    (new Image()).src = url

$(document).ready ->
  if $("#Pupil").length > 0
    # do something
    counter = 0
    path = "../media/images/config_images/web/"
    fileNames = ["hs_hsm.jpg","hs_.jpg","_hsm.jpg","hs_hsb.jpg","hr_30m.jpg","hr_.jpg"]
    imgSrcs = (path+f for f in fileNames)
    _preloadImages(imgSrcs)
    timerId = 0

    run = ->
      if counter > imgSrcs.length
        counter = 0
        stop(timerId)
      else 
        counter += 1
      cycleImages(counter, imgSrcs)
     
    stop = (timerId) ->
      clearInterval(timerId)
     
    timerId = setInterval(run, 4000)


