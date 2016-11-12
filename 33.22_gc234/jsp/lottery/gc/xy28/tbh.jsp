<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="order-box" class="order-box-oneword game-state-opening">

	<!--砝码快选-->
	<jsp:include page="../lottoBet.jsp" />

	<div id="locate-box">
		<!-- javascript app 使用 -->

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
            <th colspan="8" class="table_title tm">特码</th>
        </tr>
        </thead>
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
        </tr>
        </thead>
        <tbody><tr>
            <td class="choose">
                <b class="ball_3">0</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="01">
            </td>
            <td class="choose">
                <b class="ball_1">7</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode11"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="11">
            </td>
            <td class="choose">
                <b class="ball_3">14</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode21"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="21">
            </td>
            <td class="choose">
                <b class="ball_0">21</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode31"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="31">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <b class="ball_1">1</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="02">
            </td>
            <td class="choose">
                <b class="ball_2">8</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode12"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="12">
            </td>
            <td class="choose">
                <b class="ball_0">15</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode22"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="22">
            </td>
            <td class="choose">
                <b class="ball_1">22</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode32"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="32">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <b class="ball_2">2</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="03">
            </td>
            <td class="choose">
                <b class="ball_0">9</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode13"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="13">
            </td>
            <td class="choose">
                <b class="ball_1">16</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode23"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="23">
            </td>
            <td class="choose">
                <b class="ball_2">23</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode33"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="33">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <b class="ball_0">3</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="04">
            </td>
            <td class="choose">
                <b class="ball_1">10</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode14"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="14">
            </td>
            <td class="choose">
                <b class="ball_2">17</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode24"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="24">
            </td>
            <td class="choose">
                <b class="ball_0">24</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode34"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="34">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <b class="ball_1">4</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="05">
            </td>
            <td class="choose">
                <b class="ball_2">11</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode15"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="15">
            </td>
            <td class="choose">
                <b class="ball_0">18</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode25"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="25">
            </td>
            <td class="choose">
                <b class="ball_1">25</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode35"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="35">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <b class="ball_2">5</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode6"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="06">
            </td>
            <td class="choose">
                <b class="ball_0">12</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode16"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="16">
            </td>
            <td class="choose">
                <b class="ball_1">19</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode26"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="26">
            </td>
            <td class="choose">
                <b class="ball_2">26</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode36"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="36">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <b class="ball_0">6</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode7"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="07">
            </td>
            <td class="choose">
                <b class="ball_3">13</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode17"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="17">
            </td>
            <td class="choose">
                <b class="ball_2">20</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode27"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="27">
            </td>
            <td class="choose">
                <b class="ball_3">27</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode37"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="37">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <b class="ball_7 ball_txt">特码包三</b>
            </td>
            <td class="choose-item" colspan="7">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <select>
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                    <option>13</option>
                    <option>14</option>
                    <option>15</option>
                    <option>16</option>
                    <option>17</option>
                    <option>18</option>
                    <option>19</option>
                    <option>20</option>
                    <option>21</option>
                    <option>22</option>
                    <option>23</option>
                    <option>24</option>
                    <option>25</option>
                    <option>26</option>
                    <option>27</option>
                </select>
                <select>
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                    <option>13</option>
                    <option>14</option>
                    <option>15</option>
                    <option>16</option>
                    <option>17</option>
                    <option>18</option>
                    <option>19</option>
                    <option>20</option>
                    <option>21</option>
                    <option>22</option>
                    <option>23</option>
                    <option>24</option>
                    <option>25</option>
                    <option>26</option>
                    <option>27</option>
                </select>
                <select>
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                    <option>13</option>
                    <option>14</option>
                    <option>15</option>
                    <option>16</option>
                    <option>17</option>
                    <option>18</option>
                    <option>19</option>
                    <option>20</option>
                    <option>21</option>
                    <option>22</option>
                    <option>23</option>
                    <option>24</option>
                    <option>25</option>
                    <option>26</option>
                    <option>27</option>
                </select>
                <input type="text" id="itemCode8"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="08">
            </td>
        </tr>
        </tbody></table>

    <table class="order-table tabs-view" tabs-view="1" style="display: table;">
        <thead>
        <tr>
            <th colspan="4" class="table_title hh">混合</th>
            <th colspan="2" class="table_title bs">波色</th>
            <th colspan="2" class="table_title bz">豹子</th>
        </tr>
        </thead>
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
        </tr>
        </thead>
        <tbody><tr>
            <td class="choose">
                <b class="ball_4 ball_txt">大</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode1"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="01">
            </td>
            <td class="choose">
                <b class="ball_5 ball_txt">小</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode11"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="11">
            </td>
            <td class="choose">
                <b class="ball_0 ball_txt">红波</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode21"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="21">
            </td>
            <td class="choose" rowspan="5">
                <b class="ball_6 ball_txt">豹子</b>
            </td>
            <td class="choose-item" rowspan="5">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode31"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="31">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <b class="ball_4 ball_txt">单</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode2"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="02">
            </td>
            <td class="choose">
                <b class="ball_5 ball_txt">双</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode12"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="12">
            </td>
            <td class="choose">
                <b class="ball_1 ball_txt">绿波</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode22"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="22">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <b class="ball_4 ball_txt">大单</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode3"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="03">
            </td>
            <td class="choose">
                <b class="ball_5 ball_txt">小单</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode13"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="13">
            </td>
            <td class="choose">
                <b class="ball_2 ball_txt">蓝波</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode23"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="23">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <b class="ball_4 ball_txt">大双</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode4"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="04">
            </td>
            <td class="choose">
                <b class="ball_5 ball_txt">小双</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode14"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="14">
            </td>
            <td class="choose">
            </td>
            <td class="choose-item">
            </td>
        </tr>
        <tr>
            <td class="choose">
                <b class="ball_4 ball_txt">极大</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode5"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="05">
            </td>
            <td class="choose">
                <b class="ball_5 ball_txt">极小</b>
            </td>
            <td class="choose-item">
                <span class="odds"><#=items_map[63001].odds.toFixed(2)#></span>
                <input type="text" id="itemCode15"  class="itemCode" value=""  name="itemCode[]" data-itemcode="63001" data-itemno="15">
            </td>
            <td class="choose">
            </td>
            <td class="choose-item">
            </td>
        </tr>
        </tbody></table>
</script>

<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<script src="${ctx}/js/lottery/lhc/lhc_lm.js?51188" type="text/javascript"></script>
<script type="application/javascript">
//获取彩池
var itemInfo = "";
$.ajax({
	url: "${ctx}/lhc/getItem.do?timeStamp=" + new Date().getTime()+"&poolId=1,2,5",
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
	url: "${ctx}/lhc/getDownRate.do?timeStamp=" + new Date().getTime()+"&poolId=1,2,5",
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