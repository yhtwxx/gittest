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
					<div class="tabs">
						<ul id="tabs">
							<li tabs="1" class="tabs-btn"><a>万</a></li>
							<li tabs="2" class="tabs-btn"><a>仟</a></li>
							<li tabs="3" class="tabs-btn"><a>佰</a></li>
							<li tabs="4" class="tabs-btn"><a>拾</a></li>
							<li tabs="5" class="tabs-btn active"><a>个</a></li>
						</ul>
					</div>
				</div>

				<div class="quick-bet tabs-box">
					<!-- <span>下注金额：<input type="text" id="Gold" class="itemCode1"></span> -->
					<span type="over">大</span> <span type="under">小</span> <span
						type="odd">单</span> <span type="even">双</span> <span type="prime">质</span>
					<span type="compo">合</span>
				</div>

				<div id="locate-box">
					<table class="order-table tabs-view" tabs-view="1"
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


					<table class="order-table tabs-view" tabs-view="4"
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
						<tbody id="content4">

						</tbody>
					</table>

					<table class="order-table tabs-view" tabs-view="5"
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
						<tbody id="content5">

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
					<!-- javascript 操作 --> <span>-</span>
				</td>
				<td class="ball-field ball-num-02">
					<!-- javascript 操作 --> <span>-</span>
				</td>
				<td class="ball-field ball-num-03">
					<!-- javascript 操作 --> <span>-</span>
				</td>
				<td class="ball-field ball-num-04">
					<!-- javascript 操作 --> <span>-</span>
				</td>
				<td class="ball-field ball-num-05">
					<!-- javascript 操作 --> <span>-</span>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<script type="text/template" id="contentTpl1">
    <tr>
    <# for(var i=10001; i<10011; i++) { #>
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
    <# for(var i=10011; i<10021; i++) { #>
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

<script type="text/template" id="contentTpl3">
    <tr>
    <# for(var i=10021; i<10031; i++) { #>
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

<script type="text/template" id="contentTpl4">
    <tr>
    <# for(var i=10031; i<10041; i++) { #>
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

<script type="text/template" id="contentTpl5">
    <tr>
    <# for(var i=10041; i<10051; i++) { #>
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
<script src="${ctx}/js/lottery/shssc/mem_order_shssc.js"></script>
<script>
	$(function() {
		//循环输出
		$.ajax({
			url : "${ctx}/shssc/itemDate.do?timeStamp=" + new Date().getTime()
					+ "&poolId=1",
			type : "get",
			dataType : "json",
			success : function(b) {
				if (0 == b.code) {
					var html1 = tpl('#contentTpl1', b);
					$("#content1").html(html1);
					var html2 = tpl('#contentTpl2', b);
					$("#content2").html(html2);
					var html3 = tpl('#contentTpl3', b);
					$("#content3").html(html3);
					var html4 = tpl('#contentTpl4', b);
					$("#content4").html(html4);
					var html5 = tpl('#contentTpl5', b);
					$("#content5").html(html5);
				} else {
					parent.Showbo.Msg.alert('请登录!')
					setTimeout(function() {
						window.location.href = ctx + "logout.do";
					}, 1000);
				}
			}
		})

		var ui = this;
		$parent = $(".game-box");
		// 存放子物件
		ui._$view = $parent.find('.quick-bet');
		$gold_total = $('#BetGold');
		ui._$parent = $parent;
		// ui._chooses = chooses;

		// 下注金额栏位
		ui._$view_inputs = ui._$view.find('input').on('keyup', function() {
			var el = this;
			el.value = format_gold(el.value);
			console.log(el.value);
		}).on('change', function() {
			var el = this;
			el.value = format_gold(el.value);
			console.log(el.value);
		});

		// 快速下注
		$("#order-box")
				.on(
						'click',
						'span[type]',
						function() {
							var $el = $(this), gold = $("#kuaijiexiaju_input").val(), $content;

							function isPrime(n) {
								if (n < 2)
									return false;
								var q = Math.sqrt(n);
								for (var i = 2; i <= q; i++) {
									if (n % i == 0) {
										return false;
									}
								}
								return true;
							}

							var Filter = {
								'odd' : function(num) {
									return (num % 2 !== 0);
								},
								'even' : function(num) {
									return (num % 2 === 0);
								},
								'over' : function(num) {
									return (num > 4);
								},
								'under' : function(num) {
									return (num < 5);
								},
								'prime' : function(num) {
									return (isPrime(num) || num === '1');
								},
								'compo' : function(num) {
									return !(isPrime(num) || num === '1');
								}
							};

							if (gold > 0) {
								$el.siblings('span[type]')
										.removeClass('active');
								var type = $el.addClass('active').attr('type');

								//替代上面代码
								var tabs_view = $("#tabs").find(".active")
										.attr("tabs");
								var this_tabs = 'tabs-view=' + tabs_view;
								if (Filter.hasOwnProperty(type)) {
									var allGold = 0;
									$("table[" + this_tabs + "]")
											.find('.choose-num')
											.each(
													function() {
														var $num = $(this)
																.removeClass(
																		'active');
														var num = $num.html();
														var $input = $num
																.next()
																.find('input');
														if (Filter[type](num)) {
															$input.val(gold);
															allGold += format_gold(gold);
															$num
																	.addClass('active');
														} else {
															$input.val('');
														}
													});
									$("#BetGold").text(allGold);
								}

							} else {
								parent.Showbo.Msg.alert('请输入金额！')
								$("#kuaijiexiaju_input").focus();
							}
						});

		function format_gold(gold) {
			return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
		}

		var isEnable = function(choose) {

			var chooses = this, item = chooses.get(choose);

			return item && !item.disable() && is_effective_odds(item.odds());
		}

	});
</script>