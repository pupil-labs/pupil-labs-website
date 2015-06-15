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

calculateSubTotal = (productLinks)->
  sum = 0
  for link in productLinks
    sum += $(link).data('cost')
  return sum  

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
  # cart schema
  # [{ "items": [ { "product": "pupil", "specs": ['world-720','eye-none'], "price": 5 } ] }]
  cartButton = "a[id='StoreConfig-addToCart']"
  cartHeaderCounter = "sup[class='Nav-cart-itemCount']"
  $(cartButton).click (event)->
    event.preventDefault()
    worldSelector = "a[class='StoreConfig-world StoreConfig--state-active']" 
    eyeSelector = "a[class='StoreConfig-eye StoreConfig--state-active']"
    worldId = $(worldSelector).attr('id')
    eyeId = $(eyeSelector).attr('id')
    price = calculateSubTotal([worldSelector,eyeSelector])
    order = if LocalStorage.length() > 0 then JSON.parse(LocalStorage.get('order')) else []
    item = {
      "product" : "pupil"
      "specs": [worldId,eyeId]
      "price": price
      "quantity": 1
    }
    order.push(item) 
    LocalStorage.set "order", JSON.stringify(order)
    $(cartHeaderCounter).text("#{ JSON.parse(LocalStorage.get('order')).length }")
    console.log JSON.parse(LocalStorage.get('order')).length + " items: " + LocalStorage.get('order')


getNumItemsInCart = () ->
  itemsInCart = if LocalStorage.length() > 0 then JSON.parse(LocalStorage.get('order')).length else "" 
  cartHeaderCounter = "sup[class='Nav-cart-itemCount']"
  $(cartHeaderCounter).text("#{ itemsInCart }")


updateCart = ()->
  # item | quantity | price | remove
  for i in JSON.parse(LocalStorage.get('order'))
    products = i['product']+" "+i['specs']
    console.log products
    newRow = "<tr><td>#{ products }</td><td>#{ i['quantity'] }</td><td>#{ i['price'] }</td><td>X</td></tr>"
    $("#Cart-items tbody").append(newRow)

$(document).ready ->
  # update on every page
  getNumItemsInCart()
  if $("#Store").length > 0
    # only load scripts if we're in the store
    updateSubTotal()
    selectPreset()
    updateConfig()
    addToCart()
  if $("#Cart").length > 0
    updateCart()
