<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">
    <!--游戏区块-->
    <div id="in1_game" class="Game">
        <form name="lt_form" method="post" action="/member/lt_in1/lt_in1_order.php" target="_top"
              onsubmit="return false" class="Aside">
            <input type="hidden" name="gid" id="gid" value="551082">
            <input type="hidden" name="IN1typeI" id="IN1typeI">
            <input type="hidden" name="in1_odds" id="in1_odds" value="">

            <div id="showTable">
                <!--中一类别-->
                <div class="round-table">
                    <table id="table1" style="bakcground-color:white;" class="MobileTable">
                        <tbody>
                        <tr class="title_tr">
                            <td>类别</td>
                            <td nowrap="nowrap"><label class="padding_label"><input name="rtypeI" type="radio"
                                                                                    value="IN15">五中一</label></td>
                            <td nowrap="nowrap"><label class="padding_label"><input name="rtypeI" type="radio"
                                                                                    value="IN16">六中一</label></td>
                            <td nowrap="nowrap"><label class="padding_label"><input name="rtypeI" type="radio"
                                                                                    value="IN17">七中一</label></td>
                            <td nowrap="nowrap"><label class="padding_label"><input name="rtypeI" type="radio"
                                                                                    value="IN18">八中一</label></td>
                            <td nowrap="nowrap"><label class="padding_label"><input name="rtypeI" type="radio"
                                                                                    value="IN19">九中一</label></td>
                            <td nowrap="nowrap"><label class="padding_label"><input name="rtypeI" type="radio"
                                                                                    value="IN1A">十中一</label></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!--中一table-->
                <div class="round-table">
                    <table id="table2" style="text-align:center;">
                        <tbody>
                        <tr class="title_tr">
                            <td width="48px"> 号码</td>
                            <td> 勾选</td>
                            <td width="48px"> 号码</td>
                            <td> 勾选</td>
                            <td width="48px"> 号码</td>
                            <td> 勾选</td>
                            <td width="48px"> 号码</td>
                            <td> 勾选</td>
                            <td width="48px"> 号码</td>
                            <td style="width:10%"> 勾选</td>
                        </tr>
                        <tr>
                            <td class="bColorR"><span>01</span></td>
                            <td><label class="padding_label">
                                <span id="in1_01"></span><br>
                                <input type="checkbox" name="num[]" value="01" disabled="disabled"></label></td>
                            <td class="bColorG"><span>11</span></td>
                            <td><label class="padding_label">
                                <span id="in1_11"></span><br>
                                <input type="checkbox" name="num[]" value="11" disabled="disabled"></label></td>
                            <td class="bColorG"><span>21</span></td>
                            <td><label class="padding_label">
                                <span id="in1_21"></span><br>
                                <input type="checkbox" name="num[]" value="21" disabled="disabled"></label></td>
                            <td class="bColorB"><span>31</span></td>
                            <td style="background-color: yellow;"><label class="padding_label">
                                <span id="in1_31"></span><br>
                                <input type="checkbox" name="num[]" value="31" disabled="disabled"></label></td>
                            <td class="bColorB"><span>41</span></td>
                            <td><label class="padding_label">
                                <span id="in1_41"></span><br>
                                <input type="checkbox" name="num[]" value="41" disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorR"><span>02</span></td>
                            <td><label class="padding_label">
                                <span id="in1_02"></span><br>
                                <input type="checkbox" name="num[]" value="02" disabled="disabled"></label></td>
                            <td class="bColorR"><span>12</span></td>
                            <td><label class="padding_label">
                                <span id="in1_12"></span><br>
                                <input type="checkbox" name="num[]" value="12" disabled="disabled"></label></td>
                            <td class="bColorG"><span>22</span></td>
                            <td><label class="padding_label">
                                <span id="in1_22"></span><br>
                                <input type="checkbox" name="num[]" value="22" disabled="disabled"></label></td>
                            <td class="bColorG"><span>32</span></td>
                            <td><label class="padding_label">
                                <span id="in1_32"></span><br>
                                <input type="checkbox" name="num[]" value="32" disabled="disabled"></label></td>
                            <td class="bColorB"><span>42</span></td>
                            <td><label class="padding_label">
                                <span id="in1_42"></span><br>
                                <input type="checkbox" name="num[]" value="42" disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>03</span></td>
                            <td><label class="padding_label">
                                <span id="in1_03"></span><br>
                                <input type="checkbox" name="num[]" value="03" disabled="disabled"></label></td>
                            <td class="bColorR"><span>13</span></td>
                            <td><label class="padding_label">
                                <span id="in1_13"></span><br>
                                <input type="checkbox" name="num[]" value="13" disabled="disabled"></label></td>
                            <td class="bColorR"><span>23</span></td>
                            <td><label class="padding_label">
                                <span id="in1_23"></span><br>
                                <input type="checkbox" name="num[]" value="23" disabled="disabled"></label></td>
                            <td class="bColorG"><span>33</span></td>
                            <td><label class="padding_label">
                                <span id="in1_33"></span><br>
                                <input type="checkbox" name="num[]" value="33" disabled="disabled"></label></td>
                            <td class="bColorG"><span>43</span></td>
                            <td><label class="padding_label">
                                <span id="in1_43"></span><br>
                                <input type="checkbox" name="num[]" value="43" disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>04</span></td>
                            <td><label class="padding_label">
                                <span id="in1_04"></span><br>
                                <input type="checkbox" name="num[]" value="04" disabled="disabled"></label></td>
                            <td class="bColorB"><span>14</span></td>
                            <td><label class="padding_label">
                                <span id="in1_14"></span><br>
                                <input type="checkbox" name="num[]" value="14" disabled="disabled"></label></td>
                            <td class="bColorR"><span>24</span></td>
                            <td><label class="padding_label">
                                <span id="in1_24"></span><br>
                                <input type="checkbox" name="num[]" value="24" disabled="disabled"></label></td>
                            <td class="bColorR"><span>34</span></td>
                            <td><label class="padding_label">
                                <span id="in1_34"></span><br>
                                <input type="checkbox" name="num[]" value="34" disabled="disabled"></label></td>
                            <td class="bColorG"><span>44</span></td>
                            <td><label class="padding_label">
                                <span id="in1_44"></span><br>
                                <input type="checkbox" name="num[]" value="44" disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorG"><span>05</span></td>
                            <td><label class="padding_label">
                                <span id="in1_05"></span><br>
                                <input type="checkbox" name="num[]" value="05" disabled="disabled"></label></td>
                            <td class="bColorB"><span>15</span></td>
                            <td><label class="padding_label">
                                <span id="in1_15"></span><br>
                                <input type="checkbox" name="num[]" value="15" disabled="disabled"></label></td>
                            <td class="bColorB"><span>25</span></td>
                            <td><label class="padding_label">
                                <span id="in1_25"></span><br>
                                <input type="checkbox" name="num[]" value="25" disabled="disabled"></label></td>
                            <td class="bColorR"><span>35</span></td>
                            <td><label class="padding_label">
                                <span id="in1_35"></span><br>
                                <input type="checkbox" name="num[]" value="35" disabled="disabled"></label></td>
                            <td class="bColorR"><span>45</span></td>
                            <td><label class="padding_label">
                                <span id="in1_45"></span><br>
                                <input type="checkbox" name="num[]" value="45" disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorG"><span>06</span></td>
                            <td><label class="padding_label">
                                <span id="in1_06"></span><br>
                                <input type="checkbox" name="num[]" value="06" disabled="disabled"></label></td>
                            <td class="bColorG"><span>16</span></td>
                            <td><label class="padding_label">
                                <span id="in1_16"></span><br>
                                <input type="checkbox" name="num[]" value="16" disabled="disabled"></label></td>
                            <td class="bColorB"><span>26</span></td>
                            <td><label class="padding_label">
                                <span id="in1_26"></span><br>
                                <input type="checkbox" name="num[]" value="26" disabled="disabled"></label></td>
                            <td class="bColorB"><span>36</span></td>
                            <td><label class="padding_label">
                                <span id="in1_36"></span><br>
                                <input type="checkbox" name="num[]" value="36" disabled="disabled"></label></td>
                            <td class="bColorR"><span>46</span></td>
                            <td><label class="padding_label">
                                <span id="in1_46"></span><br>
                                <input type="checkbox" name="num[]" value="46" disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorR"><span>07</span></td>
                            <td><label class="padding_label">
                                <span id="in1_07"></span><br>
                                <input type="checkbox" name="num[]" value="07" disabled="disabled"></label></td>
                            <td class="bColorG"><span>17</span></td>
                            <td><label class="padding_label">
                                <span id="in1_17"></span><br>
                                <input type="checkbox" name="num[]" value="17" disabled="disabled"></label></td>
                            <td class="bColorG"><span>27</span></td>
                            <td><label class="padding_label">
                                <span id="in1_27"></span><br>
                                <input type="checkbox" name="num[]" value="27" disabled="disabled"></label></td>
                            <td class="bColorB"><span>37</span></td>
                            <td><label class="padding_label">
                                <span id="in1_37"></span><br>
                                <input type="checkbox" name="num[]" value="37" disabled="disabled"></label></td>
                            <td class="bColorB"><span>47</span></td>
                            <td><label class="padding_label">
                                <span id="in1_47"></span><br>
                                <input type="checkbox" name="num[]" value="47" disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorR"><span>08</span></td>
                            <td><label class="padding_label">
                                <span id="in1_08"></span><br>
                                <input type="checkbox" name="num[]" value="08" disabled="disabled"></label></td>
                            <td class="bColorR"><span>18</span></td>
                            <td><label class="padding_label">
                                <span id="in1_18"></span><br>
                                <input type="checkbox" name="num[]" value="18" disabled="disabled"></label></td>
                            <td class="bColorG"><span>28</span></td>
                            <td><label class="padding_label">
                                <span id="in1_28"></span><br>
                                <input type="checkbox" name="num[]" value="28" disabled="disabled"></label></td>
                            <td class="bColorG"><span>38</span></td>
                            <td><label class="padding_label">
                                <span id="in1_38"></span><br>
                                <input type="checkbox" name="num[]" value="38" disabled="disabled"></label></td>
                            <td class="bColorB"><span>48</span></td>
                            <td><label class="padding_label">
                                <span id="in1_48"></span><br>
                                <input type="checkbox" name="num[]" value="48" disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>09</span></td>
                            <td><label class="padding_label">
                                <span id="in1_09"></span><br>
                                <input type="checkbox" name="num[]" value="09" disabled="disabled"></label></td>
                            <td class="bColorR"><span>19</span></td>
                            <td><label class="padding_label">
                                <span id="in1_19"></span><br>
                                <input type="checkbox" name="num[]" value="19" disabled="disabled"></label></td>
                            <td class="bColorR"><span>29</span></td>
                            <td><label class="padding_label">
                                <span id="in1_29"></span><br>
                                <input type="checkbox" name="num[]" value="29" disabled="disabled"></label></td>
                            <td class="bColorG"><span>39</span></td>
                            <td><label class="padding_label">
                                <span id="in1_39"></span><br>
                                <input type="checkbox" name="num[]" value="39" disabled="disabled"></label></td>
                            <td class="bColorG"><span>49</span></td>
                            <td><label class="padding_label">
                                <span id="in1_49"></span><br>
                                <input type="checkbox" name="num[]" value="49" disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>10</span></td>
                            <td><label class="padding_label">
                                <span id="in1_10"></span><br>
                                <input type="checkbox" name="num[]" value="10" disabled="disabled"></label></td>
                            <td class="bColorB"><span>20</span></td>
                            <td><label class="padding_label">
                                <span id="in1_20"></span><br>
                                <input type="checkbox" name="num[]" value="20" disabled="disabled"></label></td>
                            <td class="bColorR"><span>30</span></td>
                            <td><label class="padding_label">
                                <span id="in1_30"></span><br>
                                <input type="checkbox" name="num[]" value="30" disabled="disabled"></label></td>
                            <td class="bColorR"><span>40</span></td>
                            <td><label class="padding_label">
                                <span id="in1_40"></span><br>
                                <input type="checkbox" name="num[]" value="40" disabled="disabled"></label></td>
                            <td colspan="2" class="Send">
                                <input type="button" class="no_min" name="btnReset" value="取消" style="padding:0px;">
                                <input type="button" class="yes_min" name="btnSubmit" value="确定" style="padding:0px;">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
    </div>
    <!--组合窗口-->
    <div id="ShowBall">
        <h2>组合窗口</h2>

        <div id="Ball"><p>组合共 <span id="total-ball" style="color:#ffc400">1</span> 组</p>

            <p></p>

            <div style="color:#ffc400;font-weight:bold;clear:both;">组合1:</div>
            <p>01, 11, 21, 12, 03</p><span class="cursor-box"></span>

            <p></p>
        </div>
    </div>
</div>

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