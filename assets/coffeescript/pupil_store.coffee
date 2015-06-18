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
      LocalStorage.set(key, value)
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
        LocalStorage.set(key, JSON.stringify(item))
        @eventUpdateCartNavCounter()

  eventClearCart: ->
    @clearCartButton.click (event)=>
      event.preventDefault()
      LocalStorage.clear()
      @eventUpdateCartNavCounter()

  eventUpdateCartNavCounter: ->
    counter = if LocalStorage.length() > 0 then LocalStorage.length() else ""
    $(@cartNavCounter).text("#{ counter }")

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
      if LocalStorage.length() > 0
        # remove empty cart text
        $("#Cart-empty").hide()
        $("#Cart-table").show()
        for k,v of LocalStorage.dict()
          # product, id, specs, price, quantity
          newRow = "<div class='Cart-container'>
                    <div class='Grid Grid--center' id='#{ k }'>
                        <div class='Grid-cell--5of8'>
                          <p>#{ v['product'] }</p>
                          <p>#{ v['specs'] }</p>
                        </div>
                        <div class='Grid-cell--1of8 u-textCenter'>
                          <p>#{ v['quantity'] }</p>
                        </div>
                        <div class='Grid-cell--1of8 u-textCenter'>
                          <p>#{ v['price'] }</p>
                        </div>  
                        <div class='Cart-removeItem Grid-cell--1of8 u-textCenter'>
                          <p>X</p>
                        </div>  
                      </div>
                      </div>"
          $("#Cart-table").after(newRow)
          # $("#Cart-table tbody").append(newRow)
        [totalPrice,label] = if LocalStorage.length() > 0 then ["€ " + @_sumAll((v['price'] for k,v of LocalStorage.dict())),"Total"] else ["",""]
        $("div[id='CartSum--label']").text("#{ label }")
        $("div[id='CartSum--total']").text("#{ totalPrice }")
      else
        # hide cart table
        # display message with link back to the store
        $("#Cart-empty").show()
        $("#Cart-table").hide()

  eventRemoveCartItem: ->
    if $(@cartPage).length > 0
      $("div[class~='Cart-removeItem']").click (event)=>
        event.preventDefault()
        item = $(event.target)
        row = $(item).closest('.Grid')
        container = $(row).closest('.Cart-container')
        LocalStorage.expire($(row).attr('id'))
        
        # remove the row
        $(container).fadeOut 500, ->
          $(container).remove()

        # update total
        [totalPrice,label] = if LocalStorage.length() > 0 then ["€ " + @_sumAll((v['price'] for k,v of LocalStorage.dict())),"Total"] else ["",""]
        $("div[id='CartSum--label']").text("#{ label }")
        $("div[id='CartSum--total']").text("#{ totalPrice }")

        # update header
        @eventUpdateCartNavCounter()
        if LocalStorage.length() < 1
          # remove empty cart text
          $("#Cart-table").hide()
          $("#Cart-empty").show()

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
