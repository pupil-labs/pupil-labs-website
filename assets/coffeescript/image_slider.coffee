cycleImages = (counter,imgSrcs)->
  $("img[id='Feature-image--configurable']").fadeOut 1000, =>
    $("img[id='Feature-image--configurable']").attr('src',imgSrcs[counter]).fadeIn(1000)

$(document).ready ->
  if $("#Pupil").length > 0
    console.log "I'm on the pupil page..."
    # do something
    counter = 0
    path = "../media/images/config_images/web/"
    fileNames = ["hs_hsm.jpg","hs_.jpg","_hsm.jpg","hs_hsb.jpg","hr_30m.jpg","hr_.jpg"]
    imgSrcs = (path+f for f in fileNames)

    timer = ->
      setInterval ->
        console.log "cycling"
        cycleImages(counter, imgSrcs)
        counter = (if counter > imgSrcs.length then 0 else counter + 1)
      , 3500
      return true
    
    timer()
