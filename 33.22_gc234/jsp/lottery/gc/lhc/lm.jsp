<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="cqsc">
            <div id="order-box" class="order-box-oneword game-state-opening">

                <!--砝码快选-->
                <jsp:include page="../lottoBet.jsp" />

                <div id="orders">
                    <!-- javascript app 使用 -->

                </div>

                <div id="order-info">
                    <div class="inner">
                        <span>下注金额:<span id="BetGold">0</span></span>
                        <!-- IE 8,9 瀏覽器BUG 在INPUT上按ENTER會被FOCUS到BTN物件觸發CLICK事件 (加上type="reset" 可以避開) -->
                        <button type="reset" id="btn-orders-reset" class="btn-cancel" onclick="reset()">取消</button>
                        <button id="btn-orders-submit" class="btn-submit">确认</button>
                    </div>
                </div>
            </div>
        </div>

<script type="text/template" id="contentTpl">
    <div class="game-box" style="display: block;"><div class="tabs-box tabs-view-4">

        <div id="locate-box">
            <table class="order-table tabs-view" tabs-view="1">
                <thead>
                <tr><th>号码</th>
                    <th>金额</th>
                    <th>号码</th>
                    <th>金额</th>
                    <th>号码</th>
                    <th>金额</th>
                    <th>号码</th>
                    <th>金额</th>
                </tr></thead>
                <tbody>
                <tr>
                    <td class="choose-num">特单</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[60001].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60001">
                    </td>
                    <td class="choose-num">特双</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[60002].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60002">
                    </td>
                    <td class="choose-num">特大</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[60003].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60003">
                    </td>
                    <td class="choose-num">特小</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[60004].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60004">
                    </td>
                </tr><tr>
                    <td class="choose-num">和单</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[60005].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60005">
                    </td>
                    <td class="choose-num">和双</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[60006].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60006">
                    </td>
                    <td class="choose-num">和大</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[60007].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60007">
                    </td>
                    <td class="choose-num">和小</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[60008].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60008">
                    </td>
                </tr><tr>
                    <td class="choose-num">总单</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61001].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61001">
                    </td>
                    <td class="choose-num">总双</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61002].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61002">
                    </td>
                    <td class="choose-num">总大</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61003].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61003">
                    </td>
                    <td class="choose-num">总小</td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61004].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61004">
                    </td>
                </tr>
                </tbody>
            </table>

            <table class="order-table tabs-view active" tabs-view="1" style="display: table;">
                <thead>
                <tr>
                    <th></th>
                    <th>正码一</th>
                    <th>正码二</th>
                    <th>正码三</th>
                    <th>正码四</th>
                    <th>正码五</th>
                    <th>正码六</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th style="padding: 0.5em">单</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62001].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62001" data-position="0">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62001].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62001" data-position="1">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62001].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62001" data-position="2">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62001].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62001" data-position="3">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62001].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62001" data-position="4">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62001].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62001" data-position="5">
                    </td>
                </tr>
                <tr>
                    <th style="padding: 0.5em">双</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62002].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62002" data-position="0">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62002].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62002" data-position="1">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62002].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62002" data-position="2">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62002].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62002" data-position="3">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62002].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62002" data-position="4">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62002].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62002" data-position="5">
                    </td>
                </tr>
                <tr>
                    <th style="padding: 0.5em">大</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62003].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62003" data-position="0">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62003].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62003" data-position="1">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62003].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62003" data-position="2">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62003].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62003" data-position="3">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62003].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62003" data-position="4">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62003].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62003" data-position="5">
                    </td>
                </tr>
                <tr>
                    <th style="padding: 0.5em">小</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62004].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62004" data-position="0">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62004].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62004" data-position="1">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62004].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62004" data-position="2">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62004].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62004" data-position="3">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62004].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62004" data-position="4">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62004].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62004" data-position="5">
                    </td>
                </tr>
                <tr>
                    <th style="padding: 0.5em">和单</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62005].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62005" data-position="0">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62005].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62005" data-position="1">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62005].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62005" data-position="2">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62005].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62005" data-position="3">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62005].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62005" data-position="4">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62005].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62005" data-position="5">
                    </td>
                </tr>
                <tr>
                    <th style="padding: 0.5em">和双</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62006].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62006" data-position="0">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62006].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62006" data-position="1">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62006].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62006" data-position="2">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62006].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62006" data-position="3">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62006].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62006" data-position="4">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62006].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62006" data-position="5">
                    </td>
                </tr>
                <tr>
                    <th style="padding: 0.5em">和大</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62007].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62007" data-position="0">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62007].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62007" data-position="1">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62007].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62007" data-position="2">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62007].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62007" data-position="3">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62007].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62007" data-position="4">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62007].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62007" data-position="5">
                    </td>
                </tr>
                <tr>
                    <th style="padding: 0.5em">和小</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62008].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62008" data-position="0">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62008].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62008" data-position="1">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62008].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62008" data-position="2">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62008].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62008" data-position="3">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62008].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62008" data-position="4">
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62008].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62008" data-position="5">
                    </td>
                </tr>
                </tbody>
            </table>
        </div></div></div>
</script>

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
