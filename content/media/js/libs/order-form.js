;(function( $ ) {

  $.fn.reveal = function(target) {
    $(this).on('click', function(e) {
      e.preventDefault();

      $(target).collapse('show');
    });
  };

  $.fn.revealNext = function(target) {
    $(this).on('click', function(e) {
      e.preventDefault();

      targetId = "#" + target + "-" + $(this).attr('id').slice(-1);
      
      $(this).fadeOut("normal", function() {
        $(this).hide();
        $(targetId).collapse('show');
      }); 
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
      }
    });
  };

  $.fn.updateFields = function(target) {
    $(this).on('input propertychange paste', function(e) {
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
  	});
  	return this;
  };

  $.fn.revealSubmit = function(target) {
    $(this).on('click', function(){
      $(this).reveal('#submit-collapse');
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


  $('a[id^=next]').revealNext('collapse'); //"div[id^=collapse-]"
  $("label[data-id=shipping-data]").copyFields("#collapse-1", "#shipping-collapse");
  $('#collapse-0').updateFields('#collapse-1');
  $('#collapse-1').updateFields('#shipping-collapse');
  $('#toggle-all').toggleAll();

  $('#ss-form').bootstrapValidator({
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
      orderPro: {
        enabled: true,
        message: 'This value is not valid',
        container: '#a1',
        selector: '[data-name=orderPro]',
        trigger: null,

        validators: {
          notEmpty: {
            message: 'A number, even if 0, is required.'
          },
          numeric: {
            message: "Value must be a number"
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
        container: '#a2',
        selector: '[data-name=orderDev]',
        trigger: null,

        validators: {
          notEmpty: {
            message: 'A number, even if 0, is required.'
          },
          numeric: {
            message: "Value must be a number"
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
            message: 'This field is required.'
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
            message: 'This field is required.'
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
            message: 'This field is required.'
          },
          emailAddress: {
            message: 'Please enter a valid email address'
          }
        }
      }
       
    } //fields
  });




});