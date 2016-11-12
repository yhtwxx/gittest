/**
 * 
 */

$(function(){
	var target = $("#table1 input[name='rtype']:checked");
	getItme(target);
})

//获取彩池
function getItme(target) {
	var num = $(target).val();
	var flag = num.substring(0,2);
	var number = num.substring(2,3);
	var poolId = "";
	if (num == "HX2") {
		poolId = "24";
		$("#nx_game .tabs-box").show();
	}else if (num == "HX3") {
		poolId = "25";
		$("#nx_game .tabs-box").show();
	}else if (num == "HX4") {
		poolId = "26";
		$("#nx_game .tabs-box").show();
	}else if (num == "HX5") {
		poolId = "27";
	}else if (num == "HX6") {
		poolId = "28";
		$("#nx_game .tabs-box").show();
	}else if (num == "HX7") {
		poolId = "29";
		$("#nx_game .tabs-box").hide();
	}else if (num == "HX8") {
		poolId = "30";
		$("#nx_game .tabs-box").hide();
	}else if (num == "HX9") {
		poolId = "31";
		$("#nx_game .tabs-box").hide();
	}else if (num == "HX10") {
		poolId = "32";
		$("#nx_game .tabs-box").hide();
	}else if (num == "HX11") {
		poolId = "33";
		$("#nx_game .tabs-box").hide();
	}
	
	$.ajax({url: "/lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId="+poolId,
		type: "get",
		dataType: "json",
	    success: function(b) {
	        if(0 == b.code){
	        	var html = tpl("#contentTpl", b);
		        $("#nx_game #roundtable2").html(html);
	        }else{
	            Showbo.Msg.alert('请登录！')
	            window.location.href="/logout.do";
	        }
	    }
	});
}


//为radio绑定单击事件
$("#nx_game").on("click","#table1 input[name='rtype']",function(event) {
	event = event || window.event; 
	var target = event.target; //这个就是触发事件的控件 
	reset();
	getItme(target);
});

//判断个数
function checkboxnum(){
	var number = getxnum();
	var n = $("#nx_game #roundtable2 #table2 input[name='nx[]']");
	var k = 0;
    for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			k ++;
		}
    }
	if(k == number){
		return 0;
	}else if(k < number){
		return 1;
	}else if(k > number){
		return 2;
	}
}
//获取肖数
function getxnum(){
	var radio = $("#table1 input[name='rtype']:checked");
	var num = $(radio).val();
	var number = 0;
	if (num == "HX2") {
		number = 2;
	}else if (num == "HX3") {
		number = 3;
	}else if (num == "HX4") {
		number = 4;
	}else if (num == "HX5") {
		number = 5;
	}else if (num == "HX6") {
		number = 6;
	}else if (num == "HX7") {
		number = 7;
	}else if (num == "HX8") {
		number = 8;
	}else if (num == "HX9") {
		number = 9;
	}else if (num == "HX10") {
		number = 10;
	}else if (num == "HX11") {
		number = 11;
	}
	return number;
}

//绑定下注事件
$('#nx_msgbox .submit_cen').bind("click", function() {
	var betGold = $("#nx_msgbox #gold").val();
	var n = $("#nx_game #roundtable2 #table2 input[name='nx[]']");
	var checknum = checkboxnum();
	var value = getxnum();
	if(checknum == 1){
		parent.Showbo.Msg.alert('必须选择' + value + '个肖');
		return ;
	}/*else if(checknum == 2){
		parent.Showbo.Msg.alert('超出相应肖数');
		return ;
	}*/
	
	var k = 0;
	var str = "";
	var name = "";
	for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			str += n[j].value + ',';
			name = n[j].value;
			k++;
		}
	}
	var strArr = argsSort(str);
	resArray = argsCombination(value,strArr);

	if (betGold > 0) {
		parent.Showbo.Msg.confirm("你总共投了"+resArray.size()+"注,投注金额：" + betGold*resArray.size(), function($el) {

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
				
				for (var int = 0; int < resArray.size(); int++) {
					var array= new Array();
					var arr_str = new Array();
					array = resArray.get(int);
					var name1 = "";
					for (var int2 = 0; int2 < array.length; int2++) {
						name1 = array[int2];
						var itemCode1 = $("input[value="+name1+"]").attr("itemCode");
						arr_str.push(itemCode1);
					}
					
					var itemCode = $("input[value="+name1+"]").attr("itemCode");
					
					itemNo += arr_str.join() + '|';
					betMoney += betGold + '|';
					itemCodes += itemCode + '|';
					position += 'N' + '|';
					
				}
				
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
		$("#gold").focus();
	}

});

//投注列表
$("#nx_game").on('click',"#table4 input[name='btnSubmit']",function(e){
	
	var checknum = checkboxnum();
	var value = getxnum();
	if(checknum == 1){
		parent.Showbo.Msg.alert('必须选择' + value + '个肖');
		return ;
	}/*else if(checknum == 2){
		parent.Showbo.Msg.alert('超出相应肖数');
		return ;
	}*/
	var tdvalue = $("#table1 input[name='rtype']:checked")[0].nextSibling.nodeValue;
	var n = $("#nx_game #roundtable2 #table2 input[name='nx[]']");
	var name = "";
	var str = "";
	for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			str += n[j].value + ',';
			name = n[j].value;
		}
	}
	var strArr = argsSort(str);
	resArray = argsCombination(value,strArr);
	var odds = Number($("#nx_game input[value="+name+"]").attr("odds"));
	var htmlstr = "";
	for (var int = 0; int < resArray.size(); int++) {
		var arr_str = new Array();
		arr_str = resArray.get(int);
		var as = arr_str.join();
		htmlstr += "<div style='text-align:left;'>";
		htmlstr += "<span style='color:white;background-color:#333;padding:0px 3px 0px 3px;'>"+tdvalue+"</span> @";
		htmlstr += "<span style='color:#FF0000' class='un-text-yew'><b>"+odds+" </b></span>";
		htmlstr += "<span><b>"+as+"</b></span></div>"
	}
	var qishu = "期数 : " + $("#cai-num").html() + "<br>";
	$('#nx_msgbox .PlayType').html(qishu);
	$('#nx_msgbox #message_show').html(htmlstr);
	$('#order-box #nx_msgbox').show();
});

function setShowBall(){
	var resArray= new ArrayList();
	var value = getxnum();
	var n = $("#nx_game #roundtable2 #table2 input[name='nx[]']");
	var str = "";
	var k = 0;
	for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			str += n[j].value + ',';
			k++;
		}
	}
	
	if(value <= k){
		//先排序
		var strArr = argsSort(str);
		resArray = argsCombination(value,strArr);
		var htmlstr = "<p>组合共 <span id='total-ball' style='color:#ffc400'>"+resArray.size()+"</span> 组</p><p></p>";
		var step = 1;
		for (var int = 0; int < resArray.size(); int++) {
			var array= new Array();
			array = resArray.get(int);
			var str1 = array.join();
			htmlstr += "<div style='color:#ffc400;font-weight:bold;clear:both;'>组合"+ step +":</div>";
			htmlstr += "<p>"+str1+"</p><p></p><p></p>";
			step++;
		}
		htmlstr += "<span class='cursor-box'><p></p>";
		$('#ShowBall #Ball').html(htmlstr);
	}else{
		var html1 = "<p>尚未选满 "+value+"个球号</p><p></p>";
		$('#ShowBall #Ball').html(html1);
	}
}

//为checkbox绑定单击事件
$("#nx_game").on("click","#roundtable2 #table2 input[name='nx[]']",function(e) {
	$('#nx_msgbox .PlayType').html('');
	$('#nx_msgbox').hide();
	$('#nx_msgbox #gold').val('');
	
	var value = getxnum();
	event = event || window.event; 
	var target = event.target; //这个就是触发事件的控件 
	if(target.checked){
		target.parentNode.parentNode.style.backgroundColor = 'yellow';   //checkbox變色
	}else{
		target.parentNode.parentNode.style.backgroundColor = '';     //checkbox變色
	}
	var n = $("#nx_game #roundtable2 #table2 input[name='nx[]']");
	var str = "";
	var k = 0;
	for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			str += n[j].value + ',';
			k++;
		}
	}
	
	//最多多少个组合
	//分段限制组合的数量，五肖以下的限制选7肖来进行组合 ,6-8肖限制选9肖，9-11肖限制选12肖
	if(value <= 5){
		if(k>=7){
			for(var j=0, t = n.length; j < t; j++){
				if(n[j].checked){
				}else{
					n.eq(j).attr("disabled",true);
				}
			}
		}else{
			n.attr("disabled",false);//全部取消禁用
		}
	}else if(value > 5 && value <= 8){
		if(k>=9){
			for(var j=0, t = n.length; j < t; j++){
				if(n[j].checked){
				}else{
					n.eq(j).attr("disabled",true);
				}
			}
		}else{
			n.attr("disabled",false);//全部取消禁用
		}
	}else if(value > 8 && value <= 11){
		if(k>=12){
			for(var j=0, t = n.length; j < t; j++){
				if(n[j].checked){
				}else{
					n.eq(j).attr("disabled",true);
				}
			}
		}else{
			n.attr("disabled",false);//全部取消禁用
		}
	}
	setShowBall();
});

$("#order-box #nx_game").on('click', 'span[type=poultry]', function () {
    var $el = $(this);
    $el.siblings('span[type=Wildbeast]').removeClass('active');
    var type = $el.addClass('active').attr('type');
    var n = $("#nx_game #roundtable2 #table2 input[name='nx[]']");
    var poultry = ["牛","马","羊","鸡","猪","狗"];
    for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			n[j].checked = "";;
			n[j].parentNode.parentNode.style.backgroundColor = '';     //checkbox變色
		}
    }
    for(var j=0, t = n.length; j < t; j++){
		for(var i=0, l = poultry.length; i < l; i++){
			if(n[j].value == poultry[i]){
				n[j].checked = "checked";
				n[j].parentNode.parentNode.style.backgroundColor = 'yellow';   //checkbox變色
			}
		}
    }
    setShowBall();
})

$("#order-box #nx_game").on('click', 'span[type=Wildbeast]', function () {
    var $el = $(this);
    var Wildbeast = ["鼠","虎","兔","龙","蛇","猴"];
    $el.siblings('span[type=poultry]').removeClass('active');
    var type = $el.addClass('active').attr('type');
    var n = $("#nx_game #roundtable2 #table2 input[name='nx[]']");
    for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			n[j].checked = "";
			n[j].parentNode.parentNode.style.backgroundColor = '';     //checkbox變色
		}
    }
    for(var j=0, t = n.length; j < t; j++){
		for(var i=0, l = Wildbeast.length; i < l; i++){
			if(n[j].value == Wildbeast[i]){
				n[j].checked = "checked";
				n[j].parentNode.parentNode.style.backgroundColor = 'yellow';   //checkbox變色
			}
		}
    }
    setShowBall();
});

function reset(){
	$('#nx_msgbox .PlayType').html('');
	$('#ShowBall #Ball').html('<p>请选择下注类别</p><p></p><span class="cursor-box"></span>');
	$('#nx_msgbox').hide()
	$('#order-box #nx_msgbox').hide();
	$('#nx_msgbox #gold').val('');
	var n = $("#nx_game #roundtable2 #table2 input[name='nx[]']");
    for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			n[j].checked = "";
			n[j].parentNode.parentNode.style.backgroundColor = '';     //checkbox變色
		}
    }
}

//清除投注
$("#nx_msgbox").on('click','input[name=btnCancel]',function(e){
	reset();
});

//清除投注
$("#nx_game").on('click',"#table4 input[name='btnReset']",function(e){
	reset();
});
