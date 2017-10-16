function animate(pulse_class, id){
  let cart_badge = document.getElementById(id);

  const animation_end_events = ['webkitAnimationEnd', 
                        'mozAnimationEnd', 
                        'MSAnimationEnd', 
                        'oanimationend', 
                        'animationend'];
  const animated_class = "animated";

  cart_badge.classList.add(pulse_class, animated_class);
  for(var i = 0; i < animation_end_events.length; i++){
    var animate_end_event = animation_end_events[i];
    cart_badge.addEventListener(animate_end_event, function(e){
      cart_badge.classList.remove(pulse_class, animated_class);
    });
  }    
}

window.onload = function(){
  const pulse_class = "pulse";
  const ids = ['cart-desktop', 'cart-mobile'];

  var add_to_cart_buttons = document.getElementsByClassName('Button-store');
  for (var i = 0; i < add_to_cart_buttons.length; i++){
    var button = add_to_cart_buttons[i]
    button.addEventListener("click", function(e){
      e.preventDefault();
      for(var j = 0; j < ids.length; j++){
        var id = ids[j];
        animate(pulse_class, id);      
      }
    })
  }
};