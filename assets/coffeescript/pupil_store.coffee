#import "local_storage.coffee"
$ = jQuery

class PupilStore
  constructor: (
    @storePage = "#Store" #Store class
    @cartPage = "#Cart" #Cart class
    @orderPage = "Order" #Order form class
    @storeConfigClass = "StoreConfig"
    @storeConfigSelector = "a[class^='#{ @storeConfigClass}-']"
    @storeConfigActiveClass = "StoreConfig--state-active"
    @addToCartClass = "a[class='AddToCart']"
    @clearCartClass = "a[id='StoreConfig-clearCart']"
    @addToCartButton = $(@addToCartClass)
    @clearCartButton = $(@clearCartClass)
    @worldConfigActiveClass = "a[class='StoreConfig-world #{ @storeConfigActiveClass }']"
    @eyeConfigActiveClass = "a[class='StoreConfig-eye #{ @storeConfigActiveClass }']"
    @configSubTotalClass = "p[class='StoreConfig-subTotal']"
    @cartNavCounter = $("sup[class='Nav-cart-itemCount']")
    @storeConfigPresetClass = "a[class='Store-nav-link Store-nav-link--preset']"
    ) ->
      @eventAddToCart()
      @eventClearCart()
      @eventUpdateCartNavCounter()
      @eventUpdateConfig()
      @eventSelectPreset()
      @eventRenderCart()
      @eventRemoveCartItem()
  
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
    if $(@storePage).length > 0
      @addToCartButton.click (event)=>
        event.preventDefault()
        addToCartBtn = $(event.target)
        productType = $(addToCartBtn).data('product')

        if productType is "pupil"
          worldId = $(@worldConfigActiveClass).data('id')
          eyeId = $(@eyeConfigActiveClass).data('id')
          id = [worldId,eyeId]
          price = @_calcConfigSubTotal([@worldConfigActiveClass,@eyeConfigActiveClass])
          specs = $(@worldConfigActiveClass).data('specs') + "," + $(@eyeConfigActiveClass).data('specs')
        else 
          productType = $(addToCartBtn).data('product')
          id = [$(addToCartBtn).data('id')]
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
    if $("#Store").length > 0
      $(@storeConfigSelector).click (event)=>
        event.preventDefault()
        # typically we would use $(this) to refer to the jquery object
        # within the scope of the `click` function
        # but in coffeescript when we use the fat arrow (=>)
        # we are referring to the class itself and not the jquery object 
        activeLinks = $(event.target)
        @_setActiveState(activeLinks)
        @_swapImg(activeLinks)
        @_updateConfigSubTotal()


  eventSelectPreset: ->
    if $("#Store").length > 0
      $(@storeConfigPresetClass).click (event)=>
        event.preventDefault()
        activeLink = $(event.target)
        [worldId,eyeId] = $(activeLink).data('preset').split(" ")
        worldLink = "a[id='#{worldId}']"
        eyeLink = "a[id='#{eyeId}']"
        @_setActiveState([worldLink, eyeLink])
        @_swapImg([worldLink, eyeLink])
        @_updateConfigSubTotal()    

  eventRenderCart: ->
    if $(@cartPage).length > 0
      for k,v of LocalStorage.dict()
        # product, id, specs, price, quantity
        newRow = "<tr id='#{ k }'><td><p>#{ v['product'] }</p><p>#{ v['specs'] }</p></td><td>#{ v['quantity'] }</td><td>#{ v['price'] }</td><td class='Cart-removeItem'>X</td></tr>"
        $("#Cart-items tbody").append(newRow).addClass("Cart-orderItem")
      total = if LocalStorage.length() > 0 then @_sumAll((v['price'] for v in LocalStorage.values())) else 0
      $("td[id='CartSum--total'").text("#{ total }")

  eventRemoveCartItem: ->
    if $(@cartPage).length > 0
      $("td[class='Cart-removeItem'").click (event)=>
        event.preventDefault()
        item = $(event.target)
        tr = $(item).closest('tr')
        LocalStorage.expire($(tr).attr('id'))
        
        # remove the row
        $(tr).fadeOut 300, ->
          $(tr).remove()

        # update total
        total = if LocalStorage.length() > 0 then @_sumAll((v['price'] for v in LocalStorage.values())) else 0
        $("td[id='CartSum--total'").text("#{ total }")
     
        # update header
        @eventUpdateCartNavCounter()

  _sumAll: (vals)->
    vals.reduce (a,b) -> a + b 

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
  s = new PupilStore
