<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">

	<!--砝码快选-->
	<jsp:include page="../lottoBet.jsp" />

	<div id="orders">
		<!-- javascript app 使用 -->
		<input type="hidden" id="xuanhao" value="1" />
		<div class="game-box" style="display: block;">
			<div class="tabs-box tabs-view-4">

				<div class="quick-bet">
					<div class="display-ctl active">
						<span class="menu-icon"></span> <span class="display-ctl-title">快选</span>
						<span class="up-and-down"></span>
						<%-- <span style="float:right;margin-top: -4px;margin-right: 35px;"><a href="javascript:void(0)" title="快选金额"><img alt="快选金额" src="${ctx}/img/icon08.png"> </a></span> --%>
					</div>
					<div id="QuickMenu" class="display-area" style="display: none;">
						<div style="display: none;">
							<label for="kxGold">下注金额 :</label> <span id="kxGoldBox"> <input
								class="itemCode" type="text" id="kxGold">
							</span>
						</div>
						<fieldset class="ball49">
							<legend>彩球号码</legend>
							<p>
								<a class="b01" id="q1" onclick="getGold(1)">01</a> <a
									class="b02" id="q2" onclick="getGold(2)">02</a> <a class="b03"
									id="q3" onclick="getGold(3)">03</a> <a class="b04" id="q4"
									onclick="getGold(4)">04</a> <a class="b05" id="q5"
									onclick="getGold(5)">05</a> <a class="b06" id="q6"
									onclick="getGold(6)">06</a> <a class="b07" id="q7"
									onclick="getGold(7)">07</a> <a class="b08" id="q8"
									onclick="getGold(8)">08</a> <a class="b09" id="q9"
									onclick="getGold(9)">09</a> <a class="b10" id="q10"
									onclick="getGold(10)">10</a> <a class="b11" id="q11"
									onclick="getGold(11)">11</a> <a class="b12" id="q12"
									onclick="getGold(12)">12</a> <a class="b13" id="q13"
									onclick="getGold(13)">13</a> <a class="b14" id="q14"
									onclick="getGold(14)">14</a> <a class="b15" id="q15"
									onclick="getGold(15)">15</a> <a class="b16" id="q16"
									onclick="getGold(16)">16</a> <a class="b17" id="q17"
									onclick="getGold(17)">17</a> <a class="b18" id="q18"
									onclick="getGold(18)">18</a> <a class="b19" id="q19"
									onclick="getGold(19)">19</a> <a class="b20" id="q20"
									onclick="getGold(20)">20</a>
							</p>
							<p>
								<a class="b21" id="q21" onclick="getGold(21)">21</a> <a
									class="b22" id="q22" onclick="getGold(22)">22</a> <a
									class="b23" id="q23" onclick="getGold(23)">23</a> <a
									class="b24" id="q24" onclick="getGold(24)">24</a> <a
									class="b25" id="q25" onclick="getGold(25)">25</a> <a
									class="b26" id="q26" onclick="getGold(26)">26</a> <a
									class="b27" id="q27" onclick="getGold(27)">27</a> <a
									class="b28" id="q28" onclick="getGold(28)">28</a> <a
									class="b29" id="q29" onclick="getGold(29)">29</a> <a
									class="b30" id="q30" onclick="getGold(30)">30</a> <a
									class="b31" id="q31" onclick="getGold(31)">31</a> <a
									class="b32" id="q32" onclick="getGold(32)">32</a> <a
									class="b33" id="q33" onclick="getGold(33)">33</a> <a
									class="b34" id="q34" onclick="getGold(34)">34</a> <a
									class="b35" id="q35" onclick="getGold(35)">35</a> <a
									class="b36" id="q36" onclick="getGold(36)">36</a> <a
									class="b37" id="q37" onclick="getGold(37)">37</a> <a
									class="b38" id="q38" onclick="getGold(38)">38</a> <a
									class="b39" id="q39" onclick="getGold(39)">39</a> <a
									class="b40" id="q40" onclick="getGold(40)">40</a>
							</p>
							<p>
								<a class="b41" id="q41" onclick="getGold(41)">41</a> <a
									class="b42" id="q42" onclick="getGold(42)">42</a> <a
									class="b43" id="q43" onclick="getGold(43)">43</a> <a
									class="b44" id="q44" onclick="getGold(44)">44</a> <a
									class="b45" id="q45" onclick="getGold(45)">45</a> <a
									class="b46" id="q46" onclick="getGold(46)">46</a> <a
									class="b47" id="q47" onclick="getGold(47)">47</a> <a
									class="b48" id="q48" onclick="getGold(48)">48</a> <a
									class="b49" id="q49" onclick="getGold(49)">49</a>
							</p>
						</fieldset>
						<fieldset>
							<legend>单双大小</legend>
							<p>
								<a onclick="getGoldXuan('Dan')">单</a> <a
									onclick="getGoldXuan('Shuang')">双</a> <a
									onclick="getGoldXuan('Da')">大</a> <a
									onclick="getGoldXuan('Xiao')">小</a> <a
									onclick="getGoldXuan('hDan')">和单</a> <a
									onclick="getGoldXuan('hShuang')">和双</a> <a
									onclick="getGoldXuan('hDa')">和大</a> <a
									onclick="getGoldXuan('hXiao')">和小</a>
							</p>
						</fieldset>
						<fieldset>
							<legend>色波</legend>
							<p>
								<a class="RED" onclick="getColorAll('R')">红波</a> <a class="BLUE"
									onclick="getColorAll('B')">蓝波</a> <a class="GREEN"
									onclick="getColorAll('G')">绿波</a>
							</p>
						</fieldset>
						<fieldset class="HB">
							<legend>半波</legend>
							<p>
								<a class="RED" onclick="getColorHerf('R','dan')">红单</a> <a
									class="RED" onclick="getColorHerf('R','shuang')">红双</a> <a
									class="RED" onclick="getColorHerf('R','da')">红大</a> <a
									class="RED" onclick="getColorHerf('R','xiao')">红小</a> <a
									class="BLUE" onclick="getColorHerf('B','dan')">蓝单</a> <a
									class="BLUE" onclick="getColorHerf('B','shuang')">蓝双</a> <a
									class="BLUE" onclick="getColorHerf('B','da')">蓝大</a> <a
									class="BLUE" onclick="getColorHerf('B','xiao')">蓝小</a> <a
									class="GREEN" onclick="getColorHerf('G','dan')">绿单</a> <a
									class="GREEN" onclick="getColorHerf('G','shuang')">绿双</a> <a
									class="GREEN" onclick="getColorHerf('G','da')">绿大</a> <a
									class="GREEN" onclick="getColorHerf('G','xiao')">绿小</a>
							</p>
						</fieldset>
						<fieldset>
							<legend>头</legend>
							<p>
								<a onclick="getNumByHead('0')">0</a> <a
									onclick="getNumByHead('1')">1</a> <a
									onclick="getNumByHead('2')">2</a> <a
									onclick="getNumByHead('3')">3</a> <a
									onclick="getNumByHead('4')">4</a>
							</p>
						</fieldset>
						<fieldset>
							<legend>尾</legend>
							<p>
								<a onclick="getNumByFoot('0')">0</a> <a
									onclick="getNumByFoot('1')">1</a> <a
									onclick="getNumByFoot('2')">2</a> <a
									onclick="getNumByFoot('3')">3</a> <a
									onclick="getNumByFoot('4')">4</a> <a
									onclick="getNumByFoot('5')">5</a> <a
									onclick="getNumByFoot('6')">6</a> <a
									onclick="getNumByFoot('7')">7</a> <a
									onclick="getNumByFoot('8')">8</a> <a
									onclick="getNumByFoot('9')">9</a>
							</p>
						</fieldset>
						<fieldset class="SPA">
							<legend>生肖</legend>
							<p>
								<a onclick="getNumByAnimal('鼠')">鼠</a> <a
									onclick="getNumByAnimal('牛')">牛</a> <a
									onclick="getNumByAnimal('虎')">虎</a> <a
									onclick="getNumByAnimal('兔')">兔</a> <a
									onclick="getNumByAnimal('龙')">龙</a> <a
									onclick="getNumByAnimal('蛇')">蛇</a> <a
									onclick="getNumByAnimal('马')">马</a> <a
									onclick="getNumByAnimal('羊')">羊</a> <a
									onclick="getNumByAnimal('猴')">猴</a> <a
									onclick="getNumByAnimal('鸡')">鸡</a> <a
									onclick="getNumByAnimal('狗')">狗</a> <a
									onclick="getNumByAnimal('猪')">猪</a>
							</p>
						</fieldset>
						<p style="clear: both; padding: 10px;">
							<button type="reset" id="btn-orders-reset" class="btn-cancel"
								onclick="kxreset()">取消</button>
							<button id="btn-orders-submit" class="btn-submit">确认</button>
						</p>
					</div>
				</div>

				<div class="tabs">
					<ul id="tabs">
						<li tabs="1" class="tabs-btn active"><a>正码特1</a></li>
						<li tabs="2" class="tabs-btn"><a>正码特2</a></li>
						<li tabs="3" class="tabs-btn"><a>正码特3</a></li>
						<li tabs="4" class="tabs-btn"><a>正码特4</a></li>
						<li tabs="5" class="tabs-btn"><a>正码特5</a></li>
						<li tabs="6" class="tabs-btn"><a>正码特6</a></li>
					</ul>
				</div>

				<div id="locate-box"></div>
			</div>
		</div>
	</div>

	<div id="order-info">
		<div class="inner">
			<span>下注金额:<span id="BetGold">0</span></span>
			<!-- IE 8,9 瀏覽器BUG 在INPUT上按ENTER會被FOCUS到BTN物件觸發CLICK事件 (加上type="reset" 可以避開) -->
			<button type="reset" id="btn-orders-reset" class="btn-cancel"
				onclick="kxreset()">取消</button>
			<button id="btn-orders-submit" class="btn-submit">确认</button>
		</div>
	</div>
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
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode1_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-position="0"  data-itemno="01">
            </td>
            <td class="choose">
                <span class="num ballG">11</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode11_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="11">
            </td>
            <td class="choose">
                <span class="num ballG">21</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode21_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="21">
            </td>
            <td class="choose">
                <span class="num ballB">31</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode31_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="31">
            </td>
            <td class="choose">
                <span class="num ballB">41</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode41_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="41">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">02</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode2_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="02">
            </td>
            <td class="choose">
                <span class="num ballR">12</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode12_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="12">
            </td>
            <td class="choose">
                <span class="num ballG">22</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode22_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="22">
            </td>
            <td class="choose">
                <span class="num ballG">32</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode32_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="32">
            </td>
            <td class="choose">
                <span class="num ballB">42</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode42_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="42">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">03</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode3_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="03">
            </td>
            <td class="choose">
                <span class="num ballR">13</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode13_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="13">
            </td>
            <td class="choose">
                <span class="num ballR">23</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode23_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="23">
            </td>
            <td class="choose">
                <span class="num ballG">33</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode33_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="33">
            </td>
            <td class="choose">
                <span class="num ballG">43</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode43_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="43">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">04</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode4_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="04">
            </td>
            <td class="choose">
                <span class="num ballB">14</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode14_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="14">
            </td>
            <td class="choose">
                <span class="num ballR">24</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode24_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="24">
            </td>
            <td class="choose">
                <span class="num ballR">34</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode34_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="34">
            </td>
            <td class="choose">
                <span class="num ballG">44</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode44_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="44">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">05</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode5_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="05">
            </td>
            <td class="choose">
                <span class="num ballB">15</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode15_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="15">
            </td>
            <td class="choose">
                <span class="num ballB">25</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode25_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="25">
            </td>
            <td class="choose">
                <span class="num ballR">35</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode35_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="35">
            </td>
            <td class="choose">
                <span class="num ballR">45</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode45_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="45">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">06</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode6_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="06">
            </td>
            <td class="choose">
                <span class="num ballG">16</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode16_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="16">
            </td>
            <td class="choose">
                <span class="num ballB">26</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode26_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="26">
            </td>
            <td class="choose">
                <span class="num ballB">36</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode36_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="36">
            </td>
            <td class="choose">
                <span class="num ballR">46</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode46_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="46">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">07</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode7_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="07">
            </td>
            <td class="choose">
                <span class="num ballG">17</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode17_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="17">
            </td>
            <td class="choose">
                <span class="num ballG">27</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode27_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="27">
            </td>
            <td class="choose">
                <span class="num ballB">37</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode37_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="37">
            </td>
            <td class="choose">
                <span class="num ballB">47</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode47_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="47">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">08</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode8_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="08">
            </td>
            <td class="choose">
                <span class="num ballR">18</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode18_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="18">
            </td>
            <td class="choose">
                <span class="num ballG">28</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode28_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="28">
            </td>
            <td class="choose">
                <span class="num ballG">38</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode38_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="38">
            </td>
            <td class="choose">
                <span class="num ballB">48</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode48_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="48">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">09</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode9_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="09">
            </td>
            <td class="choose">
                <span class="num ballR">19</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode19_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="19">
            </td>
            <td class="choose">
                <span class="num ballR">29</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode29_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="29">
            </td>
            <td class="choose">
                <span class="num ballG">39</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode39_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="39">
            </td>
            <td class="choose">
                <span class="num ballG">49</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode49_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="49">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">10</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode10_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="10">
            </td>
            <td class="choose">
                <span class="num ballB">20</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode20_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="20">
            </td>
            <td class="choose">
                <span class="num ballR">30</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode30_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="30">
            </td>
            <td class="choose">
                <span class="num ballR">40</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode40_1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="0"  data-itemno="40">
            </td>
        </tr>
        </tbody></table>
    <table class="order-table tabs-view" tabs-view="2" style="display: none;">
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
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode1_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006"  data-position="1"  data-itemno="01">
            </td>
            <td class="choose">
                <span class="num ballG">11</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode11_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="11">
            </td>
            <td class="choose">
                <span class="num ballG">21</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode21_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="21">
            </td>
            <td class="choose">
                <span class="num ballB">31</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode31_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="31">
            </td>
            <td class="choose">
                <span class="num ballB">41</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode41_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="41">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">02</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode2_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="02">
            </td>
            <td class="choose">
                <span class="num ballR">12</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode12_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="12">
            </td>
            <td class="choose">
                <span class="num ballG">22</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode22_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="22">
            </td>
            <td class="choose">
                <span class="num ballG">32</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode32_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="32">
            </td>
            <td class="choose">
                <span class="num ballB">42</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode42_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="42">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">03</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode3_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="03">
            </td>
            <td class="choose">
                <span class="num ballR">13</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode13_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="13">
            </td>
            <td class="choose">
                <span class="num ballR">23</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode23_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="23">
            </td>
            <td class="choose">
                <span class="num ballG">33</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode33_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="33">
            </td>
            <td class="choose">
                <span class="num ballG">43</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode43_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="43">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">04</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode4_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="04">
            </td>
            <td class="choose">
                <span class="num ballB">14</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode14_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="14">
            </td>
            <td class="choose">
                <span class="num ballR">24</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode24_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="24">
            </td>
            <td class="choose">
                <span class="num ballR">34</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode34_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="34">
            </td>
            <td class="choose">
                <span class="num ballG">44</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode44_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="44">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">05</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode5_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="05">
            </td>
            <td class="choose">
                <span class="num ballB">15</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode15_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="15">
            </td>
            <td class="choose">
                <span class="num ballB">25</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode25_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="25">
            </td>
            <td class="choose">
                <span class="num ballR">35</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode35_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="35">
            </td>
            <td class="choose">
                <span class="num ballR">45</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode45_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="45">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">06</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode6_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="06">
            </td>
            <td class="choose">
                <span class="num ballG">16</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode16_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="16">
            </td>
            <td class="choose">
                <span class="num ballB">26</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode26_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="26">
            </td>
            <td class="choose">
                <span class="num ballB">36</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode36_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="36">
            </td>
            <td class="choose">
                <span class="num ballR">46</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode46_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="46">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">07</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode7_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="07">
            </td>
            <td class="choose">
                <span class="num ballG">17</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode17_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="17">
            </td>
            <td class="choose">
                <span class="num ballG">27</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode27_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="27">
            </td>
            <td class="choose">
                <span class="num ballB">37</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode37_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="37">
            </td>
            <td class="choose">
                <span class="num ballB">47</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode47_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="47">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">08</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode8_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="08">
            </td>
            <td class="choose">
                <span class="num ballR">18</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode18_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="18">
            </td>
            <td class="choose">
                <span class="num ballG">28</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode28_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="28">
            </td>
            <td class="choose">
                <span class="num ballG">38</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode38_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="38">
            </td>
            <td class="choose">
                <span class="num ballB">48</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode48_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="48">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">09</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode9_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="09">
            </td>
            <td class="choose">
                <span class="num ballR">19</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode19_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="19">
            </td>
            <td class="choose">
                <span class="num ballR">29</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode29_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="29">
            </td>
            <td class="choose">
                <span class="num ballG">39</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode39_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="39">
            </td>
            <td class="choose">
                <span class="num ballG">49</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode49_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="49">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">10</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode10_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="10">
            </td>
            <td class="choose">
                <span class="num ballB">20</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode20_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="20">
            </td>
            <td class="choose">
                <span class="num ballR">30</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode30_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="30">
            </td>
            <td class="choose">
                <span class="num ballR">40</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode40_2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="1"  data-itemno="40">
            </td>
        </tr>
        </tbody></table>

    <table class="order-table tabs-view" tabs-view="3" style="display: none;">
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
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode1_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006"  data-position="2"  data-itemno="01">
            </td>
            <td class="choose">
                <span class="num ballG">11</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode11_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="11">
            </td>
            <td class="choose">
                <span class="num ballG">21</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode21_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="21">
            </td>
            <td class="choose">
                <span class="num ballB">31</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode31_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="31">
            </td>
            <td class="choose">
                <span class="num ballB">41</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode41_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="41">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">02</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode2_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="02">
            </td>
            <td class="choose">
                <span class="num ballR">12</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode12_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="12">
            </td>
            <td class="choose">
                <span class="num ballG">22</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode22_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="22">
            </td>
            <td class="choose">
                <span class="num ballG">32</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode32_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="32">
            </td>
            <td class="choose">
                <span class="num ballB">42</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode42_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="42">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">03</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode3_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="03">
            </td>
            <td class="choose">
                <span class="num ballR">13</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode13_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="13">
            </td>
            <td class="choose">
                <span class="num ballR">23</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode23_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="23">
            </td>
            <td class="choose">
                <span class="num ballG">33</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode33_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="33">
            </td>
            <td class="choose">
                <span class="num ballG">43</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode43_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="43">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">04</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode4_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="04">
            </td>
            <td class="choose">
                <span class="num ballB">14</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode14_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="14">
            </td>
            <td class="choose">
                <span class="num ballR">24</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode24_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="24">
            </td>
            <td class="choose">
                <span class="num ballR">34</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode34_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="34">
            </td>
            <td class="choose">
                <span class="num ballG">44</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode44_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="44">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">05</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode5_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="05">
            </td>
            <td class="choose">
                <span class="num ballB">15</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode15_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="15">
            </td>
            <td class="choose">
                <span class="num ballB">25</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode25_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="25">
            </td>
            <td class="choose">
                <span class="num ballR">35</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode35_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="35">
            </td>
            <td class="choose">
                <span class="num ballR">45</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode45_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="45">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">06</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode6_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="06">
            </td>
            <td class="choose">
                <span class="num ballG">16</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode16_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="16">
            </td>
            <td class="choose">
                <span class="num ballB">26</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode26_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="26">
            </td>
            <td class="choose">
                <span class="num ballB">36</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode36_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="36">
            </td>
            <td class="choose">
                <span class="num ballR">46</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode46_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="46">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">07</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode7_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="07">
            </td>
            <td class="choose">
                <span class="num ballG">17</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode17_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="17">
            </td>
            <td class="choose">
                <span class="num ballG">27</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode27_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="27">
            </td>
            <td class="choose">
                <span class="num ballB">37</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode37_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="37">
            </td>
            <td class="choose">
                <span class="num ballB">47</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode47_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="47">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">08</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode8_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="08">
            </td>
            <td class="choose">
                <span class="num ballR">18</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode18_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="18">
            </td>
            <td class="choose">
                <span class="num ballG">28</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode28_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="28">
            </td>
            <td class="choose">
                <span class="num ballG">38</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode38_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="38">
            </td>
            <td class="choose">
                <span class="num ballB">48</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode48_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="48">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">09</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode9_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="09">
            </td>
            <td class="choose">
                <span class="num ballR">19</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode19_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="19">
            </td>
            <td class="choose">
                <span class="num ballR">29</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode29_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="29">
            </td>
            <td class="choose">
                <span class="num ballG">39</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode39_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="39">
            </td>
            <td class="choose">
                <span class="num ballG">49</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode49_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="49">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">10</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode10_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="10">
            </td>
            <td class="choose">
                <span class="num ballB">20</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode20_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="20">
            </td>
            <td class="choose">
                <span class="num ballR">30</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode30_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="30">
            </td>
            <td class="choose">
                <span class="num ballR">40</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode40_3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="2"  data-itemno="40">
            </td>
        </tr>
        </tbody></table>

    <table class="order-table tabs-view" tabs-view="4" style="display: none;">
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
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode1_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006"  data-position="3"  data-itemno="01">
            </td>
            <td class="choose">
                <span class="num ballG">11</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode11_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="11">
            </td>
            <td class="choose">
                <span class="num ballG">21</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode21_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="21">
            </td>
            <td class="choose">
                <span class="num ballB">31</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode31_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="31">
            </td>
            <td class="choose">
                <span class="num ballB">41</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode41_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="41">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">02</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode2_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="02">
            </td>
            <td class="choose">
                <span class="num ballR">12</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode12_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="12">
            </td>
            <td class="choose">
                <span class="num ballG">22</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode22_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="22">
            </td>
            <td class="choose">
                <span class="num ballG">32</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode32_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="32">
            </td>
            <td class="choose">
                <span class="num ballB">42</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode42_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="42">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">03</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode3_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="03">
            </td>
            <td class="choose">
                <span class="num ballR">13</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode13_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="13">
            </td>
            <td class="choose">
                <span class="num ballR">23</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode23_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="23">
            </td>
            <td class="choose">
                <span class="num ballG">33</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode33_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="33">
            </td>
            <td class="choose">
                <span class="num ballG">43</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode43_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="43">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">04</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode4_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="04">
            </td>
            <td class="choose">
                <span class="num ballB">14</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode14_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="14">
            </td>
            <td class="choose">
                <span class="num ballR">24</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode24_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="24">
            </td>
            <td class="choose">
                <span class="num ballR">34</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode34_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="34">
            </td>
            <td class="choose">
                <span class="num ballG">44</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode44_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="44">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">05</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode5_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="05">
            </td>
            <td class="choose">
                <span class="num ballB">15</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode15_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="15">
            </td>
            <td class="choose">
                <span class="num ballB">25</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode25_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="25">
            </td>
            <td class="choose">
                <span class="num ballR">35</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode35_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="35">
            </td>
            <td class="choose">
                <span class="num ballR">45</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode45_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="45">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">06</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode6_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="06">
            </td>
            <td class="choose">
                <span class="num ballG">16</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode16_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="16">
            </td>
            <td class="choose">
                <span class="num ballB">26</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode26_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="26">
            </td>
            <td class="choose">
                <span class="num ballB">36</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode36_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="36">
            </td>
            <td class="choose">
                <span class="num ballR">46</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode46_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="46">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">07</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode7_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="07">
            </td>
            <td class="choose">
                <span class="num ballG">17</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode17_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="17">
            </td>
            <td class="choose">
                <span class="num ballG">27</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode27_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="27">
            </td>
            <td class="choose">
                <span class="num ballB">37</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode37_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="37">
            </td>
            <td class="choose">
                <span class="num ballB">47</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode47_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="47">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">08</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode8_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="08">
            </td>
            <td class="choose">
                <span class="num ballR">18</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode18_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="18">
            </td>
            <td class="choose">
                <span class="num ballG">28</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode28_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="28">
            </td>
            <td class="choose">
                <span class="num ballG">38</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode38_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="38">
            </td>
            <td class="choose">
                <span class="num ballB">48</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode48_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="48">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">09</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode9_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="09">
            </td>
            <td class="choose">
                <span class="num ballR">19</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode19_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="19">
            </td>
            <td class="choose">
                <span class="num ballR">29</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode29_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="29">
            </td>
            <td class="choose">
                <span class="num ballG">39</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode39_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="39">
            </td>
            <td class="choose">
                <span class="num ballG">49</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode49_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="49">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">10</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode10_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="10">
            </td>
            <td class="choose">
                <span class="num ballB">20</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode20_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="20">
            </td>
            <td class="choose">
                <span class="num ballR">30</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode30_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="30">
            </td>
            <td class="choose">
                <span class="num ballR">40</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode40_4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="3"  data-itemno="40">
            </td>
        </tr>
        </tbody></table>

    <table class="order-table tabs-view" tabs-view="5" style="display: none;">
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
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode1_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006"  data-position="4"  data-itemno="01">
            </td>
            <td class="choose">
                <span class="num ballG">11</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode11_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="11">
            </td>
            <td class="choose">
                <span class="num ballG">21</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode21_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="21">
            </td>
            <td class="choose">
                <span class="num ballB">31</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode31_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="31">
            </td>
            <td class="choose">
                <span class="num ballB">41</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode41_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="41">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">02</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode2_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="02">
            </td>
            <td class="choose">
                <span class="num ballR">12</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode12_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="12">
            </td>
            <td class="choose">
                <span class="num ballG">22</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode22_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="22">
            </td>
            <td class="choose">
                <span class="num ballG">32</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode32_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="32">
            </td>
            <td class="choose">
                <span class="num ballB">42</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode42_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="42">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">03</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode3_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="03">
            </td>
            <td class="choose">
                <span class="num ballR">13</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode13_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="13">
            </td>
            <td class="choose">
                <span class="num ballR">23</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode23_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="23">
            </td>
            <td class="choose">
                <span class="num ballG">33</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode33_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="33">
            </td>
            <td class="choose">
                <span class="num ballG">43</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode43_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="43">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">04</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode4_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="04">
            </td>
            <td class="choose">
                <span class="num ballB">14</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode14_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="14">
            </td>
            <td class="choose">
                <span class="num ballR">24</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode24_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="24">
            </td>
            <td class="choose">
                <span class="num ballR">34</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode34_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="34">
            </td>
            <td class="choose">
                <span class="num ballG">44</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode44_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="44">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">05</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode5_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="05">
            </td>
            <td class="choose">
                <span class="num ballB">15</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode15_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="15">
            </td>
            <td class="choose">
                <span class="num ballB">25</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode25_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="25">
            </td>
            <td class="choose">
                <span class="num ballR">35</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode35_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="35">
            </td>
            <td class="choose">
                <span class="num ballR">45</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode45_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="45">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">06</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode6_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="06">
            </td>
            <td class="choose">
                <span class="num ballG">16</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode16_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="16">
            </td>
            <td class="choose">
                <span class="num ballB">26</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode26_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="26">
            </td>
            <td class="choose">
                <span class="num ballB">36</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode36_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="36">
            </td>
            <td class="choose">
                <span class="num ballR">46</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode46_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="46">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">07</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode7_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="07">
            </td>
            <td class="choose">
                <span class="num ballG">17</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode17_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="17">
            </td>
            <td class="choose">
                <span class="num ballG">27</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode27_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="27">
            </td>
            <td class="choose">
                <span class="num ballB">37</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode37_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="37">
            </td>
            <td class="choose">
                <span class="num ballB">47</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode47_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="47">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">08</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode8_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="08">
            </td>
            <td class="choose">
                <span class="num ballR">18</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode18_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="18">
            </td>
            <td class="choose">
                <span class="num ballG">28</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode28_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="28">
            </td>
            <td class="choose">
                <span class="num ballG">38</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode38_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="38">
            </td>
            <td class="choose">
                <span class="num ballB">48</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode48_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="48">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">09</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode9_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="09">
            </td>
            <td class="choose">
                <span class="num ballR">19</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode19_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="19">
            </td>
            <td class="choose">
                <span class="num ballR">29</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode29_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="29">
            </td>
            <td class="choose">
                <span class="num ballG">39</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode39_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="39">
            </td>
            <td class="choose">
                <span class="num ballG">49</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode49_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="49">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">10</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode10_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="10">
            </td>
            <td class="choose">
                <span class="num ballB">20</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode20_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="20">
            </td>
            <td class="choose">
                <span class="num ballR">30</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode30_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="30">
            </td>
            <td class="choose">
                <span class="num ballR">40</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode40_5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="4"  data-itemno="40">
            </td>
        </tr>
        </tbody></table>

    <table class="order-table tabs-view" tabs-view="6" style="display: none;">
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
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode1_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006"  data-position="5"  data-itemno="01">
            </td>
            <td class="choose">
                <span class="num ballG">11</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode11_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="11">
            </td>
            <td class="choose">
                <span class="num ballG">21</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode21_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="21">
            </td>
            <td class="choose">
                <span class="num ballB">31</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode31_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="31">
            </td>
            <td class="choose">
                <span class="num ballB">41</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode41_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="41">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">02</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode2_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="02">
            </td>
            <td class="choose">
                <span class="num ballR">12</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode12_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="12">
            </td>
            <td class="choose">
                <span class="num ballG">22</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode22_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="22">
            </td>
            <td class="choose">
                <span class="num ballG">32</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode32_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="32">
            </td>
            <td class="choose">
                <span class="num ballB">42</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode42_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="42">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">03</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode3_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="03">
            </td>
            <td class="choose">
                <span class="num ballR">13</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode13_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="13">
            </td>
            <td class="choose">
                <span class="num ballR">23</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode23_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="23">
            </td>
            <td class="choose">
                <span class="num ballG">33</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode33_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="33">
            </td>
            <td class="choose">
                <span class="num ballG">43</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode43_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="43">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">04</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode4_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="04">
            </td>
            <td class="choose">
                <span class="num ballB">14</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode14_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="14">
            </td>
            <td class="choose">
                <span class="num ballR">24</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode24_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="24">
            </td>
            <td class="choose">
                <span class="num ballR">34</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode34_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="34">
            </td>
            <td class="choose">
                <span class="num ballG">44</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode44_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="44">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">05</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode5_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="05">
            </td>
            <td class="choose">
                <span class="num ballB">15</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode15_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="15">
            </td>
            <td class="choose">
                <span class="num ballB">25</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode25_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="25">
            </td>
            <td class="choose">
                <span class="num ballR">35</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode35_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="35">
            </td>
            <td class="choose">
                <span class="num ballR">45</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode45_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="45">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballG">06</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode6_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="06">
            </td>
            <td class="choose">
                <span class="num ballG">16</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode16_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="16">
            </td>
            <td class="choose">
                <span class="num ballB">26</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode26_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="26">
            </td>
            <td class="choose">
                <span class="num ballB">36</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode36_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="36">
            </td>
            <td class="choose">
                <span class="num ballR">46</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode46_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="46">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">07</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode7_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="07">
            </td>
            <td class="choose">
                <span class="num ballG">17</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode17_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="17">
            </td>
            <td class="choose">
                <span class="num ballG">27</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode27_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="27">
            </td>
            <td class="choose">
                <span class="num ballB">37</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode37_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="37">
            </td>
            <td class="choose">
                <span class="num ballB">47</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode47_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="47">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballR">08</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode8_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="08">
            </td>
            <td class="choose">
                <span class="num ballR">18</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode18_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="18">
            </td>
            <td class="choose">
                <span class="num ballG">28</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode28_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="28">
            </td>
            <td class="choose">
                <span class="num ballG">38</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode38_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="38">
            </td>
            <td class="choose">
                <span class="num ballB">48</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode48_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="48">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">09</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode9_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="09">
            </td>
            <td class="choose">
                <span class="num ballR">19</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode19_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="19">
            </td>
            <td class="choose">
                <span class="num ballR">29</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode29_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="29">
            </td>
            <td class="choose">
                <span class="num ballG">39</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode39_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="39">
            </td>
            <td class="choose">
                <span class="num ballG">49</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode49_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="49">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <span class="num ballB">10</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode10_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="10">
            </td>
            <td class="choose">
                <span class="num ballB">20</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode20_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="20">
            </td>
            <td class="choose">
                <span class="num ballR">30</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode30_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="30">
            </td>
            <td class="choose">
                <span class="num ballR">40</span>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[61006].odds.toFixed(2)#></span>
                <input type="text" id="itemCode40_6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="61006" data-position="5"  data-itemno="40">
            </td>
        </tr>
        </tbody></table>
</script>

<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/lhc_zmt.js?51189" type="text/javascript"></script>
<script type="application/javascript">

var itemInfo = "";
$.ajax({
	url: "${ctx}/lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId=7",
	type: "get",
	dataType: "json",
    success: function(b) {
    	itemInfo = b;
        if(0 == b.code){
        	var html = tpl('#contentTpl', b);
            $("#locate-box").html(html);
        }else{
            Showbo.Msg.alert('请登录！')
            window.location.href="${ctx}/logout.do";
        }
    }
});
//获取降水
function getDownRateInfo(){
$.ajax({
	url: "${ctx}/lhc/getDownRate.do?timeStamp=" + new Date().getTime()+"&poolId=7",
	type: "get",
	dataType: "json",
    success: function(b) {
    	//console.debug(b);
     	if(0 == b.code && b.list != null && b.list != undefined && b.list != ''){
     		var list = b.list;
     		$.each(list, function(n,value) {
   					var itemcode = value.itemcode;
   					var betdata = value.betdata;
   					var position = value.payrule;
       				var input$ = $("input[data-itemcode="+itemcode+"][data-itemno="+betdata+"][data-position="+position+"]");
       				//console.debug(itemInfo);
       				var num = itemInfo.items_map[itemcode].odds.toFixed(2);
       				//console.debug(num);
       				rate = (num - value.downrate).toFixed(2);
       				input$.siblings(".odds").html(rate);
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
