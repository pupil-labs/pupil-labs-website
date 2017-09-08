function animate(pulse_class, id){
  let cart_badge = document.getElementById(id);

  const animation_end_events = ['webkitAnimationEnd', 
                        'mozAnimationEnd', 
                        'MSAnimationEnd', 
                        'oanimationend', 
                        'animationend'];
  const animated_class = "animated";

  cart_badge.classList.add(pulse_class, animated_class);
  for(var animate_end_event of animation_end_events){
    cart_badge.addEventListener(animate_end_event, function(e){
      cart_badge.classList.remove(pulse_class, animated_class);
    });
  }    
}

window.onload = function(){
  const pulse_class = "pulse";
  const ids = ['cart-desktop', 'cart-mobile'];

  var add_to_cart_buttons = document.getElementsByClassName('Button-store');
  for (var button of add_to_cart_buttons){
    button.addEventListener("click", function(e){
      e.preventDefault();
      for(var id of ids){
        animate(pulse_class, id);      
      }
    })
  }
};