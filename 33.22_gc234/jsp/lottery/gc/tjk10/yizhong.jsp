<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="order-box" class="order-box-oneword game-state-opening">

	<!--砝码快选-->
	<jsp:include page="../lottoBet.jsp" />

	<div id="orders">
		<!-- javascript app 使用 -->

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
<div class="game-box" style="display: block;"><div class="tabs-box tabs-view-4">
  <table class="order-table">
  <caption>一中一</caption>
  <tbody><tr>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum1"></span>
          <span class="odds"><#=items_map[26001].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26001">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum6"></span>
          <span class="odds"><#=items_map[26006].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26006">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum11"></span>
          <span class="odds"><#=items_map[26011].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26011">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum16"></span>
          <span class="odds"><#=items_map[26016].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26016">
      </td>
  </tr>
  <tr>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum2"></span>
          <span class="odds"><#=items_map[26002].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26002">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum7"></span>
          <span class="odds"><#=items_map[26007].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26007">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum12"></span>
          <span class="odds"><#=items_map[26012].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26012">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum17"></span>
          <span class="odds"><#=items_map[26017].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26017">
      </td>
  </tr>
  <tr>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum3"></span>
          <span class="odds"><#=items_map[26003].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26003">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum8"></span>
          <span class="odds"><#=items_map[26008].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26008">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum13"></span>
          <span class="odds"><#=items_map[26013].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26013">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum18"></span>
          <span class="odds"><#=items_map[26018].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26018">
      </td>
  </tr>
  <tr>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum4"></span>
          <span class="odds"><#=items_map[26004].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26004">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum9"></span>
          <span class="odds"><#=items_map[26009].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26009">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum14"></span>
          <span class="odds"><#=items_map[26014].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26014">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum19"></span>
          <span class="odds"><#=items_map[26019].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26019">
      </td>
  </tr>
  <tr>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum5"></span>
          <span class="odds"><#=items_map[26005].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26005">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum10"></span>
          <span class="odds"><#=items_map[26010].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26010">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum15"></span>
          <span class="odds"><#=items_map[26015].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26015">
      </td>
      <td class="choose choose-item">
          <span class="gxkcnumber gxkcnum20"></span>
          <span class="odds"><#=items_map[26020].odds.toFixed(2)#></span>
          <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="26020">
      </td>
  </tr>
  </tbody></table>
</div>
</div>
</script>


<script src="${ctx}/js/lib/tpl.js"></script>
<script src="${ctx}/js/lib/countdown.js"></script>
<script src="${ctx}/js/lottery/tjsf/member_common_tjsf.js"></script>
<script>
    $(function() {
        //循环输出
        $.ajax({url: "${ctx}/tjsf/itemDate.do?timeStamp=" + new Date().getTime()+"&&Pid=7&Sid=7",type: "get",dataType: "json",
            success: function(b) {
            	console.debug(b);
                if(0 == b.code){
                	var html = tpl('#contentTpl', b);
                    $("#orders").html(html);
                }else{
                    Showbo.Msg.alert('请登录!')
                    setTimeout(function(){
                        window.location.href=ctx+"logout.do";
                    },1000);
                }
            }})
    });
</script>