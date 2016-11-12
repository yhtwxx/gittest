<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">
    <!--游戏区块-->
    <div id="nx_game" class="col-xs-9 Game">
        <form name="lt_form" method="post" action="" onsubmit="return false;"
              class="Aside">
            <input type="hidden" name="gid" id="gid" value="551082">

            <div id="showTable">
                <!--合肖类别-->
                <div class="round-table">
                    <table id="table1" style="background-color:white" class="MobileTable">
                        <tbody>
                        <tr class="title_tr">
                            <td><label class="padding_label"><input name="rtype" id="s_HX2" type="radio" value="HX2">二肖</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_HX3" type="radio" value="HX3">三肖</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_HX4" type="radio" value="HX4">四肖</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_HX5" type="radio" value="HX5">五肖</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_HX6" type="radio" value="HX6" checked>六肖</label>
                            </td>
                        </tr>
                        <tr class="title_tr">
                            <td><label class="padding_label"><input name="rtype" id="s_HX7" type="radio" value="HX7">七肖</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_HX8" type="radio" value="HX8">八肖</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_HX9" type="radio" value="HX9">九肖</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_HX10" type="radio" value="HX10">十肖</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_HX11" type="radio" value="HX11">十一肖</label>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="quick-bet tabs-box" style="display: none;">
                	<span type="poultry">家禽</span>
                	<span type="Wildbeast">野兽</span>
                </div>
                <!--合肖table-->
                <div class="round-table" id="roundtable2">

                </div>
                <div class="round-table">
                    <table id="table4" style="text-align:center;">
                        <tbody>
                        <tr>
                            <td class="Send">
                                <input class="no" name="btnReset" type="button" value="取消">
                                <input class="yes" name="btnSubmit" type="button" value="送出">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
    </div>
    <!--下注单-->
    <div id="nx_msgbox" class="col-xs-3 message_box" style="display: none;">
        <div class="inner">
            <div class="msg-title">六合彩 合肖 下注单</div>
            <div class="msg-text">
                <form name="LAYOUTFORM" action="" method="post"
                      onsubmit="return false">
                    <div class="PlayType">
                        
                    </div>
                    <div id="message_show">
                        
                    </div>
                    	下注金额:
                    <input type="text" pattern="[0-9]*" min="0" id="gold" name="gold" class="GoldQQ msgbox" 
                           data-callback-id="15" autocomplete="off" style="border: 1px solid rgb(187, 187, 187);"><br>

                    <div style="display: none;">
                        	可赢金额:
                        <b id="pc">0.00</b><br>
                    </div>
                   		 最低限额: 1<br>
                   		 单注限额: 10<br>
                    	单号限额: 100
                    <div style="display: inline-block; padding-left: 20px">
                        <input type="button" name="btnCancel" value="取消" class="cancel_cen">
                        &nbsp;&nbsp;
                        <input type="button" name="btnSubmit" value="确定" class="submit_cen">
                    </div>
                </form>
            </div>
        </div>
	</div>
	<!--组合窗口-->
    <div id="ShowBall" class="col-xs-3">
        <h2>组合窗口</h2>
        <div id="Ball">
			<p>请选择下注类别</p>
            <p></p>
            <span class="cursor-box"></span>
        </div>
    </div>
</div>
<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/ArrayList.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/lianma_util.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/NX.js" type="text/javascript"></script>
<script type="text/template" id="contentTpl">
<table id="table2" style="text-align:center;background-color:white;">
    <tbody>
    <tr class="title_tr">
        <td style="width:10%;">合肖</td>
        <td style="width:22%;">号码</td>
        <td colspan="2" style="width:18%;">勾选</td>
        <td style="width:10%;">合肖</td>
        <td style="width:22%;">号码</td>
        <td colspan="2" style="width:18%;">勾选</td>
    </tr>
	<tr style="text-align:center;">
	<#for(var i = 0; i < list.length; i ++){#>
		<td class="title_td2"><#=list[i].itemName#></td>
        <td style="background-color:#e5eaee;text-align:left"><#=list[i].displayNo#></td>
        <td width="40px">
			<label class="padding_label">
				<input type="checkbox" name="nx[]" value="<#=list[i].itemName#>" 
							itemCode="<#=list[i].itemCode#>" displayNo="<#=list[i].displayNo#>" odds="<#=list[i].odds.toFixed(2)#>" >
			</label>
        </td>
        <td style="color:#d63e35;font-weight:bold;font-size:12px;width:9%;" id="A1"><#=list[i].odds.toFixed(2)#></td>
		<#if(i == list.length){break;}#>
		<#if((i+1)%2 == 0){#>
			</tr>
    		<tr>
		<#}#>
	<#}#>
    </tr>
    </tbody>
</table>
</script>
