<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<button type="reset" id="btn-orders-reset" class="btn-cancel"
				onclick="reset()">取消</button>
			<button id="btn-orders-submit" class="btn-submit">确认</button>
		</div>
	</div>
</div>

<script type="text/template" id="contentTpl">
    <div class="game-box" style="display: block;"><div class="tabs-box tabs-view-4">

        <div id="locate-box">
            <table class="order-table tabs-view" tabs-view="1">
                <thead>
                <tr><th>十二生肖</th>
                    <th>号码</th>
                    <th>金额</th>
                    <th>十二生肖</th>
                    <th>号码</th>
                    <th>金额</th>
                </tr></thead>
                <tbody>
                <tr>
                    <th style="padding: 0.5em">鼠</th>
                    <td class="choose-num"><#=items_map[64001].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64001].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64001">
                    </td>
                    <th style="padding: 0.5em">牛</th>
                    <td class="choose-num"><#=items_map[64007].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64007].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64007">
                    </td>
                </tr><tr>
                    <th style="padding: 0.5em">虎</th>
                    <td class="choose-num"><#=items_map[64002].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64002].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64002">
                    </td>
                    <th style="padding: 0.5em">兔</th>
                    <td class="choose-num"><#=items_map[64008].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64008].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64008">
                    </td>
                </tr><tr>
                    <th style="padding: 0.5em">龙</th>
                    <td class="choose-num"><#=items_map[64003].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64003].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64003">
                    </td>
                    <th style="padding: 0.5em">蛇</th>
                    <td class="choose-num"><#=items_map[64009].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64009].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64009">
                    </td>
                </tr><tr>
                    <th style="padding: 0.5em">马</th>
                    <td class="choose-num"><#=items_map[64004].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64004].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64004">
                    </td>
                    <th style="padding: 0.5em">羊</th>
                    <td class="choose-num"><#=items_map[64010].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64010].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64010">
                    </td>
                </tr><tr>
                    <th style="padding: 0.5em">猴</th>
                    <td class="choose-num"><#=items_map[64005].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64005].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64005">
                    </td>
                    <th style="padding: 0.5em">鸡</th>
                    <td class="choose-num"><#=items_map[64011].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64011].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64011">
                    </td>
                </tr><tr>
                    <th style="padding: 0.5em">狗</th>
                    <td class="choose-num"><#=items_map[64006].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64006].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64006">
                    </td>
                    <th style="padding: 0.5em">猪</th>
                    <td class="choose-num"><#=items_map[64012].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[64012].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="64012">
                    </td>
                </tr>
                </tbody>
            </table>

            <table class="order-table tabs-view" tabs-view="2" style="display: table;">
                <thead>
                <tr>
                    <th colspan="6">色波</th>
                </tr>
                </thead>
                <tbody><tr>
                    <td class="choose-num">
                        <span class="num ballR">红波</span>
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[65001].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="65001">
                    </td>
                    <td class="choose-num">
                        <span class="num ballB">蓝波</span>
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[65002].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="65002">
                    </td>
                    <td class="choose-num">
                        <span class="num ballG">绿波</span>
                    </td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[65003].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="65003">
                    </td>
                </tr>
                </tbody></table>
        </div></div></div>
</script>

<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/lhc_lm.js?51188" type="text/javascript"></script>
<script type="application/javascript">
      //获取彩池
        var itemInfo = "";
        $.ajax({
        	url: ctx +"/lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId=8,9",
        	type: "get",
        	dataType: "json",
            success: function(b) {
            	itemInfo = b;
            	if(0 == b.code){
                    var html = tpl('#contentTpl', b);
                    $("#orders").html(html);

                }else{
                    Showbo.Msg.alert('请登录！')
                    window.location.href="${ctx}/logout.do";
                }
            }
        });
        //获取降水
        function getDownRateInfo(){
        $.ajax({
        	url: ctx + "/lhc/getDownRate.do?timeStamp=" + new Date().getTime()+"&poolId=8,9",
        	type: "get",
        	dataType: "json",
            success: function(b) {
            	//console.debug(b);
             	if(0 == b.code && b.list != null && b.list != undefined && b.list != ''){
             		var list = b.list;
             		$.each(list, function(n,value) {
           					var itemcode = value.itemcode;
               				var input$ = $("input[data-itemcode="+itemcode+"]");
               				//console.debug(itemInfo);
               				var num = itemInfo.items_map[itemcode].odds.toFixed(2);
               				//console.debug(num);
               				rate = (num - value.downrate).toFixed(2);
               				input$.siblings(".odds").html(rate);
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
