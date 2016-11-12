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
						<li tabs="1" class="tabs-btn active"><a>一字</a></li>
						<li tabs="2" class="tabs-btn"><a>二字</a></li>
						<li tabs="3" class="tabs-btn"><a>三字</a></li>
					</ul>
				</div>

				<div id="locate-box">
					<table class="order-table tabs-view active" tabs-view="1"
						style="display: table;">
						<thead>
							<tr>
								<th></th>
								<th>大</th>
								<th>小</th>
								<th>单</th>
								<th>双</th>
								<th>质</th>
								<th>合</th>
							</tr>
						</thead>
						<tbody id="content1">

						</tbody>
					</table>
					<table class="order-table tabs-view" tabs-view="2"
						style="display: none;">
						<thead>
							<tr>
								<th></th>
								<th>大</th>
								<th>小</th>
								<th>单</th>
								<th>双</th>
								<th>质</th>
								<th>合</th>
							</tr>
						</thead>
						<tbody id="content2">

						</tbody>
					</table>
					<table class="order-table tabs-view" tabs-view="3"
						style="display: none;">
						<thead>
							<tr>
								<th></th>
								<th>大</th>
								<th>小</th>
								<th>单</th>
								<th>双</th>
								<th>质</th>
								<th>合</th>
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
<!--下面是投注区域JS-->
<script type="text/template" id="contentTpl1">
    <tr>
        <# for(var i=14916; i<=14945; i++) { #>
        <# if(i==14916 || i==14922 || i==14928 || i==14934 || i==14940) {#>
			<th style="padding: 0.5em"><#=items_map[i].itemName#></th>
        <#}#>
        	<td class="choose-item">
            	<span class="odds"><#=items_map[i].odds#></span>
            	<input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        	</td>
        <# if(i==14921 || i==14927 || i==14933 || i==14939 || i==14945) { #>
    	</tr><tr>
        <#}#>
        <#}#>
    </tr>
</script>
<script type="text/template" id="contentTpl2">
    <tr>
        <#
		 var cont1 = 1;
		 for(var i=14946; i<=15006; i++) {
		   if(i==14982)
				continue;
		   if(cont1==1) {#>
		   		<th style="padding: 0.5em"><#=items_map[i].itemName#></th>
				<td colspan="2" class="border-none"></td>
		   <#}#>
           <# if(cont1==3) {#>
		   		<th style="padding: 0.5em"><#=items_map[i].itemName#></th>
		   <#}#>
           <td class="choose-item">
            	<span class="odds"><#=items_map[i].odds#></span>
            	<input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
           </td>
        <# 	if(cont1==2) { #>
    			<td colspan="2" class="border-left-none"></td>
            	</tr><tr>
        	<#}
            if(cont1==4){#>
				<td colspan="2" class="border-left-none"></td>
			<#}
            if(cont1==6){#>
				</tr><tr>
			<#cont1=1;
			  continue;}
			cont1++;
        }#>
    </tr>
</script>
<script type="text/template" id="contentTpl3">
    <tr>
        <# for(var i=15007; i<=15024; i++) { #>
       		<# if(i==15007 || i==15011 || i==15013 || i==15017 || i==15019 || i==15023) {#>
				<th style="padding: 0.5em"><#=items_map[i].itemName#></th>
        	<#}#>
        	<td class="choose-item">
            	<span class="odds"><#=items_map[i].odds#></span>
            	<input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        	</td>
        	<# if(i==15010 || i==15016 || i==15022) { #>
				<td colspan="2" class="border-left-none"></td>
    			</tr><tr>
        	<#}#>
			<# if(i==15012) { #>
				<td colspan="2" class="border-left-none"></td>
				<td class="choose-item"><span class="odds"><#=items_map[15493].odds#></span>
            		<input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[15493].itemCode#>">
        		</td>
				<td class="choose-item"><span class="odds"><#=items_map[15492].odds#></span>
            		<input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[15492].itemCode#>">
        		</td>
    			</tr><tr>
        	<#}#>
			<# if(i==15018) { #>
				<td colspan="2" class="border-left-none"></td>
				<td class="choose-item"><span class="odds"><#=items_map[15495].odds#></span>
            		<input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[15495].itemCode#>">
        		</td>
				<td class="choose-item"><span class="odds"><#=items_map[15494].odds#></span>
            		<input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[15494].itemCode#>">
        		</td>
    			</tr><tr>
        	<#}#>
			<# if(i==15024) { #>
				<td colspan="2" class="border-left-none"></td>
				<td class="choose-item"><span class="odds"><#=items_map[15497].odds#></span>
            		<input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[15497].itemCode#>">
        		</td>
				<td class="choose-item"><span class="odds"><#=items_map[15496].odds#></span>
            		<input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[15496].itemCode#>">
        		</td>
        	<#}#>
        <#}#>
    </tr>
</script>

<script src="${ctx}/js/lib/tpl.js"></script>
<script src="${ctx}/js/lib/countdown.js"></script>
<script src="${ctx}/js/lottery/ynssc/mem_order_ynssc.js"></script>

<script>
    $(function() {
        //循环输出
        $.ajax({url: "${ctx}/ynssc/itemDate.do?timeStamp=" + new Date().getTime()+"&poolId=7",type: "get",dataType: "json",
            success: function(b) {
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