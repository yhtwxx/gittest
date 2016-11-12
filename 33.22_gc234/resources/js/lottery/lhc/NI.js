/**
 * 自选不中
 */
//获取彩池
var itemInfo = "";
$.ajax({url: "/lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId=21",
	type: "get",
	dataType: "json",
    success: function(b) {
    	itemInfo = b;
        if(0 == b.code){
            var html = tpl('#contentTpl', b);
            $("#ni_game #orders").html(html);
        }else{
            Showbo.Msg.alert('请登录！')
            window.location.href="/logout.do";
        }
    }
});

//为radio绑定单击事件
$("#ni_game").on("click",".round-table #table1 input[name='rtype']",function(event) {
	//取消checkbox禁用
	$("#ni_game .round-table #table2 input[name='num[]']").attr("disabled",false);//全部取消禁用
	event = event || window.event; 
	var target = event.target; //这个就是触发事件的控件 
	var num = $(target).attr('displayNo');
	var html1 = "<p>尚未选满 "+num+"个球号</p><p></p>";
	$('#Ball').html(html1);
	resetcheckbox();
});


function resetcheckbox() {
	var n = $("#ni_game .round-table #table2 input[name='num[]']");
	for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			n.eq(j).attr("checked",false);   //checkbox變色
			n[j].parentNode.parentNode.style.backgroundColor = '';     //checkbox變色
		}
	}
	
}

//为checkbox绑定单击事件
$("#ni_game").on("click",".round-table #table2 input[name='num[]']",function(e) {
	var resArray= new ArrayList();
	var n = $("#ni_game .round-table #table2 input[name='num[]']");
	var radio = $('#ni_game .round-table #table1');
	var value = radio.find("input[name='rtype']:checked").attr("displayNo");
	
	//默认可以被选中的为10个
	var checkednum = "10";
	
	if(value == "8"){
		checkednum = "11";
	}else if(value == "9"){
		checkednum = "12";
	}else if(value == "10"){
		checkednum = "13";
	}else if(value == "11"){
		checkednum = "13";
	}else if(value == "12"){
		checkednum = "14";
	}
	
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
$('#ni_msgbox .submit_cen').bind("click", function() {

	var betGold = $("#ni_msgbox #gold").val();
	
	var resArray= new ArrayList();
	var radio = $('#ni_game .round-table #table1');
	var value = radio.find("input[name='rtype']:checked").attr("displayNo");
	var code = radio.find("input[name='rtype']:checked").val();
	var n = $("#ni_game .round-table #table2 input[name='num[]']");
	
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
					itemNo += str1 + '|';
					betMoney += betGold + '|';
					itemCodes += code + '|';
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
		$("#ni_msgbox #gold").focus();
	}

});

function reset(){
	var n = $("#ni_game .round-table #table2 input[name='num[]']");
	var radio = $('#ni_game .round-table #table1').find("input[name='rtype']:checked");
	for(var j=0, t = n.length; j < t; j++){
		if(n[j].checked){
			n.eq(j).attr("checked",false);
			n[j].parentNode.parentNode.style.backgroundColor = '';     //checkbox變色
		}else{
			
		}
	}
	n.attr("disabled",true);//全部禁用
	radio.attr("checked",false);//全部禁用
	$('#ni_msgbox .PlayType').html('');
	$('#Ball').html('<p>请选择下注类别</p><p></p><span class="cursor-box"></span>');
	$('#ni_msgbox').hide();
	$('#ni_msgbox #gold').val('');
}


//清除投注
$("#ni_game").on('click',".round-table #table2 input[name='btnReset']",function(e){
	reset();
});

//清除投注
$("#ni_msgbox").on('click','input[name=btnCancel]',function(e){
	reset();
});

//投注列表
$("#ni_game").on('click',".round-table #table2 input[name='btnSubmit']",function(e){
	var resArray= new ArrayList();
	
	var n = $("#ni_game .round-table #table2 input[name='num[]']");
	var radio = $('#ni_game .round-table #table1');
	var value = radio.find("input[name='rtype']:checked").attr("displayNo");
	//jQuery 获取 radio 选中后的文字
	var tdvalue = radio.find("input[name='rtype']:checked").siblings().text();
	var td = radio.find("input[name='rtype']:checked").parent().parent();
	var index = td[0].parentNode.rowIndex;
	var cellindex = td[0].cellIndex;
	var code = $('#ni_game #table1 tr:eq('+ (index+1) +') td:eq('+cellindex+')').text();
	
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
	var qishu = $("#cai-num").html();
	var htmlstr = "";
	htmlstr += "<span class='rr'>期数:"+qishu+"</span>";
	htmlstr += "<span style='color:white;background-color:#333;padding:0px 3px 0px 3px;'>"+tdvalue+"</span> @"
	htmlstr += "<b class='OddsL'>"+code+"</b><br>";
	htmlstr += strArr + "<br>组合共 <span id='TotalBall' style='color:#ff0000'>"+resArray.size()+"</span>组";
	$('#ni_msgbox .PlayType').html(htmlstr);
	$('#ni_msgbox').show();
});