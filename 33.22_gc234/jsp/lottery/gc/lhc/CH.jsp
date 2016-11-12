<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">
    <!--游戏区块-->
    <div id="ch_game" class="col-xs-9 Game">
        <form name="lt_form" method="post" action="/member/lt_ch/lt_ch_order.php" onsubmit="return false;"
              class="Aside">
            <input type="hidden" id="gid" name="gid" value="551082">
            <input type="hidden" name="rs_r" value="01">

            <div id="showTable">
                <!--连码类别-->
                <div class="round-table" id="orders">
                    
                </div>
                <div id="SPA_Box" class="round-table" style="display: none;">
                    <!--生肖对碰--><label><input name="OfTouch" disabled="" id="OfTouch" type="checkbox" value="Y"><span>生肖对碰</span></label>
                    <!--尾数对碰--><label><input name="OfTouch2" disabled="" id="OfTouch2" type="checkbox" value="Y"><span>尾数对碰</span></label>
                    <!--肖串尾数--><label><input name="OfTouch3" id="OfTouch3" type="checkbox"
                                             value="Y"><span>肖串尾数</span></label>
                    <!--交差碰--><label><input name="OfTouch4" id="OfTouch4" type="checkbox"
                                            value="Y"><span>交叉碰</span></label>
                    <!--胆拖--><label><input name="OfTouch5" id="OfTouch5" type="checkbox"
                                           value="Y"><span>胆拖</span></label>
                    <!--胆拖色波--><label><input name="OfTouch6" id="OfTouch6" type="checkbox"
                                             value="Y"><span>胆拖色波</span></label>
                    <!--胆拖生肖--><label><input name="OfTouch7" id="OfTouch7" type="checkbox"
                                             value="Y"><span>胆拖生肖</span></label>
                </div>
                <!--正/副号-->
                <div class="round-table" style="display: none;">
                    <table id="RSTable" style="width: 100%; display: table; background-color: white;"
                           class="MobileTable">
                        <tbody>
                        <tr class="title_tr">
                            <td id="RS" colspan="2">
                                <input type="checkbox" name="RS" value="R">正/副号
                            </td>
                            <td id="RNumT" style="display: none;"> 正号</td>
                            <td id="RNumB" style="display: none;"></td>
                            <td id="SNumT" style="display: none; color: red;"> 副号</td>
                            <td id="SNumB" style="display: none;"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!--连码table-->
                <div class="round-table" >
                    <table id="table2" style="text-align: center; display: table;" class="MobileTable">
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
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]"  value="01" disabled></label>
                            </td>
                            <td class="bColorG"><span>11</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="11" disabled></label>
                            </td>
                            <td class="bColorG"><span>21</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="21" disabled></label>
                            </td>
                            <td class="bColorB"><span>31</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="31" disabled></label>
                            </td>
                            <td class="bColorB"><span>41</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="41" disabled></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="bColorR"><span>02</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="02" disabled></label>
                            </td>
                            <td class="bColorR"><span>12</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="12" disabled></label>
                            </td>
                            <td class="bColorG"><span>22</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="22" disabled></label>
                            </td>
                            <td class="bColorG"><span>32</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="32" disabled></label>
                            </td>
                            <td class="bColorB"><span>42</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="42" disabled></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>03</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="03" disabled></label>
                            </td>
                            <td class="bColorR"><span>13</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="13" disabled></label>
                            </td>
                            <td class="bColorR"><span>23</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="23" disabled></label>
                            </td>
                            <td class="bColorG"><span>33</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="33" disabled></label>
                            </td>
                            <td class="bColorG"><span>43</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="43" disabled></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>04</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="04" disabled></label>
                            </td>
                            <td class="bColorB"><span>14</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="14" disabled></label>
                            </td>
                            <td class="bColorR"><span>24</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="24" disabled></label>
                            </td>
                            <td class="bColorR"><span>34</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="34" disabled></label>
                            </td>
                            <td class="bColorG"><span>44</span></td>
                            <td>
                            	<label class="padding_label"><input type="checkbox" name="num[]" value="44" disabled></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="bColorG"><span>05</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="05" disabled></label>
                            </td>
                            <td class="bColorB"><span>15</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="15" disabled></label>
                            </td>
                            <td class="bColorB"><span>25</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="25" disabled></label>
                            </td>
                            <td class="bColorR"><span>35</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="35" disabled></label>
                            </td>
                            <td class="bColorR"><span>45</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="45" disabled></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="bColorG"><span>06</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="06" disabled></label>
                            </td>
                            <td class="bColorG"><span>16</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="16" disabled></label>
                            </td>
                            <td class="bColorB"><span>26</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="26" disabled></label>
                            </td>
                            <td class="bColorB"><span>36</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="36" disabled></label>
                            </td>
                            <td class="bColorR"><span>46</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="46" disabled></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="bColorR"><span>07</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="07" disabled></label>
                            </td>
                            <td class="bColorG"><span>17</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="17" disabled></label>
                            </td>
                            <td class="bColorG"><span>27</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="27" disabled></label>
                            </td>
                            <td class="bColorB"><span>37</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="37" disabled></label>
                            </td>
                            <td class="bColorB"><span>47</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="47" disabled></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="bColorR"><span>08</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="08" disabled></label>
                            </td>
                            <td class="bColorR"><span>18</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="18" disabled></label>
                            </td>
                            <td class="bColorG"><span>28</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="28" disabled></label>
                            </td>
                            <td class="bColorG"><span>38</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="38" disabled></label>
                            </td>
                            <td class="bColorB"><span>48</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="48" disabled></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>09</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="09" disabled></label>
                            </td>
                            <td class="bColorR"><span>19</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="19" disabled></label>
                            </td>
                            <td class="bColorR"><span>29</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="29" disabled></label>
                            </td>
                            <td class="bColorG"><span>39</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="39" disabled></label>
                            </td>
                            <td class="bColorG"><span>49</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="49" disabled></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="bColorB"><span>10</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="10" disabled></label>
                            </td>
                            <td class="bColorB"><span>20</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="20" disabled></label>
                            </td>
                            <td class="bColorR"><span>30</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="30" disabled></label>
                            </td>
                            <td class="bColorR"><span>40</span></td>
                            <td><label class="padding_label"><input type="checkbox" name="num[]" value="40" disabled></label>
                            </td>
                            <td colspan="2" class="Send">
                                <input type="button" name="btnReset" value="取消" class="no_min" style="padding:0px;">
                                <input type="button" name="btnSubmit" value="确定" class="yes_min" style="padding:0px;">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="round-table" style="display: none;">
                    <table id="table3" style="text-align:center;background-color:white;display:none;"
                           class="MobileTable">
                        <tbody>
                        <tr class="title_tr">
                            <td>&nbsp;</td>
                            <td>号码</td>
                            <td>勾选</td>
                            <td> &nbsp;</td>
                            <td>号码 </td>
                            <td>勾选 </td>
                        </tr>
                        <tr style="text-align:center;">
                            <td class="title_td2">鼠</td>
                            <td style="background-color:#e5eaee;text-align:left">09, 21, 33, 45</td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="09, 21, 33, 45"></label>
                            </td>
                            <td class="title_td2">牛</td>
                            <td style="background-color:#e5eaee;text-align:left">08, 20, 32, 44</td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="08, 20, 32, 44"></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="title_td2">虎</td>
                            <td style="background-color:#e5eaee;text-align:left">07, 19, 31, 43</td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="07, 19, 31, 43"></label>
                            </td>
                            <td class="title_td2">兔</td>
                            <td style="background-color:#e5eaee;text-align:left">06, 18, 30, 42</td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="06, 18, 30, 42"></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="title_td2">龙
                            </td>
                            <td style="background-color:#e5eaee;text-align:left">05, 17, 29, 41</td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="05, 17, 29, 41"></label>
                            </td>
                            <td class="title_td2">蛇</td>
                            <td style="background-color:#e5eaee;text-align:left">04, 16, 28, 40</td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="04, 16, 28, 40"></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="title_td2">马</td>
                            <td style="background-color:#e5eaee;text-align:left">03, 15, 27, 39
                            </td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="03, 15, 27, 39"></label>
                            </td>
                            <td class="title_td2">羊</td>
                            <td style="background-color:#e5eaee;text-align:left">02, 14, 26, 38</td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="02, 14, 26, 38"></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="title_td2">猴</td>
                            <td style="background-color:#e5eaee;text-align:left">01, 13, 25, 37, 49</td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="01, 13, 25, 37, 49"></label>
                            </td>
                            <td class="title_td2"> 鸡</td>
                            <td style="background-color:#e5eaee;text-align:left">12, 24, 36, 48</td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="12, 24, 36, 48"></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="title_td2">狗</td>
                            <td style="background-color:#e5eaee;text-align:left">11, 23, 35, 47</td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="11, 23, 35, 47"></label>
                            </td>
                            <td class="title_td2">猪</td>
                            <td style="background-color:#e5eaee;text-align:left">10, 22, 34, 46</td>
                            <td>
                                <label class="padding_label"><input type="checkbox" name="spa[]" value="10, 22, 34, 46"></label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="Send">
                                <input class="no" type="button" name="btnSpaReset" value="取消">
                                <input class="yes" type="button" name="btnSpaSend" value="送出">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="round-table" style="display: none;">
                    <table id="table4" style="border: 0pt none ; border-collapse: collapse; display:none;"
                           class="MobileTable">
                        <tbody>
                        <tr style="text-align: center;">
                            <td class="title_td2 BorderLine" width="30px">0</td>
                            <td class="BorderLine">
                                <label class="padding_label"><input type="checkbox" name="nf[]" value="10, 20, 30, 40"></label>
                            </td>
                            <td class="title_td2 BorderLine" width="30px">1</td>
                            <td class="BorderLine">
                                <label class="padding_label"><input type="checkbox" name="nf[]" value="01, 11, 21, 31, 41"></label>
                            </td>
                            <td class="title_td2 BorderLine" width="30px">2</td>
                            <td class="BorderLine">
                                <label class="padding_label"><input type="checkbox" name="nf[]" value="02, 12, 22, 32, 42"></label>
                            </td>
                            <td class="title_td2 BorderLine" width="30px">3</td>
                            <td class="BorderLine">
                                <label class="padding_label"><input type="checkbox" name="nf[]" value="03, 13, 23, 33, 43"></label>
                            </td>
                            <td class="title_td2 BorderLine" width="30px">4</td>
                            <td class="BorderLine">
                                <label class="padding_label"><input type="checkbox" name="nf[]" value="04, 14, 24, 34, 44"></label>
                            </td>
                        </tr>
                        <tr style="text-align: center;">
                            <td class="title_td2 BorderLine" width="30px">5</td>
                            <td class="BorderLine">
                                <label class="padding_label"><input type="checkbox" name="nf[]" value="05, 15, 25, 35, 45"></label>
                            </td>
                            <td class="title_td2 BorderLine" width="30px">6</td>
                            <td class="BorderLine">
                                <label class="padding_label"><input type="checkbox" name="nf[]" value="06, 16, 26, 36, 46"></label>
                            </td>
                            <td class="title_td2 BorderLine" width="30px">7</td>
                            <td class="BorderLine">
                                <label class="padding_label"><input type="checkbox" name="nf[]" value="07, 17, 27, 37, 47"></label>
                            </td>
                            <td class="title_td2 BorderLine" width="30px">8</td>
                            <td class="BorderLine">
                                <label class="padding_label"><input type="checkbox" name="nf[]" value="08, 18, 28, 38, 48"></label>
                            </td>
                            <td class="title_td2 BorderLine" width="30px">9</td>
                            <td class="BorderLine">
                                <label class="padding_label"><input type="checkbox" name="nf[]" value="09, 19, 29, 39, 49"></label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="10" class="BorderLine Send">
                                <input class="no" type="button" name="btnFinReset" value="取消">
                                <input class="yes" type="button" name="btnFinSend" value="送出">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div id="XF" style="clear: both; display: none;">
                    <div>
                        <table id="table5" style="display:none;margin-top: 12px;width:45%;float:left; "class="MobileTable">
                        </table>
                    </div>
                    <div>
                        <table id="table6" style="display:none;margin-top: 12px;margin-left: 24px;width:45%;float:left; " class="MobileTable">
                        </table>
                    </div>
                    <div style="float: left; width: 100%; text-align: center; clear: both;" id="XF_Send">
                        <input type="button" class="no" name="btnXfReset" value="取消">
                        <input name="btnXfSend" class="yes" type="button" value="送出">
                    </div>
                </div>
                <div id="CrossOverHit" style="display: none;">
                    <div id="HitZone">
                        <div style="border: 2px solid red;">
                        	<label><input type="button" value="删除" disabled="" name="delCf">
                        	<input type="radio" name="Over" class="Cradio" checked="checked">
                        	<input type="hidden" name="Cross[]">
                            </label>
                        </div>
                        <p>X</p>
                        <div>
                        	<label>
                        		<input type="button" value="删除" disabled="" name="delCf">
                        		<input type="radio" name="Over" class="Cradio">
                        		<input type="hidden" name="Cross[]">
                        	</label>
                        </div>
                        <p>X</p>
                        <div>
	                        <label>
		                        <input type="button" value="删除" disabled="" name="delCf">
		                        <input type="radio" name="Over" class="Cradio">
		                        <input type="hidden" name="Cross[]">
	                        </label>
                       	</div>
                        <p>X</p>
                        <div>
                        	<label>
                        		<input type="button" value="删除" disabled="" name="delCf">
                        		<input type="radio" name="Over" class="Cradio">
                        		<input type="hidden" name="Cross[]">
                        	</label>
                        </div>
                        <div id="AddCross"><input type="button" value="新增柱列" name="addCf"></div>
                    </div>
                    <div id="CrossSend">
                        <input type="button" class="no" name="OverCancel" value="取消">
                        <input class="yes" name="OverSend" type="button" value="送出" disabled="">
                        <span id="Warn"></span>
                    </div>
                    <div id="NumBtn">
                        <!--快选区块-->
                        <table>
                            <tbody></tbody>
                            <tbody>
                            <tr style="height: 25px;">
                                <td id="B01"><span style="color: red;">01</span></td>
                                <td id="B11"><span style="color: green;">11</span></td>
                                <td id="B21"><span style="color: green;">21</span></td>
                                <td id="B31"><span style="color: blue;">31</span></td>
                                <td id="B41"><span style="color: blue;">41</span></td>
                            </tr>
                            <tr style="height: 25px;">
                                <td id="B02"><span style="color: red;">02</span></td>
                                <td id="B12"><span style="color: red;">12</span></td>
                                <td id="B22"><span style="color: green;">22</span></td>
                                <td id="B32"><span style="color: green;">32</span></td>
                                <td id="B42"><span style="color: blue;">42</span></td>
                            </tr>
                            <tr style="height: 25px;">
                                <td id="B03"><span style="color: blue;">03</span></td>
                                <td id="B13"><span style="color: red;">13</span></td>
                                <td id="B23"><span style="color: red;">23</span></td>
                                <td id="B33"><span style="color: green;">33</span></td>
                                <td id="B43"><span style="color: green;">43</span></td>
                            </tr>
                            <tr style="height: 25px;">
                                <td id="B04"><span style="color: blue;">04</span></td>
                                <td id="B14"><span style="color: blue;">14</span></td>
                                <td id="B24"><span style="color: red;">24</span></td>
                                <td id="B34"><span style="color: red;">34</span></td>
                                <td id="B44"><span style="color: green;">44</span></td>
                            </tr>
                            <tr style="height: 25px;">
                                <td id="B05"><span style="color: green;">05</span></td>
                                <td id="B15"><span style="color: blue;">15</span></td>
                                <td id="B25"><span style="color: blue;">25</span></td>
                                <td id="B35"><span style="color: red;">35</span></td>
                                <td id="B45"><span style="color: red;">45</span></td>
                            </tr>
                            <tr style="height: 25px;">
                                <td id="B06"><span style="color: green;">06</span></td>
                                <td id="B16"><span style="color: green;">16</span></td>
                                <td id="B26"><span style="color: blue;">26</span></td>
                                <td id="B36"><span style="color: blue;">36</span></td>
                                <td id="B46"><span style="color: red;">46</span></td>
                            </tr>
                            <tr style="height: 25px;">
                                <td id="B07"><span style="color: red;">07</span></td>
                                <td id="B17"><span style="color: green;">17</span></td>
                                <td id="B27"><span style="color: green;">27</span></td>
                                <td id="B37"><span style="color: blue;">37</span></td>
                                <td id="B47"><span style="color: blue;">47</span></td>
                            </tr>
                            <tr style="height: 25px;">
                                <td id="B08"><span style="color: red;">08</span></td>
                                <td id="B18"><span style="color: red;">18</span></td>
                                <td id="B28"><span style="color: green;">28</span></td>
                                <td id="B38"><span style="color: green;">38</span></td>
                                <td id="B48"><span style="color: blue;">48</span></td>
                            </tr>
                            <tr style="height: 25px;">
                                <td id="B09"><span style="color: blue;">09</span></td>
                                <td id="B19"><span style="color: red;">19</span></td>
                                <td id="B29"><span style="color: red;">29</span></td>
                                <td id="B39"><span style="color: green;">39</span></td>
                                <td id="B49"><span style="color: green;">49</span></td>
                            </tr>
                            <tr style="height: 25px;">
                                <td id="B10"><span style="color: blue;">10</span></td>
                                <td id="B20"><span style="color: blue;">20</span></td>
                                <td id="B30"><span style="color: red;">30</span></td>
                                <td id="B40"><span style="color: red;">40</span></td>
                                <td class="ball_td"></td>
                            </tr>
                            </tbody>
                        </table>
                        <div id="QuickCross">
                            <p><a style="color:red;">红波</a><a style="color:blue;">蓝波</a><a style="color:green;">绿波</a></p>
                            <p>
                                <a>鼠</a><a>牛</a>
                                <a>虎</a><a>兔</a>
                            </p>
                            <p>
                                <a>龙</a><a>蛇</a>
                                <a>马</a><a>羊</a>
                            </p>
                            <p>
                                <a>猴</a><a>鸡</a>
                                <a>狗</a><a>猪</a>
                            </p>
                            <p>
                                <a>尾0</a><a>尾1</a><a>尾2</a><a>尾3</a><a>尾4</a>
                            </p>
                            <p>
                                <a>尾5</a><a>尾6</a><a>尾7</a><a>尾8</a><a>尾9</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div id="Dantuo" style="display: none;">
                    <div class="l">
                        <h3>胆码</h3>
                    </div>
                    <div class="l">
                        <h3>拖码</h3>
                    </div>
                    <div class="SubmitSend">
                        <input name="DantuoCancel" class="no" type="button" value="取消">
                        <input name="DantuoSend" class="yes" disabled="" type="button" value="送出">
                        <span id="Warn1"></span>
                    </div>
                </div>
                <div id="DantuoC" style="display: none;">
                    <div class="l">
                        <h3>胆码</h3>
                    </div>
                    <div class="l c">
                        <h3>色波</h3>
                    </div>
                    <div class="SubmitSend">
                        <input name="DantuoCCancel" class="no" type="button" value="取消">
                        <input name="DantuoCSend" class="yes" disabled="" type="button" value="送出">
                        <span id="Warn2"></span>
                    </div>
                </div>
                <div id="DantuoSpa" style="display: none;">
                    <div class="l">
                        <h3>胆码</h3>
                    </div>
                    <div class="l">
                        <h3>生肖</h3>
                    </div>
                    <div class="SubmitSend">
                        <input name="DantuoSpaCancel" class="no" type="button" value="取消">
                        <input name="DantuoSpaSend" class="yes" disabled="" type="button" value="送出">
                        <span id="Warn3"></span>
                    </div>
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
    <div id="ch_msgbox" class="col-xs-3 message_box" style="display: none;">
        <div class="inner">
            <div class="msg-title">六合彩 连码 下注单</div>
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
                   		 单注限额: 0<br>
                    	单号限额: 0
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
        <div class="footer"></div>
    </div>
</div>

<script type="text/template" id="contentTpl">
<table id="table1" style="bakcground-color:white;" class="MobileTable">
<tbody>
	<tr class="title_tr">
		<td>类别</td>
		<td>
			<label class="padding_label">
				<input name="rtype" type="radio" value="<#=items_map[68001].itemCode#>" displayNo="<#=items_map[68001].displayNo#>"><#=items_map[68001].itemName#>
			</label>
		</td>
		<td>
			<label class="padding_label">
				<input name="rtype" type="radio" value="<#=items_map[68002].itemCode#>" displayNo="<#=items_map[68002].displayNo#>"><#=items_map[68002].itemName#>
			</label>
        </td>
        <td>
            <label class="padding_label">
                <input name="rtype" type="radio" value="<#=items_map[68003].itemCode#>" displayNo="<#=items_map[68003].displayNo#>"><#=items_map[68003].itemName#>
        	</label>
        </td>
        <td>
            <label class="padding_label">
                <input name="rtype" type="radio" value="<#=items_map[68004].itemCode#>" displayNo="<#=items_map[68004].displayNo#>"><#=items_map[68004].itemName#>
            </label>
        </td>
        <td>
            <label class="padding_label">
                <input name="rtype" type="radio" value="<#=items_map[68005].itemCode#>" displayNo="<#=items_map[68005].displayNo#>"><#=items_map[68005].itemName#>
            </label>
        </td>
        <td>
            <label class="padding_label">
                <input name="rtype" type="radio" value="<#=items_map[68006].itemCode#>" displayNo="<#=items_map[68006].displayNo#>"><#=items_map[68006].itemName#>
            </label>
        </td>
	</tr>
	<tr>
        <td>赔率</td>
        <td>
			四全中 <span id="s_CH_4" style="color:#d63e35;font-weight:bold"><#=items_map[68001].odds.toFixed(2)#></span>
        </td>
        <td>
			三全中 <span id="s_CH_3" style="color:#d63e35;font-weight:bold"><#=items_map[68002].odds.toFixed(2)#></span>
		</td>
		<td>
			 中二 <span id="s_CH_32" style="color:#d63e35;font-weight:bold"><#=items_map[68003].odds.toFixed(2)#></span><br>
			中三 <span id="s_CH_33" style="color:#d63e35;font-weight:bold"><#=items_map[68003].odds1.toFixed(2)#></span>
		</td>
		<td>
			 二全中 <span id="s_CH_2" style="color:#d63e35;font-weight:bold"><#=items_map[68004].odds.toFixed(2)#></span>
		</td>
		<td>
			 中特 <span id="s_CH_2S" style="color:#d63e35;font-weight:bold"><#=items_map[68005].odds.toFixed(2)#></span><br>
			中二 <span id="s_CH_22" style="color:#d63e35;font-weight:bold"><#=items_map[68005].odds1.toFixed(2)#></span>
		</td>
		<td>
			特串 <span id="s_CH_2SP" style="color:#d63e35;font-weight:bold"><#=items_map[68006].odds.toFixed(2)#></span>
		</td>
	</tr>
</tbody>
</table>
</script>

<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/ArrayList.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/lianma_util.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/CH.js" type="text/javascript"></script>