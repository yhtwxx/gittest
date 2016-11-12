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

// function openStaticGzPopup() {
// $.openPopupLayer({
// name: "myStaticGzPopup",
// width: 1000,
// target: "myHiddenGzDiv"
// });
// }

function reset() {
	var ui = $("#order-box");
	ui.find(".choose-num").removeClass('active disabled');
	ui.find("span").removeClass('active');
	ui.find(".itemCode").val('');
	$("#Gold").val('');
	$("#BetGold").text('0');
	ui.find(".selected-bet").removeClass("selected-bet");
	ui.find(".selectedinput").removeClass("selectedinput");
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

// 获取时间
function getCountdown() {
	$.ajax({
		url : "/xjssc/countdown.do?timeStamp=" + new Date().getTime(),
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
				parent.Showbo.Msg.alert('请登录!')
				setTimeout(function() {
					window.location.href = "/logout.do";
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
		// $parent = $(".game-box");
		// $parent.find(".active").each(function () {
		//
		// $(this).removeClass('active');
		//
		// })
		$(this).addClass('active').siblings('li').removeClass('active');

		reset();
		$('#BetGold').text(0);
		var index = $(this).index();
		var divs = $("#locate-box > table");
		$(this).parent().children("li").attr("class", "tabs-btn");// 将所有选项置为未选中
		$(this).attr("class", "tabs-btn active"); // 设置当前选中项为选中样式
		divs.hide();// 隐藏所有选中项内容
		divs.eq(index).show(); // 显示选中项对应内容
	});
});
function format_gold(gold) {
	return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
}
$(document).on("change", ".itemCode", function() {
	var el = this;
	el.value = format_gold(el.value);
	/*var allGold = 0;
	$(".itemCode").each(function(i) {
		if ($(this).val()) {
			allGold += format_gold($(this).val());
		}
	});
	$('#BetGold').text(allGold);*/
	setBetGold();
}).on("keyup", ".itemCode", function() {
	var el = this;
	el.value = format_gold(el.value);
	/*var allGold = 0;
	$(".itemCode").each(function(i) {
		if ($(this).val()) {
			allGold += format_gold($(this).val());
		}
	});
	$('#BetGold').text(allGold);*/
	setBetGold();
});// jQuery 1.7+

function fmoney(s, n) {
	n = n > 0 && n <= 20 ? n : 2;
	s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
	var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
	var t = "";
	var i;
	for (i = 0; i < l.length; i++) {
		t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
	}
	return t.split("").reverse().join("") + "." + r;
}

//计算下注金额
function setBetGold(){
	var allGold = 0;
	$(".itemCode").each(function(i) {
		if ($(this).val()) {
			allGold += format_gold($(this).val());
		}
	});
	$('#BetGold').text(allGold);
}
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
				parent.Showbo.Msg.alert(langpackage[b.code])
			}
		}
	})
}

// 绑定下注事件
$('button#btn-orders-submit').bind(
		"click",
		function() {
			var betGold = $("#BetGold").html();
			// 替代上面代码
			var tabs_view = $("#tabs").find(".active").attr("tabs");
			var this_tabs = 'tabs-view=' + tabs_view;
			var itemno = $("table[" + this_tabs + "]").find('.bet-gold').attr(
					"data-itemno");

			if (betGold > 0) {
				if (itemno) {

					parent.Showbo.Msg.confirm("投注金额：" + betGold, function($el) {

						if ($el == 'yes') {
							if (timeodd < 1) {
								parent.Showbo.Msg.alert('投注超时');
								return;
							}
							var gameNo = $("#cai-num").html();
							var itemCodes = $("table[" + this_tabs + "]").find(
									'.bet-gold').attr("data-itemcode");
							var betMoney = $("table[" + this_tabs + "]").find(
									'.bet-gold').val();

							$.ajax({
								url : "/xjssc/order.do?timeStamp="
										+ new Date().getTime(),
								data : {
									gameNo : gameNo,
									itemCodes_ : itemCodes + '|',
									betMoney_ : betMoney + '|',
									itemNo_ : itemno + '|'
								},
								type : "post",
								dataType : "json",
								success : function(b) {
									if (0 == b.code) {

										readUserDate();
										reset();
										parent.Showbo.Msg.alert('投注成功!')

									} else {
										parent.Showbo.Msg
												.alert(langpackage[b.code])
									}
								}
							})
						}
					})

				} else {

					parent.Showbo.Msg.confirm("投注金额：" + betGold, function($el) {

						if ($el == 'yes') {
							if (timeodd < 1) {
								parent.Showbo.Msg.alert('投注超时');
								return;
							}
							var gameNo = $("#cai-num").html();
							var itemCodes = '';
							var betMoney = '';

							$(".itemCode").each(
									function(i) {
										if ($(this).val()) {
											betMoney += $(this).val() + '|';
											itemCodes += $(this).attr(
													"data-itemcode")
													+ '|';
										}
									});
							$.ajax({
								url : "/xjssc/order.do?timeStamp="
										+ new Date().getTime(),
								data : {
									gameNo : gameNo,
									itemCodes_ : itemCodes,
									betMoney_ : betMoney
								},
								type : "post",
								dataType : "json",
								success : function(b) {
									if (0 == b.code) {
										readUserDate();
										reset();
										parent.Showbo.Msg.alert('投注成功!')

									} else {
										parent.Showbo.Msg
												.alert(langpackage[b.code])
									}
								}
							})

						}

					})

				}

			} else {
				parent.Showbo.Msg.alert('下注金额不能为0!')
				$("#BetGold").focus();
			}

		});