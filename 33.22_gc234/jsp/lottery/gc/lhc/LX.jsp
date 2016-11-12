<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">
    <!--游戏区块-->
    <div id="lx_game" class="col-xs-9 Game">
        <form name="lt_form" method="post" action="" onsubmit="return false;"
              class="Aside">
            <input type="hidden" name="gid" id="gid" value="551082">

            <div id="showTable">
                <!--連肖类别-->
                <div class="round-table">
                    <table id="table1" style="background-color:white" class="MobileTable">
                        <tbody>
                        <tr class="title_tr">
                            <td><label class="padding_label"><input name="rtype" id="s_LX2" type="radio" value="LX2">二肖连</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_LX3" type="radio" value="LX3">三肖连</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_LX4" type="radio" value="LX4">四肖连</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_LX5" type="radio" value="LX5">五肖连</label>
                            </td>
                        </tr>
                        <tr class="title_tr">
                            <td><label class="padding_label"><input name="rtype" id="s_LF2" type="radio" value="LF2">二尾碰</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_LF3" type="radio" value="LF3">三尾碰</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_LF4" type="radio" value="LF4">四尾碰</label>
                            </td>
                            <td><label class="padding_label"><input name="rtype" id="s_LF5" type="radio" value="LF5">五尾碰</label>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!--連肖table-->
                <div class="round-table" id="roundtable2">
                    <table id="table2" style="text-align:center;background-color:white;">
                        <tbody>
                        <tr class="title_tr">
                            <td style="width:10%;">连肖</td>
                            <td style="width:22%;">号码</td>
                            <td colspan="2" style="width:18%;">勾选</td>
                            <td style="width:10%;">连肖</td>
                            <td style="width:22%;">号码</td>
                            <td colspan="2" style="width:18%;">勾选</td>
                        </tr>
                        <tr style="text-align:center;">
                            <td class="title_td2">鼠</td>
                            <td style="background-color:#e5eaee;text-align:left">09, 21, 33, 45</td>
                            <td width="40px"><label class="padding_label"><input
                                    type="checkbox" name="lx[]" value="A1"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;width:9%;" id="A1"></td>
                            <td class="title_td2">牛</td>
                            <td style="background-color:#e5eaee;text-align:left">08, 20, 32, 44</td>
                            <td width="40px"><label class="padding_label"><input type="checkbox" name="lx[]" value="A2"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;width:9%;" id="A2"></td>
                        </tr>
                        <tr>
                            <td class="title_td2">虎</td>
                            <td style="background-color:#e5eaee;text-align:left">07, 19, 31, 43</td>
                            <td width="40px"><label class="padding_label"><input type="checkbox" name="lx[]" value="A3"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="A3"></td>
                            <td class="title_td2">兔</td>
                            <td style="background-color:#e5eaee;text-align:left">06, 18, 30, 42</td>
                            <td width="40px"><label class="padding_label"><input type="checkbox" name="lx[]" value="A4"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="A4"></td>
                        </tr>
                        <tr>
                            <td class="title_td2">龙</td>
                            <td style="background-color:#e5eaee;text-align:left">05, 17, 29, 41</td>
                            <td width="40px"><label class="padding_label"><input type="checkbox" name="lx[]" value="A5"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="A5"></td>
                            <td class="title_td2">蛇</td>
                            <td style="background-color:#e5eaee;text-align:left">04, 16, 28, 40</td>
                            <td width="40px"><label class="padding_label"><input type="checkbox" name="lx[]" value="A6"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="A6"></td>
                        </tr>
                        <tr>
                            <td class="title_td2">马</td>
                            <td style="background-color:#e5eaee;text-align:left">03, 15, 27, 39</td>
                            <td width="40px"><label class="padding_label"><input type="checkbox" name="lx[]" value="A7"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="A7"></td>
                            <td class="title_td2">羊</td>
                            <td style="background-color:#e5eaee;text-align:left">02, 14, 26, 38</td>
                            <td width="40px"><label class="padding_label"><input type="checkbox" name="lx[]" value="A8"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="A8"></td>
                        </tr>
                        <tr>
                            <td class="title_td2">猴</td>
                            <td style="background-color:#e5eaee;text-align:left">01, 13, 25, 37, 49</td>
                            <td width="40px"><label class="padding_label"><input type="checkbox" name="lx[]" value="A9"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="A9"></td>
                            <td class="title_td2">鸡</td>
                            <td style="background-color:#e5eaee;text-align:left">12, 24, 36, 48</td>
                            <td width="40px"><label class="padding_label"><input type="checkbox" name="lx[]" value="AA"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="AA"></td>
                        </tr>
                        <tr>
                            <td class="title_td2">狗</td>
                            <td style="background-color:#e5eaee;text-align:left">11, 23, 35, 47</td>
                            <td width="40px"><label class="padding_label"><input type="checkbox" name="lx[]" value="AB"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="AB"></td>
                            <td class="title_td2">猪</td>
                            <td style="background-color:#e5eaee;text-align:left">10, 22, 34, 46</td>
                            <td width="40px"><label class="padding_label"><input type="checkbox" name="lx[]" value="AC"></label>
                            </td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="AC"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="round-table" id="roundtable3">
                    <table id="table3" style="text-align:center;background-color:white;">
                        <tbody>
                        <tr class="title_tr">
                            <td style="width:10%;">尾数</td>
                            <td style="width:22%;">号码</td>
                            <td nowrap="nowrap" colspan="2" style="width:18%;">勾选</td>
                            <td style="width:10%;">尾数</td>
                            <td style="width:22%;">号码</td>
                            <td nowrap="nowrap" colspan="2" style="width:18%;">勾选</td>
                        </tr>
                        <tr style="text-align:center;">
                            <td class="title_td2">0</td>
                            <td style="background-color:#e5eaee;text-align:left">10, 20 ,30 ,40</td>
                            <td><label class="padding_label">&nbsp;<input type="checkbox" name="lf[]" value="0">&nbsp;
                            </label></td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;width:9%;" id="Fn0"></td>
                            <td class="title_td2">1</td>
                            <td style="background-color:#e5eaee;text-align:left">01, 11, 21, 31, 41</td>
                            <td><label class="padding_label">&nbsp;<input type="checkbox" name="lf[]" value="1">&nbsp;
                            </label></td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;width:9%;" id="Fn1"></td>
                        </tr>
                        <tr>
                            <td class="title_td2">2</td>
                            <td style="background-color:#e5eaee;text-align:left">02, 12, 22, 32, 42</td>
                            <td><label class="padding_label">&nbsp;<input type="checkbox" name="lf[]" value="2">&nbsp;
                            </label></td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="Fn2"></td>
                            <td class="title_td2">3</td>
                            <td style="background-color:#e5eaee;text-align:left">03, 13, 23, 33, 43</td>
                            <td><label class="padding_label">&nbsp;<input type="checkbox" name="lf[]" value="3">&nbsp;
                            </label></td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="Fn3"></td>
                        </tr>
                        <tr>
                            <td class="title_td2">4</td>
                            <td style="background-color:#e5eaee;text-align:left">04, 14, 24, 34, 44</td>
                            <td><label class="padding_label">&nbsp;<input type="checkbox" name="lf[]" value="4">&nbsp;
                            </label></td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="Fn4"></td>
                            <td class="title_td2">5</td>
                            <td style="background-color:#e5eaee;text-align:left">05, 15, 25, 35, 45</td>
                            <td><label class="padding_label">&nbsp;<input type="checkbox" name="lf[]" value="5">&nbsp;
                            </label></td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="Fn5"></td>
                        </tr>
                        <tr style="text-align:center;">
                            <td class="title_td2">6</td>
                            <td style="background-color:#e5eaee;text-align:left">06, 16, 26, 36, 46</td>
                            <td><label class="padding_label">&nbsp;<input type="checkbox" name="lf[]" value="6">&nbsp;
                            </label></td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="Fn6"></td>
                            <td class="title_td2">7</td>
                            <td style="background-color:#e5eaee;text-align:left">07, 17, 27, 37, 47</td>
                            <td><label class="padding_label">&nbsp;<input type="checkbox" name="lf[]" value="7">&nbsp;
                            </label></td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="Fn7"></td>
                        </tr>
                        <tr style="text-align:center;">
                            <td class="title_td2">8</td>
                            <td style="background-color:#e5eaee;text-align:left">08, 18, 28, 38, 48</td>
                            <td><label class="padding_label">&nbsp;<input type="checkbox" name="lf[]" value="8">&nbsp;
                            </label></td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="Fn8"></td>
                            <td class="title_td2">9</td>
                            <td style="background-color:#e5eaee;text-align:left">09, 19, 29, 39, 49</td>
                            <td><label class="padding_label">&nbsp;<input type="checkbox" name="lf[]" value="9">&nbsp;
                            </label></td>
                            <td style="color:#d63e35;font-weight:bold;font-size:12px;" id="Fn9"></td>
                        </tr>
                        </tbody>
                    </table>
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
    <!--组合窗口-->
    <div id="ShowBall" class="col-xs-3">
        <h2>组合窗口</h2>
        <div id="Ball">
			<p>请选择下注类别</p>
            <p></p>
            <span class="cursor-box"></span>
        </div>
    </div>
    <!--下注单-->
    <div id="lx_msgbox" class="col-xs-3 message_box" style="display: none;">
        <div class="inner">
            <div class="msg-title">六合彩 自选不中 下注单</div>
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
                    <input type="hidden" name="gid" value="551084">
                    <input type="hidden" name="concede_r" value="CH_4">
                    <input type="hidden" name="radio_r" value="10000000">
                </form>
            </div>
        </div>
	</div>
</div>
<script type="text/template" id="contentTpl_LX">
<table id="table2" style="text-align:center;background-color:white;">
    <tbody>
    <tr class="title_tr">
        <td style="width:10%;">连肖</td>
        <td style="width:22%;">号码</td>
        <td colspan="2" style="width:18%;">勾选</td>
        <td style="width:10%;">连肖</td>
        <td style="width:22%;">号码</td>
        <td colspan="2" style="width:18%;">勾选</td>
    </tr>
	<tr style="text-align:center;">
	
	<#for(var i = 0; i < list.length; i ++){#>
		<td class="title_td2"><#=list[i].itemName#></td>
        <td style="background-color:#e5eaee;text-align:left"><#=list[i].displayNo#></td>
        <td width="40px">
			<label class="padding_label">
				<input type="checkbox" name="lx[]" value="<#=list[i].itemName#>" 
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
<script type="text/template" id="contentTpl_LF">
<table id="table3" style="text-align:center;background-color:white;">
    <tbody>
    <tr class="title_tr">
        <td style="width:10%;">尾数</td>
        <td style="width:22%;">号码</td>
        <td nowrap="nowrap" colspan="2" style="width:18%;">勾选</td>
        <td style="width:10%;">尾数</td>
        <td style="width:22%;">号码</td>
        <td nowrap="nowrap" colspan="2" style="width:18%;">勾选</td>
    </tr>
    <tr style="text-align:center;">

	<#for(var i = 0; i < list.length; i ++){#>
		<td class="title_td2"><#=list[i].itemName#></td>
        <td style="background-color:#e5eaee;text-align:left"><#=list[i].displayNo#></td>
        <td>
			<label class="padding_label">&nbsp;
				<input type="checkbox" name="lf[]" value="<#=list[i].itemName#>" 
							itemCode="<#=list[i].itemCode#>" displayNo="<#=list[i].displayNo#>" odds="<#=list[i].odds.toFixed(2)#>" >&nbsp;
        	</label>
		</td>
        <td style="color:#d63e35;font-weight:bold;font-size:12px;width:9%;" id="Fn0"><#=list[i].odds.toFixed(2)#></td>
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
<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/ArrayList.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/lianma_util.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/LX.js" type="text/javascript"></script>
