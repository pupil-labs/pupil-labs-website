;(function( $ ) {

  $.fn.revealNextValidate = function(button,target) {
    // checks to see if an entire section's required input has-success / is valid
    // if input is valid, then reveal the target section
    // else display help block
    var section = $(this);
    $(button).on('click', function(e) {
      e.preventDefault();
      $(this).revealNext(target);
            
      // var numFields = section.children('.form-group.has-feedback').length;
      // var validFields = section.children('.form-group.has-feedback.has-success').length;

      // if (numFields === validFields){
      //   $(this).revealNext(target);
      // } 
    });
    return this
  };

  $.fn.revealNext = function(target) {
      // targetId = "#" + target + "-" + $(this).attr('id').slice(-1);
      
      $(this).fadeOut("normal", function() {
        $(this).hide();
        $(target).collapse('show');
      });
    return this;
  };

  $.fn.toggleAll = function() {
    $(this).on('click', function(e) {
      e.preventDefault();
      if ($(this).hasClass('active')) {
        $('form .collapse').collapse('hide');
        $(this).attr('data-original-title', 'Show all form fields.');
        $("a[id^=next").show();
        $(this).removeClass('active');
      } else {      
        $(this).addClass('active');
        $(this).attr('data-original-title', 'Collapse all form fields.');
        $("a[id^=next").hide();
        $('form .collapse').collapse('show');
        // $('#ss-form').data('bootstrapValidator').validate();
      }
    });
  };

  $.fn.updateFields = function(target) {
    $(this).on('input propertychange', function(e) {
      e.preventDefault();

      targetDataId = $(e.target).attr('data-id');
      targetSelect = target + " .form-control[data-id=" + targetDataId + "]";
      $(targetSelect).val($(e.target).val());
    });

    return this;
  };

  $.fn.copyFields = function(billing, shipping) {
  	$(this).on('click', function(e) {
      e.preventDefault();

  		if($(this).children('input').val() === 'use-other') {
	  		$(shipping + " .form-control").each(function() {
  				$(this).val("");
  			});
  			$(shipping).collapse('show');
  		} else {
        // if($(shipping).hasClass("in")) {
        //   $(shipping).collapse('hide');
        // }
	  		$(billing + " .form-control").each(function() {
  				$(shipping + " .form-control[data-id=" + $(this).attr('data-id') + "]").val($(this).val());
        });
        $(shipping).collapse('show');
  		};
    });
  	return this;
  };

  $.fn.sumOrder = function(order_sum) {
    // orders object writes to hidden input
    var orders = {};
    $(this).each(function() {
      orders[$(this).attr('data-product')] = $(this).val();
    });
    $(order_sum).val(JSON.stringify(orders));

    $(this).change(function() {
      orders[$(this).attr('data-product')] = $(this).val();
      $(order_sum).val(JSON.stringify(orders));
    });

    return this;
  };

  $.fn.updateButtonText = function(button) {
    $(button).text("Submit " + $(this).val() + " Request");
    $(this).change(function() {
      $(button).text("Submit " + $(this).val() + " Request");
    });
    return this;
  };

  $.fn.revealContact = function(target,toDB) {
  	$(this).on('click', function(){
  		$('button[data-id=submit-order]').text("Submit " + $(this).children('input').val() + " Request");
  		$(toDB).val($(this).children('input').val());
  		$(target).collapse('show');
      // $('#ss-form').data('bootstrapValidator').validate();
  	});
  	return this;
  };

  $.fn.revealSubmit = function(target) {
    $(this).on('click', function(){
      $('#submit-collapse').collapse('show');
      $(target).val($(this).children('input').val());
    });
    return this;
  };


})( jQuery );

$(document).ready(function() {

  $('label[data-id=order-type]').revealContact("#order-collapse","input[data-id=order-type]");
  $('label[data-id=payment-type]').revealSubmit("input[data-id=payment-method]");


  $("input[data-action=count]").sumOrder("input[data-id=orderSum]");
  $('.combobox').combobox();
  $('[data-toggle=tooltip]').tooltip();

  $('#order-collapse').revealNextValidate('a[id=next-0]','#collapse-0');
  $('#collapse-0').revealNextValidate('a[id=next-1]','#collapse-1');
  $('#collapse-1').revealNextValidate('a[id=next-2]','#collapse-2');
  $('#shipping-collapse').revealNextValidate('a[id=next-3]','#collapse-3');


  // $('a[id^=next]').revealNext('collapse'); 
  $("label[data-id=shipping-data]").copyFields("#collapse-1", "#shipping-collapse");
  $('#collapse-0').updateFields('#collapse-1');
  $('#collapse-1').updateFields('#shipping-collapse');
  $('#toggle-all').toggleAll();

  $('#pupil-order-form').bootstrapValidator({ 
    excluded: [':disabled'],
    //live: 'enabled',
    //submitButtons: '#postForm',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
      orderPro: {
        enabled: true,
        message: 'This value is not valid',
        container: '#orderPro',
        selector: '[data-name=orderPro]',
        trigger: null,

        validators: {
          notEmpty: {
            message: 'A number, even if 0, is required'
          },
          numeric: {
            message: "Value must be a number"
          },
          integer: {
            message: "Value must be an integer"
          },
          between: {
            min: 0,
            max: 10,
            message: 'Value between 0 and 10 - email for more'
          }
        }
      },
      orderDev: {
        enabled: true,
        message: 'This value is not valid',
        container: '#orderDev',
        selector: '[data-name=orderDev]',
        trigger: null,

        validators: {
          notEmpty: {
            message: 'A number, even if 0, is required'
          },
          numeric: {
            message: "Value must be a number"
          },
          integer: {
            message: "Value must be an integer"
          },          
          between: {
            min: 0,
            max: 10,
            message: 'Value between 0 and 10 - email for more'
          }
        }
      },
      firstNameContact: {
        selector: '[data-name="firstNameContact"]',
        enabled: true,
        message: 'This value is not valid',
        container: '#firstNameContact',
        trigger: null,

        validators: {
          notEmpty: {
            message: 'This field is required'
          }
        }
      },
      lastNameContact: {
        selector: '[data-name="lastNameContact"]',
        enabled: true,
        message: 'This value is not valid',
        container: '#lastNameContact',
        trigger: null,

        validators: {
          notEmpty: {
            message: 'This field is required'
          }
        }
      },       
      emailContact: {
        selector: '[data-name="emailContact"]',
        enabled: true,
        message: 'This value is not valid',
        container: '#emailContact',
        trigger: null,

        validators: {
          notEmpty: {
            message: 'This field is required'
          },
          emailAddress: {
            message: 'Please enter a valid email address'
          }
        }
      },
      firstNameBilling: {
        selector: '[data-name="firstNameBilling"]',
        enabled: true,
        message: 'This value is not valid',
        container: '#firstNameBilling',
        trigger: 'blur',

        validators: {
          notEmpty: {
            message: 'This field is required'
          }
        }
      },
      lastNameBilling: {
        selector: '[data-name="lastNameBilling"]',
        enabled: true,
        message: 'This value is not valid',
        container: '#lastNameBilling',
        trigger: 'blur',

        validators: {
          notEmpty: {
            message: 'This field is required'
          }
        }
      },   
      phone: {
        selector: '[data-name="phone"]',
        enabled: true,
        message: 'This value is not valid',
        container: '#phone',
        trigger: null,

        validators: {
          notEmpty: {
            message: 'This field is required'
          }
        }
      },   
      addressBilling: {
        selector: '[data-name="addressBilling"]',
        enabled: true,
        message: 'This value is not valid',
        container: '#addressBilling',
        trigger: null,

        validators: {
          notEmpty: {
            message: 'This field is required'
          }
        }
      },   
      country: {
        selector: '[data-name="country"]',
        enabled: true,
        message: 'This value is not valid',
        container: '#country',
        trigger: null,

        validators: {
          notEmpty: {
            message: 'This field is required'
          }
        }
      },  
      firstNameShipping: {
        selector: '[data-name="firstNameShipping"]',
        enabled: true,
        message: 'This value is not valid',
        container: '#firstNameShipping',
        trigger: 'blur',

        validators: {
          notEmpty: {
            message: 'This field is required'
          }
        }
      },
      lastNameShipping: {
        selector: '[data-name="lastNameShipping"]',
        enabled: true,
        message: 'This value is not valid',
        container: '#lastNameShipping',
        trigger: 'blur',

        validators: {
          notEmpty: {
            message: 'This field is required'
          }
        }
      },       
      addressShipping: {
        selector: '[data-name="addressShipping"]',
        enabled: true,
        message: 'This value is not valid',
        container: '#addressShipping',
        trigger: 'blur',

        validators: {
          notEmpty: {
            message: 'This field is required'
          }
        }
      }                                                       
    } //fields
  })
    .on('success.form.bv', function(e) {
      // Prevent form submission
      e.preventDefault();

      // Get the form instance
      var $form = $(e.target);

      // Use Ajax to submit form data
      var url = 'https://script.google.com/macros/s/AKfycbxC7zeD8Xb1HtzRMKVvPE0rXFHPmCsUlaEQ0KoSanXb1OZr2f0/exec';
      var redirectUrl = 'success.html';
      // add a loading spinner as feedback 
      $('#postForm').prepend($('<span></span>').addClass('glyphicon glyphicon-refresh glyphicon-refresh-animate')); 
      $('#postForm').attr('disabled','disabled');
      var jqxhr = $.post(url, $form.serialize(), function(returnMsg) {
          console.log("Success!");
      })
        .done(function(returnMsg) {
          $(location).attr('href',redirectUrl);
        })
        .fail(function(returnMsg) {
            console.warn("Error! ReturnMsg: " + returnMsg.statusText);
            if (navigator.userAgent.search("Safari") >= 0 && navigator.userAgent.search("Chrome") < 0) {
                //alert("Browser is Safari -- we get an error, but the form still submits -- continue.");
                // Known Safari Error see: https://code.google.com/p/google-apps-script-issues/issues/detail?id=3226
                $(location).attr('href',redirectUrl);                
            }
        });
  }); // validator
});