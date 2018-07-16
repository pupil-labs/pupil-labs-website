$ = jQuery

class PupilStore
  constructor: (
    @storePage = "#Store" #Store class
    @cartPage = "#Cart" #Cart class
    @orderPage = "Order" #Order form class
    @storeConfigClass = "StoreConfig"
    @storeConfigSelector = "button[class^='#{ @storeConfigClass}-']"
    @storeConfigActiveClass = "StoreConfig--state-active"
    @addToCartClass = "button[class^='AddToCart']"
    @clearCartClass = "a[id='Cart-clearCart']"
    @addToCartButton = $(@addToCartClass)
    @clearCartButton = $(@clearCartClass)
    @addToCartConfig = $("button[id='AddToCart-config']")
    @worldConfigActiveClass = "button[class='StoreConfig-world #{ @storeConfigActiveClass }']"
    @eyeConfigActiveClass = "button[class='StoreConfig-eye #{ @storeConfigActiveClass }']"
    @licenseConfigClass = 'Store-license'
    @licenseConfigActive = 'StoreConfig--state-active--license'
    @licenseConfigSelector = "button[class^='#{ @licenseConfigClass }']"
    @licenseConfigActiveClass = "button[class='#{ @licenseConfigClass } #{ @licenseConfigActive }']"
    @configSubTotalClass = "p[class='StoreConfig-subTotal']"
    @cartNavCounter = $(".Header-cart-badge")
    @storeConfigPresetClass = "button[class='Store-navPreset']"
    ) ->
      @_preloadConfigImages()
      @eventStorePageInit()
      @eventAddToCart()
      @eventClearCart()
      @eventUpdateCartNavCounter()
      @eventUpdateConfig()
      @eventSelectLicense()
      @eventFillOrderFormFromQueryString()
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
      @countryValidator()
      @postalCodeValidator()
      @divisionValidator()
      @eventLoadCart()
      @eventToggleQuoteType()

  eventStorePageInit: ->
    if $(@storePage).length > 0
      db = get_product_database()
      # create world products in configurator
      for world_id in get_world_cam_ids()
        title_store = get_world_cam_data()[world_id]['title_store']
        klass = if world_id is "w120" then "StoreConfig-world StoreConfig--state-active" else "StoreConfig-world"
        html = "<li class='Grid-cell u-textCenter'>
                 <button class='#{ klass }' id='#{ world_id }'>#{title_store}</button>
                 </li>"
        $("ul[class='Grid Grid--justifyCenter ConfigOptions--world']").append(html)

      # create eye products in configurator
      for eye_id in get_eye_cam_ids()
        title_store = get_eye_cam_data()[eye_id]['title_store']
        klass = if eye_id is "e200" then "StoreConfig-eye StoreConfig--state-active" else "StoreConfig-eye"
        html = "<li class='Grid-cell u-textCenter'>
                 <button class='#{ klass }' id='#{ eye_id }' href='#{}'>#{title_store}</button>
                 </li>"
        $("ul[class~='ConfigOptions--eye']").append(html)


      # create vr/ar products
      for vr_ar_id in get_vr_ar_product_ids()
        product = db[vr_ar_id]

        html = "<div class='Aligner-item' id='#{vr_ar_id}'>
                  <div class='Aligner-item--column'>
                    <div class='Feature-image--wrapper'>
                      <img class='Feature-image' src='#{ product.img }' title='#{ product.title_product }'>
                    </div>
                    <div class='Aligner-item--stretchHeight'>
                      <p><strong> #{ product.title_store } </strong></p>
                      <p> #{ product.description_store } </p>
                    </div>

                    <button id='#{ vr_ar_id }' class='AddToCart Button-store' href='#' data-product='product'>€ #{product.cost}</button>

                  </div>
                </div>"
        $("div[class~='VR-AR-products']").append(html)


      # create additional products
      for p_id in get_additional_product_ids()
        product = db[p_id]
        html = "<div class='Aligner-item' id='#{p_id}'>
          <div class='Aligner-item--column'>
            <div class='Feature-image--wrapper'>
              <img class='Feature-image' src='#{ product.img }' title='#{ product.title_product }'>
            </div>
            <div class='Aligner-item--stretchHeight-bottom'>
              <p><strong> #{ product.title_store } </strong></p>
              <p> #{ product.description_store } </p>
            </div>

            <button id='#{ p_id }' class='AddToCart Button-store' href='#' data-product='product'>€ #{product.cost}</button>

          </div>
        </div>"

        $("div[class~='Additional-products']").append(html)


      @_updateSpecTxt('world','w120')
      @_updateSpecTxt('eye','e200')
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
              if $("#license").hasClass(@licenseConfigActive)
                licenseId = "edu"
                product_id = ['pupil',worldId,eyeId,licenseId].join("_")
              else
                product_id = ['pupil',worldId,eyeId].join("_")
            else
              product_id = $(addToCartBtn).attr('id')

            # check if the order already exists in the cart
            # if so, then increment the quantity of that order in the cart
            if @_product_id_in_cart(product_id)
              key = @_get_key_from_product_id(product_id)
              cart_item = JSON.parse(LocalStorage.get(key))
              cart_item.qty += 1
              LocalStorage.set(key,JSON.stringify(cart_item))
            else
              # add new key
              key = 0
              if LocalStorage.length() > 0
                keys = ([parseInt(k)] for k,v of LocalStorage.dict())
                key = Math.max.apply @,keys
                key += 1
              item = {
                "product" : product_id
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
      $(".Cart-container").hide 250, ->
        $("#Cart-empty").fadeIn(300)
      @eventUpdateCartNavCounter()

  eventLoadCart: ->
    if $("#Cart").length > 0
      qty = [v.qty for k,v of LocalStorage.dict()]
      if qty[0].length <= 0
        $("#Cart-empty").fadeIn(300)


  eventUpdateCartNavCounter: ->
    qty = [v.qty for k,v of LocalStorage.dict()]
    if qty[0].length <= 0
      $(@cartNavCounter).text("0").removeClass("cart-full")
    else if qty[0].length > 0
      qtySum = qty[0].reduce (a,b) -> a + b
      $(@cartNavCounter).text("#{ qtySum }").addClass("cart-full")

  eventUpdateConfig: ->
    if $("#Store").length > 0
      $(@storeConfigSelector).click (event)=>
        event.preventDefault()

        activeLinks = $(event.target)
        @_setActiveState(activeLinks)
        @_swapImg($("button[class~='StoreConfig--state-active']"))
        @_updateConfigSubTotal()

        $("#w30").removeClass("StoreConfig--state-inactive")
        $("#e120b").removeClass("StoreConfig--state-inactive")
        $("#e200b").removeClass("StoreConfig--state-inactive")
        $("#enone").removeClass("StoreConfig--state-inactive")
        $("#wnone").removeClass("StoreConfig--state-inactive")

        if $(@worldConfigActiveClass).attr('id') is "wnone"
          $("#specs-world").fadeTo(800,0).prop('disabled',true).css('cursor','default')
          $("#enone").addClass("StoreConfig--state-inactive")
        else
          $("#specs-world").fadeTo(800,100).prop('disabled',false).css('cursor','pointer')
        if $(@eyeConfigActiveClass).attr('id') is "enone"
          $("#specs-eye").fadeTo(800,0).prop('disabled',true).css('cursor','default')
          $("#wnone").addClass("StoreConfig--state-inactive")
        else
          $("#specs-eye").fadeTo(800,100).prop('disabled',false).css('cursor','pointer')
          $("#specs-eye").fadeIn()

        if $(@worldConfigActiveClass).attr('id') is "w30"
          $("#e120b").addClass("StoreConfig--state-inactive")
          $("#e200b").addClass("StoreConfig--state-inactive")
        if $(@eyeConfigActiveClass).attr('id') is "e120b" or $(@eyeConfigActiveClass).attr('id') is "e200b"
          $("#w30").addClass("StoreConfig--state-inactive")


  eventRenderCart: ->
    if $(@cartPage).length > 0
      if LocalStorage.length() > 0
        # remove empty cart text
        $("#Cart-empty").hide()
        $(".Cart-container").show()
        db = get_product_database()

        for k,v of LocalStorage.dict()
          if v.order?
            # legacy - update
            v['product'] = updateLegacyProductIds_(v.order)
            # delete v.order
            LocalStorage.set(k,JSON.stringify(v))

          db_product = db[v.product]
          # handle outdated or corrupt cart
          if db_product is undefined
            LocalStorage.clear()
            return false

          title_product = db_product['title_product']

          cart_spec_html = ""

          if title_product is "Pupil Headset"
            sub_products = db[v.product]['sub_products']
            for sub_product_key,sub_product_data of sub_products
              cart_spec_html += "<p style='font-size:12px;padding-bottom:0.4em;font-weight:700;'>#{ sub_product_data['title_cart'] }</p>"
          else
            cart_spec_html += "<p class='LicenseSpecs-txt'>#{ db[v.product]['description_cart'] }</p>"

          # product, id, specs, price, quantity
          productImg = "<div class='Grid Grid--center Grid-cell--1of6'>
                          <div class='Grid Grid--justifySpaceBetween' style='width:100%;'>
                            <div class='Feature-figure Feature-figure--config'>
                              <img class='Feature-image Feature-image--configEye' src=#{ db[v.product]['img'] } title='#{ db[v.product]["title_product"] }'>
                            </div>
                            <btn class='Cart-removeItem'>
                              <i class='material-icons'>close</i>
                            </btn>
                          </div>
                        </div>"

          specTxtHtml = "<div class='Grid-cell--5of6'>
                          <div class='Grid Grid--justifySpaceBetween'>
                            <h4 style='font-weight:700;'>#{ db[v.product]['title_product'] }</h4>
                            <btn class='Cart-removeItem'>
                              <i class='material-icons'>close</i>
                            </btn>
                          </div>
                          <div class='Grid Grid--justifySpaceBetween'>
                            <div class='Grid-cell--1of2 Grid-persist'>
                              #{ cart_spec_html }
                              <p style='font-size:12px;padding-top:0.4em;padding-bottom:unset;'>unit cost: € #{ Number(db[v.product]['cost']) }</p>
                            </div>
                            <div class='Grid Grid-cell--1of2 Grid-persist Grid--justifyFlexEnd Grid--center'>
                              <div class='Grid Grid-column Grid--center Cart-container--increment'>
                                <div class='material-icons Cart-itemQuant--increment Cart-item-plus'>keyboard_arrow_up</div>
                                <div class='Cart-itemQuant Cart-costCalc Cart--quantity Grid Grid--justifyCenter Grid--center'>
                                  #{ v.qty }
                                </div>
                                <div class='material-icons Cart-itemQuant--increment Cart-item-minus'>keyboard_arrow_down</div>
                              </div>
                              <p class='Cart-costCalc--subTotal u-padLeft--2' id='subTotal'>€ #{ Number(db[v.product]['cost'] * v.qty) }</p>
                            </div>
                          </div>
                        </div>"

          newRow = "<div class='Cart-rowContainer'>
                      <div class='Grid Cart-row' id='#{ k }'>" +
                        productImg +
                        specTxtHtml +
                      "</div>
                    </div>"


          $("#Cart-table").append(newRow)
          # $("#Cart-table").after(newRow)
        [totalPrice,label] = if LocalStorage.length() > 0 then [Number(get_product_database()[v.product].cost * v.qty) for k,v of LocalStorage.dict(),"Subtotal"] else ["",""]
        totalPrice = if totalPrice.length > 0 then "€ " + totalPrice.reduce (a,b) -> a + b
        $("h3[id='CartSum--label']").text("#{ label }")
        $("h3[id='CartSum--total']").text("#{ totalPrice }")
        $("div[id='CartSum-label--container']").append("<p class='Cart-disclaimerTxt'>(ships worldwide using DHL or UPS express, additional VAT may apply)</p>")
      else
        $(".Cart-container").hide()

  eventRemoveCartItem: ->
    if $(@cartPage).length > 0
      $("btn[class~='Cart-removeItem']").click (event)=>
        event.preventDefault()
        item = $(event.currentTarget)
        row = $(item).closest('.Cart-row')
        container = $(row).closest('.Cart-rowContainer')
        LocalStorage.expire($(row).attr('id'))

        # remove the row
        $(container).slideUp 250, ->
          $(container).remove()

        # update total
        [totalPrice,label] = if LocalStorage.length() > 0 then [Number(get_product_database()[v.product].cost * v.qty) for k,v of LocalStorage.dict(),"Total"] else ["",""]
        totalPrice = if totalPrice.length > 0 then "€ " + totalPrice.reduce (a,b) -> a + b

        $("h3[id='CartSum--label']").text("#{ label }")
        $("h3[id='CartSum--total']").text("#{ totalPrice }")

        # update header
        @eventUpdateCartNavCounter()
        if LocalStorage.length() < 1
          # remove empty cart text
          $(".Cart-container").fadeOut 250, ->
            $("#Cart-empty").fadeIn(300)

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
        $(row).find("p[id='subTotal']").text("€ " + "#{ Number(get_product_database()[item.product].cost * item.qty) }")

        # update cart subtotal
        totalPrice = if LocalStorage.length() > 0 then (Number(get_product_database()[v.product].cost * v.qty) for k,v of LocalStorage.dict()) else ""
        totalPrice = if totalPrice.length > 0 then "€ " + totalPrice.reduce (a,b) -> a + b
        $("#CartSum--total").text("#{ totalPrice }")

        @eventUpdateCartNavCounter()

  eventSelectLicense: ->
    if $(@storePage).length > 0
      $(@licenseConfigSelector).click (event)=>
        event.preventDefault()
        link = $(event.currentTarget)
        $(link).toggleClass("#{ @licenseConfigActive }")
        @_updateConfigSubTotal()

  eventShowTechSpecs: ->
    if $(@storePage).length > 0
      $("a[class='TechSpecs']").click (event)=>
        event.preventDefault()
        button = $(event.target)

        if not $(button).prop('disabled')
          # eye or world from 'id'
          type = $(button).attr('id').split('-').pop()

          selection = "button[class='StoreConfig-#{type} #{ @storeConfigActiveClass }']"
          id = $(selection).attr('id')
          # make append active class to container
          element = "div[class='Grid-cell TechSpecs--#{ type }']"

          if $(button).hasClass("TechSpecs--active")
            $(element).fadeOut(400)
            $(button).removeClass("TechSpecs--active")
            $(button).text("show detailed specs")
          else
            $(button).addClass("TechSpecs--active")
            @_updateSpecTxt(type,id)
            $(element).fadeIn(400)
            $(button).text("hide detailed specs")

  eventShowOrderForm: ->
    if $(@cartPage).length > 0
      orderFormContainer = "Cart-orderForm-container"
      $('#OrderType-order').addClass("Button--state-active")
      $("."+orderFormContainer).css("display","block")

  eventUpdateFormValues: ->
    if $(@cartPage).length > 0
      $("input, textarea").change (event)=>
        event.preventDefault()
        field = $(event.target)
        $(field).val($(field).val())

  eventCopyBillingToShipping: ->
    if $(@cartPage).length > 0
      $("[id$='_b']").change (event)=>
        event.preventDefault()
        field = $(event.target)
        fieldId = $(field).attr('id')
        bFieldVal = $(field).val()
        type = fieldId.split('_').slice(0,-1)
        try
          type.push("s")
          sField = type.join("_")
          $("[id=#{ sField }]").val(bFieldVal)
        catch e

  eventToggleShippingInfo: ->
    if $(@cartPage).length > 0
      $("#s-checkbox").click (event)=>
        event.preventDefault()
        button = $(event.target)

        if $(button).hasClass('checkmark--active')
          $(button).toggleClass('checkmark--active')
          $(".Form-shipping-container").fadeOut(250)
        else
          $(button).toggleClass('checkmark--active')
          $("input[id='postalCode_s']")
          .attr("data-parsley-postalcodevalidator","#{$("input[id='postalCode_b']").data('parsley-postalcodevalidator')}")
          $(".Form-shipping-container").fadeIn(250)

  updateOrderTypePaymentText: ->
      paymentText = "After you submit the request we will follow up via email with a "
      creditCardRequest = "proforma invoice and credit card payment link."
      bankTransferRequest = "proforma invoice and bank account details for transfer."
      creditCardQuote = "quote and credit card payment link."
      bankTransferQuote = "quote and bank account details for transfer."

      button = $("#q-checkbox")
      input = $('#o_type')
      p_transfer = $("div[for='p-banktransfer']")
      p_credit = $("div[for='p-credit']")

      if $(button).hasClass('checkmark--active')
        # this is a quote request
        $(input).val('quote')
        submitTxt = "Submit Quote Request"
        $('label[for="form-submit"]').text(submitTxt)

        if $(p_transfer).hasClass('Button--state-active')
          $(p_transfer).val('banktransfer')
          $('#payment-text').text(paymentText + bankTransferQuote)
        else
          $(p_transfer).val('credit')
          $('#payment-text').text(paymentText + creditCardQuote)
      else
        # this is an order request
        $(input).val('order')
        submitTxt = "Submit Order Request"
        $('label[for="form-submit"]').text(submitTxt)        

        if $(p_transfer).hasClass('Button--state-active')
          $(p_transfer).val('banktransfer')
          $('#payment-text').text(paymentText + bankTransferRequest)
        else
          $(p_transfer).val('credit')
          $('#payment-text').text(paymentText + creditCardRequest)

  eventToggleQuoteType: ->
    $("#q-checkbox").click (event)=>
      event.preventDefault()
      button = $(event.target)
      $(button).toggleClass('checkmark--active')
      @updateOrderTypePaymentText()

  eventTogglePaymentType: ->
    if $(@cartPage).length > 0
      paymentButton = $("div[for^='p-']")

      $(paymentButton).click (event)=>
        event.preventDefault()
        button = $(event.target)
        buttonId = $(button).attr('for')
        inputSelector = "input[id='#{ buttonId }']"
        $("#p_type").val($(inputSelector).val())

        if !$(button).hasClass('Button--state-active')
          $(paymentButton).toggleClass('Button--state-active')
          $(inputSelector).prop("checked",true)
          @updateOrderTypePaymentText()

  eventSubmitForm: ->
    if $(@cartPage).length > 0

      $("#order-form").on "submit", (event)=>
        event.preventDefault()
        form = $(event.target)
        email = $('#email_c').val()
        input_transfer = $('#p-banktransfer')
        input_credit = $('#p-credit')
        q = ''
        pType = ''

        if $('#o_type').val() == 'quote'
              q = 'q'
            else
              q = 'o'

            if $('#p-credit').prop("checked")
              pType = 'cc'
            else
              pType = 'bt'

        if $(form).parsley().isValid()
          $('label[for="form-submit"]').addClass("Button--state-inactive")
          $('label[for="form-submit"]').text("Submitting Request")
          $('label[for="form-submit"]').attr('disabled',true)
          # add loading animation
          $('label[for="form-submit"]').addClass("loading")

          # disable the submit button to prevent double submits
          $("#form-submit").attr('disabled',true)

          # add countryIso to form data
          $("input[id='countryIso_b']").val(countryList[$("input[id='country_b']").val()].countryISO)
          $("input[id='countryIso_s']").val(countryList[$("input[id='country_s']").val()].countryISO)

          # add order object to a hidden form text area
          products = []
          keys = [k for k,v in LocalStorage.dict()]
          for k,v of LocalStorage.dict()
            products.push v
          $("textarea[id='cartObject']").val(JSON.stringify(products))
          formData_json = JSON.stringify(form.serializeArray())

          formData_formatted = {}
          for d in form.serializeArray()
            k = d.name
            if k == 'email_c'
              v = d.value.toLowerCase()
            else
              v = d.value
            formData_formatted[k] = v

          formData_formatted_JSON = JSON.stringify(formData_formatted)
          url = "https://p-u-p-i-l.com/order/form_handler"

          xhr = new XMLHttpRequest()

          xhr.addEventListener "readystatechange", ->

            if @readyState is 4
              if @status is 200
                window.location.replace "#{window.location.origin}/order_success/?email=" + email + '&p=' + pType + '&q=' + q
              else
                console.warn "Request Error: #{@statusText}"

          xhr.open "POST", url
          xhr.setRequestHeader "content-type", "application/json"
          xhr.setRequestHeader "cache-control", "no-cache"

          xhr.send formData_formatted_JSON


  countryValidator: ->
    if $(@cartPage).length > 0
      window.Parsley.addValidator('countryvalidator', ((value, requirement) ->
        validity = value of countryList
        if validity
          requirementIds = requirement.split("-")
          postalCodeId = requirementIds[0]
          stateId = requirementIds[1]

          country = countryList[value]

          # if country US or CA force state abbreviations
          if country.countryISO is 'US' or country.countryISO is 'CA'
            placeholderTxt = if country.countryISO is 'US' then "state abbreviation (e.g. CA for California)" else "province abbreviation (e.g. QC for Quebec)"
            $("input[id=#{stateId}]")
            .prop("placeholder","#{placeholderTxt}")
            .prop("required", true)
            .attr("data-parsley-maxlength","2")
            .attr("data-parsley-divisionvalidator","#{country.countryISO}")
          else
            $("input[id=#{stateId}]")
              .prop("placeholder", "state/province/division")
              .prop("required", true)
              .attr("data-parsley-maxlength", "35")
              .attr("data-parsley-divisionvalidator","0")

          # check if country uses a postalCode and update for pattern
          if country.usesPostalCode
            $("input[id=#{postalCodeId}]")
            .prop("placeholder","postal code (e.g. #{country.postalCodeFormat})")
            .prop("disabled",false)
            .prop("required", true)
            .attr("data-parsley-postalcodevalidator","#{country.postalCodeFormat}")
          else
            $("input[id=#{postalCodeId}]")
            .prop("placeholder","postal code (not required for #{country.countryISO})")
            .prop("required", false)
            .val("")
            .prop("disabled",true)

        return validity
      )).addMessage 'en', 'countryvalidator', 'Please select a country from the list'

  divisionValidator: ->
    if $(@cartPage).length > 0
      window.Parsley.addValidator('divisionvalidator', ((value, requirement) ->
        if not requirement
          validity = true
        else
          validity = value in USCADivisions[requirement]
        return validity
      )).addMessage 'en', 'divisionvalidator', 'Must be a valid division abbreviation.'


  postalCodeValidator: ->
    if $(@cartPage).length > 0
      window.Parsley.addValidator('postalcodevalidator', ((value, requirement) ->
        requirements = requirement.toString().split(',')
        tests = []
        # ideally this should be a function (but can not call/return from fn within this fn)
        for r in requirements
          exp = '^('
          for c in r.trim().split("")
            fragment = switch
              when c is "A" then '[aA-zZ]{1}'
              when c is "9" then '\\d{1}'
              when c is "-" then '\\-{1}'
              when c is " " then '\\s{1}'
            exp += fragment
          exp += ')$'
          exp = new RegExp(exp)

          tests.push(exp.test(value))

        return true in tests
      )).addMessage 'en', 'postalcodevalidator', 'Postal code should follow the pattern: %s'

  eventGenerateOrderLink: ->
    if $(@cartPage).length > 0
      $("#Nav-cart").click (event)=>
        event.preventDefault()
        link = $(event.target)
        data = @_getOrderPermalink()
        document.location = "?" + $.param(data)

  eventFillOrderFormFromQueryString: ->
    if $(@cartPage).length > 0
      query = window.location.search.substring(1)
      urlParams = new URLSearchParams(window.location.search)
      testQuery = urlParams.get('test')
      userQuery = urlParams.get('user')

      if query.length > 0
        if testQuery == '1'
          testData = getDummyData(userQuery)
          formInput = $('#order-form').find(':input')
          for input in formInput
            if $(input).prop('type') == 'checkbox'
              if $(input).attr('id') == 'q_request'
                $(input).prop(testData[$(input).prop('id')], true)
                $("span[name='#{$(input).prop('id')}']").addClass('checkmark--active')
              else
                $("span[name='#{$(input).prop('id')}']").addClass('checkmark--active')
                $(".Form-shipping-container").fadeIn(250)
            else
              $(input).val(testData[$(input).prop('name')])
          console.log('Test Success')

  eventFillCartFromQueryString: ->
    query = window.location.search.substring(1)
    productQuery = query.replace(/&user.+/g, '')
    if productQuery.length > 0
      # ?0_order=world_none%2Ceye_120hz_binocular%2Clicense_commercial&0_qty=3&1_order=world_hr%2Ceye_120hz_binocular%2Clicense_commercial&1_qty=2&2_order=product_support_6&2_qty=1
      # ?0_order=world_hr%2CCeye_120hz%2Clicense_academic&0_qty=1
      LocalStorage.clear()
      pairs = productQuery.split('&')
      # while pairs.length > 0
      j = 0
      for p,i in pairs by 2
        product_id = decodeURIComponent(decodeURIComponent(pairs.shift().split("=").pop())).split(',')

        try
          pid = product_id[0]
        catch e
          LocalStorage.clear()
          return

        if pid of get_product_database() is false
          pid = updateLegacyProductIds_(product_id)
          if pid.length is 0
            LocalStorage.clear()
            return false

        # product_id = updateLegacyProductIds_(product_id)
        qty = parseInt(pairs.shift().split("=").pop())
        item = {
          "product" : pid
          "qty"   : qty
        }
        LocalStorage.set(j, JSON.stringify(item))
        j += 1
      @eventUpdateCartNavCounter()

  eventOrderLinkSuccessPage: =>
    if $("#Success").length > 0
      data = @_getOrderPermalink()
      url = window.location.origin + "/cart/?" + $.param(data)
      link = "<a href='#{url}'>permalink</a>"
      urlParams = new URLSearchParams(window.location.search);
      email = urlParams.get('email')
      payment = urlParams.get('p')
      quote = urlParams.get('q')

      if quote == 'o'
        pi = 'proforma invoice'
        order_type = 'an order'
      else
        pi = 'quote'
        order_type = 'a quote'

      if payment == 'cc'
        payment_method = "Use the <strong>credit card payment link</strong> in the #{pi} to complete payment."
      else
        payment_method = "Use the <strong>bank account information</strong> in the #{pi} to complete payment."

      html = "<h3><strong>#{email}</strong> will receive a confirmation email with a #{pi}.</h3>
              <h3>#{payment_method}</h3>"
      $(".Site-content-container.Background-img-caption-container.u-textCenter").append(html)
      # very important - clear LocalStorage after setting the link
      LocalStorage.clear()
      @eventUpdateCartNavCounter()


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
    $("input[id='o_type']").val('order')

  _setActiveState: (links)->
    for link in links
      # see if it is 'eye' or 'world' or maybe in the future 'other'
      type = if $(link).attr('class').indexOf('world') > -1 then 'world' else 'eye'
      configType = @storeConfigClass + "-" + type
      prevSelection = "button[class='#{ configType + " " }#{ @storeConfigActiveClass}']"
      $(prevSelection).removeClass("#{ @storeConfigActiveClass }")
      $(link).addClass("#{ @storeConfigActiveClass }")
      @_updateSpecTxt(type,$(link).attr('id'))

  _updateSpecTxt: (type,id)->
    button = ".TechSpecs"
    product = get_camera_data()[id]
    tableRows = ""
    infoTxt = ""
    videoLink = ""

    for k,v of product.tech_specs
      tableRows += "<tr><td class='TechSpecs-table--column'><strong>#{ k }</strong></td><td>#{ v }</td></tr>"

    if typeof(product.link_video) isnt 'undefined'
      link = "<a href=#{ product.link_video } target='_blank'>#{ product.title_video }</a>"
      videoLink = "<tr><td class='TechSpecs-table--column'><strong>sample video(s)</strong></td><td>#{ link }</td></p>"

    selector = "div[class='Grid-cell TechSpecs--#{ type }']"
    infoTxtSelector = "#infoTxt-#{ type }"

    $(infoTxtSelector).text(product.description_store)
    if $(button).hasClass("TechSpecs--active")
      $(selector).empty()
      # $(selector).append("#{ infoTxt }")
      $(selector).append("<table class='TechSpecs-table TechSpecs-txt--#{ type}'><tbody>"+"#{ tableRows }"+"#{ videoLink }"+"</tbody></table>")
    else
      $(selector).empty()


  _swapImg: (links)->
    ids = ($(link).attr('id') for link in links)
    product_id = ['pupil',ids[0],ids[1]].join('_')
    imgSrc = get_product_database()[product_id]['img']
    $("#pupil-config-img").attr("src", imgSrc).show()

  _preloadConfigImages: ()->
    if $("#Store").length > 0
      imageUrls = get_config_images()
      for url in imageUrls
        (new Image()).src = url

  _updateConfigSubTotal: ->
    activeWorldId = $(@worldConfigActiveClass).attr('id')
    activeEyeId = $(@eyeConfigActiveClass).attr('id')
    product_id = if $("#license").hasClass(@licenseConfigActive) then ['pupil',activeWorldId,activeEyeId,"edu"].join("_") else ['pupil',activeWorldId,activeEyeId].join("_")

    if activeWorldId is "wnone" and activeEyeId is "enone"
      subTotal = "Not for sale"
      weight = ""
    else if activeWorldId is "w30" and activeEyeId is "e120b"
      subTotal = "Not for sale"
      weight = ""
    else
      db = get_product_database()
      product = db[product_id]
      sub_products = product.sub_products

      subTotal = "€ " + db[product_id]['cost']
      weight = "weight: " + Number(sub_products['world_camera'].weight + sub_products['eye_camera'].weight) + " grams"


    $("#AddToCart-config").text(subTotal)
    $("#StoreConfig-weight").text(weight)


  _product_id_in_cart: (id)->
    if LocalStorage.length() > 0
      products = (v.product for k,v of LocalStorage.dict())
      return (id in products)

  _get_key_from_product_id: (id)->
    if LocalStorage.length() > 0
      key = (k for k,v of LocalStorage.dict() when id is v.product)
      return parseInt(key)

$(document).ready ->
  s = new PupilStore

