<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="order-box" class="order-box-oneword game-state-opening">

	<!--砝码快选-->
	<jsp:include page="../lottoBet.jsp" />

	<div id="orders" class="GENERAL" style="display: block;">
		<!-- javascript app 使用 -->
	</div>

	<div id="order-info">
		<div class="inner">
			<span>下注金额:<span id="BetGold">0</span></span>
			<!-- IE 8,9 瀏覽器BUG 在INPUT上按ENTER會被FOCUS到BTN物件觸發CLICK事件 (加上type="reset" 可以避開) -->
			<button type="reset" onclick="reset();" class="btn-cancel">取消</button>
			<button id="btn-orders-submit" class="btn-submit">确认</button>
		</div>
	</div>

	<jsp:include page="lz.jsp"></jsp:include>
</div>

<script type="text/template" id="contentTpl">
	<div class="game-box quick-order tabs-box" style="display: block;"><table class="order-table">
		<caption>总和</caption>
		<tbody><tr>
		    <td class="choose-item">
		        <font class="choose-name">大</font>
		        <span class="odds"><#=items_map[20009].odds.toFixed(2)#></span>
		        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20009">
		    </td>
		    <td class="choose-item">
		        <font class="choose-name">单</font>
		        <span class="odds"><#=items_map[20011].odds.toFixed(2)#></span>
		        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20011">
		    </td>
		    <td class="choose-item">
		        <font class="choose-name">尾大</font>
		        <span class="odds"><#=items_map[20013].odds.toFixed(2)#></span>
		        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20013">
		    </td>
		    <td class="choose-item">
		        <font class="choose-name">龙</font>
		        <span class="odds"><#=items_map[20015].odds.toFixed(2)#></span>
		        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20015">
		    </td>
		</tr>
		<tr>
		    <td class="choose-item">
		        <font class="choose-name">小</font>
		        <span class="odds"><#=items_map[20010].odds.toFixed(2)#></span>
		        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20010">
		    </td>
		    <td class="choose-item">
		        <font class="choose-name">双</font>
		        <span class="odds"><#=items_map[20012].odds.toFixed(2)#></span>
		        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20012">
		    </td>
		    <td class="choose-item">
		        <font class="choose-name">尾小</font>
		        <span class="odds"><#=items_map[20014].odds.toFixed(2)#></span>
		        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20014">
		    </td>
		    <td class="choose-item">
		        <font class="choose-name">虎</font>
		        <span class="odds"><#=items_map[20016].odds.toFixed(2)#></span>
		        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20016">
		    </td>
		</tr>
		</tbody></table>
		
		<table class="order-table">
		    <caption>单码/双面</caption>
		
		    <!-- num 1 -->
		    <tbody><tr>
		        <th rowspan="2">第一球</th>
		
		        <td class="choose-item">
		            <font class="choose-name">大</font>
		            <span class="odds"><#=items_map[20001].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20001" data-position="0">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">单</font>
		            <span class="odds"><#=items_map[20003].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20003" data-position="0">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和单</font>
		            <span class="odds"><#=items_map[20005].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20005" data-position="0">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾大</font>
		            <span class="odds"><#=items_map[20007].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20007" data-position="0">
		        </td>
		    </tr>
		    <tr>
		        <td class="choose-item">
		            <font class="choose-name">小</font>
		            <span class="odds"><#=items_map[20002].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20002" data-position="0">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">双</font>
		            <span class="odds"><#=items_map[20004].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20004" data-position="0">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和双</font>
		            <span class="odds"><#=items_map[20006].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20006" data-position="0">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾小</font>
		            <span class="odds"><#=items_map[20008].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20008" data-position="0">
		        </td>
		    </tr>
		
		    <!-- num 2 -->
		    <tr>
		        <th rowspan="2">第二球</th>
		
		        <td class="choose-item">
		            <font class="choose-name">大</font>
		            <span class="odds"><#=items_map[20001].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20001" data-position="1">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">单</font>
		            <span class="odds"><#=items_map[20003].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20003" data-position="1">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和单</font>
		            <span class="odds"><#=items_map[20005].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20005" data-position="1">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾大</font>
		            <span class="odds"><#=items_map[20007].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20007" data-position="1">
		        </td>
		    </tr>
		    <tr>
		        <td class="choose-item">
		            <font class="choose-name">小</font>
		            <span class="odds"><#=items_map[20002].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20002" data-position="1">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">双</font>
		            <span class="odds"><#=items_map[20004].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20004" data-position="1">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和双</font>
		            <span class="odds"><#=items_map[20006].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20006" data-position="1">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾小</font>
		            <span class="odds"><#=items_map[20008].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20008" data-position="1">
		        </td>
		    </tr>
		
		    <!-- num 3 -->
		    <tr>
		        <th rowspan="2">第三球</th>
		
		        <td class="choose-item">
		            <font class="choose-name">大</font>
		            <span class="odds"><#=items_map[20001].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20001" data-position="2">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">单</font>
		            <span class="odds"><#=items_map[20003].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20003" data-position="2">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和单</font>
		            <span class="odds"><#=items_map[20005].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20005" data-position="2">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾大</font>
		            <span class="odds"><#=items_map[20007].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20007" data-position="2">
		        </td>
		    </tr>
		    <tr>
		        <td class="choose-item">
		            <font class="choose-name">小</font>
		            <span class="odds"><#=items_map[20002].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20002" data-position="2">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">双</font>
		            <span class="odds"><#=items_map[20004].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20004" data-position="2">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和双</font>
		            <span class="odds"><#=items_map[20006].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20006" data-position="2">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾小</font>
		            <span class="odds"><#=items_map[20008].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20008" data-position="2">
		        </td>
		    </tr>
		
		    <!-- num 4 -->
		    <tr>
		        <th rowspan="2">第四球</th>
		
		        <td class="choose-item">
		            <font class="choose-name">大</font>
		            <span class="odds"><#=items_map[20001].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20001" data-position="3">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">单</font>
		            <span class="odds"><#=items_map[20003].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20003" data-position="3">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和单</font>
		            <span class="odds"><#=items_map[20005].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20005" data-position="3">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾大</font>
		            <span class="odds"><#=items_map[20007].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20007" data-position="3">
		        </td>
		    </tr>
		    <tr>
		        <td class="choose-item">
		            <font class="choose-name">小</font>
		            <span class="odds"><#=items_map[20002].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20002" data-position="3">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">双</font>
		            <span class="odds"><#=items_map[20004].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20004" data-position="3">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和双</font>
		            <span class="odds"><#=items_map[20006].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20006" data-position="3">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾小</font>
		            <span class="odds"><#=items_map[20008].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20008" data-position="3">
		        </td>
		    </tr>
		
		    <!-- num 5 -->
		    <tr>
		        <th rowspan="2">第五球</th>
		
		        <td class="choose-item">
		            <font class="choose-name">大</font>
		            <span class="odds"><#=items_map[20001].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20001" data-position="4">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">单</font>
		            <span class="odds"><#=items_map[20003].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20003" data-position="4">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和单</font>
		            <span class="odds"><#=items_map[20005].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20005" data-position="4">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾大</font>
		            <span class="odds"><#=items_map[20007].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20007" data-position="4">
		        </td>
		    </tr>
		    <tr>
		        <td class="choose-item">
		            <font class="choose-name">小</font>
		            <span class="odds"><#=items_map[20002].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20002" data-position="4">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">双</font>
		            <span class="odds"><#=items_map[20004].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20004" data-position="4">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和双</font>
		            <span class="odds"><#=items_map[20006].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20006" data-position="4">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾小</font>
		            <span class="odds"><#=items_map[20008].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20008" data-position="4">
		        </td>
		    </tr>
		
		    <!-- num 6 -->
		    <tr>
		        <th rowspan="2">第六球</th>
		
		        <td class="choose-item">
		            <font class="choose-name">大</font>
		            <span class="odds"><#=items_map[20001].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20001" data-position="5">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">单</font>
		            <span class="odds"><#=items_map[20003].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20003" data-position="5">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和单</font>
		            <span class="odds"><#=items_map[20005].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20005" data-position="5">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾大</font>
		            <span class="odds"><#=items_map[20007].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20007" data-position="5">
		        </td>
		    </tr>
		    <tr>
		        <td class="choose-item">
		            <font class="choose-name">小</font>
		            <span class="odds"><#=items_map[20002].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20002" data-position="5">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">双</font>
		            <span class="odds"><#=items_map[20004].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20004" data-position="5">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和双</font>
		            <span class="odds"><#=items_map[20006].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20006" data-position="5">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾小</font>
		            <span class="odds"><#=items_map[20008].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20008" data-position="5">
		        </td>
		    </tr>
		
		    <!-- num 7 -->
		    <tr>
		        <th rowspan="2">第七球</th>
		
		        <td class="choose-item">
		            <font class="choose-name">大</font>
		            <span class="odds"><#=items_map[20001].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20001" data-position="6">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">单</font>
		            <span class="odds"><#=items_map[20003].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20003" data-position="6">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和单</font>
		            <span class="odds"><#=items_map[20005].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20005" data-position="6">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾大</font>
		            <span class="odds"><#=items_map[20007].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20007" data-position="6">
		        </td>
		    </tr>
		    <tr>
		        <td class="choose-item">
		            <font class="choose-name">小</font>
		            <span class="odds"><#=items_map[20002].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20002" data-position="6">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">双</font>
		            <span class="odds"><#=items_map[20004].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20004" data-position="6">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和双</font>
		            <span class="odds"><#=items_map[20006].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20006" data-position="6">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾小</font>
		            <span class="odds"><#=items_map[20008].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20008" data-position="6">
		        </td>
		    </tr>
		
		    <!-- num 8 -->
		    <tr>
		        <th rowspan="2">第八球</th>
		
		        <td class="choose-item">
		            <font class="choose-name">大</font>
		            <span class="odds"><#=items_map[20001].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20001" data-position="7">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">单</font>
		            <span class="odds"><#=items_map[20003].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20003" data-position="7">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和单</font>
		            <span class="odds"><#=items_map[20005].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20005" data-position="7">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾大</font>
		            <span class="odds"><#=items_map[20007].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20007" data-position="7">
		        </td>
		    </tr>
		    <tr>
		        <td class="choose-item">
		            <font class="choose-name">小</font>
		            <span class="odds"><#=items_map[20002].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20002" data-position="7">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">双</font>
		            <span class="odds"><#=items_map[20004].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20004" data-position="7">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">和双</font>
		            <span class="odds"><#=items_map[20006].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20006" data-position="7">
		        </td>
		        <td class="choose-item">
		            <font class="choose-name">尾小</font>
		            <span class="odds"><#=items_map[20008].odds.toFixed(2)#></span>
		            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20008" data-position="7">
		        </td>
		    </tr>
		  </tbody>
		</table>    	                    
</div>
</script>
<script src="${ctx}/js/lib/tpl.js"></script>
<script src="${ctx}/js/lib/countdown.js"></script>
<script src="${ctx}/js/lottery/gdsf/member_common_gdsf.js"></script>

<script>
    $(function() {
        //循环输出
        $.ajax({url: "${ctx}/gdsf/itemDate.do?timeStamp=" + new Date().getTime()+"&&Pid=0&Sid=1",type: "get",dataType: "json",
            success: function(b) {
            	//console.debug(b);
                if(0 == b.code){
                	var html = tpl('#contentTpl', b);
                    $("#orders").html(html);
                }else{
                    Showbo.Msg.alert('请登录!')
                    setTimeout(function(){
                        window.location.href=ctx+"logout.do";
                    },1000);
                }
            }})
    });
</script>