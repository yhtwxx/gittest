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

					<div class="cqsc">
						<div id="order-box" class="order-box-oneword game-state-opening">

							<!--砝码快选-->
                			<jsp:include page="../lottery/gc/lottoBet.jsp" />

							<div id="orders">
								<!-- javascript app 使用 -->

								<div class="game-box" style="display: block;">
									<div class="tabs-box tabs-view-4">
										<div class="tabs">
											<span class="choose-item-cnt">已选取：0笔</span>
											<ul id="tabs">
												<li tabs="1" class="tabs-btn active"><a>万仟</a></li>
												<li tabs="2" class="tabs-btn"><a>万佰</a></li>
												<li tabs="3" class="tabs-btn"><a>万拾</a></li>
												<li tabs="4" class="tabs-btn"><a>万个</a></li>
												<li tabs="5" class="tabs-btn"><a>仟佰</a></li>
												<li tabs="6" class="tabs-btn"><a>仟拾</a></li>
												<li tabs="7" class="tabs-btn"><a>仟个</a></li>
												<li tabs="8" class="tabs-btn"><a>佰拾</a></li>
												<li tabs="9" class="tabs-btn"><a>佰个</a></li>
												<li tabs="10" class="tabs-btn"><a>拾个</a></li>
											</ul>
										</div>

										<div class="quick-bet">
											<span><span class="quick-bet-title">下注金额：</span> <input
												type="text" id="Gold" class="itemCode1"></span>
											<div class="quick-bet-h">
												<span class="quick-bet-head">头</span> <span type="h">0</span>
												<span type="h">1</span> <span type="h">2</span> <span
													type="h">3</span> <span type="h">4</span> <span type="h">5</span>
												<span type="h">6</span> <span type="h">7</span> <span
													type="h">8</span> <span type="h">9</span>
											</div>
											<div class="quick-bet-t">
												<span class="quick-bet-tail">尾</span> <span type="t">0</span>
												<span type="t">1</span> <span type="t">2</span> <span
													type="t">3</span> <span type="t">4</span> <span type="t">5</span>
												<span type="t">6</span> <span type="t">7</span> <span
													type="t">8</span> <span type="t">9</span>
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
												<tbody id="content5">

												</tbody>
											</table>
											<table class="order-table tabs-view" tabs-view="6"
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
												<tbody id="content6">

												</tbody>
											</table>
											<table class="order-table tabs-view" tabs-view="7"
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
												<tbody id="content7">

												</tbody>
											</table>
											<table class="order-table tabs-view" tabs-view="8"
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
												<tbody id="content8">

												</tbody>
											</table>
											<table class="order-table tabs-view" tabs-view="9"
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
												<tbody id="content9">

												</tbody>
											</table>
											<table class="order-table tabs-view" tabs-view="10"
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
												<tbody id="content10">

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
					</div>

				</div>
				<div class="clearfix"></div>
			</div>

	<script type="text/template" id="contentTpl1">
    <tr>
    <# for(var i=10051; i<10151; i++) { #>
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
    <# for(var i=10151; i<10251; i++) { #>
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
    <# for(var i=10251; i<10351; i++) { #>
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
    <# for(var i=10351; i<10451; i++) { #>
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
    <# for(var i=10451; i<10551; i++) { #>
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

	<script type="text/template" id="contentTpl6">
    <tr>
    <# for(var i=10551; i<10651; i++) { #>
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

	<script type="text/template" id="contentTpl7">
    <tr>
    <# for(var i=10651; i<10751; i++) { #>
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

	<script type="text/template" id="contentTpl8">
    <tr>
    <# for(var i=10751; i<10851; i++) { #>
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

	<script type="text/template" id="contentTpl9">
    <tr>
    <# for(var i=10851; i<10951; i++) { #>
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

	<script type="text/template" id="contentTpl10">
    <tr>
    <# for(var i=10951; i<11051; i++) { #>
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

	<script src="../js/lib/tpl.js" type="text/javascript"></script>
	<script src="../js/lib/countdown.js" type="text/javascript"></script>
	<script src="${ctx}/js/lottert/common.js" type="text/javascript"></script>
	<script src="../js/lottery/mem_order_cqsc.js?51197755" type="text/javascript"></script>
	<script src="../js/lottery/twoworddw.quick.choose.js?51197755" type="text/javascript"></script>
	<script src="../js/lottery/Util.js" type="text/javascript"></script>

	<c:choose>

		<c:when test="${code == 0}">
			<script language="javascript" type="text/javascript">
				$("#headerLogin").hide();
				$("#headerPanel").show();
			</script>
		</c:when>

		<c:when test="${accountno != null}">
			<script language="javascript" type="text/javascript">
				$("#headerLogin").hide();
				$("#headerPanel").show();
			</script>
		</c:when>

		<c:when test="${code == null}">
			<script language="javascript" type="text/javascript">
				
			</script>
		</c:when>

		<c:otherwise>
			<script language="javascript" type="text/javascript">
				alert('<spring:message code="${code}"/>');
				$("#headerPanel").hide();
				$("#headerLogin").show();
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>
