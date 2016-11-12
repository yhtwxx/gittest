<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                        <button type="reset" id="btn-orders-reset" class="btn-cancel" onclick="reset()">取消</button>
                        <button id="btn-orders-submit" class="btn-submit">确认</button>
                    </div>
                </div>

                <jsp:include page="lz.jsp"></jsp:include>
            </div>
            
            <script type="text/template" id="contentTpl">
<div class="game-box" style="display: block;"><div class="tabs-box tabs-view-4">
 <table class="order-table">
     <tbody><tr>
         <th style="padding: 0.5em">总和大小</th>
         <td class="choose choose-item">
             <font class="choose-name">大</font>
             <span class="odds"><#=items_map[20009].odds.toFixed(2)#></span>
             <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20009">
         </td>
         <td class="choose choose-item">
             <font class="choose-name">小</font>
             <span class="odds"><#=items_map[20010].odds.toFixed(2)#></span>
             <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20010">
         </td>
     </tr>
     <tr>
         <th style="padding: 0.5em">总和单双</th>
         <td class="choose choose-item">
             <font class="choose-name">单</font>
             <span class="odds"><#=items_map[20011].odds.toFixed(2)#></span>
             <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20011">
         </td>
         <td class="choose choose-item">
             <font class="choose-name">双</font>
             <span class="odds"><#=items_map[20012].odds.toFixed(2)#></span>
             <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20012">
         </td>
     </tr>
     <tr>
         <th style="padding: 0.5em">总和尾数大小</th>
         <td class="choose choose-item">
             <font class="choose-name">大</font>
             <span class="odds"><#=items_map[20013].odds.toFixed(2)#></span>
             <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20013">
         </td>
         <td class="choose choose-item">
             <font class="choose-name">小</font>
             <span class="odds"><#=items_map[20014].odds.toFixed(2)#></span>
             <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20014">
         </td>
     </tr>
     <tr>
         <th style="padding: 0.5em">龙虎</th>
         <td class="choose choose-item">
             <font class="choose-name">龙</font>
             <span class="odds"><#=items_map[20015].odds.toFixed(2)#></span>
             <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20015">
         </td>
         <td class="choose choose-item">
             <font class="choose-name">虎</font>
             <span class="odds"><#=items_map[20016].odds.toFixed(2)#></span>
             <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="20016">
         </td>
     </tr>
     </tbody></table>
</div></div>
</script>

<script src="${ctx}/js/lib/tpl.js"></script>
<script src="${ctx}/js/lib/countdown.js"></script>
<script src="${ctx}/js/lottery/gxsf/member_common_gxsf.js"></script>
<script>
    $(function() {
        //循环输出
        $.ajax({url: "${ctx}/gxsf/itemDate.do?timeStamp=" + new Date().getTime()+"&&Pid=0&Sid=1",type: "get",dataType: "json",
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