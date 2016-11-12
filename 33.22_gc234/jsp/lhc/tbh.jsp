<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>黄金世纪</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
    <!--本页css-->
    <link rel="stylesheet" href="${ctx}/css/lottery/ssc.css" />
    <link rel="stylesheet" href="${ctx}/css/lottery/View.css" />
</head>

<body>

<div class="caicontainer">

    <div class="caicontent" style="width:100%">

        <div class="text-center scrollResults" id="scrollResults">
	        <div class="page-header">
		  		<h1>正在开奖！祝您好运！</h1>
			</div>
        	<table class="table table-bordered">
        		<thead>
        			<tr>
        				<th class="text-center">正码一</th>
        				<th class="text-center">正码二</th>
        				<th class="text-center">正码三</th>
        				<th class="text-center">正码四</th>
        				<th class="text-center">正码五</th>
        				<th class="text-center">正码六</th>
        				<th class="text-center">特别号</th>
        			</tr>
        		</thead>
        		<tbody>
        			<tr>
        				<td id="num1" class="scrollNum choose">&nbsp;</td>
        				<td id="num2" class="scrollNum choose">&nbsp;</td>
        				<td id="num3" class="scrollNum choose">&nbsp;</td>
        				<td id="num4" class="scrollNum choose">&nbsp;</td>
        				<td id="num5" class="scrollNum choose">&nbsp;</td>
        				<td id="num6" class="scrollNum choose">&nbsp;</td>
        				<td id="num7" class="scrollNum choose">&nbsp;</td>
        			</tr>
        			<tr>
        				<td id="animal1" class="scrollAnimal">&nbsp;</td>
        				<td id="animal2" class="scrollAnimal">&nbsp;</td>
        				<td id="animal3" class="scrollAnimal">&nbsp;</td>
        				<td id="animal4" class="scrollAnimal">&nbsp;</td>
        				<td id="animal5" class="scrollAnimal">&nbsp;</td>
        				<td id="animal6" class="scrollAnimal">&nbsp;</td>
        				<td id="animal7" class="scrollAnimal">&nbsp;</td>
        			</tr>
        		</tbody>
        	</table>
        </div>
        
        <div class="cqsc">
            <div id="order-box" class="order-box-oneword game-state-opening">

                <!--砝码快选-->
                <jsp:include page="../lottery/gc/lottoBet.jsp" />

                <div id="locate-box">
                    <!-- javascript app 使用 -->

                    <div class="game-box" style="display: block;"><div class="tabs-box tabs-view-4">

                        <div class="quick-bet">
                            <div class="display-ctl active">
                                <span class="menu-icon"></span>
                                <span class="display-ctl-title">快选</span>
                                <span class="up-and-down"></span>
                            </div>
                            <div id="QuickMenu" class="display-area" style="display: none;">
                                <div>
                                    下注金额 :
                                    <input type="text" name="kxGold" id="kxGold">
                                </div>
                                <fieldset class="ball49">
                                    <legend>彩球号码</legend>
                                    <p>
                                        <a class="b01" id="q1" onclick="getGold(1)">01</a>
                                        <a class="b02" id="q2" onclick="getGold(2)">02</a>
                                        <a class="b03" id="q3" onclick="getGold(3)">03</a>
                                        <a class="b04" id="q4" onclick="getGold(4)">04</a>
                                        <a class="b05" id="q5" onclick="getGold(5)">05</a>
                                        <a class="b06" id="q6" onclick="getGold(6)">06</a>
                                        <a class="b07" id="q7" onclick="getGold(7)">07</a>
                                        <a class="b08" id="q8" onclick="getGold(8)">08</a>
                                        <a class="b09" id="q9" onclick="getGold(9)">09</a>
                                        <a class="b10" id="q10" onclick="getGold(10)">10</a>
                                        <a class="b11" id="q11" onclick="getGold(11)">11</a>
                                        <a class="b12" id="q12" onclick="getGold(12)">12</a>
                                        <a class="b13" id="q13" onclick="getGold(13)">13</a>
                                        <a class="b14" id="q14" onclick="getGold(14)">14</a>
                                        <a class="b15" id="q15" onclick="getGold(15)">15</a>
                                        <a class="b16" id="q16" onclick="getGold(16)">16</a>
                                        <a class="b17" id="q17" onclick="getGold(17)">17</a>
                                        <a class="b18" id="q18" onclick="getGold(18)">18</a>
                                        <a class="b19" id="q19" onclick="getGold(19)">19</a>
                                        <a class="b20" id="q20" onclick="getGold(20)">20</a>
                                    </p>
                                    <p>
                                        <a class="b21" id="q21" onclick="getGold(21)">21</a>
                                        <a class="b22" id="q22" onclick="getGold(22)">22</a>
                                        <a class="b23" id="q23" onclick="getGold(23)">23</a>
                                        <a class="b24" id="q24" onclick="getGold(24)">24</a>
                                        <a class="b25" id="q25" onclick="getGold(25)">25</a>
                                        <a class="b26" id="q26" onclick="getGold(26)">26</a>
                                        <a class="b27" id="q27" onclick="getGold(27)">27</a>
                                        <a class="b28" id="q28" onclick="getGold(28)">28</a>
                                        <a class="b29" id="q29" onclick="getGold(29)">29</a>
                                        <a class="b30" id="q30" onclick="getGold(30)">30</a>
                                        <a class="b31" id="q31" onclick="getGold(31)">31</a>
                                        <a class="b32" id="q32" onclick="getGold(32)">32</a>
                                        <a class="b33" id="q33" onclick="getGold(33)">33</a>
                                        <a class="b34" id="q34" onclick="getGold(34)">34</a>
                                        <a class="b35" id="q35" onclick="getGold(35)">35</a>
                                        <a class="b36" id="q36" onclick="getGold(36)">36</a>
                                        <a class="b37" id="q37" onclick="getGold(37)">37</a>
                                        <a class="b38" id="q38" onclick="getGold(38)">38</a>
                                        <a class="b39" id="q39" onclick="getGold(39)">39</a>
                                        <a class="b40" id="q40" onclick="getGold(40)">40</a>
                                    </p>
                                    <p>
                                        <a class="b41" id="q41" onclick="getGold(41)">41</a>
                                        <a class="b42" id="q42" onclick="getGold(42)">42</a>
                                        <a class="b43" id="q43" onclick="getGold(43)">43</a>
                                        <a class="b44" id="q44" onclick="getGold(44)">44</a>
                                        <a class="b45" id="q45" onclick="getGold(45)">45</a>
                                        <a class="b46" id="q46" onclick="getGold(46)">46</a>
                                        <a class="b47" id="q47" onclick="getGold(47)">47</a>
                                        <a class="b48" id="q48" onclick="getGold(48)">48</a>
                                        <a class="b49" id="q49" onclick="getGold(49)">49</a>
                                    </p>
                                </fieldset>
                                <fieldset class="SPA">
                                    <legend>单双大小</legend>
                                    <p>
                                        <a onclick="getGoldXuan('Dan')">单</a>
                                        <a onclick="getGoldXuan('Shuang')">双</a>
                                        <a onclick="getGoldXuan('Da')">大</a>
                                        <a onclick="getGoldXuan('Xiao')">小</a>
                                        <a onclick="getGoldXuan('hDan')">和单</a>
                                        <a onclick="getGoldXuan('hShuang')">和双</a>
                                        <a onclick="getGoldXuan('hDa')">和大</a>
                                        <a onclick="getGoldXuan('hXiao')">和小</a>
                                    </p>
                                </fieldset>
                                <p style="clear:both;padding: 10px;">
                                    <button type="reset" id="btn-orders-reset" class="btn-cancel" onclick="kxreset()">取消</button>
                                    <button id="btn-orders-submit" class="btn-submit">确认</button>
                                </p>
                            </div></div>

                        <div id="locate-box">

                        </div></div></div></div>

                <div id="order-info">
                    <div class="inner">
                        <span>下注金额:<span id="BetGold">0</span></span>
                        <!-- IE 8,9 瀏覽器BUG 在INPUT上按ENTER會被FOCUS到BTN物件觸發CLICK事件 (加上type="reset" 可以避開) -->
                        <button type="reset" id="btn-orders-reset" class="btn-cancel" onclick="kxreset()">取消</button>
                        <button id="btn-orders-submit" class="btn-submit">确认</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="clearfix"></div>
</div>

<script type="text/template" id="contentTpl">
    <table class="order-table tabs-view" tabs-view="1" style="display: table;">
        <thead>
        <tr>
            <th>号码</th>
            <th>金额</th>
            <th>号码</th>
            <th>金额</th>
            <th>号码</th>
            <th>金额</th>
            <th>号码</th>
            <th>金额</th>
            <th>号码</th>
            <th>金额</th>
        </tr>
        </thead>
        <tbody><tr>
            <td class="choose">
                <span class="num ballR">01</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="01">
            </td>
            <td class="choose">
                <span class="num ballG">11</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode11"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="11">
            </td>
            <td class="choose">
                <span class="num ballG">21</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode21"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="21">
            </td>
            <td class="choose">
                <span class="num ballB">31</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode31"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="31">
            </td>
            <td class="choose">
                <span class="num ballB">41</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode41"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="41">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">02</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="02">
            </td>
            <td class="choose">
                <span class="num ballR">12</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode12"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="12">
            </td>
            <td class="choose">
                <span class="num ballG">22</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode22"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="22">
            </td>
            <td class="choose">
                <span class="num ballG">32</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode32"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="32">
            </td>
            <td class="choose">
                <span class="num ballB">42</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode42"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="42">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">03</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="03">
            </td>
            <td class="choose">
                <span class="num ballR">13</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode13"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="13">
            </td>
            <td class="choose">
                <span class="num ballR">23</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode23"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="23">
            </td>
            <td class="choose">
                <span class="num ballG">33</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode33"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="33">
            </td>
            <td class="choose">
                <span class="num ballG">43</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode43"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="43">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">04</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="04">
            </td>
            <td class="choose">
                <span class="num ballB">14</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode14"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="14">
            </td>
            <td class="choose">
                <span class="num ballR">24</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode24"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="24">
            </td>
            <td class="choose">
                <span class="num ballR">34</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode34"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="34">
            </td>
            <td class="choose">
                <span class="num ballG">44</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode44"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="44">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">05</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="05">
            </td>
            <td class="choose">
                <span class="num ballB">15</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode15"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="15">
            </td>
            <td class="choose">
                <span class="num ballB">25</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode25"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="25">
            </td>
            <td class="choose">
                <span class="num ballR">35</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode35"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="35">
            </td>
            <td class="choose">
                <span class="num ballR">45</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode45"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="45">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">06</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="06">
            </td>
            <td class="choose">
                <span class="num ballG">16</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode16"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="16">
            </td>
            <td class="choose">
                <span class="num ballB">26</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode26"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="26">
            </td>
            <td class="choose">
                <span class="num ballB">36</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode36"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="36">
            </td>
            <td class="choose">
                <span class="num ballR">46</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode46"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="46">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">07</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode7"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="07">
            </td>
            <td class="choose">
                <span class="num ballG">17</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode17"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="17">
            </td>
            <td class="choose">
                <span class="num ballG">27</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode27"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="27">
            </td>
            <td class="choose">
                <span class="num ballB">37</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode37"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="37">
            </td>
            <td class="choose">
                <span class="num ballB">47</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode47"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="47">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">08</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode8"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="08">
            </td>
            <td class="choose">
                <span class="num ballR">18</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode18"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="18">
            </td>
            <td class="choose">
                <span class="num ballG">28</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode28"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="28">
            </td>
            <td class="choose">
                <span class="num ballG">38</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode38"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="38">
            </td>
            <td class="choose">
                <span class="num ballB">48</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode48"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="48">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">09</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode9"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="09">
            </td>
            <td class="choose">
                <span class="num ballR">19</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode19"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="19">
            </td>
            <td class="choose">
                <span class="num ballR">29</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode29"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="29">
            </td>
            <td class="choose">
                <span class="num ballG">39</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode39"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="39">
            </td>
            <td class="choose">
                <span class="num ballG">49</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode49"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="49">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">10</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode10"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="10">
            </td>
            <td class="choose">
                <span class="num ballB">20</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode20"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="20">
            </td>
            <td class="choose">
                <span class="num ballR">30</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode30"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="30">
            </td>
            <td class="choose">
                <span class="num ballR">40</span>
            </td>
            <td class="choose">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode40"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="40">
            </td>
        </tr>
        </tbody></table>

    <table class="order-table tabs-view" tabs-view="1">
        <tbody>
        <tr>
            <td class="choose-num">特单</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[60001].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60001">
            </td>
            <td class="choose-num">特双</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[60002].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60002">
            </td>
            <td class="choose-num">特大</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[60003].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60003">
            </td>
            <td class="choose-num">特小</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[60004].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60004">
            </td>
            <td class="choose-num">尾大</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[60009].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60009">
            </td>
        </tr><tr>
            <td class="choose-num">和单</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[60005].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60005">
            </td>
            <td class="choose-num">和双</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[60006].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60006">
            </td>
            <td class="choose-num">和大</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[60007].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60007">
            </td>
            <td class="choose-num">和小</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[60008].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60008">
            </td>
            <td class="choose-num">尾小</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[60010].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="60010">
            </td>
        </tr><tr>
            <td class="choose-num">大双</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63002].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63002">
            </td>
            <td class="choose-num">小双</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63003].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63003">
            </td>
            <td class="choose-num">大单</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63004].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63004">
            </td>
            <td class="choose-num">小单</td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63005].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63005">
            </td>
        </tr>
        </tbody>
    </table>
</script>

<script src="../js/lib/tpl.js" type="text/javascript"></script>
<script src="../js/lib/countdown.js" type="text/javascript"></script>
<script src="${ctx}/js/lottert/common.js" type="text/javascript"></script>
<script src="../js/lottery/lhc/lhc_lm.js?51188" type="text/javascript"></script>
<script src="../js/lottery/Util.js" type="text/javascript"></script>
<script type="application/javascript">

    //循环输出
    /* $.ajax({url: "../lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId=1,2,5",type: "get",dataType: "json",
        success: function(b) {
            if(0 == b.code){
                var html = tpl('#contentTpl', b);
                $("#locate-box").html(html);

            }else{
                Showbo.Msg.alert('请登录！')
                window.location.href=ctx+"logout.do";
            }
        }}) */
//获取彩池
var itemInfo = "";
$.ajax({
	url: "../lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId=1,2,5",
	type: "get",
	dataType: "json",
    success: function(b) {
    	itemInfo = b;
        if(0 == b.code){
            var html = tpl('#contentTpl', b);
            $("#locate-box").html(html);
        }else{
            Showbo.Msg.alert('请登录！')
            window.location.href=ctx+"logout.do";
        }
    }
});
//获取降水
function getDownRateInfo(){
$.ajax({
	url: "../lhc/getDownRate.do?timeStamp=" + new Date().getTime()+"&poolId=1,2,5",
	type: "get",
	dataType: "json",
    success: function(b) {
    	//console.debug(b);
     	if(0 == b.code && b.list != null && b.list != undefined && b.list != ''){
     		var list = b.list;
     		$.each(list, function(n,value) {
    				if(value.betdata != null && value.betdata != undefined && value.betdata != '' &&value.betdata.length > 0){
    					var itemcode = value.itemcode;
    					var betdata = value.betdata;
        				var input$ = $("input[data-itemcode="+itemcode+"][data-itemno="+betdata+"]");
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
</body>
</html>
