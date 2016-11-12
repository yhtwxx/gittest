/**
 * 
 */
 
 //获取彩池
var itemInfo = "";
$.ajax({url: "/lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId=11",
	type: "get",
	dataType: "json",
    success: function(b) {
    	itemInfo = b;
        if(0 == b.code){
            var html = tpl('#contentTpl', b);
            $("#nap_game #orders").html(html);
        }else{
            Showbo.Msg.alert('请登录！')
            window.location.href="/logout.do";
        }
    }
});


//清除投注
$("#nap_game").on('click','.Send .no',function(e){
	reset();
});

//清除投注
$("#nap_msgbox").on('click','input[name=btnCancel]',function(e){
	reset();
});

function reset(){
	for (var i = 1; i <= 6; i++) {
		var n = $("#nap_game .round-table input[name=game"+ i +"]"); 
		n.each(function(j) {
			if(n[j].checked){
				//清除 radio
				n[j].checked = false;
				n[j].parentNode.parentNode.style.backgroundColor = ''; 
			}
		});
	}
	$("#nap_game .round-table #insOdds").html('');
	$('#nap_msgbox').hide();
	$('#nap_msgbox input[name=itemcode]').val('');
	$('#nap_msgbox input[name=itemno]').val('');
	$('#nap_msgbox #gold').val('');
}

//绑定下注事件
$('#nap_msgbox .submit_cen').bind("click", function() {

	var betGold = $("#nap_msgbox #gold").val();
	
	var k = 0;
	for (var i = 1; i <= 6; i++) {
		var n = $("#nap_game .round-table input[name=game"+ i +"]"); 
		for (var j=0, t = n.length; j < t; j++) {
			if ('INPUT' == n[j].tagName.toUpperCase() && 'RADIO' == n[j].type.toUpperCase()) {
				if(n[j].checked){
					k++;
				} 
			}
	   }
	}
	if (k == 1){
		parent.Showbo.Msg.alert('请选择二组以上玩法，若只要单一下注请前往正码1-6投注!');
	}else if(k == 0){
		parent.Showbo.Msg.alert('投注内容不能为空！');
	}

	if (betGold > 0) {
		parent.Showbo.Msg.confirm("投注金额：" + betGold, function($el) {

			if ($el == 'yes') {
				if (parent.window.timeodd < 1) {
					parent.Showbo.Msg.alert('投注超时');
					return;
				}
				var gameNo = $("#cai-num").html();
				var itemCodes = $('#nap_msgbox input[name=itemcode]').val() + '|';
				var position = 'N|';
				var betMoney = $('#nap_msgbox #gold').val() + '|';
				var itemNo = $('#nap_msgbox input[name=itemno]').val() + '|';

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
		parent.Showbo.Msg.alert('下注金额不能为0!');
		$("#nap_msgbox #gold").focus();
	}

});


//radio 绑定单击事件
$("#nap_game").on('click','.round-table input[type="radio"]',function(e){
	var sumOdds = 1;
	var checkedOdds = 1;
	var k = 0;
	for (var i = 1; i <= 6; i++) {
		var n = $("#nap_game .round-table input[name=game"+ i +"]"); 
		for (var j=0, t = n.length; j < t; j++) {
			if ('INPUT' == n[j].tagName.toUpperCase() && 'RADIO' == n[j].type.toUpperCase()) {
				if(n[j].checked){
					n[j].parentNode.parentNode.style.backgroundColor = 'yellow';   //radio變色
					checkedOdds = $("#nap_game .round-table #s"+i+"_"+n[j].value).html();
					sumOdds = sumOdds * checkedOdds;
					k++;
				} else {
					n[j].parentNode.parentNode.style.backgroundColor = '';     //radio變色
				}
			}
	   }
	}
	if (k > 1){
		sumOdds = Math.floor(sumOdds * 100) / 100; //無條件捨去
	    sumOdds = sumOdds.toFixed(2);
	    $("#nap_game .round-table #insOdds").html(k +' 串 1'+' @ <font color=red>' + sumOdds + '</font>');
	}
});

function getposition(position){
	var str = "";
	switch (position) {
	case '0':
		str = "正码一";
		break;
	case '1':
		str = "正码二";
		break;
	case '2':
		str = "正码三";
		break;
	case '3':
		str = "正码四";
		break;
	case '4':
		str = "正码五";
		break;
	case '5':
		str = "正码六";
		break;
	default:
		break;
	}
	return str;
}

//投注列表
$("#nap_game").on('click','.Send .yes',function(e){
	var htmlstr = "";
	var k = 0;
	var itemno = "";
	var itemcode = "";
	for (var i = 1; i <= 6; i++) {
		var itemcodeodds = "";
		var n = $("#nap_game .round-table input[name=game"+ i +"]"); 
		for (var j=0, t = n.length; j < t; j++) {
			if(n[j].checked){
				htmlstr += "<div>";
				var tdvalue = n[j].parentNode.parentNode;
				var str = n.eq(j).attr('data-position');
				var position = getposition(str);
				var index = tdvalue.parentNode.rowIndex;
				var cellindex = tdvalue.cellIndex;
				var code = $('#table1 tr:eq('+index+') td:eq('+cellindex+')').find('label').text();
				var odds = $('#table1 tr:eq('+index+') td:eq('+cellindex+')').find('span').text();
				htmlstr += "<span style='color:white;background-color:#333;padding:0px 3px 0px 3px;'>" + position + " "+code+"</span> ";
				htmlstr += "@ <span style='color:#FF0000'><b>"+odds+"</b></span>";
				/*记录表格位置，然后删除时可以直接定位位置*/
				htmlstr += "<input type='hidden' id='position' value='"+i+"' >";
				htmlstr += "<input type='button' class='cancel_cen' name='cancel' value='删除'>";
				htmlstr += "</div>";
				itemcodeodds += n[j].value;
				itemcode = n[j].value;
				k++;
			}
		}
		itemno += itemcodeodds;
		if (i < 6) {	
			itemno += ',';
		}
	}
	if(k <= 1){
		parent.Showbo.Msg.alert('请选择二组以上玩法，若只要单一下注请前往正码1-6投注!');
		return;
	}
	$('#nap_msgbox #message_show').html(htmlstr);
	$('#nap_msgbox #wstarshow').html($(".round-table #insOdds").html());
	$("#nap_msgbox #wstar").html('<option value='+k+'>'+k+'串1</option>') 
	$('#nap_msgbox input[name=itemno]').val(itemno);
	$('#nap_msgbox input[name=itemcode]').val(itemcode);
	var qishu = '期数:' + $("#cai-num").html() +' <br>'
	$('#nap_msgbox .PlayType').html(qishu);
	$('#nap_msgbox').show();
	$('#nap_msgbox .submit_cen').attr({"disabled":false}); 
	$("html,body",parent.document).stop(true);
	$("html,body",parent.document).animate({scrollTop: $("#nap_msgbox").offset().top}, 1000);
});

//单条删除投注信息
$("#nap_msgbox").on('click','input[name=cancel]',function(e){
	$(this).parent().remove();
	var position = $(this).siblings('#position').val();
	var sumOdds = 1;
	var checkedOdds = 1;
	var k = 0;
	var itemno = "";
	var itemcode = "";
	//先删除RADIO
	var nj = $("#nap_game .round-table input[name=game"+ position +"]");
	for (var j=0, t = nj.length; j < t; j++) {
		if ('INPUT' == nj[j].tagName.toUpperCase() && 'RADIO' == nj[j].type.toUpperCase()) {
			if(nj[j].checked){
				nj[j].checked = false;
				nj[j].parentNode.parentNode.style.backgroundColor = '';
			} 
		}
	}
	//这里在重构
	for (var i = 1; i <= 6; i++) {
		var itemcodeodds = "";
		var n = $("#nap_game .round-table input[name=game"+ i +"]"); 
		for (var j=0, t = n.length; j < t; j++) {
			if ('INPUT' == n[j].tagName.toUpperCase() && 'RADIO' == n[j].type.toUpperCase()) {
				if(n[j].checked){
					checkedOdds = $("#nap_game .round-table #s"+i+"_"+n[j].value).html();
					sumOdds = sumOdds * checkedOdds;
					var tdvalue = n[j].parentNode.parentNode;
					var index = tdvalue.parentNode.rowIndex;
					var cellindex = tdvalue.cellIndex;
					var odds = $('#nap_game #table1 tr:eq('+index+') td:eq('+cellindex+')').find('span').text();
					itemcodeodds += n[j].value;
					itemcode = n[j].value;
					k++;
				}
			}
		}
		itemno += itemcodeodds;
		if (i < 6) {	
			itemno += ',';
		}
	}
	if (k > 1){
		sumOdds = Math.floor(sumOdds * 100) / 100; //無條件捨去
	    sumOdds = sumOdds.toFixed(2);
	    $("#nap_game .round-table #insOdds").html(k +' 串 1'+' @ <font color=red>' + sumOdds + '</font>');
	    $("#nap_msgbox #wstar").html('<option value='+k+'>'+k+'串1</option>') 
	    $('#nap_msgbox #wstarshow').html(k +' 串 1'+' @ <font color=red>' + sumOdds + '</font>');
	    $('#nap_msgbox input[name=itemno]').val(itemno);
		$('#nap_msgbox input[name=itemcode]').val(itemcode);
	}else if (k == 1){
		$("#nap_game .round-table #insOdds").html('');
	    $("#nap_msgbox #wstar").html('');
	    $('#nap_msgbox #wstarshow').html('');
	    $('#nap_msgbox input[name=itemno]').val(itemno);
		$('#nap_msgbox input[name=itemcode]').val(itemcode);
		$('#nap_msgbox .submit_cen').attr({"disabled":"disabled"}); 
	}else{
		$('#nap_msgbox').hide();
	}
	
});


