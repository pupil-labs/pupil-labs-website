#import "local_storage.coffee"
#import "products.coffee"
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
    @clearCartClass = "a[id='Cart-clearCart']"
    @addToCartButton = $(@addToCartClass)
    @clearCartButton = $(@clearCartClass)
    @addToCartConfig = $("a[id='AddToCart-config']")
    @worldConfigActiveClass = "a[class='StoreConfig-world #{ @storeConfigActiveClass }']"
    @eyeConfigActiveClass = "a[class='StoreConfig-eye #{ @storeConfigActiveClass }']"
    @licenseConfigClass = 'Store-license'
    @licenseConfigActive = 'StoreConfig--state-active--license'
    @licenseConfigSelector = "a[class^='#{ @licenseConfigClass }']"
    @licenseConfigActiveClass = "a[class='#{ @licenseConfigClass } #{ @licenseConfigActive }']"
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
      @eventSelectLicense()
      @eventRenderCart()
      @eventRemoveCartItem()
      @eventUpdateCartQuantity()
      @eventShowTechSpecs()
      @eventShowOrderForm()
      @eventCopyBillingToShipping()
      @eventToggleShippingInfo()
      @eventTogglePaymentType()
      @eventUpdateFormValues()
      @eventSubmitForm()


  eventStorePageInit: ->
    if $(@storePage).length > 0
      # ConfigOptions--world
      # getProductsFiltered('world')
      for w in getProductsFiltered('world')
        klass = if w.id is "world_hs" then "StoreConfig-world StoreConfig--state-active" else "StoreConfig-world"
        html = "<li class='Grid-cell u-textCenter'>
                 <a role='button' class='#{ klass }' id='#{ w.id }' href='#{ w.img }'>#{w.label}</a> 
                 </li>"
        $("ul[class='Grid Grid--justifyCenter ConfigOptions--world']").append(html)
      for e in getProductsFiltered('eye')
        klass = if e.id is "eye_30hz" then "StoreConfig-eye StoreConfig--state-active" else "StoreConfig-eye"
        html = "<li class='Grid-cell u-textCenter'>
                 <a role='button' class='#{ klass }'' id='#{ e.id }' href='#{ e.img }'>#{e.label}</a> 
                 </li>"
        $("ul[class~='ConfigOptions--eye'").append(html)

      @_updateConfigSubTotal()

  eventAddToCart: ->
    if $(@storePage).length > 0
      @addToCartButton.click (event)=>
          event.preventDefault()
          addToCartBtn = $(event.target)
          if not $(@addToCartBtn).hasClass('Button--state-inactive')

            productType = $(addToCartBtn).data('product')

            if productType is "pupil"
              worldId = $(@worldConfigActiveClass).data('id')
              eyeId = $(@eyeConfigActiveClass).data('id')
              id = [worldId,eyeId]
              price = @_calcConfigSubTotal([@worldConfigActiveClass,@eyeConfigActiveClass,@licenseConfigActiveClass])
              specs = $(@worldConfigActiveClass).data('specs') + "," + $(@eyeConfigActiveClass).data('specs')
              license = $(@licenseConfigActiveClass).data('id')
            else 
              productType = $(addToCartBtn).data('product')
              id = [$(addToCartBtn).data('id')]
              price = $(addToCartBtn).data('cost')
              specs = $(addToCartBtn).data('specs')
              license = "not applicable"
          
            key = @_uniqueId()
            item = {
              "product" : productType
              "id": id
              "specs": specs
              "price": price
              "quantity": 1
              "license": license
            }
            # save to local storage & update the nav counter
            LocalStorage.set(key, JSON.stringify(item))
            @eventUpdateCartNavCounter()
          else
            return false

  eventClearCart: ->
    @clearCartButton.click (event)=>
      event.preventDefault()
      LocalStorage.clear()
      $(".Cart-container").hide 800, ->
        $("#Cart-empty").fadeIn(1000)
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

        if $(@worldConfigActiveClass).data('id') is "world-none" and $(@eyeConfigActiveClass).data('id') is "eye-none"
          @addToCartConfig.addClass('Button--state-inactive')
        else
          if @addToCartConfig.hasClass('Button--state-inactive')
            @addToCartConfig.removeClass('Button--state-inactive') 


  eventSelectPreset: ->
    if $(@storePage).length > 0
      $(@storeConfigPresetClass).click (event)=>
        event.preventDefault()
        activeLink = $(event.currentTarget)
        [worldId,eyeId] = $(activeLink).data('preset').split(" ")
        worldLink = "a[id='#{worldId}']"
        eyeLink = "a[id='#{eyeId}']"
        @_setActiveState([worldLink, eyeLink])
        @_swapImg([worldLink, eyeLink])
        @_updateConfigSubTotal()    

  eventSelectLicense: ->
    if $(@storePage).length > 0
      $("p[class='LicenseSpecs-txt']").text($(@licenseConfigActiveClass).data('specs'))
      $(@licenseConfigSelector).click (event)=>
        event.preventDefault()
        link = $(event.target)
        if not $(link).hasClass("#{ @licenseConfigActive }") 
          # remove the active class from the other link
          # add active to self 
          $(@licenseConfigActiveClass).removeClass("#{ @licenseConfigActive }")
          $(link).addClass("#{ @licenseConfigActive }")
          $("p[class='LicenseSpecs-txt']").text($(link).data('specs'))
          @_updateConfigSubTotal()

  eventRenderCart: ->
    if $(@cartPage).length > 0
      if LocalStorage.length() > 0
        # remove empty cart text
        $("#Cart-empty").hide()
        $(".Cart-container").show()
        for k,v of LocalStorage.dict()
          # product, id, specs, price, quantity
          newRow = "<div class='Cart-rowContainer'>
                    <div class='Grid Grid--center Cart-row' id='#{ k }'>
                        <div class='Grid-cell--5of8'>
                          <p>#{ v['product'] }</p>
                          <p>#{ v['specs'] }</p>
                          <p>License : #{ v['license'] }</p>
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
        [totalPrice,label] = if LocalStorage.length() > 0 then ["€ " + @_sumAll((v['price']*v['quantity'] for k,v of LocalStorage.dict())),"Sub Total"] else ["",""]
        $("div[id='CartSum--label']").text("#{ label }")
        $("div[id='CartSum--total']").text("#{ totalPrice }")
        $("div[id='CartSum--label']").append("<p class='LicenseSpecs-txt' style='font-weight:400;'>(additional shipping and VAT may apply)</p>")
      else
        $(".Cart-container").hide()

  eventRemoveCartItem: ->
    if $(@cartPage).length > 0
      $("div[class~='Cart-removeItem']").click (event)=>
        event.preventDefault()
        item = $(event.currentTarget)
        row = $(item).closest('.Cart-row')
        container = $(row).closest('.Cart-rowContainer')
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
          $(".Cart-container").hide 600, ->
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

  eventShowTechSpecs: ->
    if $(@storePage).length > 0
      $("a[class='TechSpecs']").click (event)=>
        event.preventDefault()
        button = $(event.target)
        # eye or world from 'id'
        type = $(button).attr('id').split('-').pop() 

        selection = "a[class='StoreConfig-#{type} #{ @storeConfigActiveClass }']"
        specTxt = $(selection).data('specs').toLowerCase()
        # make append active class to container 
        element = "p[class='TechSpecs-txt--#{ type }']"       

        if $(button).hasClass("TechSpecs--active")
          $(element).fadeOut(400)
          $(button).removeClass("TechSpecs--active")
          $(button).text("show technical specs")
        else
          $(button).addClass("TechSpecs--active")
          @_updateSpecTxt(type,specTxt)
          $(element).fadeIn(400)
          $(button).text("hide technical specs")

  eventShowOrderForm: ->
    if $(@cartPage).length > 0
      $(".Form-input--radio.Form-checkout").click (event)=>
        event.preventDefault()
        button = $(event.target)
        id = $(button).attr('id')
        submitTxt = if id is "Order" then "Submit Order" else "Request Quote"
        labelId = '#'+id+"-label"
        orderFormContainer = "Cart-orderForm-container"
        orderFormActive = "Cart-orderForm--state-active" 
        if not $(labelId).hasClass("Button--state-active")
          $("label[class^='Button-radio--lg Form-input--radioLabel--lg']").removeClass('Button--state-active') 
          $(labelId).addClass("Button--state-active")
          if not $(orderFormContainer).hasClass(orderFormActive)
            $("."+orderFormContainer).slideDown()
            $("."+orderFormContainer).addClass(orderFormActive)
          $('label[id="form-submit"]').text(submitTxt)            

  eventUpdateFormValues: ->
    if $(@cartPage).length > 0
      $("input, textarea").change (event)=>
        event.preventDefault()
        field = $(event.target)
        $(field).val($(field).val())
        console.log $(field).val()

  eventCopyBillingToShipping: ->
    if $(@cartPage).length > 0
      $("[id^='b-']").change (event)=>
        event.preventDefault()
        field = $(event.target)
        fieldId = $(field).attr('id')
        bFieldVal = $(field).val()
        type = fieldId.split('-').pop()
        try
          sField = "s-"+type
          $("[id=#{ sField }]").val(bFieldVal)
        catch e
          console.log "No matching field in shipping"

  eventToggleShippingInfo: ->
    if $(@cartPage).length > 0
      $("input[id^='s-toggle-']").click (event)=>
        event.preventDefault()
        button = $(event.target)
        buttonId = $(button).attr('id') 
        type = buttonId.split("-").pop()
        if type is "alt"
          # clear all the values of the inputs        
          $("label[for='#{ buttonId }']").addClass('Button--state-active')
          $("label[for='s-toggle-copy']").removeClass('Button--state-active')
          $(".Form-shipping-container").fadeIn()
        else
          $("label[for='#{ buttonId }']").addClass('Button--state-active')
          $("label[for='s-toggle-alt']").removeClass('Button--state-active')
          $(".Form-shipping-container").fadeOut()

  eventTogglePaymentType: ->
    if $(@cartPage).length > 0
      inputPaymentClass = "input[class='Form-input--radio Form-payment-type']"
      $(inputPaymentClass).click (event)=>
        event.preventDefault()
        button = $(event.target)
        $(button).attr("checked")
        
        buttonId = $(button).attr('id') 
        label = "label[for='#{ buttonId }']"
        $("label[for^='p-']").not($(label)).removeClass('Button--state-active')
        $(label).toggleClass("Button--state-active")
        event.stopPropagation()

  eventValidateForm: ->
    # something here
    console.log "something"

  eventSubmitForm: ->
    if $(@cartPage).length > 0
      $("#order-form").on "submit", (event)=>
        event.preventDefault()
        $("input, textarea").each (i,element)=>
          # console.log $(element).val()
          # $(element).val($(element).val())
          # console.log $(element).val()
        formData = $(event.target)
        console.log formData.serialize()

  _sumAll: (vals)->
    vals.reduce (a,b) -> a + b 

  _setActiveState: (links)->
    for link in links
      # see if it is 'eye' or 'world' or maybe in the future 'other'
      type = $(link).attr('id').split('-',1)
      configType = @storeConfigClass + "-" + type
      prevSelection = "a[class='#{ configType + " " }#{ @storeConfigActiveClass}']"
      $(prevSelection).removeClass("#{ @storeConfigActiveClass }")
      $(link).addClass("#{ @storeConfigActiveClass }")
      @_updateSpecTxt(type,$(link).data('specs'))

  _updateSpecTxt: (type,txt)->
    button = ".TechSpecs"
    selector = "p[class='TechSpecs-txt--#{ type }']"
    if $(button).hasClass("TechSpecs--active")
      console.log "active class"
      $(selector).text("#{ txt }")
    else
      $(selector).text("#{ txt }").hide()

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
    subTotal = "€ " + @_calcConfigSubTotal([@worldConfigActiveClass,@eyeConfigActiveClass,@licenseConfigActiveClass])
    if $(@worldConfigActiveClass).data('id') is "world-none" and $(@eyeConfigActiveClass).data('id') is "eye-none"
      subTotal = "Not for sale"  
    $(@configSubTotalClass).text(subTotal)

  _uniqueId: (len=6)->
    id = ""
    id += Math.random().toString(36).substr(2) while id.length < len
    id.substr 0, len
    return id


$(document).ready ->
  s = new PupilStore
