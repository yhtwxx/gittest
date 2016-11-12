<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--游戏区块-->
<div id="s7fe_game" class="Game">
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
					<tr class="title_tr" classname="title_tr">
						<td>七码</td>
						<td>赔率</td>
						<td>金额</td>
						<td>七码</td>
						<td>赔率</td>
						<td>金额</td>
					</tr>
					<tr>
						<td><span>单0 . 双7</span></td>
						<td id="S7_0O7E_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_0O7E">231.3</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_0O7E]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_0O7E]" value="231.3"></td>
						<td><span>大0 . 小7</span></td>
						<td id="S7_0O7U_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_0O7U">231.3</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_0O7U]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_0O7U]" value="231.3"></td>
					</tr>
					<tr>
						<td><span>单1 . 双6</span></td>
						<td id="S7_1O6E_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_1O6E">24.11</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_1O6E]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_1O6E]" value="24.11"></td>
						<td><span>大1 . 小6</span></td>
						<td id="S7_1O6U_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_1O6U">24.11</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_1O6U]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_1O6U]" value="24.11"></td>
					</tr>
					<tr>
						<td><span>单2 . 双5</span></td>
						<td id="S7_2O5E_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_2O5E">6.45</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_2O5E]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_2O5E]" value="6.45"></td>
						<td><span>大2 . 小5</span></td>
						<td id="S7_2O5U_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_2O5U">6.45</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_2O5U]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_2O5U]" value="6.45"></td>
					</tr>
					<tr>
						<td><span>单3 . 双4</span></td>
						<td id="S7_3O4E_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_3O4E">3.4</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_3O4E]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_3O4E]" value="3.4"></td>
						<td><span>大3 . 小4</span></td>
						<td id="S7_3O4U_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_3O4U">3.4</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_3O4U]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_3O4U]" value="3.4"></td>
					</tr>
					<tr>
						<td><span>单4 . 双3</span></td>
						<td id="S7_4O3E_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_4O3E">3.2</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_4O3E]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_4O3E]" value="3.2"></td>
						<td><span>大4 . 小3</span></td>
						<td id="S7_4O3U_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_4O3U">3.2</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_4O3U]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_4O3U]" value="3.2"></td>
					</tr>
					<tr>
						<td><span>单5 . 双2</span></td>
						<td id="S7_5O2E_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_5O2E">5.56</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_5O2E]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_5O2E]" value="5.56"></td>
						<td><span>大5 . 小2</span></td>
						<td id="S7_5O2U_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_5O2U">5.56</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_5O2U]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_5O2U]" value="5.56"></td>
					</tr>
					<tr>
						<td><span>单6 . 双1</span></td>
						<td id="S7_6O1E_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_6O1E">19.2</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_6O1E]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_6O1E]" value="19.2"></td>
						<td><span>大6 . 小1</span></td>
						<td id="S7_6O1U_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_6O1U">19.2</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_6O1U]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_6O1U]" value="19.2"></td>
					</tr>
					<tr>
						<td><span>单7 . 双0</span></td>
						<td id="S7_7O0E_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_7O0E">169.32</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_7O0E]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_7O0E]" value="169.32"></td>
						<td><span>大7 . 小0</span></td>
						<td id="S7_7O0U_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="S7_7O0U">169.32</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[S7_7O0U]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[S7_7O0U]" value="169.32"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="round-table">
			<table id="table2">
				<tbody>
					<tr class="title_tr" classname="title_tr">
						<td>五行</td>
						<td>号码</td>
						<td>赔率</td>
						<td>金额</td>
					</tr>
					<tr>
						<td><span>金</span></td>
						<td>01,06,11,16,21,26,31,36,41,46</td>
						<td id="F_METAL_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="F_METAL">4.72</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[F_METAL]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[F_METAL]" value="4.72"></td>
					</tr>
					<tr>
						<td><span>木</span></td>
						<td>02,07,12,17,22,27,32,37,42,47</td>
						<td id="F_WOOD_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="F_WOOD">4.72</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[F_WOOD]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[F_WOOD]" value="4.72"></td>
					</tr>
					<tr>
						<td><span>水</span></td>
						<td>03,08,13,18,23,28,33,38,43,48</td>
						<td id="F_WATER_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="F_WATER">4.72</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[F_WATER]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[F_WATER]" value="4.72"></td>
					</tr>
					<tr>
						<td><span>火</span></td>
						<td>04,09,14,19,24,29,34,39,44,49</td>
						<td id="F_FIRE_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="F_FIRE">4.72</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[F_FIRE]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[F_FIRE]" value="4.72"></td>
					</tr>
					<tr>
						<td><span>土</span></td>
						<td>05,10,15,20,25,30,35,40,45</td>
						<td id="F_EARTH_bg"><span
							style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
							id="F_EARTH">5.22</span></td>
						<td><input type="text" class="GoldQQ" pattern="[0-9]*"
							name="gold[F_EARTH]" min="0" max="99999999" data-callback-id="7"
							maxlength="8" style="border: 1px solid rgb(187, 187, 187);"><input
							type="hidden" name="odds[F_EARTH]" value="5.22"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="round-table" style="display: none;">
			<table id="table3"></table>
		</div>
		<div class="round-table" style="display: none;">
			<table id="table4"></table>
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
