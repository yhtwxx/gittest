/**
 * 自选不中
 */
//获取彩池
//全局变量   重置的时候使用  重新渲染页面
var showTable = $("#lx_game #showTable").html();
/**
 * target  选中对象
 */
function getItme(target) {
	var num = $(target).val();
	var flag = num.substring(0,2);
	var number = num.substring(2,3);
	var poolId = "";
	if (num == "LX2") {
		poolId = "13";
	}else if (num == "LX3") {
		poolId = "14";
	}else if (num == "LX4") {
		poolId = "15";
	}else if (num == "LX5") {
		poolId = "16";
	}else if (num == "LF2") {
		poolId = "17";
	}else if (num == "LF3") {
		poolId = "18";
	}else if (num == "LF4") {
		poolId = "19";
	}else if (num == "LF5") {
		poolId = "20";
	}
	$.ajax({url: "/lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId="+poolId,
		type: "get",
		dataType: "json",
	    success: function(b) {
	        if(0 == b.code){
	        	if (flag == "LX") {
	        		var html = tpl("#contentTpl_LX", b);
		            $("#lx_game #roundtable2").html(html);
	        		$("#lx_game #roundtable2").show();
	        		$("#lx_game #roundtable3").hide();
	        		var html1 = "<p>尚未选满 "+number+"个球号</p><p></p>";
	        		$('#Ball').html(html1);
	        		$('#lx_msgbox .PlayType').html('');
	        		$('#lx_msgbox').hide();
	        		$('#lx_msgbox #gold').val('');
	        	} else if (flag == "LF") {
	        		var html = tpl("#contentTpl_LF", b);
		            $("#lx_game #roundtable3").html(html);
	        		$("#lx_game #roundtable2").hide();
	        		$("#lx_game #roundtable3").show();
	        		var html1 = "<p>尚未选满 "+number+"个球号</p><p></p>";
	        		$('#Ball').html(html1);
	        		$('#lx_msgbox .PlayType').html('');
	        		$('#lx_msgbox').hide();
	        		$('#lx_msgbox #gold').val('');
	        	}  
	        }else{
	            Showbo.Msg.alert('请登录！')
	            window.location.href="/logout.do";
	        }
	    }
	});
}


//为radio绑定单击事件
$("#lx_game").on("click","#table1 input[name='rtype']",function(event) {
	event = event || window.event; 
	var target = event.target; //这个就是触发事件的控件 
	getItme(target);
});


//为checkbox绑定单击事件
$("#lx_game").on("click","input[type='checkbox']",function(e) {
	$('#lx_msgbox .PlayType').html('');
	$('#lx_msgbox').hide();
	$('#lx_msgbox #gold').val('');
	
	var resArray= new ArrayList();
	e = e || window.event; 
	var target = e.target; //这个就是触发事件的控件 
	var radio = $('.round-table #table1');
	var number = radio.find("input[name='rtype']:checked").val();
	
	if (typeof(number) == "undefined" || number == null) {
		parent.Showbo.Msg.alert('请选择下注类别');
		$(target).attr("checked",false);
		return ;
	}
	var value = number.substring(2,3);
	var flag = number.substring(0,2);
	var n;
	if (flag == "LX") {
		n = $("#lx_game .round-table #table2 input[name='lx[]']");
	} else if(flag == "LF") {
		n = $("#lx_game .round-table #table3 input[name='lf[]']");
	}
	
	//默认可以被选中的为6个
	var checkednum = "6";
	
	var str = "";
	var k = 0;
	for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			n[j].parentNode.parentNode.style.backgroundColor = 'yellow';   //checkbox變色
			str += n[j].value + ',';
			k++;
		}else{
			n[j].parentNode.parentNode.style.backgroundColor = '';     //checkbox變色
		}
	}
	//最多是个数字
	if(k>=checkednum){
		for(var j=0, t = n.length; j < t; j++){
			if(n[j].checked){
			}else{
				n.eq(j).attr("disabled",true);     //当达到10个时，未选中的就禁用
			}
		}
	}else{
		n.attr("disabled",false);//全部取消禁用
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
		$('#Ball').html(htmlstr);
	}else{
		var html1 = "<p>尚未选满 "+value+"个球号</p><p></p>";
		$('#Ball').html(html1);
	}
});


//绑定下注事件
$('#lx_msgbox .submit_cen').bind("click", function() {

	var resArray= new ArrayList();
	var betGold = $("#lx_msgbox #gold").val();
	var radio = $('#lx_game .round-table #table1');
	var number = radio.find("input[name='rtype']:checked").val();
	
	if (typeof(number) == "undefined" || number == null) {
		parent.Showbo.Msg.alert('请选择下注类别');
		return ;
	}
	var value = number.substring(2,3);
	var flag = number.substring(0,2);
	var n;
	if (flag == "LX") {
		n = $("#lx_game .round-table #table2 input[name='lx[]']");
	} else if(flag == "LF") {
		n = $("#lx_game .round-table #table3 input[name='lf[]']");
	}
	
	

	var k = 0;
	var str = "";
	for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			str += n[j].value + ',';
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
					array = resArray.get(int);
					var str1 = array.join();
					
					var arr_str = new Array();
					var first = null; 
					var name1 = "";
					for (var int2 = 0; int2 < array.length; int2++) {
						var name = array[int2];
						var odds = Number($("#lx_game input[value="+name+"]").attr("odds"));
						var itemCode1 = $("input[value="+name+"]").attr("itemCode");
						arr_str.push(itemCode1);
						if (first != null) {
							if (flag == "LX") {
								if (first > odds) {
									first = odds;
									name1 = name;
								}
							}else if (flag == "LF") {
								if (first < odds) {
									first = odds;
									name1 = name;
								}
							}
						}else{
							first = odds;
							name1 = name;
						}
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

function reset() {
	$("#lx_game #showTable").html(showTable);
	$('#lx_msgbox .PlayType').html('');
	$('#Ball').html('<p>请选择下注类别</p><p></p><span class="cursor-box"></span>');
	$('#lx_msgbox').hide();
	$('#lx_msgbox #gold').val('');
}

//清除投注
$("#lx_game").on('click',"#table4 input[name='btnReset']",function(e){
	reset();
});

//清除投注
$("#lx_msgbox").on('click','input[name=btnCancel]',function(e){
	reset();
});

//投注列表
$("#lx_game").on('click',".round-table #table4 input[name='btnSubmit']",function(e){
	var resArray= new ArrayList();
	
	var radio = $('#lx_game .round-table #table1');
	var number = radio.find("input[name='rtype']:checked").val();
	var value = number.substring(2,3);
	var flag = number.substring(0,2);
	var n;
	if (flag == "LX") {
		n = $("#lx_game .round-table #table2 input[name='lx[]']");
	} else if(flag == "LF") {
		n = $("#lx_game .round-table #table3 input[name='lf[]']");
	}
	
	var tdvalue = radio.find("input[name='rtype']:checked")[0].nextSibling.nodeValue;
	
	var k = 0;
	var str = "";
	for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			str += n[j].value + ',';
			k++;
		}
	}
	if(k < value){
		parent.Showbo.Msg.alert("尚未选满 "+value+"个球号");
		return ;
	}
	var strArr = argsSort(str);
	resArray = argsCombination(value,strArr);
	
	var htmlstr = "";
	
	for (var int = 0; int < resArray.size(); int++) {
		var arr_str = new Array();
		arr_str = resArray.get(int);
		var first = null; 
		for (var int2 = 0; int2 < arr_str.length; int2++) {
			var name = arr_str[int2];
			var odds = Number($("#lx_game input[value="+name+"]").attr("odds"));
			if (first != null) {
				if (flag == "LX") {
					if (first > odds) {
						first = odds;
					}
				}else if (flag == "LF") {
					if (first < odds) {
						first = odds;
					}
				}
			}else{
				first = odds;
			}
		}
		var as = arr_str.join();
		htmlstr += "<div style='text-align:left;'>";
		htmlstr += "<span style='color:white;background-color:#333;padding:0px 3px 0px 3px;'>"+tdvalue+"</span> @";
		htmlstr += "<span style='color:#FF0000' class='un-text-yew'><b>"+first+" </b></span>";
		htmlstr += "<span><b>"+as+"</b></span></div>"
	}
	var qishu = "期数 : " + $("#cai-num").html() + "<br>";
	$('#lx_msgbox .PlayType').html(qishu);
	$('#lx_msgbox #message_show').html(htmlstr);
	$('#lx_msgbox').show();
});