$(function(){
 $(".boxy").click(function(){
        $('.popup').fadeIn(400);
        $(".transparent_class").fadeIn(400);
		$('.popup').css({
			 'left':($(window).width()-$('.popup').width())/2, 
			 'top':$(window).scrollTop() + ($(window).height() - $('.popup').height())/2
		});
 })
  $(".boxy1").click(function(){
        $('.popup1').fadeIn(400);
        $(".transparent_class").fadeIn(400);
		$('.popup1').css({
			 'left':($(window).width()-$('.popup1').width())/2,
			 'top':$(window).scrollTop() + ($(window).height() - $('.popup1').height())/2
		});
 })
 $(".popup_close").click(function(){	 	
		 $(".popup_close").parent().parent().fadeOut(400);
		 $(".transparent_class").fadeOut(400);
        $("#popLoginError").html("");
 })
 $(".transparent_class").css({'width': jQuery(document).width(), 'height': jQuery(document).height()})
 
 //拖动
 var dragging = false;
 var iX, iY;
 $(".popup_head").mousedown(function(e){
 dragging = true;
 iX = e.clientX - parseInt($(".popup").css('left'));
 iY = e.clientY - parseInt($(".popup").css('top'));
 return false;
 });
 $(document).mousemove(function(e) {
 if (dragging) {
 //var e = e || window.event;
 var oX = e.clientX - iX;
 var oY = e.clientY - iY;
 $(".popup").css({"left":oX + "px", "top":oY + "px"});
 return false;
 }
 })
 $(document).mouseup(function(e) {
 dragging = false;
 })
 })