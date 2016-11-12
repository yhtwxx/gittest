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
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum1"></span>
                                        <span class="odds"><#=items_map[21001].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21001" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum6"></span>
                                        <span class="odds"><#=items_map[21006].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21006" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum11"></span>
                                        <span class="odds"><#=items_map[21011].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21011" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum16"></span>
                                        <span class="odds"><#=items_map[21016].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21016" data-position="<#=i#>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum2"></span>
                                        <span class="odds"><#=items_map[21002].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21002" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum7"></span>
                                        <span class="odds"><#=items_map[21007].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21007" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum12"></span>
                                        <span class="odds"><#=items_map[21012].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21012" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum17"></span>
                                        <span class="odds"><#=items_map[21017].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21017" data-position="<#=i#>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum3"></span>
                                        <span class="odds"><#=items_map[21003].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21003" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum8"></span>
                                        <span class="odds"><#=items_map[21008].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21008" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum13"></span>
                                        <span class="odds"><#=items_map[21013].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21013" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum18"></span>
                                        <span class="odds"><#=items_map[21018].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21018" data-position="<#=i#>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum4"></span>
                                        <span class="odds"><#=items_map[21004].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21004" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum9"></span>
                                        <span class="odds"><#=items_map[21009].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21009" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum14"></span>
                                        <span class="odds"><#=items_map[21014].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21014" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum19"></span>
                                        <span class="odds"><#=items_map[21019].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21019" data-position="<#=i#>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum5"></span>
                                        <span class="odds"><#=items_map[21005].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21005" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum10"></span>
                                        <span class="odds"><#=items_map[21010].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21010" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <span class="gxkcnumber gxkcnum15"></span>
                                        <span class="odds"><#=items_map[21015].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21015" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
										<span class="gxkcnumber gxkcnum20"></span>
                                        <span class="odds"><#=items_map[21020].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="21020" data-position="<#=i#>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="choose choose-item">
                                        <font class="choose-name">大</font>
                                        <span class="odds"><#=items_map[20001].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20001" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <font class="choose-name">单</font>
                                        <span class="odds"><#=items_map[20003].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20003" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <font class="choose-name">和单</font>
                                        <span class="odds"><#=items_map[20005].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20005" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <font class="choose-name">尾大</font>
                                        <span class="odds"><#=items_map[20007].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20007" data-position="<#=i#>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="choose choose-item">
                                        <font class="choose-name">小</font>
                                        <span class="odds"><#=items_map[20002].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20002" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <font class="choose-name">双</font>
                                        <span class="odds"><#=items_map[20004].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20004" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <font class="choose-name">和双</font>
                                        <span class="odds"><#=items_map[20006].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20006" data-position="<#=i#>">
                                    </td>
                                    <td class="choose choose-item">
                                        <font class="choose-name">尾小</font>
                                        <span class="odds"><#=items_map[20008].odds.toFixed(2)#></span>
                                        <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20008" data-position="<#=i#>">
                                    </td>
                                </tr>
                                </tbody>
</table>
<#}#>
</script>

<script src="${ctx}/js/lib/tpl.js"></script>
<script src="${ctx}/js/lib/countdown.js"></script>
<script src="${ctx}/js/lottery/tjsf/member_common_tjsf.js"></script>
<script>
	$(function() {
		//循环输出
		$.ajax({
			url : "${ctx}/tjsf/itemDate.do?timeStamp=" + new Date().getTime()
					+ "&&Pid=1&Sid=2",
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