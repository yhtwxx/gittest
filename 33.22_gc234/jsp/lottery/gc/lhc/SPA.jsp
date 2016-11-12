<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--游戏区块-->
<div id="spa_game" class="Game">
	<form name="newForm" id="newForm" action="/member/Grp/grpOrder.php"
		method="post">
		<!--正码1-6选择-->
		<div id="tab" style="display: none;">
			<ul>
				<li data-rtypen="N1" class="onTagClick"><span><b>正码特
							1</b></span></li>
				<li data-rtypen="N2" class="unTagClick"><span><b>正码特
							2</b></span></li>
				<li data-rtypen="N3" class="unTagClick"><span><b>正码特
							3</b></span></li>
				<li data-rtypen="N4" class="unTagClick"><span><b>正码特
							4</b></span></li>
				<li data-rtypen="N5" class="unTagClick"><span><b>正码特
							5</b></span></li>
				<li data-rtypen="N6" class="unTagClick"><span><b>正码特
							6</b></span></li>
				<li id="space" style="width: 15px;"></li>
			</ul>
		</div>
		<div id="quickMode">
			<input type="button" name="quickinput" value="切换一般模式" id="switchMode">
		</div>
		<div class="round-table">
			<table id="table1">
				<tbody>
					<tr style="text-align: center; color: black;" class="title_tr">
						<td>十二生肖</td>
						<td>号码</td>
						<td>赔率</td>
						<td>金额</td>
						<td>十二生肖</td>
						<td>号码</td>
						<td>赔率</td>
						<td>金额</td>
					</tr>
					<tr style="text-align: center; color: black;">
						<td class="title_td2"><span>鼠</span></td>
						<td class="title_td3">09, 21, 33, 45</td>
						<td id="SP_A1_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_A1">11.1</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_A1]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_A1]" value="11.1"></td>
						<td class="title_td2"><span>牛</span></td>
						<td class="title_td3">08, 20, 32, 44</td>
						<td id="SP_A2_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_A2">11.1</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_A2]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_A2]" value="11.1"></td>
					</tr>
					<tr style="text-align: center; color: black;">
						<td class="title_td2"><span>虎</span></td>
						<td class="title_td3">07, 19, 31, 43</td>
						<td id="SP_A3_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_A3">11.1</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_A3]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_A3]" value="11.1"></td>
						<td class="title_td2"><span>兔</span></td>
						<td class="title_td3">06, 18, 30, 42</td>
						<td id="SP_A4_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_A4">11.1</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_A4]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_A4]" value="11.1"></td>
					</tr>
					<tr style="text-align: center; color: black;">
						<td class="title_td2"><span>龙</span></td>
						<td class="title_td3">05, 17, 29, 41</td>
						<td id="SP_A5_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_A5">11.1</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_A5]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_A5]" value="11.1"></td>
						<td class="title_td2"><span>蛇</span></td>
						<td class="title_td3">04, 16, 28, 40</td>
						<td id="SP_A6_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_A6">11.1</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_A6]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_A6]" value="11.1"></td>
					</tr>
					<tr style="text-align: center; color: black;">
						<td class="title_td2"><span>马</span></td>
						<td class="title_td3">03, 15, 27, 39</td>
						<td id="SP_A7_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_A7">11.1</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_A7]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_A7]" value="11.1"></td>
						<td class="title_td2"><span>羊</span></td>
						<td class="title_td3">02, 14, 26, 38</td>
						<td id="SP_A8_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_A8">11.1</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_A8]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_A8]" value="11.1"></td>
					</tr>
					<tr style="text-align: center; color: black;">
						<td class="title_td2"><span>猴</span></td>
						<td class="title_td3">01, 13, 25, 37, 49</td>
						<td id="SP_A9_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_A9">8.9</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_A9]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_A9]" value="8.9"></td>
						<td class="title_td2"><span>鸡</span></td>
						<td class="title_td3">12, 24, 36, 48</td>
						<td id="SP_AA_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_AA">11.1</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_AA]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_AA]" value="11.1"></td>
					</tr>
					<tr style="text-align: center; color: black;">
						<td class="title_td2"><span>狗</span></td>
						<td class="title_td3">11, 23, 35, 47</td>
						<td id="SP_AB_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_AB">11.1</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_AB]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_AB]" value="11.1"></td>
						<td class="title_td2"><span>猪</span></td>
						<td class="title_td3">10, 22, 34, 46</td>
						<td id="SP_AC_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_AC">11.1</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_AC]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_AC]" value="11.1"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="round-table">
			<table id="table2">
				<tbody>
					<tr
						style="text-align: center; color: black; background-color: rgb(255, 255, 255);">
						<td class="HTD" colspan="9">色波</td>
					</tr>
					<tr style="text-align: center; color: black;">
						<td class="color-r  BorderLine"><span>红波</span></td>
						<td id="SP_R_bg" class="BorderLine"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_R">2.7</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_R]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_R]" value="2.7"></td>
						<td class="color-b  BorderLine"><span>蓝波</span></td>
						<td id="SP_B_bg" class="BorderLine"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_B">2.85</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_B]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_B]" value="2.85"></td>
						<td class="color-g  BorderLine"><span>绿波</span></td>
						<td id="SP_G_bg" class="BorderLine"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SP_G">2.85</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[SP_G]" min="0" max="99999999" data-callback-id="5"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SP_G]" value="2.85"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="round-table">
			<table id="table3" style="border: 0; border-collapse: collapse;">
				<tbody>
					<tr
						style="text-align: center; color: black; background-color: rgb(255, 255, 255);">
						<td class="HTD" colspan="15">特码头尾数</td>
					</tr>
					<tr style="text-align: center; color: black;">
						<td style="font-weight: normal;" class="title_td2 BorderLine"><span>头0</span></td>
						<td style="width: 6%;" id="SH0_bg" class="BorderLine"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SH0">5</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SH0]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SH0]" value="5"></td>
						<td style="font-weight: normal;" class="title_td2 BorderLine"><span>头1</span></td>
						<td style="width: 6%;" id="SH1_bg" class="BorderLine"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SH1">4.5</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SH1]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SH1]" value="4.5"></td>
						<td style="font-weight: normal;" class="title_td2 BorderLine"><span>头2</span></td>
						<td style="width: 6%;" id="SH2_bg" class="BorderLine"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SH2">4.5</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SH2]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SH2]" value="4.5"></td>
						<td style="font-weight: normal;" class="title_td2 BorderLine"><span>头3</span></td>
						<td style="width: 6%;" id="SH3_bg" class="BorderLine"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SH3">4.5</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SH3]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SH3]" value="4.5"></td>
						<td style="font-weight: normal;" class="title_td2 BorderLine"><span>头4</span></td>
						<td style="width: 6%;" id="SH4_bg" class="BorderLine"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SH4">4.5</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SH4]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SH4]" value="4.5"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="round-table">
			<table id="table4">
				<tbody>
					<tr style="text-align: center; color: black;">
						<td style="width: 6%;" class="title_td2"><span>尾0</span></td>
						<td style="width: 6%;" id="SF0_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SF0">11.5</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SF0]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SF0]" value="11.5"></td>
						<td style="width: 6%;" class="title_td2"><span>尾1</span></td>
						<td style="width: 6%;" id="SF1_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SF1">9.2</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SF1]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SF1]" value="9.2"></td>
						<td style="width: 6%;" class="title_td2"><span>尾2</span></td>
						<td style="width: 6%;" id="SF2_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SF2">9.2</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SF2]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SF2]" value="9.2"></td>
						<td style="width: 6%;" class="title_td2"><span>尾3</span></td>
						<td style="width: 6%;" id="SF3_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SF3">9.2</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SF3]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SF3]" value="9.2"></td>
						<td style="width: 6%;" class="title_td2"><span>尾4</span></td>
						<td style="width: 6%;" id="SF4_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SF4">9.2</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SF4]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SF4]" value="9.2"></td>
					</tr>
					<tr style="text-align: center; color: black;">
						<td style="width: 6%;" class="title_td2"><span>尾5</span></td>
						<td style="width: 6%;" id="SF5_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SF5">9.2</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SF5]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SF5]" value="9.2"></td>
						<td style="width: 6%;" class="title_td2"><span>尾6</span></td>
						<td style="width: 6%;" id="SF6_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SF6">9.2</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SF6]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SF6]" value="9.2"></td>
						<td style="width: 6%;" class="title_td2"><span>尾7</span></td>
						<td style="width: 6%;" id="SF7_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SF7">9.2</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SF7]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SF7]" value="9.2"></td>
						<td style="width: 6%;" class="title_td2"><span>尾8</span></td>
						<td style="width: 6%;" id="SF8_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SF8">9.2</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SF8]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SF8]" value="9.2"></td>
						<td style="width: 6%;" class="title_td2"><span>尾9</span></td>
						<td style="width: 6%;" id="SF9_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="SF9">9.2</span></td>
						<td style="width: 6%;"><input type="text" class="GoldQQ"
							pattern="[0-9]*" name="gold[SF9]" min="0" max="99999999"
							data-callback-id="5" maxlength="8"
							style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[SF9]" value="9.2"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="SendLT Send">
			<span class="credit">下注金额:<b id="total_bet">0.00</b></span> <input
				class="no" type="reset" value="取消"> <input class="yes"
				type="button" name="btnBet" value="确定">
		</div>
		<input type="hidden" name="gid" id="gid" value="551082"> <input
			type="hidden" name="Line" id="Line" value="">
	</form>
</div>


<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/lhc_lm.js?51188" type="text/javascript"></script>
<script type="application/javascript">
//获取彩池
var itemInfo = "";
$.ajax({url: "${ctx}/lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId=1,3,4",
	type: "get",
	dataType: "json",
    success: function(b) {
    	itemInfo = b;
        if(0 == b.code){
            var html = tpl('#contentTpl', b);
            $("#orders").html(html);
        }else{
            Showbo.Msg.alert('请登录！')
            window.location.href=ctx+"logout.do";
        }
    }
});
//获取降水
function getDownRateInfo(){
 $.ajax({
 	url: "${ctx}/lhc/getDownRate.do?timeStamp=" + new Date().getTime()+"&poolId=1,3,4",
		type: "get",
		dataType: "json",
     success: function(b) {
     	if(0 == b.code && b.list != null && b.list != undefined && b.list != ''){
     		var list = b.list;
     		$.each(list, function(n,value) {
    				if(value.payrule != null && value.payrule != undefined && value.payrule != '' &&value.payrule.length > 0){
    					var itemcode = value.itemcode;
    					var position = value.payrule
        				var input$ = $("input[data-itemcode="+itemcode+"][data-position="+position+"]");
        				//console.debug(itemInfo);
        				var num = itemInfo.items_map[itemcode].odds.toFixed(2);
        				//console.debug(num);
        				rate = (num - value.downrate).toFixed(2);
        				input$.siblings(".odds").html(rate);
        			}else{
        				var itemcode = value.itemcode;
        				var input$ = $("input[data-itemcode="+value.itemcode+"]");
        				var num = itemInfo.items_map[itemcode].odds.toFixed(2);
        				//console.debug(num);
        				rate = (num - value.downrate).toFixed(2);
        				input$.siblings(".odds").html(rate);
        			}
        		});
     		}
		}
    });
}
$(document).ready(function(){
	getDownRateInfo();
	setInterval(getDownRateInfo, 10000);
});


</script>
