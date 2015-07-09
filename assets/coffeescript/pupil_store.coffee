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
      @eventFillCartFromQueryString()
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
      @eventGenerateOrderLink()
      @eventOrderLinkSuccessPage()


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
        $("ul[class~='ConfigOptions--eye']").append(html)
      for p in getProductsFiltered('product')
        html = "<div class='Aligner-item'>
                  <div class='Aligner-item--column'>
                    <img class='Feature-image' src=#{ p.img }>
                    <div class='Aligner-item--stretchHeight'>
                      <p> #{ p.label } </p>
                      <p> #{ p.specs } </p>
                      <p>€ #{ p.cost } </p>
                    </div>

                  <a role='button' id='#{ p.id }' class='AddToCart button-flex' href='#' data-product='product'>Add to Cart</a>
                
                  </div>
                </div>"
        $("div[class~='Additional-products']").append(html)

      @_updateConfigSubTotal()

  eventAddToCart: ->
    if $(@storePage).length > 0
      $(@addToCartClass).click (event)=>
          event.preventDefault()
          addToCartBtn = $(event.target)
          if not $(@addToCartBtn).hasClass('Button--state-inactive')

            productType = $(addToCartBtn).data('product')

            if productType is "pupil"
              worldId = $(@worldConfigActiveClass).attr('id')
              eyeId = $(@eyeConfigActiveClass).attr('id')
              licenseId = $(@licenseConfigActiveClass).attr('id')
              orderItems = [worldId,eyeId,licenseId]
              # id = [worldId,eyeId]
              # price = @_calcConfigSubTotal([@worldConfigActiveClass,@eyeConfigActiveClass,@licenseConfigActiveClass])
              # specs = $(@worldConfigActiveClass).data('specs') + "," + $(@eyeConfigActiveClass).data('specs')
              # license = $(@licenseConfigActiveClass).data('id')
            else 
              orderItems = [$(addToCartBtn).attr('id')]
              # id = [$(addToCartBtn).data('id')]
              # price = $(addToCartBtn).data('cost')
              # specs = $(addToCartBtn).data('specs')
              # license = "not applicable"
          
            # check if the order already exists in the cart
            # if so, then increment the quantity of that order in the cart
            existingOrderKey = @_compareOrders(orderItems)
            if existingOrderKey
              existingOrder = JSON.parse(LocalStorage.get(existingOrderKey))
              existingOrder.qty += 1
              LocalStorage.set(existingOrderKey,JSON.stringify(existingOrder))
            else
              # add new key
              key = 0
              if LocalStorage.length() > 0
                keys = ([parseInt(k)] for k,v of LocalStorage.dict())
                key = Math.max.apply @,keys
                key += 1
              item = {
                "order" : orderItems
                "qty"   : 1
              }
              LocalStorage.set(key, JSON.stringify(item))
  
            # update the nav counter          
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
    qty = [v.qty for k,v of LocalStorage.dict()]
    if qty[0].length > 0
      qtySum = qty[0].reduce (a,b) -> a + b
    counter = if LocalStorage.length() > 0 then qtySum else ""
    $(@cartNavCounter).text("#{ counter }")

  eventUpdateConfig: ->
    if $("#Store").length > 0
      $(@storeConfigSelector).click (event)=>
        event.preventDefault()

        activeLinks = $(event.target)
        @_setActiveState(activeLinks)
        @_swapImg(activeLinks)
        @_updateConfigSubTotal()

        if $(@worldConfigActiveClass).attr('id') is "world_none" and $(@eyeConfigActiveClass).attr('id') is "eye_none"
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
      $("p[class='LicenseSpecs-txt']").text(getProductById($(@licenseConfigActiveClass).attr('id')).specs)
      $(@licenseConfigSelector).click (event)=>
        event.preventDefault()
        link = $(event.currentTarget)
        if not $(link).hasClass("#{ @licenseConfigActive }") 
          # remove the active class from the other link
          # add active to self 
          $(@licenseConfigActiveClass).removeClass("#{ @licenseConfigActive }")
          $(link).addClass("#{ @licenseConfigActive }")
          $("p[class='LicenseSpecs-txt']").text(getProductById($(link).attr('id')).specs)
          @_updateConfigSubTotal()

  eventRenderCart: ->
    if $(@cartPage).length > 0
      if LocalStorage.length() > 0
        # remove empty cart text
        $("#Cart-empty").hide()
        $(".Cart-container").show()
        for k,v of LocalStorage.dict()
          # product, id, specs, price, quantity
          specTxtHtml = "<div class='Grid-cell--2of3 Grid-cell--2of3-padright'>
                          #{ getOrderSpecTxt(v.order) }
                        </div>"

          costFormulaHtml = "<div class='Grid-cell Grid-cell--cartFormula'>
                                <div class='Grid Grid--cartFormula-break'>

                                  <div id='CartItem-unitCost' class='Grid-cell'>
                                    <p class='Cart-costCalc'>€ #{ getProductsSum(v.order,1) }</p>
                                  </div>              
                                
                                  <div class='Grid-cell'>
                                    <div class='Grid Grid--center'>
                                      <div class='Grid-cell'>
                                        <p class='Cart-costCalc'>x</p>
                                      </div>
                                      <div id='CartItem-unitQuant' class='Grid-cell'>
                                        <p class='Cart-itemQuant Cart-costCalc'>#{ v.qty }</p>
                                      </div>
                                      <div class='Grid-cell'>
                                        <div class='Grid Grid-column'>
                                          <div class='Grid-cell Cart-itemQuant--increment Cart-item-plus'><p class='Cart--triangle-up'></p></div>
                                          <div class='Grid-cell Cart-itemQuant--increment Cart-item-minus'><p class='Cart--triangle-down'></p></div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>

                            </div>
                          </div>"

          costSumHtml = "<div class='Grid-cell Grid-cell--cartSum'>
                          <div class='Grid Grid--center'>

                            <div id='CartItem-equalSign' class='Grid-cell'>
                              <p class='Cart-costCalc'>=</p>
                            </div>                                                   
                                
                            <div class='Grid-cell u-textCenter'>
                              <p class='Cart--sumRow Cart-costCalc--subTotal'>€ #{ getProductsSum(v.order,v.qty) }</p>
                            </div>  
                                
                            <div class='Cart-removeItem Grid-cell u-textRight'>
                              <p>(remove)</p>
                            </div>

                          </div>
                        </div>"

          newRow = "<div class='Cart-rowContainer'>
                      <div class='Grid Grid--center Cart-row' id='#{ k }'>" +
                        
                        specTxtHtml +
                        "<div class='Grid-cell'>" +
                          "<div class='Grid Grid--center'>" +
                            costFormulaHtml +
                            costSumHtml +
                          "</div>" +
                        "</div>" +

                      "</div>" +
                    "</div>"

          $("#Cart-table").after(newRow)
        [totalPrice,label] = if LocalStorage.length() > 0 then [getProductsSum(v.order,v.qty) for k,v of LocalStorage.dict(),"Sub Total"] else ["",""]
        totalPrice = if totalPrice.length > 0 then "€ " + _sumAll(totalPrice)
        $("h3[id='CartSum--label']").text("#{ label }")
        $("h3[id='CartSum--total']").text("#{ totalPrice }")
        $("div[id='CartSum-label--container']").append("<p class='Cart-disclaimerTxt'>(additional shipping and VAT may apply)</p>")
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
        [totalPrice,label] = if LocalStorage.length() > 0 then [getProductsSum(v.order,v.qty) for k,v of LocalStorage.dict(),"Total"] else ["",""]
        totalPrice = if totalPrice.length > 0 then "€ " + _sumAll(totalPrice)

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
        numDisplay = $(row).find('.Cart-itemQuant.Cart-costCalc')
        key = $(row).attr('id')

        # get object from local storage
        item = JSON.parse(LocalStorage.get(key))
        # update quantity 
        item.qty = if sign is 'plus' then item.qty += 1 else if item.qty > 1 then item.qty -= 1 else 1

        # write quantity back to storage
        LocalStorage.set(key,JSON.stringify(item))

        # update the display text
        $(numDisplay).text("#{ item.qty }")

        # update row sum
        $(row).find("p[class='Cart--sumRow Cart-costCalc--subTotal']").text("€ " + "#{ getProductsSum(item.order,item.qty) }")

        # update cart subtotal 
        totalPrice = if LocalStorage.length() > 0 then getProductsSum(v.order,v.qty) for k,v of LocalStorage.dict() else ""
        totalPrice = if totalPrice.length > 0 then "€ " + _sumAll(totalPrice)
        $("#CartSum--total").text("#{ totalPrice }")

        @eventUpdateCartNavCounter()


  eventShowTechSpecs: ->
    if $(@storePage).length > 0
      $("a[class='TechSpecs']").click (event)=>
        event.preventDefault()
        button = $(event.target)
        # eye or world from 'id'
        type = $(button).attr('id').split('-').pop() 

        selection = "a[class='StoreConfig-#{type} #{ @storeConfigActiveClass }']"
        id = $(selection).attr('id')
        # make append active class to container 
        element = "p[class='TechSpecs-txt--#{ type }']"       

        if $(button).hasClass("TechSpecs--active")
          $(element).fadeOut(400)
          $(button).removeClass("TechSpecs--active")
          $(button).text("show technical specs")
        else
          $(button).addClass("TechSpecs--active")
          @_updateSpecTxt(type,id)
          $(element).fadeIn(400)
          $(button).text("hide technical specs")

  eventShowOrderForm: ->
    if $(@cartPage).length > 0
      $("input[class='Form-input--radio Form-checkout']").click (event)=>
        event.preventDefault()
        button = $(event.target)
        id = $(button).attr('id')
        submitTxt = if id is "order" then "Submit Order" else "Request Quote"
        labelId = '#OrderType-'+id
        orderFormContainer = "Cart-orderForm-container"
        orderFormActive = "Cart-orderForm--state-active" 
        if not $(labelId).hasClass("Button--state-active")
          $("label[class^='Button-radio--lg Form-input--radioLabel--lg']").removeClass('Button--state-active') 
          $(labelId).addClass("Button--state-active")
          if not $(orderFormContainer).hasClass(orderFormActive)
            $("."+orderFormContainer).slideDown()
            $("."+orderFormContainer).addClass(orderFormActive)
          $('label[for="form-submit"]').text(submitTxt)            

  eventUpdateFormValues: ->
    if $(@cartPage).length > 0
      $("input, textarea").change (event)=>
        event.preventDefault()
        field = $(event.target)
        $(field).val($(field).val())

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
      radios = "input[name='p-type']:radio"
      inputPaymentClass = "input[class='Form-input--radio Form-payment-type']"
      $(inputPaymentClass).click (event)=>
        event.preventDefault()
        button = $(event.target)
        buttonId = $(button).attr('id') 
        label = "label[for='#{ buttonId }']"
        $("label[for^='p-']").not($(buttonId)).removeClass('Button--state-active')
        $(label).toggleClass("Button--state-active")

        $(button).prop("checked",true)
        # the checked state is not saved for form submission why? 

  resetActivePaymentRadio: ->
    activeId = "#"+$("label[class='Button-radio--sm Form-input--radioLabel Button--state-active'][for^='p-']").attr('for')
    $(activeId).prop('checked',true)


  eventSubmitForm: ->
    if $(@cartPage).length > 0
      $("#order-form").on "submit", (event)=>
        event.preventDefault()
        form = $(event.target)

        if $(form).parsley().isValid()
          $('label[for="form-submit"]').addClass("Button--state-inactive")  
          $('label[for="form-submit"]').text("Submitting Request")    
          $('label[for="form-submit"]').attr('disabled',true)     
          # disable the submit button to prevent double submits
          $("#form-submit").attr('disabled',true)
          @resetActivePaymentRadio()
          @_setOrderType()
          # add order object to a hidden form text area
          orders = []
          keys = [k for k,v in LocalStorage.dict()]
          for k,v of LocalStorage.dict()
            orders.push v
          $("textarea[class='Form-input--cart']").val(JSON.stringify(orders))
          formData = $(form).serialize()
          url = "https://script.google.com/macros/s/AKfycbz6hkUNiXKGrOrDlEIEuGXpqsNvUAN6wpfN07NpzfkIBznWnxA/exec"
          $.ajax
            type: 'POST'
            crossDomain: true
            url: url
            dataType: "json"
            data: formData
            error: (jqXHR, textStatus, errorThrown) ->
              # console.warn "AJAX Error: #{textStatus}"
              if navigator.userAgent.search "Safari"  >= 0 and navigator.userAgent.search "Chrome" < 0
                  # Known Safari Error see: https://code.google.com/p/google-apps-script-issues/issues/detail?id=3226
                  # We continue anyways to the success page.
                  console.log "Successful AJAX call with Safari."
                  $(location).attr('href',"order_success")
            success: (data, textStatus, jqXHR) ->
              console.log "Successful AJAX call: #{textStatus}"
              $(location).attr('href',"order_success")



  eventGenerateOrderLink: ->
    if $(@cartPage).length > 0 
      $("#Nav-cart").click (event)=>
        event.preventDefault()
        link = $(event.target)
        data = @_getOrderPermalink()
        document.location = "?"+ $.param(data)

  eventFillCartFromQueryString: ->
    query = window.location.search.substring(1)
    if query.length > 0
      # ?0_order=world_none%2Ceye_120hz_binocular%2Clicense_commercial&0_qty=3&1_order=world_hr%2Ceye_120hz_binocular%2Clicense_commercial&1_qty=2&2_order=product_support_6&2_qty=1
      LocalStorage.clear()
      pairs = query.split('&')
      # while pairs.length > 0
      j = 0
      for p,i in pairs by 2
        orderItems = decodeURIComponent(pairs.shift().split("=").pop()).split(',')
        qty = parseInt(pairs.shift().split("=").pop())
        item = {
          "order" : orderItems
          "qty"   : qty
        }
        LocalStorage.set(j, JSON.stringify(item))
        j += 1
      @eventUpdateCartNavCounter()
    
  eventOrderLinkSuccessPage: =>
    if $("#Success").length > 0
      data = @_getOrderPermalink()
      url = window.location.origin + "/cart?" + $.param(data)
      link = "<a class='u-linkAttention' href='#{url}'>permalink</a>"
      html = "<h2 class='Banner-subtitle'>You can always revisit your order with this #{link}.</h2>"
      $(".Banner-item.u-textCenter").append(html)
      # very important - clear LocalStorage after setting the link
      LocalStorage.clear()      



  _getOrderPermalink: ->
    data = []
    i = 0
    for key,value of LocalStorage.dict()
      # data.push({"name":"key","value":"#{orderKey}"})
      for _k,v of value
        name = "#{i}"+"_#{_k}"
        data.push({"name":name,"value":v})
      i += 1
    return data

  _setOrderType: ->
    activeId = $("label[id^='OrderType-'][class~='Button--state-active']").attr('id').split('-').pop()
    $("input[class='Form-input--orderType']").val(activeId.toLowerCase())

  _setActiveState: (links)->
    for link in links
      # see if it is 'eye' or 'world' or maybe in the future 'other'
      type = $(link).attr('id').split('_',1)
      configType = @storeConfigClass + "-" + type
      prevSelection = "a[class='#{ configType + " " }#{ @storeConfigActiveClass}']"
      $(prevSelection).removeClass("#{ @storeConfigActiveClass }")
      $(link).addClass("#{ @storeConfigActiveClass }")
      @_updateSpecTxt(type,$(link).attr('id'))

  _updateSpecTxt: (type,id)->
    button = ".TechSpecs"
    txt = getProductById(id).specs
    selector = "p[class='TechSpecs-txt--#{ type }']"
    if $(button).hasClass("TechSpecs--active")
      $(selector).text("#{ txt }")
    else
      $(selector).text("#{ txt }").hide()

  _swapImg: (links)->
    for link in links
      imgUrl = getProductById($(link).attr('id')).img
      imgId = '#' + $(link).attr('id').split('_',1) + '-img'
      $(imgId).attr("src", imgUrl).show()

  _calcConfigSubTotal: (links)->
    sum = 0
    for link in links
      sum += $(link).data('cost')
    return sum  

  _updateConfigSubTotal: ->
    activeWorldId = $(@worldConfigActiveClass).attr('id')
    activeEyeId = $(@eyeConfigActiveClass).attr('id')
    activeLicenseId = $(@licenseConfigActiveClass).attr('id')
    # subTotal = "€ " + @_calcConfigSubTotal([@worldConfigActiveClass,@eyeConfigActiveClass,@licenseConfigActiveClass])
    subTotal = "€ " + getProductsSum([activeWorldId,activeEyeId,activeLicenseId])
    if activeWorldId is "world_none" and activeEyeId is "eye_none"
      subTotal = "Not for sale"  
    $(@configSubTotalClass).text(subTotal)

  # _uniqueId: (len=6)->
  #   id = ""
  #   id += Math.random().toString(36).substr(2) while id.length < len
  #   id.substr 0, len
  #   return id

  _arrayEqual: (a, b) ->
    # a.length is b.length and 
    a.every (elem, i) -> elem is b[i]

  _compareOrders: (orderItems)->
    if LocalStorage.length() > 0
      for k,v of LocalStorage.dict()
        if @_arrayEqual(v.order,orderItems)
          return k


$(document).ready ->
  s = new PupilStore
