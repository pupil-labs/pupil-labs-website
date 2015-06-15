#import "local_storage.coffee"

$ = jQuery

class PupilStore
  constructor: (
    @storeSelector = "Store" #Store class
    @cartPage = "Cart" #Cart class
    @orderPage = "Order" #Order form class

    ) ->
  
  getItemInCart: (key)->
    # check if local storage exists
    try
      return JSON.parse(LocalStorage.get(key))
    catch e 
      console.log "Nothing in the cart, can't get items."
      return {}
  
  getValuesInCart: ()->
    LocalStorage.values()

  addToCart: (key,value)->
    try
      LocalStorage.set(key,JSON.stringify(orders))
    catch e
      console.log "Unable to add item to cart"
    
  emptyCart: (key)->
    try 
      LocalStorage.expire(key)
    catch e
      console.log "Nothing in the cart to be removed."

  removeFromCart: (key,productId)->
    LocalStorage.expire(key)

  uniqueId: (len=6) ->
    id = ""
    id += Math.random().toString(36).substr(2) while id.length < len
    id.substr 0, len

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
  # [{ "order": [ { "product": "pupil", "specs": ['world-720','eye-none'], "price": 5 } ] }]
  # OR - a unique key for each order option (k="order-uid",v=[{}])
  # { "order": [ { "product": "pupil", "specs": ['world-720','eye-none'], "price": 5 } ] }]
  cartButton = "a[id='StoreConfig-addToCart']"
  cartHeaderCounter = "sup[class='Nav-cart-itemCount']"
  $(cartButton).click (event)->
    event.preventDefault()
    worldSelector = "a[class='StoreConfig-world StoreConfig--state-active']" 
    eyeSelector = "a[class='StoreConfig-eye StoreConfig--state-active']"
    worldId = $(worldSelector).attr('id')
    eyeId = $(eyeSelector).attr('id')
    price = calculateSubTotal([worldSelector,eyeSelector])
    # order = if LocalStorage.length() > 0 then JSON.parse(LocalStorage.get('order')) else []
    item = {
      "product" : "pupil"
      "specs": [worldId,eyeId]
      "price": price
      "quantity": 1
    }
    # order.push(item)
    s = new PupilStore
    uid = s.uniqueId()
    uida = uid+'a' 

    s.addToCart(uid,item)
    console.log "Items in cart: " + s.getValuesInCart()
    LocalStorage.set uida, JSON.stringify(item)
    $(cartHeaderCounter).text("#{ LocalStorage.length() }")
    console.log LocalStorage.length() + " items: " + LocalStorage.values()

clearCart = ()->
  clearCartButton = "a[id='StoreConfig-clearCart']"
  $(clearCartButton).click (event)->
    event.preventDefault()
    LocalStorage.clear()
    getNumItemsInCart()


getNumItemsInCart = () ->
  cartHeaderCounter = "sup[class='Nav-cart-itemCount']"
  $(cartHeaderCounter).text("#{ LocalStorage.length() }")


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
    clearCart()
  if $("#Cart").length > 0
    updateCart()
