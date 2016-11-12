<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">
    <!--砝码快选-->
    <jsp:include page="../lottoBet.jsp" />
    <!--游戏区块-->
    <div id="spb_game" class="Game">
            <div class="round-table" id="orders">
                
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
            <input type="hidden" name="gid" id="gid" value="551081">
            <input type="hidden" name="Line" id="Line" value="">
    </div>
</div>
<script type="text/template" id="contentTpl">
<div class="game-box" style="display: block;"><div class="tabs-box tabs-view-4">
        <div id="locate-box">
            <table class="order-table tabs-view" tabs-view="1">
                <thead>
                <tr>
					<th>一肖</th>
                    <th>号码</th>
                    <th>金额</th>
                    <th>一肖</th>
                    <th>号码</th>
                    <th>金额</th>
                </tr>
				</thead>
                <tbody>
                <tr>
                    <th style="padding: 0.5em"><#=items_map[61901].itemName#></th>
                    <td class="choose-num"><#=items_map[61901].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61901].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61901">
                    </td>
                    <th style="padding: 0.5em"><#=items_map[61906].itemName#></th>
                    <td class="choose-num"><#=items_map[61906].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61906].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61906">
                    </td>
                </tr>
				<tr>
                    <th style="padding: 0.5em"><#=items_map[61902].itemName#></th>
                    <td class="choose-num"><#=items_map[61902].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61902].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61902">
                    </td>
                    <th style="padding: 0.5em"><#=items_map[61907].itemName#></th>
                    <td class="choose-num"><#=items_map[61907].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61907].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61907">
                    </td>
                </tr>
				<tr>
                    <th style="padding: 0.5em"><#=items_map[61903].itemName#></th>
                    <td class="choose-num"><#=items_map[61903].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61903].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61903">
                    </td>
                    <th style="padding: 0.5em"><#=items_map[61908].itemName#></th>
                    <td class="choose-num"><#=items_map[61908].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61908].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61908">
                    </td>
                </tr>
				<tr>
                    <th style="padding: 0.5em"><#=items_map[61904].itemName#></th>
                    <td class="choose-num"><#=items_map[61904].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61904].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61904">
                    </td>
                    <th style="padding: 0.5em"><#=items_map[61909].itemName#></th>
                    <td class="choose-num"><#=items_map[61909].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61909].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61909">
                    </td>
                </tr>
				<tr>
                    <th style="padding: 0.5em"><#=items_map[61912].itemName#></th>
                    <td class="choose-num"><#=items_map[61912].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61912].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61912">
                    </td>
                    <th style="padding: 0.5em"><#=items_map[61910].itemName#></th>
                    <td class="choose-num"><#=items_map[61910].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61910].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61910">
                    </td>
                </tr>
				<tr>
                    <th style="padding: 0.5em"><#=items_map[61905].itemName#></th>
                    <td class="choose-num"><#=items_map[61905].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61905].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61905">
                    </td>
                    <th style="padding: 0.5em"><#=items_map[61911].itemName#></th>
                    <td class="choose-num"><#=items_map[61911].displayNo#></td>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[61911].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61911">
                    </td>
                </tr>
                </tbody>
            </table>

            <table class="order-table tabs-view" tabs-view="2" style="display: table;">
                <thead>
                <tr>
                    <th colspan="12">正特尾数</th>
                </tr>
                </thead>
                <tbody>
				<tr>
                    <th style="padding: 0.5em"><#=items_map[62101].itemName#>尾</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62101].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62101">
                    </td>
					<th style="padding: 0.5em"><#=items_map[62102].itemName#>尾</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62102].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62102">
                    </td>
					<th style="padding: 0.5em"><#=items_map[62103].itemName#>尾</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62103].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62103">
                    </td>
					<th style="padding: 0.5em"><#=items_map[62104].itemName#>尾</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62104].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62104">
                    </td>
					<th style="padding: 0.5em"><#=items_map[62105].itemName#>尾</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62105].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62105">
                    </td>
                </tr>
				<tr>
                    <th style="padding: 0.5em"><#=items_map[62106].itemName#>尾</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62106].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62106">
                    </td>
					<th style="padding: 0.5em"><#=items_map[62107].itemName#>尾</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62107].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62107">
                    </td>
					<th style="padding: 0.5em"><#=items_map[62108].itemName#>尾</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62108].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62108">
                    </td>
					<th style="padding: 0.5em"><#=items_map[62109].itemName#>尾</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62109].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62109">
                    </td>
					<th style="padding: 0.5em"><#=items_map[62110].itemName#>尾</th>
                    <td class="choose-item">
                        <span class="odds"><#=items_map[62110].odds.toFixed(2)#></span>
                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="62110">
                    </td>
                </tr>
                </tbody></table>
        </div></div></div>
</script>
<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/SPB.js" type="text/javascript"></script>