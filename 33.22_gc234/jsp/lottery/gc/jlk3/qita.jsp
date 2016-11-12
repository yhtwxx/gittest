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
        <caption>三军</caption>
        <tbody><tr>
            <td><span class="dice dice-num-1"></span></td>
            <td class="choose choose-item">
                <span class="odds"><#=items_map[30019].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30019">
            </td>
            <td><span class="dice dice-num-2"></span></td>
            <td class="choose choose-item">
                <span class="odds"><#=items_map[30020].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30020">
            </td>
            <td><span class="dice dice-num-3"></span></td>
            <td class="choose choose-item">
                <span class="odds"><#=items_map[30021].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30021">
            </td>
        </tr>
        <tr>
            <td><span class="dice dice-num-4"></span></td>
            <td class="choose choose-item">
                <span class="odds"><#=items_map[30022].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30022">
            </td>
            <td><span class="dice dice-num-5"></span></td>
            <td class="choose choose-item">
                <span class="odds"><#=items_map[30023].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30023">
            </td>
            <td><span class="dice dice-num-6"></span></td>
            <td class="choose choose-item">
                <span class="odds"><#=items_map[30024].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30024">
            </td>
        </tr>
        </tbody></table>

        <table class="order-table">
            <caption>围骰/全骰</caption>
            <tbody><tr>
                <td>
                    <span class="dice dice-num-1"></span>
                    <span class="dice dice-num-1"></span>
                    <span class="dice dice-num-1"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30025].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30025">
                </td>
                <td>
                    <span class="dice dice-num-2"></span>
                    <span class="dice dice-num-2"></span>
                    <span class="dice dice-num-2"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30026].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30026">
                </td>
                <td>
                    <span class="dice dice-num-3"></span>
                    <span class="dice dice-num-3"></span>
                    <span class="dice dice-num-3"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30027].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30027">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="dice dice-num-4"></span>
                    <span class="dice dice-num-4"></span>
                    <span class="dice dice-num-4"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30028].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30028">
                </td>
                <td>
                    <span class="dice dice-num-5"></span>
                    <span class="dice dice-num-5"></span>
                    <span class="dice dice-num-5"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30029].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30029">
                </td>
                <td>
                    <span class="dice dice-num-6"></span>
                    <span class="dice dice-num-6"></span>
                    <span class="dice dice-num-6"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30030].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30030">
                </td>
            </tr>
            <tr>
                <td class="bet-tag">全骰</td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30031].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30031">
                </td>
                <td colspan="4"></td>
            </tr>
            </tbody></table>

        <table class="order-table">
            <caption>长牌</caption>
            <tbody><tr>
                <td>
                    <span class="dice dice-num-1"></span>
                    <span class="dice dice-num-2"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30032].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30032">
                </td>
                <td>
                    <span class="dice dice-num-1"></span>
                    <span class="dice dice-num-3"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30033].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30033">
                </td>
                <td>
                    <span class="dice dice-num-1"></span>
                    <span class="dice dice-num-4"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30034].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30034">
                </td>
                <td>
                    <span class="dice dice-num-1"></span>
                    <span class="dice dice-num-5"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30035].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30035">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="dice dice-num-1"></span>
                    <span class="dice dice-num-6"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30036].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30036">
                </td>
                <td>
                    <span class="dice dice-num-2"></span>
                    <span class="dice dice-num-3"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30037].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30037">
                </td>
                <td>
                    <span class="dice dice-num-2"></span>
                    <span class="dice dice-num-4"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30038].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30038">
                </td>
                <td>
                    <span class="dice dice-num-2"></span>
                    <span class="dice dice-num-5"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30039].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30039">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="dice dice-num-2"></span>
                    <span class="dice dice-num-6"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30040].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30040">
                </td>
                <td>
                    <span class="dice dice-num-3"></span>
                    <span class="dice dice-num-4"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30041].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30041">
                </td>
                <td>
                    <span class="dice dice-num-3"></span>
                    <span class="dice dice-num-5"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30042].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30042">
                </td>
                <td>
                    <span class="dice dice-num-3"></span>
                    <span class="dice dice-num-6"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30043].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30043">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="dice dice-num-4"></span>
                    <span class="dice dice-num-5"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30044].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30044">
                </td>
                <td>
                    <span class="dice dice-num-4"></span>
                    <span class="dice dice-num-6"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30045].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30045">
                </td>
                <td>
                    <span class="dice dice-num-5"></span>
                    <span class="dice dice-num-6"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30046].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30046">
                </td>
                <td colspan="2"></td>
            </tr>
            </tbody></table>

        <table class="order-table">
            <caption>短牌</caption>
            <tbody><tr>
                <td>
                    <span class="dice dice-num-1"></span>
                    <span class="dice dice-num-1"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30047].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30047">
                </td>
                <td>
                    <span class="dice dice-num-2"></span>
                    <span class="dice dice-num-2"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30048].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30048">
                </td>
                <td>
                    <span class="dice dice-num-3"></span>
                    <span class="dice dice-num-3"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30049].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30049">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="dice dice-num-4"></span>
                    <span class="dice dice-num-4"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30050].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30050">
                </td>
                <td>
                    <span class="dice dice-num-5"></span>
                    <span class="dice dice-num-5"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30051].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30051">
                </td>
                <td>
                    <span class="dice dice-num-6"></span>
                    <span class="dice dice-num-6"></span>
                </td>
                <td class="choose choose-item">
                    <span class="odds"><#=items_map[30052].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="30052">
                </td>
            </tr>
            </tbody></table></div>
</script>

<script src="${ctx }/js/lib/tpl.js"></script>
<script src="${ctx }/js/lib/countdown.js"></script>
<script src="${ctx }/js/lottery/jlk3/member_common_jlk3.js"></script>
	
<script>
    //循环输出
    $.ajax({url: "${ctx }/jlk3/itemDate.do?timeStamp=" + new Date().getTime()+"+&Pid=3,4,5,6,7",type: "get",dataType: "json",
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