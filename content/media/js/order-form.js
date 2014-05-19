;(function( $ ) {

  $.fn.copyForm = function(billing, shipping) {
  	$(this).on('click', function(e) {
  		if($(this).children('input').val() === 'use-other') {
	  		$(shipping + " .form-control").each(function() {
  				$(this).val("");
  			});
  			$(shipping).collapse('show');
        $('#submit-collapse').collapse('show');
  		} else {
        if($(shipping).hasClass("in")) {
          $(shipping).collapse('hide');
        }
	  		$(billing + " .form-control").each(function() {
  				$(shipping + " .form-control[data-id=" + $(this).attr('data-id') + "]").val($(this).val());
	  		});
        $('#submit-collapse').collapse('show');
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

  $.fn.revealShippingIntro = function(target) {
    $(this).on('click', function(){
      $(target).collapse('show');
    });
    return this;
  };


})( jQuery );