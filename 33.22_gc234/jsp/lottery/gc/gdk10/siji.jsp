<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="order-box" class="order-box-oneword game-state-opening">

	<!--砝码快选-->
	<jsp:include page="../lottoBet.jsp" />

	<div id="orders">
		<!-- javascript app 使用 -->

		<div class="game-box" style="display: block;">
			<div class="tabs-box tabs-view-4">
				<div class="tabs">
					<ul id="tabs">
						<li tabs="1" class="tabs-btn active"><a>第一球</a></li>
						<li tabs="2" class="tabs-btn"><a>第二球</a></li>
						<li tabs="3" class="tabs-btn"><a>第三球</a></li>
						<li tabs="4" class="tabs-btn"><a>第四球</a></li>
						<li tabs="5" class="tabs-btn"><a>第五球</a></li>
						<li tabs="6" class="tabs-btn"><a>第六球</a></li>
						<li tabs="7" class="tabs-btn"><a>第七球</a></li>
						<li tabs="S" class="tabs-btn"><a>第八球</a></li>
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
				onclick="reset()">取消</button>
			<button id="btn-orders-submit" class="btn-submit">确认</button>
		</div>
	</div>

	<jsp:include page="lz.jsp"></jsp:include>
</div>

<script type="text/template" id="contentTpl">
<#for(var i=0;i<8;i++){
    var caption="";
	var divstr="";
	if(i==0){
		caption="<caption>第一球</caption>";	
		divstr="<table class='order-table tabs-view active' tabs-view='1'>";
    }else if(i==1){
		caption="<caption>第二球</caption>";
		divstr="<table class='order-table tabs-view' tabs-view='2' style='display: none;'>";
	}else if(i==2){
		caption="<caption>第三球</caption>";
		divstr="<table class='order-table tabs-view' tabs-view='3' style='display: none;'>";
	}else if(i==3){
		caption="<caption>第四球</caption>";
		divstr="<table class='order-table tabs-view' tabs-view='4' style='display: none;'>";
	}else if(i==4){
		caption="<caption>第五球</caption>";
		divstr="<table class='order-table tabs-view' tabs-view='5' style='display: none;'>";
	}else if(i==5){
		caption="<caption>第六球</caption>";
		divstr="<table class='order-table tabs-view' tabs-view='6' style='display: none;'>";
	}else if(i==6){
		caption="<caption>第七球</caption>";
		divstr="<table class='order-table tabs-view' tabs-view='7' style='display: none;'>";
	}else if(i==7){
		caption="<caption>第八球</caption>";
		divstr="<table class='order-table tabs-view' tabs-view='S' style='display: none;'>";
	}
	#>
	<#=divstr#>
	<#=caption#>
	<tbody><tr>
<tbody><tr>
                                    <td class="choose choose-item">
                                        <span class="num-group">春</span>
                                        <span class="gxkcnumber gxkcnum1"></span>
                                        <span class="gxkcnumber gxkcnum2"></span>
                                        <span class="gxkcnumber gxkcnum3"></span>
                                        <span class="gxkcnumber gxkcnum4"></span>
                                        <span class="gxkcnumber gxkcnum5"></span>
                                        <span class="odds"><#=items_map[22001].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="22001" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="num-group">金</span>
                                        <span class="gxkcnumber gxkcnum5"></span>
                                        <span class="gxkcnumber gxkcnum10"></span>
                                        <span class="gxkcnumber gxkcnum15"></span>
                                        <span class="gxkcnumber gxkcnum20"></span>
                                        <span class="odds"><#=items_map[23001].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="23001" data-position="<#=i#>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="choose choose-item">
                                        <span class="num-group">夏</span>
                                        <span class="gxkcnumber gxkcnum6"></span>
                                        <span class="gxkcnumber gxkcnum7"></span>
                                        <span class="gxkcnumber gxkcnum8"></span>
                                        <span class="gxkcnumber gxkcnum9"></span>
                                        <span class="gxkcnumber gxkcnum10"></span>
                                        <span class="odds"><#=items_map[22002].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="22002" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="num-group">木</span>
                                        <span class="gxkcnumber gxkcnum1"></span>
                                        <span class="gxkcnumber gxkcnum6"></span>
                                        <span class="gxkcnumber gxkcnum11"></span>
                                        <span class="gxkcnumber gxkcnum16"></span>
                                        <span class="odds"><#=items_map[23002].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="23002" data-position="<#=i#>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="choose choose-item">
                                        <span class="num-group">秋</span>
                                        <span class="gxkcnumber gxkcnum11"></span>
                                        <span class="gxkcnumber gxkcnum12"></span>
                                        <span class="gxkcnumber gxkcnum13"></span>
                                        <span class="gxkcnumber gxkcnum14"></span>
                                        <span class="gxkcnumber gxkcnum15"></span>
                                        <span class="odds"><#=items_map[22003].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="22003" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="num-group">水</span>
                                        <span class="gxkcnumber gxkcnum2"></span>
                                        <span class="gxkcnumber gxkcnum7"></span>
                                        <span class="gxkcnumber gxkcnum12"></span>
                                        <span class="gxkcnumber gxkcnum17"></span>
                                        <span class="odds"><#=items_map[23003].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="23003" data-position="<#=i#>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="choose choose-item">
                                        <span class="num-group">冬</span>
                                        <span class="gxkcnumber gxkcnum16"></span>
                                        <span class="gxkcnumber gxkcnum17"></span>
                                        <span class="gxkcnumber gxkcnum18"></span>
                                        <span class="gxkcnumber gxkcnum19"></span>
                                        <span class="gxkcnumber gxkcnum20"></span>
                                        <span class="odds"><#=items_map[22004].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="22004" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="num-group">火</span>
                                        <span class="gxkcnumber gxkcnum3"></span>
                                        <span class="gxkcnumber gxkcnum8"></span>
                                        <span class="gxkcnumber gxkcnum13"></span>
                                        <span class="gxkcnumber gxkcnum18"></span>
                                        <span class="odds"><#=items_map[23004].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="23004" data-position="<#=i#>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="choose choose-item">
                                        <!-- empty -->
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="num-group">土</span>
                                        <span class="gxkcnumber gxkcnum4"></span>
                                        <span class="gxkcnumber gxkcnum9"></span>
                                        <span class="gxkcnumber gxkcnum14"></span>
                                        <span class="gxkcnumber gxkcnum19"></span>
                                        <span class="odds"><#=items_map[23005].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="23005" data-position="<#=i#>">
                                    </td>
                                </tr>
                                </tbody></table>                                    
<#}#>
</script>

<script src="${ctx}/js/lib/tpl.js"></script>
<script src="${ctx}/js/lib/countdown.js"></script>
<script src="${ctx}/js/lottery/gdsf/member_common_gdsf.js"></script>
<script>
	$(function() {
		//循环输出
		$.ajax({
			url : "${ctx}/gdsf/itemDate.do?timeStamp=" + new Date().getTime()
					+ "&&Pid=3&Sid=4",
			type : "get",
			dataType : "json",
			success : function(b) {
				console.debug(b);
				if (0 == b.code) {
					var html = tpl('#contentTpl', b);
					$("#locate-box").html(html);
				} else {
					Showbo.Msg.alert('请登录!')
					setTimeout(function() {
						window.location.href = ctx + "logout.do";
					}, 1000);
				}
			}
		})
	});
</script>