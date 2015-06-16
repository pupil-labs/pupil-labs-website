#import "local_storage.coffee"
$ = jQuery

class PupilStore
  constructor: (
    @storeSelector = "Store" #Store class
    @cartPage = "Cart" #Cart class
    @orderPage = "Order" #Order form class
    @addToCartClass = "a[class='StoreConfig-addToCart']"
    @clearCartClass = "a[id='StoreConfig-clearCart']"
    @addToCartButton = $(@addToCartClass)
    @clearCartButton = $(@clearCartClass)
    @worldConfigActiveClass = "a[class='StoreConfig-world StoreConfig--state-active']"
    @eyeConfigActiveClass = "a[class='StoreConfig-eye StoreConfig--state-active']"
    @cartNavCounter = $("sup[class='Nav-cart-itemCount']")
    ) ->
      @eventAddToCart()
      @eventClearCart()
      @eventUpdateCartNavCounter()
  
  getItemInCart: (key)->
    # check if local storage exists
    try
      return JSON.parse(LocalStorage.get(key))
    catch e 
      console.log "Nothing in the cart, can't get items."
      return {}
  
  getValuesInCart: ->
    LocalStorage.values()

  saveToCart: (key,value)->
    try
      LocalStorage.set(key, JSON.stringify(value))
    catch e
      console.log "Unable to add item to cart"
    
  emptyCart: (key)->
    try 
      LocalStorage.expire(key)
    catch e
      console.log "Nothing in the cart to be removed."

  removeFromCart: (key,productId)->
    LocalStorage.expire(key)

  eventAddToCart: ->
    @addToCartButton.click (event)=>
      event.preventDefault()

      productType = $(this).data('product')
      
      if productType is "pupil"
        worldId = $(@worldConfigActiveClass).data('id')
        eyeId = $(@eyeConfigActiveClass).data('id')
        id = [worldId,eyeId]
        price = @_calcConfigSubTotal([@worldConfigActiveClass,@eyeConfigActiveClass])
        console.log price
        specs = $(@worldConfigActiveClass).data('specs') + "," + $(@eyeConfigActiveClass).data('specs')
      else 
        productType = $(this).data('product')
        id = $(this).data('id')
        price = $(this).data('cost')
        specs = $(this).data('specs')
    
      key = @uniqueId()
      item = {
        "product" : productType
        "id": id
        "specs": specs
        "price": price
        "quantity": 1
      }

      # save to local storage & update the nav counter
      @saveToCart(key, item)
      @eventUpdateCartNavCounter()

  eventClearCart: ->
    @clearCartButton.click (event)=>
      event.preventDefault()
      LocalStorage.clear()
      @eventUpdateCartNavCounter()

  _calcConfigSubTotal: (productLinks)->
    sum = 0
    for link in productLinks
      sum += $(link).data('cost')
    return sum  

  uniqueId: (len=6)->
    id = ""
    id += Math.random().toString(36).substr(2) while id.length < len
    id.substr 0, len
    return id

  eventUpdateCartNavCounter: ->
    $(@cartNavCounter).text("#{ LocalStorage.length() }")


$(document).ready ->
  # update
  # if $("#Store").length > 0
  s = new PupilStore
