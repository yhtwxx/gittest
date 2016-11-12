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
                    <div class="game-box"><div class="tabs-box tabs-view-1"><div class="tabs">
                        <ul id="tabs">
                            <li tabs="1" class="tabs-btn active"><a>前三</a></li>
                            <li tabs="2" class="tabs-btn"><a>中三</a></li>
                            <li tabs="3" class="tabs-btn"><a>后三</a></li>
                        </ul>
                    </div>
                        <div id="locate-box">
                            <table class="order-table tabs-view active" tabs-view="1" style="display: table;">
                                <thead>
                                <tr><th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                </tr></thead>
                                 <tbody id="content1">

                                </tbody>
                            </table>
                            <table class="order-table tabs-view" tabs-view="2" style="display: none;">
                                <thead>
                                <tr><th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                </tr></thead>
                                 <tbody id="content2">

                                </tbody>
                            </table>
                            <table class="order-table tabs-view" tabs-view="3" style="display: none;">
                                <thead>
                                <tr><th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                    <th>号码</th>
                                    <th>金额</th>
                                </tr></thead>
                                <tbody id="content3">

                                </tbody>
                            </table>
                        </div></div></div></div>

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

<script src="../js/lib/tpl.js" type="text/javascript"></script>
<script src="../js/lib/countdown.js" type="text/javascript"></script>
<script src="${ctx}/js/lottert/common.js" type="text/javascript"></script>
<script src="../js/lottery/mem_order_cqsc.js?51197755" type="text/javascript"></script>
<script src="../js/lottery/Util.js" type="text/javascript"></script>

<script>
    $(function() {
        //循环输出
        $.ajax({url: "../ssc/itemDate.do?timeStamp=" + new Date().getTime()+"&poolId=9",type: "get",dataType: "json",
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
