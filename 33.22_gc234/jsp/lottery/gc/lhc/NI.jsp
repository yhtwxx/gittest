<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">
    <!--游戏区块-->
    <div id="ni_game" class="col-xs-9 Game">
        <form name="lt_form" method="post" action="/member/lt_ni/lt_ni_order.php" target="_top" onsubmit="return false"
              class="Aside">
            <input type="hidden" name="gid" id="gid" value="551082">

            <div id="showTable">
                <!--多选不中类别-->
                <div class="round-table" id="orders">
                    
                </div>
                <!--多选不中table-->
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
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="01"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>11</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="11"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>21</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="21"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>31</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="31"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>41</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="41"
                                                                    disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorR"><span>02</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="02"
                                                                    disabled="disabled"></label>
                            </td>
                            <td class="bColorR"><span>12</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="12"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>22</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="22"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>32</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="32"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>42</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="42"
                                                                    disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>03</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="03"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>13</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="13"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>23</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="23"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>33</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="33"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>43</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="43"
                                                                    disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>04</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="04"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>14</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="14"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>24</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="24"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>34</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="34"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>44</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="44"
                                                                    disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorG"><span>05</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="05"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>15</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="15"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>25</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="25"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>35</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="35"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>45</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="45"
                                                                    disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorG"><span>06</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="06"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>16</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="16"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>26</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="26"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>36</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="36"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>46</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="46"
                                                                    disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorR"><span>07</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="07"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>17</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="17"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>27</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="27"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>37</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="37"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>47</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="47"
                                                                    disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorR"><span>08</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="08"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>18</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="18"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>28</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="28"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>38</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="38"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>48</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="48"
                                                                    disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>09</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="09"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>19</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="19"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>29</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="29"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>39</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="39"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorG"><span>49</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="49"
                                                                    disabled="disabled"></label></td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>10</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="10"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorB"><span>20</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="20"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>30</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="30"
                                                                    disabled="disabled"></label></td>
                            <td class="bColorR"><span>40</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="40"
                                                                    disabled="disabled"></label></td>
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
    <div id="ShowBall" class="col-xs-3">
        <h2>组合窗口</h2>
        <div id="Ball">
        	<p>请选择下注类别</p>
            <p></p>
            <span class="cursor-box"></span>
        </div>
    </div>
    <!--下注单-->
    <div id="ni_msgbox" class="col-xs-3 message_box" style="display: none;">
        <div class="inner">
            <div class="msg-title">六合彩 自选不中 下注单</div>
            <div class="msg-text">
                <form name="LAYOUTFORM" action="" method="post"
                      onsubmit="return false">
                    <div class="PlayType">
                        
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
<script type="text/template" id="contentTpl">
<table id="table1" style="bakcground-color:white;" class="MobileTable">
    <tbody>
    <tr class="title_tr">
        <td>类别</td>
        <td nowrap="nowrap">
			<label class="padding_label">
				<input name="rtype" type="radio" value="<#=items_map[61801].itemCode#>" displayNo="<#=items_map[61801].displayNo#>" ><#=items_map[61801].itemName#>
			</label>
		</td>
        <td nowrap="nowrap">
			<label class="padding_label">
				<input name="rtype" type="radio" value="<#=items_map[61802].itemCode#>" displayNo="<#=items_map[61802].displayNo#>" ><#=items_map[61802].itemName#>
			</label>
		</td>
        <td nowrap="nowrap">	
			<label class="padding_label">
				<input name="rtype" type="radio" value="<#=items_map[61803].itemCode#>" displayNo="<#=items_map[61803].displayNo#>" ><#=items_map[61803].itemName#>
			</label>
		</td>
        <td nowrap="nowrap">
			<label class="padding_label">
				<input name="rtype" type="radio" value="<#=items_map[61804].itemCode#>" displayNo="<#=items_map[61804].displayNo#>" ><#=items_map[61804].itemName#>
			</label>
		</td>
        <td nowrap="nowrap">
			<label class="padding_label">
				<input name="rtype" type="radio" value="<#=items_map[61805].itemCode#>" displayNo="<#=items_map[61805].displayNo#>" ><#=items_map[61805].itemName#>
			</label>
		</td>
        <td nowrap="nowrap">	
			<label class="padding_label">
				<input name="rtype" type="radio" value="<#=items_map[61806].itemCode#>" displayNo="<#=items_map[61806].displayNo#>" ><#=items_map[61806].itemName#>
			</label>
		</td>
        <td nowrap="nowrap">
			<label class="padding_label">
				<input name="rtype" type="radio" value="<#=items_map[61807].itemCode#>" displayNo="<#=items_map[61807].displayNo#>" ><#=items_map[61807].itemName#>
			</label>
		</td>
        <td nowrap="nowrap">
			<label class="padding_label">
				<input name="rtype" type="radio" value="<#=items_map[61808].itemCode#>" displayNo="<#=items_map[61808].displayNo#>" ><#=items_map[61808].itemName#>
			</label>
		</td>
    </tr>
    <tr style="text-align:center;">
        <td>赔率</td>
        <td><span id="s_NI5" style="color:#d63e35;font-weight:bold"><#=items_map[61801].odds.toFixed(2)#></span></td>
        <td><span id="s_NI6" style="color:#d63e35;font-weight:bold"><#=items_map[61802].odds.toFixed(2)#></span></td>
        <td><span id="s_NI7" style="color:#d63e35;font-weight:bold"><#=items_map[61803].odds.toFixed(2)#></span></td>
        <td><span id="s_NI8" style="color:#d63e35;font-weight:bold"><#=items_map[61804].odds.toFixed(2)#></span></td>
        <td><span id="s_NI9" style="color:#d63e35;font-weight:bold"><#=items_map[61805].odds.toFixed(2)#></span></td>
        <td><span id="s_NIA" style="color:#d63e35;font-weight:bold"><#=items_map[61806].odds.toFixed(2)#></span></td>
        <td><span id="s_NIB" style="color:#d63e35;font-weight:bold"><#=items_map[61807].odds.toFixed(2)#></span></td>
        <td><span id="s_NIC" style="color:#d63e35;font-weight:bold"><#=items_map[61808].odds.toFixed(2)#></span></td>
    </tr>
    </tbody>
</table>
</script>
<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/ArrayList.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/lianma_util.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/NI.js" type="text/javascript"></script>
