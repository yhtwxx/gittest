<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">
    <!--砝码快选-->
    <jsp:include page="../lottoBet.jsp" />
    <!--游戏区块-->
    <div id="no_game" class="Game">
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
            <!--div id="quickMode">
                <input type="button" name="quickinput" value="切换一般模式" id="switchMode">
            </div-->
            <div class="round-table" id="orders">
                
            </div>
            <div class="round-table" style="display: none;">
                <table id="table2"></table>
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
                <input class="yes" type="button" id="btn-orders-submit" name="btnBet" value="确定">
            </div>
            <input type="hidden" name="gid" id="gid" value="551081">
            <input type="hidden" name="Line" id="Line" value="">
        </form>
    </div>
</div>

<script type="text/template" id="contentTpl">
<table id="table1">
<tbody>
<tr style="color:black;text-align:center;" class="title_tr">
    <td>&nbsp;</td>
    <td colspan="2" style="width:14%;">正码一</td>
    <td colspan="2" style="width:14%;">正码二</td>
    <td colspan="2" style="width:14%;">正码三</td>
    <td colspan="2" style="width:14%;">正码四</td>
    <td colspan="2" style="width:14%;">正码五</td>
    <td colspan="2" style="width:14%;">正码六</td>
</tr>
<tr style="color:black;text-align:center;">
    <td class="title_td"><span>&nbsp;</span></td>
    <td class="title_td">赔率</td>
    <td class="title_td">金额</td>
    <td class="title_td">赔率</td>
    <td class="title_td">金额</td>
    <td class="title_td">赔率</td>
    <td class="title_td">金额</td>
    <td class="title_td">赔率</td>
    <td class="title_td">金额</td>
    <td class="title_td">赔率</td>
    <td class="title_td">金额</td>
    <td class="title_td">赔率</td>
    <td class="title_td">金额</td>
</tr>

<# for(var i=62001; i<=62010; i++) { #>
	<tr style="color:black;text-align:center;">
    <td class="title_td">
		<span><#=items_map[i].itemName#></span>
	</td>
    <td class="" id="NO1_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO1_ODD"><#=items_map[i].odds.toFixed(2)#></span>
	</td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="0">
	</td>
    <td class="" id="NO2_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO2_ODD"><#=items_map[i].odds.toFixed(2)#></span></td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="1">
	</td>
    <td class="" id="NO3_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO3_ODD"><#=items_map[i].odds.toFixed(2)#></span>
	</td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="2">
	</td>
    <td class="" id="NO4_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO4_ODD"><#=items_map[i].odds.toFixed(2)#></span>
	</td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="3">
	</td>
    <td class="" id="NO5_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO5_ODD"><#=items_map[i].odds.toFixed(2)#></span>
	</td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="4">
	</td>
    <td class="" id="NO6_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO6_ODD"><#=items_map[i].odds.toFixed(2)#></span>
	</td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="5">
	</td>
	</tr>
<#}#>
<# for(var i=66001; i<=66003; i++) { #>
	<tr style="color:black;text-align:center;">
    <td class="title_td">
		<span><#=items_map[i].itemName#></span>
	</td>
    <td class="" id="NO1_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO1_ODD"><#=items_map[i].odds.toFixed(2)#></span>
	</td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="0">
	</td>
    <td class="" id="NO2_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO2_ODD"><#=items_map[i].odds.toFixed(2)#></span></td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="1">
	</td>
    <td class="" id="NO3_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO3_ODD"><#=items_map[i].odds.toFixed(2)#></span>
	</td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="2">
	</td>
    <td class="" id="NO4_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO4_ODD"><#=items_map[i].odds.toFixed(2)#></span>
	</td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="3">
	</td>
    <td class="" id="NO5_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO5_ODD"><#=items_map[i].odds.toFixed(2)#></span>
	</td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="4">
	</td>
    <td class="" id="NO6_ODD_bg">
		<span style="color: rgb(214, 62, 53); font-weight: bold; font-size: 12px;" id="NO6_ODD"><#=items_map[i].odds.toFixed(2)#></span>
	</td>
    <td class="choose-item">
		<span class="odds"></span>
		<input type="text" class="GoldQQ" pattern="[0-9]*" name="gold[]" min="0" max="99999999" data-callback-id="1" maxlength="8" 
				style="border: 1px solid rgb(187, 187, 187);" data-itemno="<#=items_map[i].displayNo#>" data-itemcode="<#=items_map[i].itemCode#>" data-position="5">
	</td>
	</tr>
<#}#>
</tbody>
</table>
</script>
<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/NO.js" type="text/javascript"></script>