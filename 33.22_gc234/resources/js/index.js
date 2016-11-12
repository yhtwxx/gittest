$(document).ready(function() {
       $(window).on('scroll load', function() {
         if ($(this).scrollTop() > 650) {
            $("#deposit").animate({width:'100px'},2000);
			$("#take").animate({width:'180px'},3000);
			$(".num-inner-bg").animate({width:'180px'},3000);
			$(".num-inner-bg2").animate({width:'100px'},2000);
			$(".num-inner-bg3").animate({width:'160px'},2500);
			$(".num-inner-bg4").animate({width:'220px'},3500);
         }
     })
});
$(".serBox").hover(function () {
	 $(this).children().stop(false,true);
	 $(this).children(".serBoxOn").fadeIn("slow");
     $(this).children(".pic1").animate({right: -234},400);
     $(this).children(".pic2").animate({left: 0},400);
     $(this).children(".txt1").animate({left: -240},400);
     $(this).children(".txt2").animate({right: 0},400);
},function () {
	 $(this).children().stop(false,true);
	 $(this).children(".serBoxOn").fadeOut("slow");
	 $(this).children(".pic1").animate({right:0},400);
     $(this).children(".pic2").animate({left: -234},400);
     $(this).children(".txt1").animate({left: 0},400);
     $(this).children(".txt2").animate({right: -240},400);
});
$(document).ready(function(e) {
    $(".load_e").animate("width","50px");
});
$(document).ready(function() {
  var y=true;
   $(window).on('scroll load', function() {
	 if ($(this).scrollTop() > 650) {
		while(y==true){
			var options = {
				useEasing : true,
				useGrouping : true,
				separator : '\'',
				decimal : '\'',
				prefix : '',
				suffix : ''
			};
			var demo = new CountUp("take_num", 0, 2.8, 1,1, options);
			demo.start();
			var demo2 = new CountUp("deposit_num", 0, 25, 0, 1, options);
			demo2.start();
			var demo3 = new CountUp("bank_num", 0, 34, 0, 1, options);
			demo3.start();
			var demo4 = new CountUp("num1", 0, 2472, 0, 1, options);
			demo4.start();
			var demo5 = new CountUp("num2", 0, 189871, 0, 1, options);
			demo5.start();
			var demo6 = new CountUp("num3", 0, 3294, 0, 1, options);
			demo6.start();
			var demo7 = new CountUp("num4", 0, 5, 0, 1, options);
			demo7.start();
			var demo8 = new CountUp("num5", 0, 39, 0, 1, options);
			demo8.start();
			var demo9 = new CountUp("num6", 0, 8531234638, 0, 1, options);
			demo9.start();
			y=false;
		}
       }
     })
 });
$(function(){
	$('.carousel .show ul li:eq(0)').show();
	var speed = 5000,iNum = 0;
	$('.carousel .focus a').bind('click',function(){
			var aIndex = $('.carousel .focus a').index(this);
			$('.on').removeClass('on');
			$(this).addClass('on');
			$('.carousel .show ul li').fadeOut().eq(aIndex).fadeIn();
			iNum = aIndex;
			})
	var autoPlay = function(){
		iNum++;
		if(iNum == $('.carousel .show ul li').length){iNum=0;}
		$('.on').removeClass('on');
		$('.carousel .focus  a').eq(iNum).addClass('on');
		$('.carousel .show ul li').fadeOut().eq(iNum).fadeIn(1000);
		};
	var timer = setInterval(autoPlay,speed);
	$('.carousel .show,.carousel .focus').hover(function(){clearInterval(timer);},function(){timer = setInterval(autoPlay,speed);});
  });