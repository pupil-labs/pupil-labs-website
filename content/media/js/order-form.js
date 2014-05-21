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
      
      parent = $(this).parent().parent();
      $(this).fadeOut("normal", function() {
        $(parent).remove();
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
        $("a[id^=next").parent().parent().show();
        $(this).removeClass('active');
      } else {      
        $(this).addClass('active');
        $(this).attr('data-original-title', 'Collapse all form fields.');
        $("a[id^=next").parent().parent().hide();
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



})( jQuery );

$(document).ready(function() {
  $('label[data-id=order-type]').revealContact("#order-collapse","input[data-id=order-type]")


  $("input[data-action=count]").sumOrder("input[data-id=orderSum]");
  $('.combobox').combobox();
  $('[data-toggle=tooltip]').tooltip();


  $('a[id^=next]').revealNext('collapse'); //"div[id^=collapse-]"
  $("label[data-id=shipping-data]").copyFields("#collapse-1", "#shipping-collapse");
  $('#collapse-0').updateFields('#collapse-1');
  $('#collapse-1').updateFields('#shipping-collapse');
  $('label[data-id=payment-data]').reveal('#submit-collapse')
  $('#toggle-all').toggleAll();


});