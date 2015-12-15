newsletterSignup = ()->
  # bind jquery/ajax events here
  $("#newsletter-form").on "submit", (event)=>
    event.preventDefault()
    form = $(event.target)

    if $(form).parsley().isValid()
      $('label[for="newsletter-form-submit"]').addClass("Button--state-inactive")  
      $('label[for="newsletter-form-submit"]').text("Submitting Request")    
      $('label[for="newsletter-form-submit"]').attr('disabled',true)     
      # add loading animation
      $('label[for="newsletter-form-submit"]').addClass("loading")    

      # disable the submit button to prevent double submits
      $("#newsletter-form-submit").attr('disabled',true)

      # mailchimp list 
      url = "//pupil-labs.us3.list-manage.com/subscribe/post-json?u=ed9736f18028b208205770080&amp;id=56698f0460&c=?"

      formData = $(form).serialize()
      console.log(formData)

      $.ajax
        type: 'POST'
        crossDomain: true
        url: url
        dataType: "jsonp"
        data: formData
        # contentType: "application/json; charset=utf-8",          
        error: (jqXHR, textStatus, errorThrown) ->
          # console.warn "AJAX Error: #{textStatus}"
          if navigator.userAgent.search "Safari"  >= 0 and navigator.userAgent.search "Chrome" < 0
              # Known Safari Error see: https://code.google.com/p/google-apps-script-issues/issues/detail?id=3226
              # We continue anyways to the success page.
              console.log "Successful AJAX call with Safari."
              
        success: (data, textStatus, jqXHR) ->
          console.log "Successful AJAX call: #{textStatus} - #{data.msg}"
          $("#newsletter-form-submit").attr('disabled',false)
        complete: (jqXHR,textStatus) ->
          $('label[for="newsletter-form-submit"]').removeClass("loading")     




$(document).ready ->
  # bind jquery events to footer
  newsletterSignup()

