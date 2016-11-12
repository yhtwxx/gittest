$.setupJMPopups({
	screenLockerBackground : "#000"
});

// 已移到父级
// function openStaticPopup() {
// $.openPopupLayer({
// name: "myStaticPopup",
// width: 1000,
// target: "myHiddenDiv"
// });
// }
//
// function openStaticGzPopup() {
// $.openPopupLayer({
// name: "myStaticGzPopup",
// width: 1000,
// target: "myHiddenGzDiv"
// });
// }

function reset() {
	var ui = $("#order-box");

	/*
	 * $.each(ui, function(num, $el){ $el.removeClass('active disabled'); });
	 */

	ui.find(".itemCode").val('');
	ui.find("#BetGold").text('0');
	ui.find(".itemCode").val('').removeClass("selectedinput");
	ui.find(".selected-bet").removeClass("selected-bet");
}
// 文字闪动
function shake(ele, cls, times) {
	var i = 0, t = false, o = ele.attr("class") + " ", c = "", times = times || 2;
	if (t)
		return;
	t = setInterval(function() {
		i++;
		c = i % 2 ? o + cls : o;
		ele.attr("class", c);
		if (i == 2 * times) {
			clearInterval(t);
			ele.removeClass(cls);
		}
	}, 200);
};
var timeodd = 0;

var zxx = {
	obj : function() {
		return {
			sec : $("#second_show"),
			mini : $("#minute_show"),
			hour : $("#hour_show")
		}
	}
};

function getCountdown() {
	$.ajax({
		url : "/ahk3/countdown.do?timeStamp=" + new Date().getTime(),
		type : "get",
		dataType : "json",
		success : function(b) {
			if (0 == b.code) {
				stopCount();
				var cai_num = $("#cai-num");
				cai_num.html(b.gameNo);
				var intDiff = parseInt(b.countdown);// 倒计时总秒数量
				timeodd = intDiff;
				if (intDiff > 0) {
					$("#overMsg").hide();
					$("#ui-countdown").show();
					var now = new Date();
					var d = now.getTime() + intDiff * 1000; // 如果未定义时间，则我们设定倒计时日期是2050年1月1日
					fnTimeCountDown(d, zxx.obj());
				} else {
					// $("#orders").hidden();
					// $("#result").show();
					$("#ui-countdown").hide();
					$("#overMsg").show();
				}
			} else {
				Showbo.Msg.alert('请登录!')
				setTimeout(function() {
					window.location.href = ctx + "logout.do";
				}, 1000);
			}
		}
	})
}

$(function() {
	// 加载完执行
	getCountdown();
	// 定时任务
	window.setInterval('getCountdown()', 10000);
});

function toJSON(list) {
	if (list == null)
		return {};
	var result = {};
	for (var i = 0, length = list.length; i < length; i++) {
		result[list[i]] = 1;
	}
	return result;
}

// 左侧导航切换
$(function() {
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
		var links = this.el.find('.link');
		// Evento
		links.on('click', {
			el : this.el,
			multiple : this.multiple
		}, this.dropdown)
	}

	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
		$this = $(this), $next = $this.next();

		$next.slideToggle();
		$this.parent().toggleClass('open');

		if (!e.data.multiple) {
			$el.find('.submenu').not($next).slideUp().parent().removeClass(
					'open');
		}
		;
	}

	var accordion = new Accordion($('#accordion'), false);
});

// 表格切换
$(document).ready(function() {
	$("#tabs li").bind("click", function() {
		$parent = $(".game-box");
		$parent.find(".active").each(function() {

			$(this).removeClass('active');

		})

		$("#tabs-body").find("input").each(function() {
			$(this).val('');
		})
		reset();
		$('#BetGold').text(0);
		var index = $(this).index();
		var divs = $("#locate-box > table");
		$(this).parent().children("li").attr("class", "tabs-btn");// 将所有选项置为未选中
		$(this).attr("class", "tabs-btn active"); // 设置当前选中项为选中样式
		divs.hide();// 隐藏所有选中项内容
		divs.eq(index).show(); // 显示选中项对应内容
	});

	$(".display-ctl").click(function() {
		$(".display-area").toggle();
	})

});
function format_gold(gold) {
	return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
}
$(document).on("change", ".itemCode", function() {
	var el = this;
	el.value = format_gold(el.value);
	var allGold = 0;
	$(".itemCode").each(function(i) {
		if ($(this).val()) {
			allGold += format_gold($(this).val());
		}
	});
	$('#BetGold').text(allGold);

}).on("keyup", ".itemCode", function() {
	var el = this;
	el.value = format_gold(el.value);
	var allGold = 0;
	$(".itemCode").each(function(i) {
		if ($(this).val()) {
			allGold += format_gold($(this).val());
		}
	});
	$('#BetGold').text(allGold);
});// jQuery 1.7+

// 公共读取用户信息
function readUserDate() {
	$.ajax({
		url : "/userDate.do?timeStamp=" + new Date().getTime(),
		data : {},
		type : "get",
		dataType : "json",
		success : function(b) {
			if (0 == b.code) {

				var balance = b.balance / 100;
				shake($("#balance"), "wzred", 3);
				$("#balance").html(fmoney(balance) + ' ' + b.currency);

			} else {
				Showbo.Msg.alert(langpackage[b.code])
			}
		}
	})
}

// 绑定下注事件
$('button#btn-orders-submit').bind("click", function() {

	var betGold = $("#BetGold").html();
	// 替代上面代码
	var tabs_view = $("#tabs").find(".active").attr("tabs");
	var this_tabs = 'tabs-view=' + tabs_view;

	if (betGold > 0) {
		parent.Showbo.Msg.confirm("投注金额：" + betGold, function($el) {
			if ($el == 'yes') {
				if (timeodd < 1) {
					parent.Showbo.Msg.alert('投注超时');
					return;
				}
				var gameNo = $("#cai-num").html();
				var itemCodes = '';
				var position = '';
				var betMoney = '';

				$(".itemCode").each(function(i) {
					if ($(this).val()) {
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
					position_ : position
				}

				$.ajax({
					url : "/ahk3/order.do?timeStamp=" + new Date().getTime(),
					data : Data,
					type : "post",
					dataType : "json",
					success : function(b) {
						if (0 == b.code) {

							readUserDate();
							reset();
							parent.Showbo.Msg.alert('投注成功!')

						} else {
							Showbo.Msg.alert(langpackage[b.code])
						}
					}
				})
			}
		})

	} else {
		parent.Showbo.Msg.alert('下注金额不能为0!')
		$("#BetGold").focus();
	}

});