/**
 * 
 */

$(function(){
	$(document).on('click','.menu',function(e){
		$(".showFastMoney").hide();
		var $parent = $(this).parent();
		var html = '<ul class="showFastMoney">'+
						'<li><a href="#" class="chanceMoney" data-val="1">下注1元</a></li>'+
						'<li><a href="#" class="chanceMoney" data-val="5">下注5元</a></li>'+
						'<li><a href="#" class="chanceMoney" data-val="10">下注10元</a></li>'+
						'<li><a href="#" class="chanceMoney" data-val="20">下注20元</a></li>'+
						'<li><a href="#" class="chanceMoney" data-val="50">下注50元</a></li>'+
						'<li><a href="#" class="chanceMoney" data-val="100">下注100元</a></li>'+
					'</ul>';
		$parent.css('position','relative');
		var $menu = $parent.find('.showFastMoney');
		//alert($menu.length);
		if($menu.length <= 0){
			$parent.append(html);
		}
		$menu = $parent.find('.showFastMoney');
		var top = $(this).position().top;
		var left = $(this).position().left;
		var height = $(this).outerHeight(true);
		var inputWidth = $(this).width();
		var menuWidth = $menu.width() + 14;
//		console.log(menuWidth);
		var boxLeft, boxTop;
		boxLeft = (left + inputWidth/2) - menuWidth/2;
		$menu.css({'top':top+height+15, 'left':boxLeft}).show();
//		if($parent.attr('id') == 'kxGoldBox'){
//			$menu.css({'top':'35px', 'left':'0px'}).show();
//		}else{
//			$menu.css({'top':'45px', 'left':'30px'}).show();
//		}
		
		$(document).one("click", function(){
	        $(".showFastMoney").hide();
	    });
		e.stopPropagation();
	});
	
	$(document).on('click', '.chanceMoney', function(e){
		var money = $(this).attr('data-val');
		money = parseInt(money);
		$(this).parent('li').parent('.showFastMoney').siblings('input').val(money).change();
		$(".showFastMoney").hide();
		e.stopPropagation();
		e.preventDefault();
	});
	
});