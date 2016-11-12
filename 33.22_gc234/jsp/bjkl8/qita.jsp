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
            </div>
        </div>

    </div>
    <div class="clearfix"></div>
</div>

<script type="text/template" id="contentTpl">
    <div class="game-box quick-order tabs-box" style="display: block;"><table class="order-table">
        <tbody><tr>
            <th style="padding: 0.5em">和值</th>
            <td class="choose">
                <span class="choose-name">单</span>
                <span class="odds"><#=items_map[50006].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50006">
            </td>
            <td class="choose">
                <span class="choose-name">双</span>
                <span class="odds"><#=items_map[50007].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50007">
            </td>
            <td class="choose">
                <span class="choose-name">大</span>
                <span class="odds"><#=items_map[50008].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50008">
            </td>
            <td class="choose">
                <span class="choose-name">小</span>
                <span class="odds"><#=items_map[50009].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50009">
            </td>
            <td class="choose">
                <span class="choose-name">810</span>
                <span class="odds"><#=items_map[50025].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50025">
            </td>
        </tr>
        <tr>
            <th style="padding: 0.5em">上中下盘</th>
            <td class="choose">
                <span class="choose-name">上</span>
                <span class="odds"><#=items_map[50010].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50010">
            </td>
            <td class="choose">
                <span class="choose-name">中</span>
                <span class="odds"><#=items_map[50011].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50011">
            </td>
            <td class="choose">
                <span class="choose-name">下</span>
                <span class="odds"><#=items_map[50012].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50012">
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <th style="padding: 0.5em">奇偶和盘</th>
            <td class="choose">
                <span class="choose-name">奇</span>
                <span class="odds"><#=items_map[50013].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50013">
            </td>
            <td class="choose">
                <span class="choose-name">和</span>
                <span class="odds"><#=items_map[50014].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50014">
            </td>
            <td class="choose">
                <span class="choose-name">偶</span>
                <span class="odds"><#=items_map[50015].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50015">
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <th style="padding: 0.5em">五行</th>
            <td class="choose">
                <span class="choose-name">金</span>
                <span class="odds"><#=items_map[50016].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50016">
            </td>
            <td class="choose">
                <span class="choose-name">木</span>
                <span class="odds"><#=items_map[50017].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50017">
            </td>
            <td class="choose">
                <span class="choose-name">水</span>
                <span class="odds"><#=items_map[50018].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50018">
            </td>
            <td class="choose">
                <span class="choose-name">火</span>
                <span class="odds"><#=items_map[50019].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50019">
            </td>
            <td class="choose">
                <span class="choose-name">土</span>
                <span class="odds"><#=items_map[50020].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50020">
            </td>
        </tr>
        <tr>
            <th style="padding: 0.5em">过关</th>
            <td class="choose">
                <span class="choose-name">小单</span>
                <span class="odds"><#=items_map[50021].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50021">
            </td>
            <td class="choose">
                <span class="choose-name">小双</span>
                <span class="odds"><#=items_map[50022].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50022">
            </td>
            <td class="choose">
                <span class="choose-name">大单</span>
                <span class="odds"><#=items_map[50023].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50023">
            </td>
            <td class="choose">
                <span class="choose-name">大双</span>
                <span class="odds"><#=items_map[50024].odds.toFixed(2)#></span>
                <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="50024">
            </td>
            <td></td>
        </tr>
        </tbody></table>
    </div>
</script>

<script src="../js/lib/tpl.js" type="text/javascript"></script>
<script src="../js/lib/countdown.js" type="text/javascript"></script>
<script src="${ctx}/js/lottert/common.js" type="text/javascript"></script>
<script src="../js/lottery/bjkl8/member_common_bjkl8_2.js?51155" type="text/javascript"></script>
<script src="../js/lottery/Util.js" type="text/javascript"></script>
<script type="application/javascript">
    //循环输出
    $.ajax({url: "../bjkl8/itemDate.do?timeStamp=" + new Date().getTime()+"&Pid=2,3,4,5,6",type: "get",dataType: "json",
        success: function(b) {
            if(0 == b.code){
                var html = tpl('#contentTpl', b);
                $("#orders").html(html);

            }else{
                Showbo.Msg.alert('请登录')
                window.location.href=ctx+"logout.do";
            }
        }})
</script>
</body>
</html>