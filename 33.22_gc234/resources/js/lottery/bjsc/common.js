$(function(){
	getLastSg();//获取最后一起赛果
	setInterval(getLastSg, 10000);
	//选中导航
	var gameType = $("#caiplaynav").find("li.active a").attr("data-type");
	var pream = $("#caiplaynav").find("li.active a").attr("data-flag");
	getBetDiv(gameType, pream);
	$(document).on('click', '#caiplaynav li a', function(){
		$("#caiplaynav li").removeClass("active");
        $(this).parent("li").addClass("active");
		var flag = $(this).attr('data-flag');
		getBetDiv(gameType, flag);
	});
	
	//展开或关闭快选
	$(document).on('click', '.display-ctl', function(){
		$(".display-area").toggle();
	});
	
});
//获取最后一期赛果
var d = new Date();
var date = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();
function getLastSg() {
	$.ajax({
        url: "/bjsc/getLastSg.do?timeStamp=" + new Date().getTime() + "+&resultDate=" + date, type: "get", dataType: "json",
        success: function (b) {
        	//console.debug(b);
        	if(b == null || b == undefined || b == ''){
        		$("#prevSGSpan").hide();
        	}else if(b.result == null || b.result == undefined || b.result == ''){
        		$("#prevQihao").html(b.qihao);
        		$("#lastSg").html("未派彩");
        	}else{
        		$("#prevQihao").html(b.qihao);
        		var result = b.result;
        		var saiguo = result.split(",");
        		var saiguohtml = "";
        		for(var i=0 ; i < saiguo.length; i++){
        			var num = parseInt(saiguo[i]);
        			saiguohtml += "<span class='ball ball-num-"+num+"'>"+num+"</span>";
        		}
        		$("#lastSg").html(saiguohtml);	
        	}
        }
    })
}

function getBetDiv(gameType, pream){
	$.get("/lottery/gc/getHtmlByflag.do", {gameType: gameType,flag: pream}, function(result){
		//console.debug(result);
		$("#betSection").html(result);
	},"html");
}


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
