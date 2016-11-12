<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="order-box" class="order-box-oneword game-state-opening">

	<!--砝码快选-->
	<%-- <jsp:include page="../lottoBet.jsp" /> --%>

	<div id="orders">
		<!-- javascript app 使用 -->
		<div class="game-box">
			<div>
				<div class="tabs">
					<ul id="tabs">
						<li tabs="1" class="tabs-btn active"><a>前三</a></li>
						<li tabs="2" class="tabs-btn"><a>中三</a></li>
						<li tabs="3" class="tabs-btn"><a>后三</a></li>
					</ul>
				</div>

				<button class="btn-all-in" type="button">全包</button>

				<p class="rule-descript">组选三至少要选择5个号码!!</p>

				<div id="locate-box">
					<table class="order-table" tabs-view="1" style="display: table;">
						<caption>选号区</caption>
						<tbody>
							<tr>
								<td class="choose-item" num="0"><span>0</span></td>
								<td class="choose-item" num="1"><span>1</span></td>
								<td class="choose-item" num="2"><span>2</span></td>
								<td class="choose-item" num="3"><span>3</span></td>
								<td class="choose-item" num="4"><span>4</span></td>
							</tr>
							<tr>
								<td class="choose-item" num="5"><span>5</span></td>
								<td class="choose-item" num="6"><span>6</span></td>
								<td class="choose-item" num="7"><span>7</span></td>
								<td class="choose-item" num="8"><span>8</span></td>
								<td class="choose-item" num="9"><span>9</span></td>
							</tr>
							<tr>
								<td class="choose" colspan="11"><span>已选号码数:<span
										class="display-bets-info">0</span></span> <span
									class="display-odds-item">@<span class="odds">0</span></span> <input
									type="text" class="bet-gold itemCode menu" data-itemcode=""
									data-itemno=""></td>
							</tr>
						</tbody>
					</table>
					<table class="order-table" tabs-view="2" style="display: none;">
						<caption>选号区</caption>
						<tbody>
							<tr>
								<td class="choose-item" num="0"><span>0</span></td>
								<td class="choose-item" num="1"><span>1</span></td>
								<td class="choose-item" num="2"><span>2</span></td>
								<td class="choose-item" num="3"><span>3</span></td>
								<td class="choose-item" num="4"><span>4</span></td>
							</tr>
							<tr>
								<td class="choose-item" num="5"><span>5</span></td>
								<td class="choose-item" num="6"><span>6</span></td>
								<td class="choose-item" num="7"><span>7</span></td>
								<td class="choose-item" num="8"><span>8</span></td>
								<td class="choose-item" num="9"><span>9</span></td>
							</tr>
							<tr>
								<td class="choose" colspan="11"><span>已选号码数:<span
										class="display-bets-info">0</span></span> <span
									class="display-odds-item">@<span class="odds">0</span></span> <input
									type="text" class="bet-gold itemCode menu" data-itemcode=""
									data-itemno=""></td>
							</tr>
						</tbody>
					</table>
					<table class="order-table" tabs-view="3" style="display: none;">
						<caption>选号区</caption>
						<tbody>
							<tr>
								<td class="choose-item" num="0"><span>0</span></td>
								<td class="choose-item" num="1"><span>1</span></td>
								<td class="choose-item" num="2"><span>2</span></td>
								<td class="choose-item" num="3"><span>3</span></td>
								<td class="choose-item" num="4"><span>4</span></td>
							</tr>
							<tr>
								<td class="choose-item" num="5"><span>5</span></td>
								<td class="choose-item" num="6"><span>6</span></td>
								<td class="choose-item" num="7"><span>7</span></td>
								<td class="choose-item" num="8"><span>8</span></td>
								<td class="choose-item" num="9"><span>9</span></td>
							</tr>
							<tr>
								<td class="choose" colspan="11"><span>已选号码数:<span
										class="display-bets-info">0</span></span> <span
									class="display-odds-item">@<span class="odds">0</span></span> <input
									type="text" class="bet-gold itemCode menu" data-itemcode=""
									data-itemno=""></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div id="order-info">
		<div class="inner">
			<span>下注金额:<span id="BetGold">0</span></span>
			<!-- IE 8,9 瀏覽器BUG 在INPUT上按ENTER會被FOCUS到BTN物件觸發CLICK事件 (加上type="reset" 可以避開) -->
			<button type="reset" id="btn-orders-reset" class="btn-cancel"
				onclick="reset()">取消</button>
			<button id="btn-orders-submit" class="btn-submit">确认</button>
		</div>
	</div>

	<jsp:include page="lz.jsp"></jsp:include>
</div>

<script src="${ctx}/js/lib/tpl.js"></script>
<script src="${ctx}/js/lib/countdown.js"></script>
<script src="${ctx}/js/lottery/xjssc/mem_order_xjssc.js"></script>
<script src="${ctx}/js/lottery/group3.page.choose.js"></script>
<script src="${ctx}/js/lottery/menu_util.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#tabs li").bind("click", function () {
            $parent = $(".game-box");
            $parent.find(".active").each(function () {
                $(this).removeClass('active');
            })
            $parent.find(".display-bets-info").each(function () {
                $(this).html(0);
            })
            $parent.find(".odds").each(function () {
                $(this).html(0);
            })
            $("#tabs-body").find("input").each(function() {
                $(this).val('');
            })

            var index = $(this).index();
            var divs = $("#locate-box > table");
            $(this).parent().children("li").attr("class", "tabs-btn");//将所有选项置为未选中
            $(this).attr("class", "tabs-btn active"); //设置当前选中项为选中样式
            divs.hide();//隐藏所有选中项内容
            divs.eq(index).show(); //显示选中项对应内容
            tabs_view = $("#tabs").find(".active").attr("tabs");
            this_tabs = 'tabs-view='+tabs_view;
            // 賠率欄位
            ui._$view_odds = $("table["+this_tabs+"]").find('.odds');
            // 選取資訊
            ui._$view_info = $("table["+this_tabs+"]").find('.display-bets-info');
            ui._$bet_gold = $("table["+this_tabs+"]").find('.bet-gold');
            ui.select = {};
            ui.selected = 0;
            ui._$view_odds.text(0);
            ui._$view_info.text(0);
            ui._$bet_gold.attr("data-itemcode","");
            ui._$bet_gold.attr("data-itemno","");
            ui._$bet_gold.text("");
            $(".bet-gold").val("");
        });

    });

    function render1(tabs_view){
        var ui = this
        var data = makeArray(ui.select);
        var nums = data.length;
        var itemcode;
        var itemNo;
        var sumOfOdds = 0, odds = 0, cnt = 0, info = '', bets;

        if (nums > 4) {
            bets = C(data, 2);
            cnt = bets.length;
            // 获取赔率
            odds = config_group3[tabs_view][nums].dds;
            info = ' (:nums)'.replace(/:nums/, data.join(','));
            itemNo = data.join(',');
            itemcode = config_group3[tabs_view][nums].itemCode;
        }

        ui._$view_odds.text(odds);
        ui._$view_info.text(nums + info);
        ui._$bet_gold.attr("data-itemcode",itemcode);
        ui._$bet_gold.attr("data-itemno",itemNo);

        // 更新資料
        ui.odds(odds);
        ui.selected = nums;
    }
    
    var config_group3="";
    //console.debug(config_group3);
    $(function() {
        //循环输出
        $.ajax({url: "${ctx}/xjssc/itemDate.do?timeStamp=" + new Date().getTime()+"&poolId=A",type: "get",dataType: "json",
            success: function(b) {
            	console.debug(b);
                if(0 == b.code){
                	var itmes = b.items_map;
                	//console.debug(itmes);
                	var str = ""; 
                	//前三
                	var jsonT = "{";
                	var jsonT1 = "1: {";
                	var num1=5; //最少选4个数开始
                	for (var i=15429; i < 15435; i++) {
                		jsonT1 += num1 + ": {dds:" + itmes[i].odds + ", itemCode:" + itmes[i].itemCode + "}";
                		if(num1 != 10){
                			jsonT1 += ",";
                		}
                		num1++;
                	}
                	jsonT1 += "},";
                	//中三
                	var jsonT2 = "2: {";
                	var num2=5; //最少选4个数开始
    				for (var i=15435; i < 15441; i++) {
    					jsonT2 += num2 + ": {dds:" + itmes[i].odds + ", itemCode:" + itmes[i].itemCode + "}";
                		if(num2 != 10){
                			jsonT2 += ",";
                		}
                		num2++;        		
    				}
    				jsonT2 += "},";
                	//后三
                	var jsonT3 = "3: {";
                	var num3=5; //最少选4个数开始
    				for (var i=15441; i <= 15446; i++) {
    					jsonT3 += num3 + ": {dds:" + itmes[i].odds + ", itemCode:" + itmes[i].itemCode + "}";
                		if(num3 != 10){
                			jsonT3 += ",";
                		}
                		num3++; 
    				}
    				jsonT3 += "}";
    				jsonT += jsonT1+jsonT2+jsonT3+"}";
    				var obj = eval('(' + jsonT + ')');
    				config_group3 = obj;
                }
            }})
    });
    
</script>
