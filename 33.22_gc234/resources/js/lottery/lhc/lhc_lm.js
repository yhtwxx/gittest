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

	ui.find("#BetGold").text('0');
	ui.find("#Gold").val('');
	ui.find("span").removeClass('active');
	ui.find(".itemCode").val('').removeClass("selectedinput");
	ui.find(".choose-num").removeClass('active disabled');
	ui.find(".selected-bet").removeClass("selected-bet");
}
// 文字闪动
/*function shake(ele, cls, times) {
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
};*/
/*var timeodd = 0;*/
/*var zxx = {
	obj : function() {
		return {
			day : $("#day_show"),
			sec : $("#second_show"),
			mini : $("#minute_show"),
			hour : $("#hour_show")
		}
	}
};*/
// 获取时间
/*var getTimeFunction;
function getCountdown() {
	$.ajax({
		url : "../lhc/signal.do?timeStamp=" + new Date().getTime(),
		type : "get",
		dataType : "json",
		success : function(b) {
			// console.debug(b);
			if (0 == b.code) {
				stopCount();
				var cai_num = $("#cai-num");
				cai_num.html(b.gameNo);
				var intDiff = parseInt(b.countdown);// 倒计时总秒数量
				timeodd = intDiff;
				if (intDiff > 0 && !startScroll) {
					$("#overMsg").hide();
					$("#ui-countdown").show();
					var now = new Date();
					var d = now.getTime() + intDiff * 1000; // 如果未定义时间，则我们设定倒计时日期是2050年1月1日
					fnTimeCountDownDay(d, zxx.obj());
					getTimeFunction = setTimeout("getCountdown()", 10000);
				} else {
					// $("#orders").hidden();
					// $("#result").show();
					// clearTimeout(getTimeFunction);//停止获取
					startScroll = true;// 标识开始开奖
					getCountdownOrnot();
					clearTimeout(getTimeFunction);// 停止倒计时
				}
			} else {
				Showbo.Msg.alert('请登录!')
				setTimeout(function() {
					window.location.href = ctx + "logout.do";
				}, 1000);
			}
		}
	})
}*/

/*function startScrollSg() {
	$("#order-box").hide();
	$("#prevSGSpan").hide();
	$("#cai-info").hide();
	$("#scrollResults").show();
	sn_Lottery_choose("#scrollResults", ".scrollNum", 50);
}*/

/**
 * Code Width jQuery 开奖效果 [sn_Lottery_choose description]
 * 
 * @param {[type]}
 *            elem [外层box]
 * @param {[type]}
 *            numBox [滚动数字box]
 * @param {[type]}
 *            count [最大数字限制]
 * @return {[type]} [function]
 */
/*var sn_Lottery_choose = function(elem, numBox, count) {
	// console.debug(lastSg);
	var num, index = 0, i = 0, speed = 100, frequency = 100;// speed=闪烁速度，
															// frequency=出结果频率
	var $elem = $(elem);
	var $numBox = $elem.find(numBox);
	var arrBall = [];
	for (var j = 1; j < count; j++) {
		arrBall.push(pad(j, 2));
	}
	// console.debug(arrBall);
	arrBall.sort(function() {
		return (Math.random() < 0.5 ? 1 : -1)
	});
	// console.debug(arrBall);
	function setNum() {
		getLastSg();
		$elem.find(numBox).each(function() {
			if ($(this).attr("data-ok") != "ok") {
				num = arrBall[Math.floor(Math.random() * (count - 1))];
				$(this).html(num);
			}
		});
		if (i == frequency || i == frequency * 2 || i == frequency * 3
				|| i == frequency * 4 || i == frequency * 5
				|| i == frequency * 6 || i == frequency * 7) {
			var color = lastSg.ballResultList[index].ballColor;
			var html = '';
			switch (color) {
			case 'H':
				html = '<span class="num ballR">'
						+ lastSg.ballResultList[index].ballNum + '</span>';
				break;
			case 'B':
				html = '<span class="num ballB">'
						+ lastSg.ballResultList[index].ballNum + '</span>';
				break;
			case 'G':
				html = '<span class="num ballG">'
						+ lastSg.ballResultList[index].ballNum + '</span>';
				break;
			default:
				break;
			}
			$("#num" + (index + 1)).attr("data-ok", "ok").html(html);
			$("#animal" + (index + 1)).attr("data-ok", "ok").html(
					lastSg.ballResultList[index].animal);
			index++;
		} else if (i > frequency * 7) {
			startScroll = false;
			setTimeout(function() {
				$("#scrollResults").hide();
				$("#order-box").show();
				$("#prevSGSpan").show();
				$("#cai-info").show();
				$(".scrollNum").attr("data-ok", "").html("&nbsp;");
				$(".scrollAnimal").html("&nbsp;");
				getCountdownOrnot();
			}, 10000);
			return;
		}

		if (lastSg == null || lastSg == undefined || lastSg == "") {

		} else {
			i++;
		}

		setTimeout(arguments.callee, speed);
	}

	setNum();
}*/

function pad(num, n) {
	num += "";
	if ((num + "").length >= n)
		return num;
	return pad("0" + num, n);
}

/*function getCountdownOrnot() {
	if (!startScroll) {
		getCountdown();
	} else {
		startScrollSg();
	}
}*/

/*var startScroll = false;// 标识是否是开奖时间
$(function() {
	// 加载完执行
	getCountdown();
	// 定时任务
	// var timerInterval = window.setInterval('getCountdownOrnot()', 10000);
});
*/
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
$(document).on("change", "#locate-box .itemCode", function() {
	var el = this;
	el.value = format_gold(el.value);
	var allGold = 0;
	$("#locate-box .itemCode").each(function(i) {
		if ($(this).val()) {
			allGold += format_gold($(this).val());
		}
	});
	$('#BetGold').text(allGold);

}).on("keyup", "#locate-box .itemCode", function() {
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
				var itemNo = '';
				$("#locate-box .itemCode").each(function(i) {
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
					url : "/lhc/order.do?timeStamp=" + new Date().getTime(),
					data : Data,
					type : "post",
					dataType : "json",
					success : function(b) {
						if (0 == b.code) {

							readUserDate();
							kxreset();
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
		$("#BetGold").focus();
	}

});

function getGoldValue() {
	var allGold = 0;
	$("#locate-box .itemCode").each(function(i) {
		if ($(this).val()) {
			allGold += format_gold($(this).val());
		}
	});
	$('#BetGold').text(allGold);
}

function getGold(obj) {
	var kxGold = $("#kuaijiexiaju_input").val();
	var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
	if (!exp.test(kxGold)) {
		parent.Showbo.Msg.alert('请输入正确的下注金额');
		$("#kuaijiexiaju_input").focus();
		return;
	}
	$("#q" + obj).addClass("hasGold");
	$("#itemCode" + obj).val(kxGold);
	getGoldValue();
}

function getGoldXuan(obj) {
	var kxGold = $("#kuaijiexiaju_input").val();
	var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
	if (!exp.test(kxGold)) {
		parent.Showbo.Msg.alert('请输入正确的下注金额');
		$("#kuaijiexiaju_input").focus();
		return;
	}

	for (var i = 1; i < 50; i++) {
		if (obj == "Dan") {// 单
			if (i % 2 != 0) {
				getGold(i);
			}
		} else if (obj == "Shuang") {// 双
			if (i % 2 == 0) {
				getGold(i);
			}
		} else if (obj == "Da") {// 大
			if (i > 24) {
				getGold(i);
			}
		} else if (obj == "Xiao") {// 小
			if (i < 25) {
				getGold(i);
			}
		} else if (obj == "hDan") {// 和单
			if (i > 9) {
				var ge = i % 10;
				var shi = parseInt(i / 10, 10);
				if ((ge + shi) % 2 != 0) {
					getGold(i);
				}
			} else {
				if (i % 2 != 0) {
					getGold(i);
				}
			}
		} else if (obj == "hShuang") {// 和双
			if (i > 9) {
				var ge = i % 10;
				var shi = parseInt(i / 10, 10);
				if ((ge + shi) % 2 == 0) {
					getGold(i);
				}
			} else {
				if (i % 2 == 0) {
					getGold(i);
				}
			}
		} else if (obj == "hDa") {// 和大
			if (i > 9) {
				var ge = i % 10;
				var shi = parseInt(i / 10, 10);
				if ((ge + shi) > 6) {
					getGold(i);
				}
			} else {
				if (i > 6) {
					getGold(i);
				}
			}
		} else if (obj == "hXiao") {// 和小
			if (i > 9) {
				var ge = i % 10;
				var shi = parseInt(i / 10, 10);
				if ((ge + shi) < 7) {
					getGold(i);
				}
			} else {
				if (i < 7) {
					getGold(i);
				}
			}
		}
	}
}

function getColorAll(obj) {
	var kxGold = $("#kuaijiexiaju_input").val();
	var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
	if (!exp.test(kxGold)) {
		parent.Showbo.Msg.alert('请输入正确的下注金额');
		$("#kuaijiexiaju_input").focus();
		return;
	}

	var nums = '';
	if (obj == 'R') {
		nums = '1,2,7,8,12,13,18,19,23,24,29,30,34,35,40,45,46';
		nums = nums.split(',');
	} else if (obj == 'B') {
		nums = '3,4,9,10,14,15,20,25,26,31,36,37,41,42,47,48';
		nums = nums.split(',');
	} else if (obj == 'G') {
		nums = '5,6,11,16,17,21,22,27,28,32,33,38,39,43,44,49';
		nums = nums.split(',');
	}
	for (var j = 0; j < nums.length; j++) {
		getGold(parseInt(nums[j]));
	}
}

function getColorHerf(color, type) {
	var kxGold = $("#kuaijiexiaju_input").val();
	var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
	if (!exp.test(kxGold)) {
		parent.Showbo.Msg.alert('请输入正确的下注金额');
		$("#kuaijiexiaju_input").focus();
		return;
	}

	var nums;
	var numslist = new Array();
	if (color == 'R') {
		nums = new Array(1, 2, 7, 8, 12, 13, 18, 19, 23, 24, 29, 30, 34, 35,
				40, 45, 46);
	} else if (color == 'B') {
		nums = new Array(3, 4, 9, 10, 14, 15, 20, 25, 26, 31, 36, 37, 41, 42,
				47, 48);
	} else if (color == 'G') {
		nums = new Array(5, 6, 11, 16, 17, 21, 22, 27, 28, 32, 33, 38, 39, 43,
				44, 49);
	}

	if (type == 'dan') {
		for (var i = 0; i < nums.length; i++) {
			if (nums[i] % 2 != 0) {//单
				getGold(nums[i]);
			}
		}
	} else if (type == 'shuang') {
		for (var i = 0; i < nums.length; i++) {
			if (nums[i] % 2 == 0) {//双
				getGold(nums[i]);
			}
		}

	} else if (type == 'da') {
		for (var i = 0; i < nums.length; i++) {
			if (nums[i] > 24) {//大
				getGold(nums[i]);
			}
		}
	} else if (type == 'xiao') {
		for (var i = 0; i < nums.length; i++) {
			if (nums[i] < 25) {//小
				getGold(nums[i]);
			}
		}
	}
}

function getNumByHead(num) {
	var kxGold = $("#kuaijiexiaju_input").val();
	var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
	if (!exp.test(kxGold)) {
		parent.Showbo.Msg.alert('请输入正确的下注金额');
		$("#kuaijiexiaju_input").focus();
		return;
	}

	for (var i = 1; i < 50; i++) {
		var j = pad(i, 2);
		if (j.substr(0, 1) == num) {
			getGold(parseInt(i));
		}
	}
}

function getNumByFoot(num) {
	var kxGold = $("#kuaijiexiaju_input").val();
	var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
	if (!exp.test(kxGold)) {
		parent.Showbo.Msg.alert('请输入正确的下注金额');
		$("#kuaijiexiaju_input").focus();
		return;
	}

	for (var i = 1; i < 50; i++) {
		var j = pad(i, 2);
		if (j.substr(1, 1) == num) {
			getGold(parseInt(i));
		}
	}
}

function getNumByAnimal(animal) {
	var kxGold = $("#kuaijiexiaju_input").val();
	var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
	if (!exp.test(kxGold)) {
		parent.Showbo.Msg.alert('请输入正确的下注金额');
		$("#kuaijiexiaju_input").focus();
		return;
	}

	$.ajax({
		url : "/lhc/getItem.do?timeStamp=" + new Date().getTime()
				+ "&poolId=8",
		type : "get",
		dataType : "json",
		success : function(b) {
			if (b.code == 0) {
				var list = b.list;
				//console.debug(list);
				for (var i = 0; i < list.length; i++) {
					if (animal == list[i].itemName) {
						var nums = list[i].displayNo;
						nums = nums.split(',');
						for (var j = 0; j < nums.length; j++) {
							getGold(parseInt(nums[j]));
						}
					}
				}
			}

		}
	});
}

function kxreset() {
	reset();
	for (var i = 1; i < 50; i++) {
		$("#q" + i).removeClass("hasGold");
	}
}