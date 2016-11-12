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
    <style>.select {display:none;}</style>
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
                    <div class="game-box multi-locate-order" style="display: block;">
                        <table id="FIRST2" class="choose-group-block">
                            <tbody>
                            <tr>
                                <th rowspan="3">
                                    <table class="choose-group-table">
                                        <tbody><tr>
                                            <td class="choose-group-name">
                                                前2                    </td>
                                            <td class="odds-box">
                                                <table>
                                                    <tbody><tr class="odds-item">
                                                        <td>
                                                            中2                                    <span class="odds" choose="FIRST:2:MATCH:2" id="odds_43001_1"></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="odds-item">
                                                        <td>
                                                            中1                                    <span class="odds" choose="FIRST:2:MATCH:1" id="odds_43001_2"></span>
                                                        </td>
                                                    </tr>
                                                    </tbody></table>
                                            </td>
                                        </tr>
                                        </tbody></table>
                                </th>
                                <td class="row-name">冠军</td>
                                <td><span locate="1" class="ball ball-num-1">1</span></td>
                                <td><span locate="1" class="ball ball-num-2">2</span></td>
                                <td><span locate="1" class="ball ball-num-3">3</span></td>
                                <td><span locate="1" class="ball ball-num-4">4</span></td>
                                <td><span locate="1" class="ball ball-num-5">5</span></td>
                                <td><span locate="1" class="ball ball-num-6">6</span></td>
                                <td><span locate="1" class="ball ball-num-7">7</span></td>
                                <td><span locate="1" class="ball ball-num-8">8</span></td>
                                <td><span locate="1" class="ball ball-num-9">9</span></td>
                                <td><span locate="1" class="ball ball-num-10">10</span></td>
                                <td><span class="select" locate="1"></span></td>
                            </tr>
                            <tr>
                                <td class="row-name">亚军</td>
                                <td><span locate="2" class="ball ball-num-1">1</span></td>
                                <td><span locate="2" class="ball ball-num-2">2</span></td>
                                <td><span locate="2" class="ball ball-num-3">3</span></td>
                                <td><span locate="2" class="ball ball-num-4">4</span></td>
                                <td><span locate="2" class="ball ball-num-5">5</span></td>
                                <td><span locate="2" class="ball ball-num-6">6</span></td>
                                <td><span locate="2" class="ball ball-num-7">7</span></td>
                                <td><span locate="2" class="ball ball-num-8">8</span></td>
                                <td><span locate="2" class="ball ball-num-9">9</span></td>
                                <td><span locate="2" class="ball ball-num-10">10</span></td>
                                <td><span class="select" locate="2"></span></td>
                            </tr>
                            <tr>
                                <td colspan="11" class="gold-input">
                                    下注金额    <input type="text" class="itemCode" value="" name="itemCode[]" data-itemcode="43001" data-itemNo="">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <hr>
                        <table id="FIRST3" class="choose-group-block">
                            <tbody>
                            <tr>
                                <th rowspan="4">
                                    <table class="choose-group-table">
                                        <tbody><tr>
                                            <td class="choose-group-name">
                                                前3                    </td>
                                            <td class="odds-box">
                                                <table>
                                                    <tbody><tr class="odds-item">
                                                        <td>
                                                            中3                                    <span class="odds" choose="FIRST:3:MATCH:3"  id="odds_43002_1"></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="odds-item">
                                                        <td>
                                                            中2                                    <span class="odds" choose="FIRST:3:MATCH:2" id="odds_43002_2"></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="odds-item">
                                                        <td style="display: none;">
                                                            中1                                    <span class="odds" choose="FIRST:3:MATCH:1" id="odds_43002_3"></span>
                                                        </td>
                                                    </tr>
                                                    </tbody></table>
                                            </td>
                                        </tr>
                                        </tbody></table>
                                </th>
                                <td class="row-name">冠军</td>
                                <td><span locate="1" class="ball ball-num-1">1</span></td>
                                <td><span locate="1" class="ball ball-num-2">2</span></td>
                                <td><span locate="1" class="ball ball-num-3">3</span></td>
                                <td><span locate="1" class="ball ball-num-4">4</span></td>
                                <td><span locate="1" class="ball ball-num-5">5</span></td>
                                <td><span locate="1" class="ball ball-num-6">6</span></td>
                                <td><span locate="1" class="ball ball-num-7">7</span></td>
                                <td><span locate="1" class="ball ball-num-8">8</span></td>
                                <td><span locate="1" class="ball ball-num-9">9</span></td>
                                <td><span locate="1" class="ball ball-num-10">10</span></td>
                                <td><span class="select" locate="1"></span></td>
                            </tr>
                            <tr>
                                <td class="row-name">亚军</td>
                                <td><span locate="2" class="ball ball-num-1">1</span></td>
                                <td><span locate="2" class="ball ball-num-2">2</span></td>
                                <td><span locate="2" class="ball ball-num-3">3</span></td>
                                <td><span locate="2" class="ball ball-num-4">4</span></td>
                                <td><span locate="2" class="ball ball-num-5">5</span></td>
                                <td><span locate="2" class="ball ball-num-6">6</span></td>
                                <td><span locate="2" class="ball ball-num-7">7</span></td>
                                <td><span locate="2" class="ball ball-num-8">8</span></td>
                                <td><span locate="2" class="ball ball-num-9">9</span></td>
                                <td><span locate="2" class="ball ball-num-10">10</span></td>
                                <td><span class="select" locate="2"></span></td>
                            </tr>
                            <tr>
                                <td class="row-name">季军</td>
                                <td><span locate="3" class="ball ball-num-1">1</span></td>
                                <td><span locate="3" class="ball ball-num-2">2</span></td>
                                <td><span locate="3" class="ball ball-num-3">3</span></td>
                                <td><span locate="3" class="ball ball-num-4">4</span></td>
                                <td><span locate="3" class="ball ball-num-5">5</span></td>
                                <td><span locate="3" class="ball ball-num-6">6</span></td>
                                <td><span locate="3" class="ball ball-num-7">7</span></td>
                                <td><span locate="3" class="ball ball-num-8">8</span></td>
                                <td><span locate="3" class="ball ball-num-9">9</span></td>
                                <td><span locate="3" class="ball ball-num-10">10</span></td>
                                <td><span class="select" locate="3"></span></td>
                            </tr>
                            <tr>
                                <td colspan="11" class="gold-input">
                                    下注金额             <input type="text" class="itemCode" value="" name="itemCode[]" data-itemcode="43002" data-itemNo="">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <hr>
                        <table id="FIRST4" class="choose-group-block">
                            <tbody>
                            <tr>
                                <th rowspan="5">
                                    <table class="choose-group-table">
                                        <tbody><tr>
                                            <td class="choose-group-name">
                                                前4                    </td>
                                            <td class="odds-box">
                                                <table>
                                                    <tbody><tr class="odds-item">
                                                        <td>
                                                            中4                                    <span class="odds" choose="FIRST:4:MATCH:4"  id="odds_43003_1"></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="odds-item">
                                                        <td>
                                                            中3                                    <span class="odds" choose="FIRST:4:MATCH:3" id="odds_43003_2"></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="odds-item">
                                                        <td>
                                                            中2                                    <span class="odds" choose="FIRST:4:MATCH:2" id="odds_43003_3"></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="odds-item">
                                                        <td style="display: none;">
                                                            中1                                    <span class="odds" choose="FIRST:4:MATCH:1">0.00</span>
                                                        </td>
                                                    </tr>
                                                    </tbody></table>
                                            </td>
                                        </tr>
                                        </tbody></table>
                                </th>
                                <td class="row-name">冠军</td>
                                <td><span locate="1" class="ball ball-num-1">1</span></td>
                                <td><span locate="1" class="ball ball-num-2">2</span></td>
                                <td><span locate="1" class="ball ball-num-3">3</span></td>
                                <td><span locate="1" class="ball ball-num-4">4</span></td>
                                <td><span locate="1" class="ball ball-num-5">5</span></td>
                                <td><span locate="1" class="ball ball-num-6">6</span></td>
                                <td><span locate="1" class="ball ball-num-7">7</span></td>
                                <td><span locate="1" class="ball ball-num-8">8</span></td>
                                <td><span locate="1" class="ball ball-num-9">9</span></td>
                                <td><span locate="1" class="ball ball-num-10">10</span></td>
                                <td><span class="select" locate="1"></span></td>
                            </tr>
                            <tr>
                                <td class="row-name">亚军</td>
                                <td><span locate="2" class="ball ball-num-1">1</span></td>
                                <td><span locate="2" class="ball ball-num-2">2</span></td>
                                <td><span locate="2" class="ball ball-num-3">3</span></td>
                                <td><span locate="2" class="ball ball-num-4">4</span></td>
                                <td><span locate="2" class="ball ball-num-5">5</span></td>
                                <td><span locate="2" class="ball ball-num-6">6</span></td>
                                <td><span locate="2" class="ball ball-num-7">7</span></td>
                                <td><span locate="2" class="ball ball-num-8">8</span></td>
                                <td><span locate="2" class="ball ball-num-9">9</span></td>
                                <td><span locate="2" class="ball ball-num-10">10</span></td>
                                <td><span class="select" locate="2"></span></td>
                            </tr>
                            <tr>
                                <td class="row-name">季军</td>
                                <td><span locate="3" class="ball ball-num-1">1</span></td>
                                <td><span locate="3" class="ball ball-num-2">2</span></td>
                                <td><span locate="3" class="ball ball-num-3">3</span></td>
                                <td><span locate="3" class="ball ball-num-4">4</span></td>
                                <td><span locate="3" class="ball ball-num-5">5</span></td>
                                <td><span locate="3" class="ball ball-num-6">6</span></td>
                                <td><span locate="3" class="ball ball-num-7">7</span></td>
                                <td><span locate="3" class="ball ball-num-8">8</span></td>
                                <td><span locate="3" class="ball ball-num-9">9</span></td>
                                <td><span locate="3" class="ball ball-num-10">10</span></td>
                                <td><span class="select" locate="3"></span></td>
                            </tr>
                            <tr>
                                <td class="row-name">第四名</td>
                                <td><span locate="4" class="ball ball-num-1">1</span></td>
                                <td><span locate="4" class="ball ball-num-2">2</span></td>
                                <td><span locate="4" class="ball ball-num-3">3</span></td>
                                <td><span locate="4" class="ball ball-num-4">4</span></td>
                                <td><span locate="4" class="ball ball-num-5">5</span></td>
                                <td><span locate="4" class="ball ball-num-6">6</span></td>
                                <td><span locate="4" class="ball ball-num-7">7</span></td>
                                <td><span locate="4" class="ball ball-num-8">8</span></td>
                                <td><span locate="4" class="ball ball-num-9">9</span></td>
                                <td><span locate="4" class="ball ball-num-10">10</span></td>
                                <td><span class="select" locate="4"></span></td>
                            </tr>
                            <tr>
                                <td colspan="11" class="gold-input">

                                    下注金额  <input type="text" class="itemCode" value="" name="itemCode[]" data-itemcode="43003" data-itemNo="">

                                </td>
                            </tr>
                            </tbody>
                        </table></div>
                </div>

                <div id="order-info">
                    <div class="inner">
                        <span>下注金额:<span id="BetGold">0</span></span>
                        <!-- IE 8,9 瀏覽器BUG 在INPUT上按ENTER會被FOCUS到BTN物件觸發CLICK事件 (加上type="reset" 可以避開) -->
                        <button type="reset" id="btn-orders-reset" class="btn-cancel" onclick="reset()">取消</button>
                        <button id="btn-orders-submit" class="btn-submit">确认</button>
                        <input type="hidden"  id="xuanhaopd" value="1"/>
                    </div>
                </div>

                <jsp:include page="lz.jsp"></jsp:include>
            </div>
        </div>

    </div>
    <div class="clearfix"></div>
</div>

<script src="../js/lib/countdown.js" type="text/javascript"></script>
<script src="${ctx}/js/lottert/common.js" type="text/javascript"></script>
<script src="../js/lottery/bjsc/member_common_bjsc.js?51197755" type="text/javascript"></script>
<script src="../js/lottery/bjsc/multilocate.choose.js?51197755" type="text/javascript"></script>
<script src="../js/lottery/Util.js" type="text/javascript"></script>
<script type="application/javascript">
    //循环输出
    $.ajax({url: "../bjsc/itemDate.do?timeStamp=" + new Date().getTime()+"&Pid=4",type: "get",dataType: "json",
        success: function(b) {
            if(0 == b.code){
                var map = b.items_map;
                var key="43001";
                var data=map[key];
                $("#odds_"+key+"_1").html(data.odds.toFixed(2));
                $("#odds_"+key+"_2").html(data.odds1.toFixed(2));
                key="43002";
                data=map[key];
                $("#odds_"+key+"_1").html(data.odds.toFixed(2));
                $("#odds_"+key+"_2").html(data.odds1.toFixed(2));
                key="43003";
                data=map[key];
                $("#odds_"+key+"_1").html(data.odds.toFixed(2));
                $("#odds_"+key+"_2").html(data.odds1.toFixed(2));
                $("#odds_"+key+"_3").html(data.odds2.toFixed(2));
            }else{
                Showbo.Msg.alert('请登录！')
                window.location.href=ctx+"logout.do";
            }
        }})
</script>
</body>
</html>