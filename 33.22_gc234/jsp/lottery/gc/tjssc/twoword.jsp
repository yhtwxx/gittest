<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="order-box" class="order-box-oneword game-state-opening">

	<!--砝码快选-->
	<jsp:include page="../lottoBet.jsp" />

	<div id="orders">
		<!-- javascript app 使用 -->

		<div class="game-box" style="display: block;">
			<div class="tabs-box tabs-view-4">
				<div class="tabs">
					<span class="choose-item-cnt">已选取：0笔</span>
					<ul id="tabs">
						<li tabs="1" class="tabs-btn active"><a>前三</a></li>
						<li tabs="2" class="tabs-btn"><a>中三</a></li>
						<li tabs="3" class="tabs-btn"><a>后三</a></li>
					</ul>
				</div>

				<div class="quick-bet">
					<!-- <span> <span class="quick-bet-title">下注金额：</span> <input
						type="text" id="Gold" class="itemCode1">
					</span> -->
					<div class="quick-bet-h">
						<span class="quick-bet-head">头</span> <span type="h">0</span> <span
							type="h">1</span> <span type="h">2</span> <span type="h">3</span>
						<span type="h">4</span> <span type="h">5</span> <span type="h">6</span>
						<span type="h">7</span> <span type="h">8</span> <span type="h">9</span>
					</div>
					<div class="quick-bet-t">
						<span class="quick-bet-tail">尾</span> <span type="t">0</span> <span
							type="t">1</span> <span type="t">2</span> <span type="t">3</span>
						<span type="t">4</span> <span type="t">5</span> <span type="t">6</span>
						<span type="t">7</span> <span type="t">8</span> <span type="t">9</span>
					</div>
				</div>

				<div id="locate-box">
					<table class="order-table tabs-view active" tabs-view="1"
						style="display: table;">
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
						<tbody id="content1">


						</tbody>
					</table>
					<table class="order-table tabs-view" tabs-view="2"
						style="display: none;">
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
						<tbody id="content2">


						</tbody>
					</table>
					<table class="order-table tabs-view" tabs-view="3"
						style="display: none;">
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
						<tbody id="content3">


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

<div id="result" style="display: none">
	<table class="CQSC">
		<thead>
			<tr>
				<th>期数</th>
				<th>号码1</th>
				<th>号码2</th>
				<th>号码3</th>
				<th>号码4</th>
				<th>号码5</th>
			</tr>
		</thead>
		<tbody>
			<tr class="RoundResult">
				<td class="result-game-num">20150525-067</td>
				<td class="ball-field ball-num-01">
					<!-- javascript 操作 -->
					<span>-</span>
				</td>
				<td class="ball-field ball-num-02">
					<!-- javascript 操作 -->
					<span>-</span>
				</td>
				<td class="ball-field ball-num-03">
					<!-- javascript 操作 -->
					<span>-</span>
				</td>
				<td class="ball-field ball-num-04">
					<!-- javascript 操作 -->
					<span>-</span>
				</td>
				<td class="ball-field ball-num-05">
					<!-- javascript 操作 -->
					<span>-</span>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<script type="text/template" id="contentTpl1">
    <tr>

        <# for(var i=14091; i<14146; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if(i%5==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl2">
    <tr>

        <# for(var i=14146; i<14201; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text" class="itemCode" value="" name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if(i%5==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl3">
    <tr>

        <# for(var i=14201; i<14256; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if(i%5==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script src="${ctx}/js/lib/tpl.js"></script>
<script src="${ctx}/js/lib/countdown.js"></script>
<script src="${ctx}/js/lottery/tjssc/mem_order_tjssc.js"></script>
<script>
$(function() {
    //循环输出
    $.ajax({url: "${ctx}/tjssc/itemDate.do?timeStamp=" + new Date().getTime()+"&poolId=5",type: "get",dataType: "json",
        success: function(b) {
            if(0 == b.code){
                var html1 = tpl('#contentTpl1', b);
                $("#content1").html(html1);
                var html2 = tpl('#contentTpl2', b);
                $("#content2").html(html2);
                var html3 = tpl('#contentTpl3', b);
                $("#content3").html(html3);
            }else{
               parent.Showbo.Msg.alert('请登录！')
                window.location.href=ctx+"logout.do";
            }
        }})

    function compose(){
        var dimensions = [], results = [],
            index, max;

        function explore(curDim, prefix){
            var nextDim = dimensions.shift();
            for (var i = 0; i < curDim.length; i ++) {
                if (nextDim) {
                    explore(nextDim, prefix + curDim[i]);
                } else {
                    results.push(prefix + curDim[i]);
                }
            }
            nextDim && dimensions.push(nextDim);
        }

        for (index = 0, max = arguments.length; index < max; ++ index) {
            dimensions.push(arguments[index]);
        }

        explore(dimensions.shift(), "");
        return results;
    }


    var ui = this;
    $parent = $(".game-box");
// 存放子物件
    ui._$view = $parent.find('.quick-bet');
    $gold_total = $('#BetGold');
    ui._$parent = $parent;

// 下注金额栏位
    ui._$view_inputs = ui._$view.find('input').


        on('keyup', function () {
            var el = this;
            el.value = format_gold(el.value);
            console.log(el.value);
        }).
        on('change', function () {
            var el = this;
            el.value = format_gold(el.value);
            console.log(el.value);
        });



    ui._$view.find('.quick-bet-h, .quick-bet-t').on('click', 'span[type]', function(){
        if ( $("#kuaijiexiaju_input").val() > 0) {
            $(this).toggleClass('active');
            render();
        } else {
            parent.Showbo.Msg.alert('请输入金额！');
            $("#kuaijiexiaju_input").focus();
        }
    });



   var render= function(){
       var  $parent = $(".game-box");
// 存放子物件
       var ui = this,
           chooses = ui._chooses,
           head = [],
           tail = [],
           $content;
       var _$view = $parent.find('.quick-bet');
        var $gold_total = $('#BetGold');



        var gold = $("#kuaijiexiaju_input").val();

        if ($parent.data('tabs-active')) {
            $content =$parent.data('tabs_data').views[$parent.data('tabs-active')];
        } else {
            $content = $parent;
        }

       //替代上面代码
       var tabs_view = $("#tabs").find(".active").attr("tabs");
       var this_tabs = 'tabs-view='+tabs_view;
       $content =  $("table["+this_tabs+"]");

        _$view.find('span[type]').filter('.active').each(function(){
            var $el = $(this);
            switch ($el.attr('type')) {
                case 'h':
                    head.push($el.html());
                    break;
                case 't':
                    tail.push($el.html());
                    break;
                default:
            }
        });
       $("#locate-box").find('input').val('');
        $content.find('.choose-num').removeClass('active');
       var allGold = 0;
        if (head.length > 0 && tail.length > 0) {
            var cps = toJSON(compose(head, tail));
            $content.find('.choose-num').each(function(){
                var $el = $(this),
                    num = $el.html().replace(/X/, ''),
                    $input = $el.next().find('input');
                if (cps.hasOwnProperty(num)) {
                    $el.addClass('active');
                    $input.val(gold);
                    allGold += format_gold(gold);
                }
            });
        } else if (head.length > 0) {
            $.each(head, function(k, v){
                $content.find('.choose-num').each(function(){
                    var $el = $(this);
                    var $input =  $el.next().find('input');

                    if ($el.html().replace(/X/, '').charAt(0) === v) {
                        $el.addClass('active');
                        $input.val(gold);
                        allGold += format_gold(gold);
                    }
                });
            });
        } else if (tail.length > 0) {
            $.each(tail, function(k, v){
                $content.find('.choose-num').each(function(){
                    var $el = $(this);
                    var $input =  $el.next().find('input');

                    if ( $el.html().replace(/X/, '').charAt(1) === v) {
                        $el.addClass('active');
                        $input.val(gold);
                        allGold += format_gold(gold);
                    }
                });
            });
        }
       $gold_total.text(allGold);
       // ui.notice(null, 'gold_change');
        //ui.count();
    };

    function format_gold(gold) {
        return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
    }

    var isEnable = function (choose) {

        var chooses = this,
            item = chooses.get(choose);

        return item && !item.disable() &&
            is_effective_odds(item.odds());
    }


});
</script>