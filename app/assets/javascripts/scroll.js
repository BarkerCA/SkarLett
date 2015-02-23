$(document).ready(function (){
  
  function do_scroll(anchor){
    $('html,body').animate({
      scrollTop: $(anchor).offset().top - 77
    }, 2000);
  };
  
  $("#nav_top").click(function(){
    do_scroll('#topofpage');
  });
  
  $("#nav_coaching").click(function (){
    do_scroll('#coaching');
  });
  
  $("#nav_barnabas").click(function (){
    do_scroll('#barnabas');
  });
  
  $("#nav_leadership").click(function (){
    do_scroll('#leadership');
  });
  
  $("#nav_about").click(function (){
    do_scroll('#about');
  });
  
  $("#nav_contact").click(function (){
    do_scroll('#contact');
  });
});