<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="order-box" class="order-box-oneword game-state-opening">

	<!--砝码快选-->
	<jsp:include page="../lottoBet.jsp" />

	<div id="orders">
		<!-- javascript app 使用 -->
		<div class="game-box">
			<div class="tabs-box tabs-view-1">
				<div class="tabs">
					<ul id="tabs">
						<li tabs="1" class="tabs-btn active"><a>前三</a></li>
						<li tabs="2" class="tabs-btn"><a>中三</a></li>
						<li tabs="3" class="tabs-btn"><a>后三</a></li>
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

<script type="text/template" id="contentTpl1">
    <tr>
        <# for(var i=15462; i<15472; i++) { 
		#>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i-1)%5==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl2">
    <tr>
        <# for(var i=15472; i<15482; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i-1)%5==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl3">
    <tr>
        <# for(var i=15482; i<=15491; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i-1)%5==0){ #>
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
        $.ajax({url: "${ctx}/tjssc/itemDate.do?timeStamp=" + new Date().getTime()+"&poolId=9",type: "get",dataType: "json",
            success: function(b) {
            	console.debug(b);
                if(0 == b.code){
                    var html1 = tpl('#contentTpl1', b);
                    $("#content1").html(html1);
                    var html2 = tpl('#contentTpl2', b);
                    $("#content2").html(html2);
                    var html3 = tpl('#contentTpl3', b);
                    $("#content3").html(html3);
                }else{
                    Showbo.Msg.alert('请登录!')
                    setTimeout(function(){
                        window.location.href=ctx+"logout.do";
                    },1000);
                }
            }})
    });
</script>
