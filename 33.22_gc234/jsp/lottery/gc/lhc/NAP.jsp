<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">
    <!--游戏区块-->
    <div id="nap_game" class="col-xs-9 Game">
        <form name="lt_form" method="post" action="" onsubmit="return false;">
            <input type="hidden" name="gid" id="gid" value="551082">

            <div id="showTable">
                <!--正码过关table-->
                <div class="round-table" id="orders">
                    
                </div>
            </div>
        </form>
    </div>

    <!--下注单-->
    <div id="nap_msgbox" class="col-xs-3 message_box" style="display: none;">
        <div class="inner">
            <div class="msg-title">六合彩 正码过关 下注单</div>
            <div class="msg-text">
                <form name="MyForm" action="" method="get" onsubmit="return false;">
                    <input type="hidden" name="gid" value="551082">

                    <div class="PlayType">
                       	 
                    </div>
                    <div id="message_show" style="text-align:center;width:90%;">
                        
                    </div>
                    <div id="wstarshow" style="text-align:center;width:90%;display:block">
                    </div>
                    <br>
                    	模式 :
                    <select name="wkind">
                        <option value="S" selected="selected">单注</option>
                    </select>
                    <select name="wstar" id="wstar">
                        
                    </select>
                    <select name="wteam" style="display:none">
                    </select>
                    <input type="hidden" name="teamcount" value="3">
                </form>
                <form name="LAYOUTFORM" action="" method="post" onsubmit="return false">
                    	下注金额:
                    <input type="text" pattern="[0-9]*" min="0" id="gold" name="gold" class="GoldQQ msgbox"
                           data-callback-id="4" autocomplete="off" style="border: 1px solid rgb(187, 187, 187);"><br>
					                    最低限额: 1<br>
					                    单注限额: 5000<br>
					                    单项(号)限额: 50000
                    <div style="display: inline-block; padding-left: 20px">
                        <input type="button" class="cancel_cen" name="btnCancel" value="取消">
                        &nbsp;&nbsp;
                        <input type="button" class="submit_cen" name="btnSubmit" value="确定">
                        <input type="hidden" name="itemno" value="">
                        <input type="hidden" name="itemcode" value="">
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
<script type="text/template" id="contentTpl">
<table id="table1" style="background-color:white">
<tbody>
<tr class="title_tr">
    <td>
       	 号码
    </td>
    <td colspan="3">
         赔率
    </td>
</tr>
<tr style="background-color:white" >
    <td class="title_td1" style="text-align:center;" rowspan="6">
      	  正码一
    </td>
    <td>
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67001].itemCode#>" data-position="0"><#=items_map[67001].itemName#>
        </label><span id="s1_<#=items_map[67001].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67001].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67002].itemCode#>" data-position="0"><#=items_map[67002].itemName#>
        </label><span id="s1_<#=items_map[67002].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67002].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67003].itemCode#>" data-position="0"><#=items_map[67003].itemName#>
        </label><span id="s1_<#=items_map[67003].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67003].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67004].itemCode#>" data-position="0"><#=items_map[67004].itemName#>
        </label><span id="s1_<#=items_map[67004].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67004].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67005].itemCode#>" data-position="0"><#=items_map[67005].itemName#>
        </label><span id="s1_<#=items_map[67005].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67005].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67006].itemCode#>" data-position="0"><#=items_map[67006].itemName#>
        </label><span id="s1_<#=items_map[67006].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67006].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67007].itemCode#>" data-position="0"><#=items_map[67007].itemName#>
        </label><span id="s1_<#=items_map[67007].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67007].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67008].itemCode#>" data-position="0"><#=items_map[67008].itemName#>
        </label><span id="s1_<#=items_map[67008].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67008].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67009].itemCode#>" data-position="0"><#=items_map[67009].itemName#>
        </label><span id="s1_<#=items_map[67009].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67009].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67010].itemCode#>" data-position="0"><#=items_map[67010].itemName#>
        </label><span id="s1_<#=items_map[67010].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67010].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67011].itemCode#>" data-position="0"><#=items_map[67011].itemName#>
        </label><span id="s1_<#=items_map[67011].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67011].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67012].itemCode#>" data-position="0"><#=items_map[67012].itemName#>
        </label><span id="s1_<#=items_map[67012].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67012].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game1" type="radio" value="<#=items_map[67013].itemCode#>" data-position="0"><#=items_map[67013].itemName#>
        </label><span id="s1_<#=items_map[67013].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67013].odds.toFixed(2)#></span>
    </td>
</tr>         


<tr style="background-color:white">
    <td class="title_td2" style="text-align:center;" rowspan="6">
      	  正码二
    </td>
    <td>
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67001].itemCode#>" data-position="1"><#=items_map[67001].itemName#>
        </label><span id="s2_<#=items_map[67001].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67001].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67002].itemCode#>" data-position="1"><#=items_map[67002].itemName#>
        </label><span id="s2_<#=items_map[67002].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67002].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67003].itemCode#>" data-position="1"><#=items_map[67003].itemName#>
        </label><span id="s2_<#=items_map[67003].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67003].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67004].itemCode#>" data-position="1"><#=items_map[67004].itemName#>
        </label><span id="s2_<#=items_map[67004].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67004].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67005].itemCode#>" data-position="1"><#=items_map[67005].itemName#>
        </label><span id="s2_<#=items_map[67005].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67005].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67006].itemCode#>" data-position="1"><#=items_map[67006].itemName#>
        </label><span id="s2_<#=items_map[67006].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67006].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67007].itemCode#>" data-position="1"><#=items_map[67007].itemName#>
        </label><span id="s2_<#=items_map[67007].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67007].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67008].itemCode#>" data-position="1"><#=items_map[67008].itemName#>
        </label><span id="s2_<#=items_map[67008].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67008].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67009].itemCode#>" data-position="1"><#=items_map[67009].itemName#>
        </label><span id="s2_<#=items_map[67009].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67009].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67010].itemCode#>" data-position="1"><#=items_map[67010].itemName#>
        </label><span id="s2_<#=items_map[67010].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67010].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67011].itemCode#>" data-position="1"><#=items_map[67011].itemName#>
        </label><span id="s2_<#=items_map[67011].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67011].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67012].itemCode#>" data-position="1"><#=items_map[67012].itemName#>
        </label><span id="s2_<#=items_map[67012].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67012].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game2" type="radio" value="<#=items_map[67013].itemCode#>" data-position="1"><#=items_map[67013].itemName#>
        </label><span id="s2_<#=items_map[67013].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67013].odds.toFixed(2)#></span>
    </td>
</tr>       


<tr style="background-color:white">
    <td class="title_td3" style="text-align:center;" rowspan="6">
      	  正码三
    </td>
    <td>
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67001].itemCode#>" data-position="2"><#=items_map[67001].itemName#>
        </label><span id="s3_<#=items_map[67001].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67001].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67002].itemCode#>" data-position="2"><#=items_map[67002].itemName#>
        </label><span id="s3_<#=items_map[67002].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67002].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67003].itemCode#>" data-position="2"><#=items_map[67003].itemName#>
        </label><span id="s3_<#=items_map[67003].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67003].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67004].itemCode#>" data-position="2"><#=items_map[67004].itemName#>
        </label><span id="s3_<#=items_map[67004].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67004].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67005].itemCode#>" data-position="2"><#=items_map[67005].itemName#>
        </label><span id="s3_<#=items_map[67005].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67005].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67006].itemCode#>" data-position="2"><#=items_map[67006].itemName#>
        </label><span id="s3_<#=items_map[67006].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67006].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67007].itemCode#>" data-position="2"><#=items_map[67007].itemName#>
        </label><span id="s3_<#=items_map[67007].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67007].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67008].itemCode#>" data-position="2"><#=items_map[67008].itemName#>
        </label><span id="s3_<#=items_map[67008].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67008].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67009].itemCode#>" data-position="2"><#=items_map[67009].itemName#>
        </label><span id="s3_<#=items_map[67009].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67009].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67010].itemCode#>" data-position="2"><#=items_map[67010].itemName#>
        </label><span id="s3_<#=items_map[67010].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67010].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67011].itemCode#>" data-position="2"><#=items_map[67011].itemName#>
        </label><span id="s3_<#=items_map[67011].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67011].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67012].itemCode#>" data-position="2"><#=items_map[67012].itemName#>
        </label><span id="s3_<#=items_map[67012].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67012].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game3" type="radio" value="<#=items_map[67013].itemCode#>" data-position="2"><#=items_map[67013].itemName#>
        </label><span id="s3_<#=items_map[67013].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67013].odds.toFixed(2)#></span>
    </td>
</tr>       


<tr style="background-color:white">
    <td class="title_td4" style="text-align:center;" rowspan="6">
      	  正码四
    </td>
    <td>
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67001].itemCode#>" data-position="3"><#=items_map[67001].itemName#>
        </label><span id="s4_<#=items_map[67001].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67001].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67002].itemCode#>" data-position="3"><#=items_map[67002].itemName#>
        </label><span id="s4_<#=items_map[67002].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67002].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67003].itemCode#>" data-position="3"><#=items_map[67003].itemName#>
        </label><span id="s4_<#=items_map[67003].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67003].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67004].itemCode#>" data-position="3"><#=items_map[67004].itemName#>
        </label><span id="s4_<#=items_map[67004].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67004].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67005].itemCode#>" data-position="3"><#=items_map[67005].itemName#>
        </label><span id="s4_<#=items_map[67005].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67005].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67006].itemCode#>" data-position="3"><#=items_map[67006].itemName#>
        </label><span id="s4_<#=items_map[67006].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67006].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67007].itemCode#>" data-position="3"><#=items_map[67007].itemName#>
        </label><span id="s4_<#=items_map[67007].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67007].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67008].itemCode#>" data-position="3"><#=items_map[67008].itemName#>
        </label><span id="s4_<#=items_map[67008].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67008].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67009].itemCode#>" data-position="3"><#=items_map[67009].itemName#>
        </label><span id="s4_<#=items_map[67009].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67009].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67010].itemCode#>" data-position="3"><#=items_map[67010].itemName#>
        </label><span id="s4_<#=items_map[67010].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67010].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67011].itemCode#>" data-position="3"><#=items_map[67011].itemName#>
        </label><span id="s4_<#=items_map[67011].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67011].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67012].itemCode#>" data-position="3"><#=items_map[67012].itemName#>
        </label><span id="s4_<#=items_map[67012].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67012].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game4" type="radio" value="<#=items_map[67013].itemCode#>" data-position="3"><#=items_map[67013].itemName#>
        </label><span id="s4_<#=items_map[67013].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67013].odds.toFixed(2)#></span>
    </td>
</tr>


<tr style="background-color:white">
    <td class="title_td5" style="text-align:center;" rowspan="6">
      	  正码五
    </td>
    <td>
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67001].itemCode#>" data-position="4"><#=items_map[67001].itemName#>
        </label><span id="s5_<#=items_map[67001].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67001].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67002].itemCode#>" data-position="4"><#=items_map[67002].itemName#>
        </label><span id="s5_<#=items_map[67002].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67002].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67003].itemCode#>" data-position="4"><#=items_map[67003].itemName#>
        </label><span id="s5_<#=items_map[67003].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67003].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67004].itemCode#>" data-position="4"><#=items_map[67004].itemName#>
        </label><span id="s5_<#=items_map[67004].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67004].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67005].itemCode#>" data-position="4"><#=items_map[67005].itemName#>
        </label><span id="s5_<#=items_map[67005].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67005].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67006].itemCode#>" data-position="4"><#=items_map[67006].itemName#>
        </label><span id="s5_<#=items_map[67006].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67006].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67007].itemCode#>" data-position="4"><#=items_map[67007].itemName#>
        </label><span id="s5_<#=items_map[67007].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67007].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67008].itemCode#>" data-position="4"><#=items_map[67008].itemName#>
        </label><span id="s5_<#=items_map[67008].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67008].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67009].itemCode#>" data-position="4"><#=items_map[67009].itemName#>
        </label><span id="s5_<#=items_map[67009].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67009].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67010].itemCode#>" data-position="4"><#=items_map[67010].itemName#>
        </label><span id="s5_<#=items_map[67010].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67010].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67011].itemCode#>" data-position="4"><#=items_map[67011].itemName#>
        </label><span id="s5_<#=items_map[67011].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67011].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67012].itemCode#>" data-position="4"><#=items_map[67012].itemName#>
        </label><span id="s5_<#=items_map[67012].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67012].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game5" type="radio" value="<#=items_map[67013].itemCode#>" data-position="4"><#=items_map[67013].itemName#>
        </label><span id="s5_<#=items_map[67013].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67013].odds.toFixed(2)#></span>
    </td>
</tr>


<tr style="background-color:white">
    <td class="title_td6" style="text-align:center;" rowspan="6">
      	  正码六
    </td>
    <td>
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67001].itemCode#>" data-position="5"><#=items_map[67001].itemName#>
        </label><span id="s6_<#=items_map[67001].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67001].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67002].itemCode#>" data-position="5"><#=items_map[67002].itemName#>
        </label><span id="s6_<#=items_map[67002].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67002].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67003].itemCode#>" data-position="5"><#=items_map[67003].itemName#>
        </label><span id="s6_<#=items_map[67003].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67003].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67004].itemCode#>" data-position="5"><#=items_map[67004].itemName#>
        </label><span id="s6_<#=items_map[67004].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67004].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67005].itemCode#>" data-position="5"><#=items_map[67005].itemName#>
        </label><span id="s6_<#=items_map[67005].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67005].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67006].itemCode#>" data-position="5"><#=items_map[67006].itemName#>
        </label><span id="s6_<#=items_map[67006].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67006].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67007].itemCode#>" data-position="5"><#=items_map[67007].itemName#>
        </label><span id="s6_<#=items_map[67007].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67007].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67008].itemCode#>" data-position="5"><#=items_map[67008].itemName#>
        </label><span id="s6_<#=items_map[67008].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67008].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67009].itemCode#>" data-position="5"><#=items_map[67009].itemName#>
        </label><span id="s6_<#=items_map[67009].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67009].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67010].itemCode#>" data-position="5"><#=items_map[67010].itemName#>
        </label><span id="s6_<#=items_map[67010].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67010].odds.toFixed(2)#></span>
    </td>
    <td>
        &nbsp;
    </td>
</tr>
<tr style="background-color:white">
    <td>
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67011].itemCode#>" data-position="5"><#=items_map[67011].itemName#>
        </label><span id="s6_<#=items_map[67011].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67011].odds.toFixed(2)#></span>
    </td>
    <td>
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67012].itemCode#>" data-position="5"><#=items_map[67012].itemName#>
        </label><span id="s6_<#=items_map[67012].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67012].odds.toFixed(2)#></span>
    </td>
    <td style="">
        <label class="nap_label">
            <input name="game6" type="radio" value="<#=items_map[67013].itemCode#>" data-position="5"><#=items_map[67013].itemName#>
        </label><span id="s6_<#=items_map[67013].itemCode#>" style="color:#d63e35;font-weight:bold"><#=items_map[67013].odds.toFixed(2)#></span>
    </td>
</tr>

<tr style="background-color:white;">
    <td colspan="4" class="Send">
        <table width="100%">
            <tbody>
            <tr>
                <td id="insOdds" style="width:38%;border:0px;text-align:right;font-size:12px"></td>
                <td style="width:62%;border:0px;text-align:left">&nbsp;&nbsp;&nbsp;
				<input type="button" class="no" id="btnReset"  value="重设">&nbsp;&nbsp;&nbsp;
				<input type="button" class="yes" id="btnSubmit" value="确认"></td>
            </tr>
            </tbody>
        </table>
    </td>
</tr>
</tbody>
<table>
</script>
<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/NAP.js" type="text/javascript"></script>