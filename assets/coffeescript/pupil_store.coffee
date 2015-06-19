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
    @addToCartClass = "a[class^='AddToCart']"
    @clearCartClass = "a[id='StoreConfig-clearCart']"
    @addToCartButton = $(@addToCartClass)
    @clearCartButton = $(@clearCartClass)
    @worldConfigActiveClass = "a[class='StoreConfig-world #{ @storeConfigActiveClass }']"
    @eyeConfigActiveClass = "a[class='StoreConfig-eye #{ @storeConfigActiveClass }']"
    @configSubTotalClass = "p[class='StoreConfig-subTotal']"
    @cartNavCounter = $("sup[class='Nav-cart-itemCount']")
    @storeConfigPresetClass = "a[class='Store-navPreset']"
    ) ->
      @eventStorePageInit()
      @eventAddToCart()
      @eventClearCart()
      @eventUpdateCartNavCounter()
      @eventUpdateConfig()
      @eventSelectPreset()
      @eventRenderCart()
      @eventRemoveCartItem()
      @eventUpdateCartQuantity()
  
  eventStorePageInit: ->
    if $(@storePage).length > 0
      @_updateConfigSubTotal()

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
    if $(@storePage).length > 0
      $(@storeConfigPresetClass).click (event)=>
        event.preventDefault()
        activeLink = $(event.target)
        console.log activeLink
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
                    <div class='Grid Grid--center Cart-row' id='#{ k }'>
                        <div class='Grid-cell--5of8'>
                          <p>#{ v['product'] }</p>
                          <p>#{ v['specs'] }</p>
                        </div>
                        <div class='Grid-cell--1of8 u-textCenter'>
                          <div class='Grid Grid--center'>
                            <div class='Grid-cell--1of2'>
                              <p class='Cart-itemQuant'>#{ v['quantity'] }</p>
                            </div>
                            <div class='Grid-cell--1of2'>
                              <div class='Grid Grid-column'>
                                <div class='Grid-cell Cart-itemQuant--increment Cart-item-plus'><p class='Cart--triangle-up'></p></div>
                                <div class='Grid-cell Cart-itemQuant--increment Cart-item-minus'><p class='Cart--triangle-down'></p></div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class='Grid-cell--1of8 u-textCenter'>
                          <p>€ #{ v['price'] }</p>
                        </div>  
                        <div class='Cart-removeItem Grid-cell--1of8 u-textCenter'>
                          <p>X</p>
                        </div>  
                      </div>
                      </div>"
          $("#Cart-table").after(newRow)
          # $("#Cart-table tbody").append(newRow)
        [totalPrice,label] = if LocalStorage.length() > 0 then ["€ " + @_sumAll((v['price']*v['quantity'] for k,v of LocalStorage.dict())),"Total"] else ["",""]
        $("div[id='CartSum--label']").text("#{ label }")
        $("div[id='CartSum--total']").text("#{ totalPrice }")
      else
        # hide cart table
        # display message with link back to the store
        # $("#Cart-empty").show()
        $("#Cart-table").hide()

  eventRemoveCartItem: ->
    if $(@cartPage).length > 0
      $("div[class~='Cart-removeItem']").click (event)=>
        event.preventDefault()
        item = $(event.currentTarget)
        row = $(item).closest('.Cart-row')
        container = $(row).closest('.Cart-container')
        LocalStorage.expire($(row).attr('id'))
        
        # remove the row
        $(container).slideUp 400, ->
          $(container).remove()

        # update total
        [totalPrice,label] = if LocalStorage.length() > 0 then ["€ " + @_sumAll((v['price']*v['quantity'] for k,v of LocalStorage.dict())),"Total"] else ["",""]
        $("div[id='CartSum--label']").text("#{ label }")
        $("div[id='CartSum--total']").text("#{ totalPrice }")

        # update header
        @eventUpdateCartNavCounter()
        if LocalStorage.length() < 1
          # remove empty cart text
          $("#Cart-table").hide 600, ->
            $("#Cart-empty").fadeIn(1000)

  eventUpdateCartQuantity: ->
    if $(@cartPage).length > 0
      $("div[class~='Cart-itemQuant--increment']").click (event)=>
        event.preventDefault()
        item = $(event.currentTarget)
        sign = $(item).attr('class').split(' ').pop().split('-').pop()

        row = $(item).closest('.Cart-row')
        numDisplay = $(row).find('.Cart-itemQuant')
        key = $(row).attr('id')

        # get object from local storage
        order = JSON.parse(LocalStorage.get(key))
        # update quantity 
        order['quantity'] = if sign is 'plus' then order['quantity'] += 1 else if order['quantity'] > 1 then order['quantity'] -= 1 else 1

        # write quantity back to storage
        LocalStorage.set(key,JSON.stringify(order))

        # update the display text
        $(numDisplay).text("#{ order['quantity'] }")

        # update subtotal 
        totalPrice = if LocalStorage.length() > 0 then "€ " + @_sumAll((v['price']*v['quantity'] for k,v of LocalStorage.dict())) else ""
        $("div[id='CartSum--total']").text("#{ totalPrice }")

  _sumAll: (vals)->
    vals.reduce (a,b) -> a + b 

  _setActiveState: (links)->
    for link in links
      console.log link
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
