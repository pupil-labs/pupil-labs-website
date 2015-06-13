#import "local_storage.coffee"

$ = jQuery

swapImg = (links) ->
  for link in links
    imgId = '#' + $(link).attr('id').split('-',1) + '-img'
    imgSrc = $(link).attr("href")
    # use the href attribute of the link to update the img
    $(imgId).attr("src", imgSrc).show()

updateLinkState = (links) ->
  for link in links
    configType = 'StoreConfig-' + $(link).attr('id').split('-',1)
    activeState = 'StoreConfig--state-active'
    prevSelection = "a[class='#{ configType + " " + activeState }']"
    # remove previously active & add active class to clicked 
    $(prevSelection).removeClass(activeState)
    $(link).addClass(activeState)

updateSubTotal = () ->
  # sum the cost of the active links
  worldLink = "a[class='StoreConfig-world StoreConfig--state-active']"
  eyeLink = "a[class='StoreConfig-eye StoreConfig--state-active']"
  subTotalTxt = "p[class=StoreConfig-subTotal]"

  worldCost = $(worldLink).data('cost')
  eyeCost = $(eyeLink).data('cost')
  # console.log "world: #{ worldCost } eye: #{ eyeCost }"
  subTotal = parseFloat(worldCost) + parseFloat(eyeCost)
  $(subTotalTxt).text("€ "+subTotal)

updateConfig = () ->
  link = "a[class^='StoreConfig-']"
  $(link).click (event)->
    event.preventDefault()
    updateLinkState([$(this)])
    swapImg([$(this)])
    updateSubTotal()

selectPreset = () ->
  link = "a[class='Store-nav-link Store-nav-link--preset']"
  $(link).click (event)->
    event.preventDefault()
    # get the id of the preset from the data attribute
    [worldId,eyeId] = $(this).data('preset').split(" ")
    worldLink = "a[id='#{worldId}']"
    eyeLink = "a[id='#{eyeId}']"
    updateLinkState([worldLink, eyeLink])
    swapImg([worldLink, eyeLink])
    updateSubTotal()

addToCart = () ->
  cartButton = "a[id='StoreConfig-addToCart']"
  cartHeaderCounter = "sup[class='Nav-cart-itemCount']"
  $(cartButton).click (event)->
    event.preventDefault()
    worldId = $("a[class='StoreConfig-world StoreConfig--state-active']").attr('id')
    eyeId = $("a[class='StoreConfig-eye StoreConfig--state-active']").attr('id')  
    if LocalStorage.length() is 0
      counter = 0
    else
      counter = LocalStorage.length()
    LocalStorage.set counter, JSON.stringify([worldId, eyeId])
    $(cartHeaderCounter).text("#{ LocalStorage.length() }")

getNumItemsInCart = () ->
  itemsInCart = if LocalStorage.length() > 0 then LocalStorage.length() else "" 
  cartHeaderCounter = "sup[class='Nav-cart-itemCount']"
  $(cartHeaderCounter).text("#{ itemsInCart }")

$(document).ready ->
  getNumItemsInCart()
  if $("#Store").length > 0
    # only load scripts if we're in the store
    updateSubTotal()
    selectPreset()
    updateConfig()
    addToCart()
