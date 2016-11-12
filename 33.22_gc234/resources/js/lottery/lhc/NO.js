/**
 * 
 */
//获取彩池
var itemInfo = "";
$.ajax({url: "/lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId=4,10",
	type: "get",
	dataType: "json",
    success: function(b) {
    	console.debug(b);
    	itemInfo = b;
        if(0 == b.code){
            var html = tpl('#contentTpl', b);
            $("#no_game #orders").html(html);
        }else{
            Showbo.Msg.alert('请登录！')
            window.location.href="/logout.do";
        }
    }
});

//绑定下注事件
$('#no_game #btn-orders-submit').bind("click", function() {

	var betGold = $("#no_game #total_bet").html();
	if (betGold > 0) {
		parent.Showbo.Msg.confirm("投注金额：" + betGold, function($el) {

			if ($el == 'yes') {
				if (parent.window.timeodd < 1) {
					parent.Showbo.Msg.alert('投注超时');
					return;
				}
				var gameNo = $("#cai-num").html();
				var itemCodes = '';
				var position = '';
				var betMoney = '';
				var itemNo = '';
				$("#no_game .GoldQQ").each(function(i) {
					if ($(this).val()) {
						if ($(this).attr("data-itemno")) {
							itemNo += $(this).attr("data-itemno") + '|';
						} else {
							itemNo += 'N' + '|';
						}

						betMoney += $(this).val() + '|';
						itemCodes += $(this).attr("data-itemcode") + '|';
						if ($(this).attr("data-position")) {
							position += $(this).attr("data-position") + '|';
						} else {
							position += 'N' + '|';
						}
					}
				});

				var Data = {
					gameNo : gameNo,
					itemCodes_ : itemCodes,
					betMoney_ : betMoney,
					position_ : position,
					itemNo_ : itemNo
				}

				$.ajax({
					url : ctx+"/lhc/order.do?timeStamp=" + new Date().getTime(),
					data : Data,
					type : "post",
					dataType : "json",
					success : function(b) {
						if (0 == b.code) {

							readUserDate();
							reset();
							parent.Showbo.Msg.alert('投注成功!')

						} else {
							parent.Showbo.Msg.alert(langpackage[b.code])
						}
					}
				})
			}
		})

	} else {
		parent.Showbo.Msg.alert('下注金额不能为0!')
		$("#no_game #total_bet").focus();
	}

});

function reset() {
	$("#no_game .GoldQQ").val('');
	$('#no_game #total_bet').text('0');
	$("#no_game #orders").find(".selected-bet").removeClass("selected-bet");
}

$("#no_game").on('click','.Send .no',function(e){
	$("#no_game .GoldQQ").val('');
	$('#no_game #total_bet').text('0');
	$("#no_game #orders").find(".selected-bet").removeClass("selected-bet");
	$("#no_game #orders").find(".GoldQQ").val('').removeClass("selectedinput");
});


$("#no_game").on("change", ".GoldQQ", function() {
	var el = this;
	el.value = format_gold(el.value);
	var allGold = 0;
	$("#no_game .round-table .GoldQQ").each(function(i) {
		if ($(this).val()) {
			allGold += format_gold($(this).val());
		}
	});
	$('#no_game #total_bet').text(allGold);

}).on("keyup", "#no_game .GoldQQ", function() {
	var el = this;
	el.value = format_gold(el.value);
	var allGold = 0;
	$("#no_game .GoldQQ").each(function(i) {
		if ($(this).val()) {
			allGold += format_gold($(this).val());
		}
	});
	$('#no_game #total_bet').text(allGold);
});// jQuery 1.7+

function format_gold(gold) {
	return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
}