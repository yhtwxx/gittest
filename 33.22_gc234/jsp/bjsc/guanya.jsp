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

                <div id="orders" class="GENERAL" style="display: block;">
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
        </div>

    </div>
    <div class="clearfix"></div>
</div>

<script type="text/template" id="contentTpl">
    <div class="game-box quick-order tabs-box" style="display: block;">
        <table class="order-table">
            <tbody><tr>
                <td colspan="2">03、04、18、19</td>
                <td colspan="2">
                    <span class="odds"><#=items_map[42001].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="42001">
                </td>
                <td colspan="2">09、10、12、13</td>
                <td colspan="2">
                    <span class="odds"><#=items_map[42004].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="42004">
                </td>
            </tr>
            <tr>
                <td colspan="2">05、06、16、17</td>
                <td colspan="2">
                    <span class="odds"><#=items_map[42002].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="42002">
                </td>
                <td colspan="2">11</td>
                <td colspan="2">
                    <span class="odds"><#=items_map[42005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="42005">
                </td>
            </tr>
            <tr>
                <td colspan="2">07、08、14、15</td>
                <td colspan="2">
                    <span class="odds"><#=items_map[42003].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="42003">
                </td>
                <td colspan="2"></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td>和大</td>
                <td>
                    <span class="odds"><#=items_map[42006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="42006">
                </td>
                <td>和小</td>
                <td>
                    <span class="odds"><#=items_map[42007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="42007">
                </td>
                <td>和单</td>
                <td>
                    <span class="odds"><#=items_map[42008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="42008">
                </td>
                <td>和双</td>
                <td>
                    <span class="odds"><#=items_map[42009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="42009">
                </td>
            </tr>
            </tbody></table></div>
</script>

<script src="../js/lib/tpl.js" type="text/javascript"></script>
<script src="../js/lib/countdown.js" type="text/javascript"></script>
<script src="${ctx}/js/lottert/common.js" type="text/javascript"></script>
<script src="../js/lottery/bjsc/member_common_bjsc.js?51155" type="text/javascript"></script>
<script src="../js/lottery/Util.js" type="text/javascript"></script>
<script type="application/javascript">
    //循环输出
    $.ajax({url: "../bjsc/itemDate.do?timeStamp=" + new Date().getTime()+"&Pid=3",type: "get",dataType: "json",
        success: function(b) {
            if(0 == b.code){
                var html = tpl('#contentTpl', b);
                $("#orders").html(html);

            }else{
                Showbo.Msg.alert('请登录！')
                window.location.href=ctx+"logout.do";
            }
        }})
</script>
</body>
</html>