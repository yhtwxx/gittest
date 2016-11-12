/**
 * 开奖，获取开奖结果
 */


var timeodd = 0;
var lastSg_;
var d = new Date();
var date = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();

var zxx = {
	obj : function() {
		return {
			day : $("#day_show"),
			sec : $("#second_show"),
			mini : $("#minute_show"),
			hour : $("#hour_show")
		}
	}
};

var getTimeFunction;
function getCountdown() {
	$.ajax({
		url : "/lhc/signal.do?timeStamp=" + new Date().getTime(),
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
}


function startScrollSg() {
	$("#prevSGSpan").hide();
	$("#cai-info").hide();
	$("#betSection").hide();
	$("#randomball").show();
	sn_Lottery_choose("#randomball", 50);
}


function getLastSg_() {  
	$.ajax({
        url: "/lhc/getLastSg.do?timeStamp=" + new Date().getTime() + "+&resultDate=" + date, type: "get", dataType: "json",
        success: function (b) {
        	if(b != null && b != undefined && b != ''){
        		if(b.lhcResultList != null && b.lhcResultList != undefined && b.lhcResultList != ''){
        			lastSg_ = b.lhcResultList[0];
        		}else{
        		}
        	}else{
        	}
        }
    });
}

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
var sn_Lottery_choose = function(elem, count) {
	// console.debug(lastSg);
	var num, index = 0, i = 0, speed = 100, frequency = 100;// speed=闪烁速度，
															// frequency=出结果频率
	var $elem = $(elem);
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
		getLastSg_();
		var lastSg = lastSg_;
		$elem.find("tr:eq(1) td").each(function() {
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
				html = '<span>' + lastSg.ballResultList[index].ballNum + '</span>';
				$("#bal" + (index)).addClass("bColorR");
				break;
			case 'B':
				html = '<span>' + lastSg.ballResultList[index].ballNum + '</span>';
				$("#bal" + (index)).addClass("bColorB");
				break;
			case 'G':
				html = '<span>' + lastSg.ballResultList[index].ballNum + '</span>';
				$("#bal" + (index)).addClass("bColorG");
				break;
			default:
				break;
			}
			$("#bal" + (index)).attr("data-ok", "ok").html(html);
			$("#bal" + (index) + "a").attr("data-ok", "ok").html(lastSg.ballResultList[index].animal);
			index++;
		} else if (i > frequency * 7) {
			startScroll = false;
			setTimeout(function() {
				$("#randomball").hide();
				$("#prevSGSpan").show();
				$("#cai-info").show();
				$("#betSection").show();
				$elem.find("tr:eq(1) td").attr("data-ok", "").html("&nbsp;");
				$elem.find("tr:eq(2) td").html("&nbsp;");
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
}

function pad(num, n) {
	num += "";
	if ((num + "").length >= n)
		return num;
	return pad("0" + num, n);
}

function getCountdownOrnot() {
	if (!startScroll) {
		getCountdown();
	} else {
		startScrollSg();
	}
}

var startScroll = false;// 标识是否是开奖时间
$(function() {
	// 加载完执行
	getCountdown();
	// 定时任务
	// var timerInterval = window.setInterval('getCountdownOrnot()', 10000);
});


//公共读取用户信息
function readUserDate() {
	$.ajax({
		url : "/userDate.do?timeStamp=" + new Date().getTime(),
		data : {},
		type : "get",
		dataType : "json",
		success : function(b) {
			if (0 == b.code) {
				var balance = b.balance / 100;
				shake($("#balance",parent.document), "wzred", 3);
				$("#balance",parent.document).html(fmoney(balance) + ' ' + b.currency);

			} else {
				Showbo.Msg.alert(langpackage[b.code])
			}
		}
	})
}


//文字闪动
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




var currentBetMode = 1;
var selectedChip = "";
//鼠标悬浮筹码效果
function moveOnChips(chipNums) {
	$("#C" + chipNums).css({
		"backgroundPosition" : "-50px 0px"
	});
}
//鼠标离开筹码效果
function outOnChips(chipNums) {
	$("#C50").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C100").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C500").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C1000").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C5000").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C10000").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C" + selectedChip).css({
		"backgroundPosition" : "-50px 0px"
	});
}
//按下筹码效果
function selectChipsBet(chipNum) {
	if ($("#kuaijiexiaju_input").val() != "") {
		chipConut = parseInt($("#kuaijiexiaju_input").val())
				+ parseInt(chipNum);
		$("#kuaijiexiaju_input").val(chipConut);
		/* $("#backup_input").val(chipConut); */
	} else {
		$("#kuaijiexiaju_input").val(chipNum);
		/* $("#backup_input").val(chipNum); */
	}
	$("#C50").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C100").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C500").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C1000").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C5000").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C10000").css({
		"backgroundPosition" : "0px 0px"
	});
	$("#C" + chipNum).css({
		"backgroundPosition" : "-100px 0px"
	});
	selectedChip = "" + chipNum;
	setSelectedInputVal();
}
//松开筹码效果
function setChips(chipNums) {
	$("#C" + chipNums).css({
		"backgroundPosition" : "-50px 0px"
	});
}
//设置金额
function setSelectedInputVal() {
	$(".selectedinput").val($("#kuaijiexiaju_input").val()).change();
}
//点击取消
function cleanBetItmes() {
	$("#chiplisttm li").css({
		"backgroundPosition" : "0px 0px"
	});
	if (currentBetMode == 1) {
		$(".itemCode").val("").change();
		$(".GoldQQ").val("").change();
		$("#kuaijiexiaju_input").val("");
		$(".selected-bet").removeClass("selected-bet");
		$(".selectedinput").removeClass("selectedinput");
	} else if (currentBetMode == 2) {
		$("#kuaijiexiaju_input").val("");
		$(".selected-bet").removeClass("selected-bet");
		$(".selectedinput").removeClass("selectedinput");
	} else if (currentBetMode == 3) {
		resetFilterResult();
		resetFilter();
	}
	/* $("#backup_input").val(""); */
	setBetGold();//从新计算金额
	chipConut = 0;
	selectedChip = "";
}
//改变快速下注金额
function forceInteger(c) {
	if (!isInteger($(c).val())) {
		$(c).val("");
		return;
	}
	$("#backup_input").val($(c).val());
	$("#kuaijiexiaju_input").val($(c).val());
	setSelectedInputVal();
};
function isInteger(num){
	return /^\+?[1-9][0-9]*$/.test(num);
};


//鼠标悬浮投注区域
$(document).on("mouseover",".choose-item", function(){
	if(!$(this).hasClass("selected-bet")){
		$(this).addClass("bc");
	}
});
//鼠标离开投注区域
$(document).on("mouseout",".choose-item", function(){
	$(this).removeClass("bc");
});
//点击投注区域
$(document).on("click",".choose-item", function(){
	//if(currentBetMode == 1 && currentGame[gameType].gameTime > currentGame[gameType].closeTime){
		//$(this).toggleClass("selected-bet");
		var flaseORtrue = $(this).find("input").is(':focus');
		//alert(flaseORtrue);
		if(!flaseORtrue){
			/* $(this).find(".fontBlue").toggleClass("selected-bet"); */
			$(this).toggleClass("selected-bet");
			$(this).find(".odds").toggleClass("selected-bet");
			$(this).find("input").toggleClass("selectedinput");				
		}
		if($("#kuaijiexiaju_input").val() != ""){
			$(this).find("input").val($("#kuaijiexiaju_input").val()).change();
		}			
		if(!$(this).find(".odds").hasClass("selected-bet")){
			$(this).find("input").val("").change();
		}
	//}
});




/**
 * 
 */

$(function(){
	$(document).on('click','.GoldQQ.msgbox',function(e){
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