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
			<button type="reset" id="btn-orders-reset" class="btn-cancel"
				onclick="reset()">取消</button>
			<button id="btn-orders-submit" class="btn-submit">确认</button>
		</div>
	</div>

	<jsp:include page="lz.jsp"></jsp:include>
</div>

<script type="text/template" id="contentTpl">
    <div class="game-box quick-order tabs-box" style="display: block;"><table class="order-table">
        <caption>双面</caption>
        <tbody><tr>
            <td class="bet-tag">大</td>
            <td class="choose choose-item">
                <span class="odds"><#=items_map[30001].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30001">
            </td>
            <td class="bet-tag">小</td>
            <td class="choose choose-item">
                <span class="odds"><#=items_map[30002].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30002">
            </td>
            <td class="bet-tag">单</td>
            <td class="choose choose-item">
                <span class="odds"><#=items_map[30003].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30003">
            </td>
            <td class="bet-tag">双</td>
            <td class="choose choose-item">
                <span class="odds"><#=items_map[30004].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30004">
            </td>
        </tr>
        </tbody></table>

        <table class="order-table">
            <caption>点数</caption>
            <tbody><tr>
                <td class="bet-tag">4</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30005">
                </td>
                <td class="bet-tag">5</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30006">
                </td>
                <td class="bet-tag">6</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30007">
                </td>
                <td class="bet-tag">7</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30008">
                </td>
            </tr>
            <tr>
                <td class="bet-tag">8</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30009">
                </td>
                <td class="bet-tag">9</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30010].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30010">
                </td>
                <td class="bet-tag">10</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30011].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30011">
                </td>
                <td class="bet-tag">11</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30012].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30012">
                </td>
            </tr>
            <tr>
                <td class="bet-tag">12</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30013].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30013">
                </td>
                <td class="bet-tag">13</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30014].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30014">
                </td>
                <td class="bet-tag">14</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30015].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30015">
                </td>
                <td class="bet-tag">15</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30016].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30016">
                </td>
            </tr>
            <tr>
                <td class="bet-tag">16</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30017].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30017">
                </td>
                <td class="bet-tag">17</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30018].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30018">
                </td>
                <td colspan="4"></td>
            </tr>
            </tbody></table>
    </div>
</script>

<script src="${ctx}/js/lib/tpl.js"></script>
<script src="${ctx}/js/lib/countdown.js"></script>
<script src="${ctx}/js/lottery/jssb/member_common_jssb.js"></script>

<script>
    //循环输出
    $.ajax({url: "${ctx}/jssb/itemDate.do?timeStamp=" + new Date().getTime()+"+&Pid=1&Sid=2",type: "get",dataType: "json",
        success: function(b) {
            if(0 == b.code){
                var html = tpl('#contentTpl', b);
                $("#orders").html(html);
            }else{
                Showbo.Msg.alert('请登录！')
                window.location.href=ctx+"logout.do";
            }
        }})
</script>