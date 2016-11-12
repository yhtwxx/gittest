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
			<div class="tabs-box tabs-view-1">
				<div class="tabs">
					<ul id="tabs">
						<li tabs="1" class="tabs-btn active"><a>前三</a></li>
						<li tabs="2" class="tabs-btn"><a>中三</a></li>
						<li tabs="3" class="tabs-btn"><a>后三</a></li>
						<li tabs="4" class="tabs-btn"><a>万仟</a></li>
						<li tabs="5" class="tabs-btn"><a>万佰</a></li>
						<li tabs="6" class="tabs-btn"><a>万拾</a></li>
						<li tabs="7" class="tabs-btn"><a>万个</a></li>
						<li tabs="8" class="tabs-btn"><a>仟佰</a></li>
						<li tabs="9" class="tabs-btn"><a>仟拾</a></li>
						<li tabs="10" class="tabs-btn"><a>仟个</a></li>
						<li tabs="11" class="tabs-btn"><a>佰拾</a></li>
						<li tabs="12" class="tabs-btn"><a>佰个</a></li>
						<li tabs="13" class="tabs-btn"><a>拾个</a></li>
					</ul>
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
							</tr>
						</thead>
						<tbody id="content10">

						</tbody>
					</table>
					<table class="order-table tabs-view" tabs-view="11"
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
							</tr>
						</thead>
						<tbody id="content11">

						</tbody>
					</table>
					<table class="order-table tabs-view" tabs-view="12"
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
							</tr>
						</thead>
						<tbody id="content12">

						</tbody>
					</table>
					<table class="order-table tabs-view" tabs-view="13"
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
							</tr>
						</thead>
						<tbody id="content13">

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
<script type="text/template" id="contentTpl1">
    <tr>
        <# for(var i=15025; i<15053; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if(i%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl2">
    <tr>
        <# for(var i=15053; i<15081; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if(i%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl3">
    <tr>
        <# for(var i=15081; i<15109; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if(i%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl4">
    <tr>
        <# for(var i=15109; i<15128; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if(i%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl5">
    <tr>
        <# for(var i=15128; i<15147; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i+1)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>
<script type="text/template" id="contentTpl6">
    <tr>
        <# for(var i=15147; i<15166; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i+2)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl7">
    <tr>
        <# for(var i=15166; i<15185; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i-1)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl8">
    <tr>
        <# for(var i=15185; i<15204; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if(i%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl9">
    <tr>
        <# for(var i=15204; i<15223; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i+1)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl10">
    <tr>
        <# for(var i=15223; i<15242; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i+2)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl11">
    <tr>
        <# for(var i=15242; i<15261; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i-1)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl12">
    <tr>
        <# for(var i=15261; i<15280; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if(i%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl13">
    <tr>
        <# for(var i=15280; i<15299; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i+1)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>
<script src="${ctx}/js/lib/tpl.js"></script>
<script src="${ctx}/js/lib/countdown.js"></script>
<script src="${ctx}/js/lottery/mem_order_cqsc.js"></script>
<script>
    $(function() {
        //循环输出
        $.ajax({url: "${ctx}/ssc/itemDate.do?timeStamp=" + new Date().getTime()+"&poolId=8",type: "get",dataType: "json",
            success: function(b) {
                if(0 == b.code){
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
                    var html6 = tpl('#contentTpl6', b);
                    $("#content6").html(html6);
                    var html7 = tpl('#contentTpl7', b);
                    $("#content7").html(html7);
                    var html8 = tpl('#contentTpl8', b);
                    $("#content8").html(html8);
                    var html9 = tpl('#contentTpl9', b);
                    $("#content9").html(html9);
                    var html10 = tpl('#contentTpl10', b);
                    $("#content10").html(html10);
                    var html11 = tpl('#contentTpl11', b);
                    $("#content11").html(html11);
                    var html12 = tpl('#contentTpl12', b);
                    $("#content12").html(html12);
                    var html13 = tpl('#contentTpl13', b);
                    $("#content13").html(html13);
                }else{
                    Showbo.Msg.alert('请登录!')
                    setTimeout(function(){
                        window.location.href=ctx+"logout.do";
                    },1000);
                }
            }})
    });
</script>
