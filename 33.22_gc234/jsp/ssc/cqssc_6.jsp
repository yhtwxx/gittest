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

                    <div class="game-box" style="display: block;"><div class="tabs-box tabs-view-4"><div class="tabs">
                        <span class="choose-item-cnt">已选取：0笔</span>
                        <ul id="tabs">
                            <li tabs="1" class="tabs-btn active"><a>前三</a></li>
                            <li tabs="2" class="tabs-btn"><a>中三</a></li>
                            <li tabs="3" class="tabs-btn"><a>后三</a></li>
                        </ul>
                    </div>

                        <div class="quick-bet">
                            <div class="display-ctl active">
                                <span class="menu-icon"></span>
                                <span class="display-ctl-title">快选</span>
                                <span class="up-and-down"></span>
                            </div>
                            <table class="display-area" style="display: none;">
                                <tbody><tr>
                                    <td>
                                        <span>头</span>
                                    </td>
                                    <td>
                                        <input type="text" name="head-i">
                                    </td>
                                    <td>
                                        <span>大</span>
                                        <input type="radio" name="head" value="2">
                                    </td>
                                    <td>
                                        <span>小</span>
                                        <input type="radio" name="head" value="3">
                                    </td>
                                    <td>
                                        <span>单</span>
                                        <input type="radio" name="head" value="0">
                                    </td>
                                    <td>
                                        <span>双</span>
                                        <input type="radio" name="head" value="1">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>中</span>
                                    </td>
                                    <td><input type="text" name="middle-i"></td>
                                    <td>
                                        <span>大</span>
                                        <input type="radio" name="middle" value="2">
                                    </td>
                                    <td>
                                        <span>小</span>
                                        <input type="radio" name="middle" value="3">
                                    </td>
                                    <td>
                                        <span>单</span>
                                        <input type="radio" name="middle" value="0">
                                    </td>
                                    <td>
                                        <span>双</span>
                                        <input type="radio" name="middle" value="1">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>尾</span>
                                    </td>
                                    <td>
                                        <input type="text" name="tail-i">
                                    </td>
                                    <td>
                                        <span>大</span>
                                        <input type="radio" name="tail" value="2">
                                    </td>
                                    <td>
                                        <span>小</span>
                                        <input type="radio" name="tail" value="3">
                                    </td>
                                    <td>
                                        <span>单</span>
                                        <input type="radio" name="tail" value="0">
                                    </td>
                                    <td>
                                        <span>双</span>
                                        <input type="radio" name="tail" value="1">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>和尾数</span>
                                    </td>
                                    <td>
                                        <input type="text" name="sumTail-i">
                                    </td>
                                    <td>
                                        <span>大</span>
                                        <input type="radio" name="sumTail" value="2">
                                    </td>
                                    <td>
                                        <span>小</span>
                                        <input type="radio" name="sumTail" value="3">
                                    </td>
                                    <td>
                                        <span>单</span>
                                        <input type="radio" name="sumTail" value="0">
                                    </td>
                                    <td>
                                        <span>双</span>
                                        <input type="radio" name="sumTail" value="1">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <span>和数值</span>
                                        <input type="text" name="sum-i">
                                        <span>（0~27, 以逗号作分隔，不能空格）</span>
                                    </td>
                                    <td colspan="3">
                                        <span>胆</span>
                                        <input type="text" name="da-i">
                                    </td>
                                </tr>
                                <tr class="check-box-group">
                                    <td colspan="6">
                                        <span>和单</span>
                                        <input type="checkbox" name="options" value="0">
                                        <span>和双</span>
                                        <input type="checkbox" name="options" value="1">
                                        <span>和值大</span>
                                        <input type="checkbox" name="options" value="16">
                                        <span>和值小</span>
                                        <input type="checkbox" name="options" value="17">
                                        <span>跳号</span>
                                        <input type="checkbox" name="options" value="14">
                                        <span>豹子</span>
                                        <input type="checkbox" name="options" value="15">
                                        <span>组三</span>
                                        <input type="checkbox" name="options" value="12">
                                        <span>组六</span>
                                        <input type="checkbox" name="options" value="13">
                                        <span>全单</span>
                                        <input type="checkbox" name="options" value="4">
                                        <span>全双</span>
                                        <input type="checkbox" name="options" value="5">
                                        <span>2单1双</span>
                                        <input type="checkbox" name="options" value="20">
                                        <span>2双1单</span>
                                        <input type="checkbox" name="options" value="21">
                                        <span>全大</span>
                                        <input type="checkbox" name="options" value="6">
                                        <span>全小</span>
                                        <input type="checkbox" name="options" value="7">
                                        <span>2大1小</span>
                                        <input type="checkbox" name="options" value="18">
                                        <span>2小1大</span>
                                        <input type="checkbox" name="options" value="19">
                                        <span>含质数</span>
                                        <input type="checkbox" name="options" value="35">
                                        <span>不含质数</span>
                                        <input type="checkbox" name="options" value="36">
                                        <span>单点</span>
                                        <input type="checkbox" name="options" value="37">
                                        <span>双点</span>
                                        <input type="checkbox" name="options" value="38">
                                        <span>三连号</span>
                                        <input type="checkbox" name="options" value="8">
                                        <span>半连号</span>
                                        <input type="checkbox" name="options" value="9">
                                        <span>连号</span>
                                        <input type="checkbox" name="options" value="10">
                                        <span>不连号</span>
                                        <input type="checkbox" name="options" value="11">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <span>余数A</span>
                                        <input type="checkbox" name="options" value="22">
                                    </td>
                                    <td colspan="2">
                                        <span>余数B</span>
                                        <input type="checkbox" name="options" value="23">
                                    </td>
                                    <td colspan="2">
                                        <span>余数C</span>
                                        <input type="checkbox" name="options" value="24">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>二次和尾</span>
                                    </td>
                                    <td>
                                        <span>0</span>
                                        <input type="checkbox" name="options" value="25">
                                    </td>
                                    <td>
                                        <span>2</span>
                                        <input type="checkbox" name="options" value="26">
                                    </td>
                                    <td>
                                        <span>4</span>
                                        <input type="checkbox" name="options" value="27">
                                    </td>
                                    <td>
                                        <span>6</span>
                                        <input type="checkbox" name="options" value="28">
                                    </td>
                                    <td>
                                        <span>8</span>
                                        <input type="checkbox" name="options" value="29">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>二次差尾</span>
                                    </td>
                                    <td>
                                        <span>0</span>
                                        <input type="checkbox" name="options" value="30">
                                    </td>
                                    <td>
                                        <span>2</span>
                                        <input type="checkbox" name="options" value="31">
                                    </td>
                                    <td>
                                        <span>4</span>
                                        <input type="checkbox" name="options" value="32">
                                    </td>
                                    <td>
                                        <span>6</span>
                                        <input type="checkbox" name="options" value="33">
                                    </td>
                                    <td>
                                        <span>8</span>
                                        <input type="checkbox" name="options" value="34">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <span>下注金额：<input type="text" name="bet-i" id="Gold" class="itemCode1"></span>
                                        <button class="btn-quick-select">选取</button>
                                        <button class="btn-quick-reset">清除</button>
                                        <button class="btn-quick-submit">确认</button>
                                    </td>
                                </tr>
                                </tbody></table>
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
                                </tr></thead>
                                <tbody id="content1">

                                </tbody>

                            </table>
                            <table class="order-table tabs-view active" tabs-view="2" style="display: none;">
                                <thead>
                                <tr><th>号码</th>
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
                            <table class="order-table tabs-view active" tabs-view="3" style="display: none;">
                                <thead>
                                <tr><th>号码</th>
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
        <# for(var i=14256; i<14476; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds.toFixed(2)#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i+1)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl2">
    <tr>
        <# for(var i=14476; i<14696; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds.toFixed(2)#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i+1)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl3">
    <tr>
        <# for(var i=14696; i<14916; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds.toFixed(2)#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i+1)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script src="../js/lib/tpl.js" type="text/javascript"></script>
<script src="../js/lib/countdown.js" type="text/javascript"></script>
<script src="${ctx}/js/lottert/common.js" type="text/javascript"></script>
<script src="../js/lottery/mem_order_cqsc.js?51197755" type="text/javascript"></script>
<script src="../js/lottery/da.js?51197755" type="text/javascript"></script>
<script src="../js/lottery/sumTail.js?51197755" type="text/javascript"></script>
<script src="../js/lottery/sum.js?51197755" type="text/javascript"></script>
<script src="../js/lottery/options.js?51197755" type="text/javascript"></script>
<script src="../js/lottery/threeword.quick.choose.js?51197755" type="text/javascript"></script>
<script src="../js/lottery/Util.js" type="text/javascript"></script>

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
