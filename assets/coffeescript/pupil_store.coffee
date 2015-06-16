#import "local_storage.coffee"
$ = jQuery

class PupilStore
  constructor: (
    @storeSelector = "Store" #Store class
    @cartPage = "Cart" #Cart class
    @orderPage = "Order" #Order form class
    @storeConfigClass = "StoreConfig"
    @storeConfigSelector = "a[class^='#{ @storeConfigClass}-']"
    @storeConfigSelectorJq = $("a[class^='StoreConfig-']")
    @storeConfigActiveClass = "StoreConfig--state-active"
    @addToCartClass = "a[class='AddToCart']"
    @clearCartClass = "a[id='StoreConfig-clearCart']"
    @addToCartButton = $(@addToCartClass)
    @clearCartButton = $(@clearCartClass)
    @worldConfigActiveClass = "a[class='StoreConfig-world #{ @storeConfigActiveClass }']"
    @eyeConfigActiveClass = "a[class='StoreConfig-eye #{ @storeConfigActiveClass }']"
    @configSubTotalClass = "p[class='StoreConfig-subTotal']"
    @cartNavCounter = $("sup[class='Nav-cart-itemCount']")
    @activeLink = null
    ) ->
      @eventAddToCart()
      @eventClearCart()
      @eventUpdateCartNavCounter()
      @eventUpdateConfig()
  
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
      addToCartBtn = $(event.target)
      console.log "addtocart event.target " + event.target
      productType = $(addToCartBtn).data('product')
      
      if productType is "pupil"
        worldId = $(@worldConfigActiveClass).data('id')
        eyeId = $(@eyeConfigActiveClass).data('id')
        id = [worldId,eyeId]
        price = @_calcConfigSubTotal([@worldConfigActiveClass,@eyeConfigActiveClass])
        specs = $(@worldConfigActiveClass).data('specs') + "," + $(@eyeConfigActiveClass).data('specs')
      else 
        productType = $(addToCartBtn).data('product')
        id = $(addToCartBtn).data('id')
        price = $(addToCartBtn).data('cost')
        specs = $(addToCartBtn).data('specs')
    
      key = @_uniqueId()
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

  eventUpdateCartNavCounter: ->
    $(@cartNavCounter).text("#{ LocalStorage.length() }")


  eventUpdateConfig: ->
    @storeConfigSelectorJq.click (event)=>
      event.preventDefault()
      console.log "Event.target: " + event.target
      console.log "Event.currentTarget: " + event.currentTarget

      activeLinks = $(event.target)
      @_setActiveState(activeLinks)
      @_swapImg(activeLinks)
      @_updateConfigSubTotal()

  _setActiveState: (links)->
    for link in links
      # see if it is 'eye' or 'world' or maybe in the future 'other'
      configType = @storeConfigClass + "-" + $(link).attr('id').split('-',1)
      prevSelection = "a[class='#{ configType + " " }#{ @storeConfigActiveClass}']"
      $(prevSelection).removeClass("#{ @storeConfigActiveClass }")
      $(link).addClass("#{ @storeConfigActiveClass }")

  _swapImg: (links)->
    for link in links
      imgId = '#' + $(link).attr('id').split('-',1) + '-img'
      imgSrc = $(link).attr("href")
      $(imgId).attr("src", imgSrc).show()

  _calcConfigSubTotal: (links)->
    sum = 0
    for link in links
      sum += $(link).data('cost')
    return sum  

  _updateConfigSubTotal: ->
    subTotal = @_calcConfigSubTotal([@worldConfigActiveClass,@eyeConfigActiveClass])
    $(@configSubTotalClass).text("€ " + subTotal)

  _uniqueId: (len=6)->
    id = ""
    id += Math.random().toString(36).substr(2) while id.length < len
    id.substr 0, len
    return id



$(document).ready ->
  # update
  # if $("#Store").length > 0
  s = new PupilStore
