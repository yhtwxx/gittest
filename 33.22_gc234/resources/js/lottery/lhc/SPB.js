/**
 * 
 */

//获取彩池
var itemInfo = "";
$.ajax({url: "/lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId=22,23",
	type: "get",
	dataType: "json",
    success: function(b) {
    	itemInfo = b;
        if(0 == b.code){
            var html = tpl('#contentTpl', b);
            $("#spb_game #orders").html(html);
        }else{
            Showbo.Msg.alert('请登录！')
            window.location.href="/logout.do";
        }
    }
});

//绑定下注事件
$('#spb_game #btn-orders-submit').bind("click", function() {

	var betGold = $("#spb_game #BetGold").html();
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
				$("#spb_game .itemCode").each(function(i) {
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
		$("#spb_game #BetGold").focus();
	}

});

$("#spb_game").on("change", ".itemCode", function() {
	var el = this;
	el.value = format_gold(el.value);
	var allGold = 0;
	$("#spb_game .round-table .itemCode").each(function(i) {
		if ($(this).val()) {
			allGold += format_gold($(this).val());
		}
	});
	$('#spb_game #BetGold').text(allGold);

}).on("keyup", "#spb_game .itemCode", function() {
	var el = this;
	el.value = format_gold(el.value);
	var allGold = 0;
	$("#spb_game .itemCode").each(function(i) {
		if ($(this).val()) {
			allGold += format_gold($(this).val());
		}
	});
	$('#spb_game #BetGold').text(allGold);
});// jQuery 1.7+

function format_gold(gold) {
	return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
}

function reset() {
	var ui = $("#order-box");

	ui.find("#BetGold").text('0');
	ui.find("#Gold").val('');
	ui.find("span").removeClass('active');
	ui.find(".itemCode").val('').removeClass("selectedinput");
	ui.find(".choose-num").removeClass('active disabled');
	ui.find(".selected-bet").removeClass("selected-bet");
}