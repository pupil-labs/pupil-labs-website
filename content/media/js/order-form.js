;(function( $ ) {

  $.fn.copyForm = function(billing, shipping) {
    this.click(function() {
      if ($(this).is(':checked')) {
        $(billing + " .form-control").each(function() {
          $(shipping + " .form-control[data-id='" + $(this).attr('data-id') + "'").val($(this).val());
        });
      } else {
        $(shipping + " .form-control").each(function() {
          $(this).val($(this).attr('placeholder'));
        });
      }
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

  $.fn.reveal = function(target,toDB) {
  	$(this).on('click', function(){
  		console.log($(this).children('input').val());
  		$(toDB).val($(this).children('input').val());
  		$(target).collapse('show');
  	});

  		// $(this).addClass('.active');
  		// console.log($(this).children('input').val());
  	// });
  };

})( jQuery );