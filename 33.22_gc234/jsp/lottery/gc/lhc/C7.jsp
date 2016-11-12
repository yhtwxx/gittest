<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">
    <!--游戏区块-->
    <div id="c7_game" class="Game">
        <form name="newForm" id="newForm" action="" method="post">
            <!--正码1-6选择-->
            <div id="tab" style="display:none;">
                <ul>
                    <li data-rtypen="N1" class="onTagClick"><span><b>正码特 1</b></span></li>
                    <li data-rtypen="N2" class="unTagClick"><span><b>正码特 2</b></span></li>
                    <li data-rtypen="N3" class="unTagClick"><span><b>正码特 3</b></span></li>
                    <li data-rtypen="N4" class="unTagClick"><span><b>正码特 4</b></span></li>
                    <li data-rtypen="N5" class="unTagClick"><span><b>正码特 5</b></span></li>
                    <li data-rtypen="N6" class="unTagClick"><span><b>正码特 6</b></span></li>
                    <li id="space" style="width:15px;"></li>
                </ul>
            </div>
            <div id="quickMode">
                <input type="button" name="quickinput" value="切换一般模式" id="switchMode">
            </div>
            <div class="round-table">
                <table id="table1">
                    <tbody>
                    <tr style="font-size:11px;text-align:center;color:black;" class="title_tr">
                        <td>正肖</td>
                        <td>号码</td>
                        <td>赔率</td>
                        <td>金额</td>
                        <td>正肖</td>
                        <td>号码</td>
                        <td>赔率</td>
                        <td>金额</td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;">
                        <td class="title_td2"><span>鼠</span></td>
                        <td class="title_td3">09, 21, 33, 45</td>
                        <td id="NA_A1_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_A1">1.92</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_A1]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_A1]"
                                                                                        value="1.92"></td>
                        <td class="title_td2"><span>牛</span></td>
                        <td class="title_td3">08, 20, 32, 44</td>
                        <td id="NA_A2_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_A2">1.92</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_A2]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_A2]"
                                                                                        value="1.92"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;">
                        <td class="title_td2"><span>虎</span></td>
                        <td class="title_td3">07, 19, 31, 43</td>
                        <td id="NA_A3_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_A3">1.92</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_A3]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_A3]"
                                                                                        value="1.92"></td>
                        <td class="title_td2"><span>兔</span></td>
                        <td class="title_td3">06, 18, 30, 42</td>
                        <td id="NA_A4_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_A4">1.92</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_A4]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_A4]"
                                                                                        value="1.92"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;">
                        <td class="title_td2"><span>龙</span></td>
                        <td class="title_td3">05, 17, 29, 41</td>
                        <td id="NA_A5_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_A5">1.92</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_A5]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_A5]"
                                                                                        value="1.92"></td>
                        <td class="title_td2"><span>蛇</span></td>
                        <td class="title_td3">04, 16, 28, 40</td>
                        <td id="NA_A6_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_A6">1.92</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_A6]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_A6]"
                                                                                        value="1.92"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;">
                        <td class="title_td2"><span>马</span></td>
                        <td class="title_td3">03, 15, 27, 39</td>
                        <td id="NA_A7_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_A7">1.92</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_A7]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_A7]"
                                                                                        value="1.92"></td>
                        <td class="title_td2"><span>羊</span></td>
                        <td class="title_td3">02, 14, 26, 38</td>
                        <td id="NA_A8_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_A8">1.92</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_A8]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_A8]"
                                                                                        value="1.92"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;">
                        <td class="title_td2"><span>猴</span></td>
                        <td class="title_td3">01, 13, 25, 37, 49</td>
                        <td id="NA_A9_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_A9">1.62</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_A9]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_A9]"
                                                                                        value="1.62"></td>
                        <td class="title_td2"><span>鸡</span></td>
                        <td class="title_td3">12, 24, 36, 48</td>
                        <td id="NA_AA_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_AA">1.92</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_AA]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_AA]"
                                                                                        value="1.92"></td>
                    </tr>
                    <tr style="font-size:11px;text-align:center;color:black;">
                        <td class="title_td2"><span>狗</span></td>
                        <td class="title_td3">11, 23, 35, 47</td>
                        <td id="NA_AB_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_AB">1.92</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_AB]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_AB]"
                                                                                        value="1.92"></td>
                        <td class="title_td2"><span>猪</span></td>
                        <td class="title_td3">10, 22, 34, 46</td>
                        <td id="NA_AC_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                                id="NA_AC">1.92</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[NA_AC]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[NA_AC]"
                                                                                        value="1.92"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="round-table">
                <table id="table2">
                    <tbody>
                    <tr style="font-size:11px;text-align:center;color:black;">
                        <td class="title_td"><span>红波</span></td>
                        <td id="C7_R_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                               id="C7_R">2.65</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[C7_R]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[C7_R]"
                                                                                        value="2.65"></td>
                        <td class="title_td"><span>蓝波</span></td>
                        <td id="C7_B_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                               id="C7_B">3</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[C7_B]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[C7_B]"
                                                                                        value="3"></td>
                        <td class="title_td"><span>绿波</span></td>
                        <td id="C7_G_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                               id="C7_G">3</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[C7_G]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[C7_G]"
                                                                                        value="3"></td>
                        <td class="title_td"><span>和局</span></td>
                        <td id="C7_N_bg"><span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;"
                                               id="C7_N">25</span></td>
                        <td><input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[C7_N]" min="0" max="99999999"
                                   data-callback-id="3" maxlength="8"
                                   style="border: 1px solid rgb(187, 187, 187);"><input type="hidden" name="odds[C7_N]"
                                                                                        value="25"></td>
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
                <span class="credit">下注金额:<b id="total_bet">0.00</b></span>
                <input class="no" type="reset" value="取消">
                <input class="yes" type="button" name="btnBet" value="确定">
            </div>
            <input type="hidden" name="gid" id="gid" value="551082">
            <input type="hidden" name="Line" id="Line" value="">
        </form>
    </div>
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