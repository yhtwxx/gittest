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
            <tbody>
            <tr>
                <th rowspan="2">冠军</th>
                <td>
                    <span class="ball ball-num-1">1</span>
                    <span class="odds"><#=items_map[41001].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41001" data-position="0">
                </td>
                <td>
                    <span class="ball ball-num-2">2</span>
                    <span class="odds"><#=items_map[41002].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41002" data-position="0">
                </td>
                <td>
                    <span class="ball ball-num-3">3</span>
                    <span class="odds"><#=items_map[41003].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41003" data-position="0">
                </td>
                <td>
                    <span class="ball ball-num-4">4</span>
                    <span class="odds"><#=items_map[41004].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41004" data-position="0">
                </td>
                <td>
                    <span class="ball ball-num-5">5</span>
                    <span class="odds"><#=items_map[41005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41005" data-position="0">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="ball ball-num-6">6</span>
                    <span class="odds"><#=items_map[41006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41006" data-position="0">
                </td>
                <td>
                    <span class="ball ball-num-7">7</span>
                    <span class="odds"><#=items_map[41007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41007" data-position="0">
                </td>
                <td>
                    <span class="ball ball-num-8">8</span>
                    <span class="odds"><#=items_map[41008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41008" data-position="0">
                </td>
                <td>
                    <span class="ball ball-num-9">9</span>
                    <span class="odds"><#=items_map[41009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41009" data-position="0">
                </td>
                <td>
                    <span class="ball ball-num-10">10</span>
                    <span class="odds"><#=items_map[41010].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41010" data-position="0">
                </td>
            </tr>
            <tr>
                <th rowspan="2">亚军</th>
                <td>
                    <span class="ball ball-num-1">1</span>
                    <span class="odds"><#=items_map[41001].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41001" data-position="1">
                </td>
                <td>
                    <span class="ball ball-num-2">2</span>
                    <span class="odds"><#=items_map[41002].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41002" data-position="1">
                </td>
                <td>
                    <span class="ball ball-num-3">3</span>
                    <span class="odds"><#=items_map[41003].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41003" data-position="1">
                </td>
                <td>
                    <span class="ball ball-num-4">4</span>
                    <span class="odds"><#=items_map[41004].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41004" data-position="1">
                </td>
                <td>
                    <span class="ball ball-num-5">5</span>
                    <span class="odds"><#=items_map[41005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41005" data-position="1">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="ball ball-num-6">6</span>
                    <span class="odds"><#=items_map[41006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41006" data-position="1">
                </td>
                <td>
                    <span class="ball ball-num-7">7</span>
                    <span class="odds"><#=items_map[41007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41007" data-position="1">
                </td>
                <td>
                    <span class="ball ball-num-8">8</span>
                    <span class="odds"><#=items_map[41008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41008" data-position="1">
                </td>
                <td>
                    <span class="ball ball-num-9">9</span>
                    <span class="odds"><#=items_map[41009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41009" data-position="1">
                </td>
                <td>
                    <span class="ball ball-num-10">10</span>
                    <span class="odds"><#=items_map[41010].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41010" data-position="1">
                </td>
            </tr>
            <tr>
                <th rowspan="2">季军</th>
                <td>
                    <span class="ball ball-num-1">1</span>
                    <span class="odds"><#=items_map[41001].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41001" data-position="2">
                </td>
                <td>
                    <span class="ball ball-num-2">2</span>
                    <span class="odds"><#=items_map[41002].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41002" data-position="2">
                </td>
                <td>
                    <span class="ball ball-num-3">3</span>
                    <span class="odds"><#=items_map[41003].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41003" data-position="2">
                </td>
                <td>
                    <span class="ball ball-num-4">4</span>
                    <span class="odds"><#=items_map[41004].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41004" data-position="2">
                </td>
                <td>
                    <span class="ball ball-num-5">5</span>
                    <span class="odds"><#=items_map[41005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41005" data-position="2">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="ball ball-num-6">6</span>
                    <span class="odds"><#=items_map[41006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41006" data-position="2">
                </td>
                <td>
                    <span class="ball ball-num-7">7</span>
                    <span class="odds"><#=items_map[41007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41007" data-position="2">
                </td>
                <td>
                    <span class="ball ball-num-8">8</span>
                    <span class="odds"><#=items_map[41008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41008" data-position="2">
                </td>
                <td>
                    <span class="ball ball-num-9">9</span>
                    <span class="odds"><#=items_map[41009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41009" data-position="2">
                </td>
                <td>
                    <span class="ball ball-num-10">10</span>
                    <span class="odds"><#=items_map[41010].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41010" data-position="2">
                </td>
            </tr>
            <tr>
                <th rowspan="2">第四名</th>
                <td>
                    <span class="ball ball-num-1">1</span>
                    <span class="odds"><#=items_map[41001].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41001" data-position="3">
                </td>
                <td>
                    <span class="ball ball-num-2">2</span>
                    <span class="odds"><#=items_map[41002].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41002" data-position="3">
                </td>
                <td>
                    <span class="ball ball-num-3">3</span>
                    <span class="odds"><#=items_map[41003].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41003" data-position="3">
                </td>
                <td>
                    <span class="ball ball-num-4">4</span>
                    <span class="odds"><#=items_map[41004].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41004" data-position="3">
                </td>
                <td>
                    <span class="ball ball-num-5">5</span>
                    <span class="odds"><#=items_map[41005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41005" data-position="3">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="ball ball-num-6">6</span>
                    <span class="odds"><#=items_map[41006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41006" data-position="3">
                </td>
                <td>
                    <span class="ball ball-num-7">7</span>
                    <span class="odds"><#=items_map[41007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41007" data-position="3">
                </td>
                <td>
                    <span class="ball ball-num-8">8</span>
                    <span class="odds"><#=items_map[41008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41008" data-position="3">
                </td>
                <td>
                    <span class="ball ball-num-9">9</span>
                    <span class="odds"><#=items_map[41009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41009" data-position="3">
                </td>
                <td>
                    <span class="ball ball-num-10">10</span>
                    <span class="odds"><#=items_map[41010].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41010" data-position="3">
                </td>
            </tr>
            <tr>
                <th rowspan="2">第五名</th>
                <td>
                    <span class="ball ball-num-1">1</span>
                    <span class="odds"><#=items_map[41001].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41001" data-position="4">
                </td>
                <td>
                    <span class="ball ball-num-2">2</span>
                    <span class="odds"><#=items_map[41002].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41002" data-position="4">
                </td>
                <td>
                    <span class="ball ball-num-3">3</span>
                    <span class="odds"><#=items_map[41003].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41003" data-position="4">
                </td>
                <td>
                    <span class="ball ball-num-4">4</span>
                    <span class="odds"><#=items_map[41004].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41004" data-position="4">
                </td>
                <td>
                    <span class="ball ball-num-5">5</span>
                    <span class="odds"><#=items_map[41005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41005" data-position="4">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="ball ball-num-6">6</span>
                    <span class="odds"><#=items_map[41006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41006" data-position="4">
                </td>
                <td>
                    <span class="ball ball-num-7">7</span>
                    <span class="odds"><#=items_map[41007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41007" data-position="4">
                </td>
                <td>
                    <span class="ball ball-num-8">8</span>
                    <span class="odds"><#=items_map[41008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41008" data-position="4">
                </td>
                <td>
                    <span class="ball ball-num-9">9</span>
                    <span class="odds"><#=items_map[41009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41009" data-position="4">
                </td>
                <td>
                    <span class="ball ball-num-10">10</span>
                    <span class="odds"><#=items_map[41010].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41010" data-position="4">
                </td>
            </tr>
            <tr>
                <th rowspan="2">第六名</th>
                <td>
                    <span class="ball ball-num-1">1</span>
                    <span class="odds"><#=items_map[41001].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41001" data-position="5">
                </td>
                <td>
                    <span class="ball ball-num-2">2</span>
                    <span class="odds"><#=items_map[41002].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41002" data-position="5">
                </td>
                <td>
                    <span class="ball ball-num-3">3</span>
                    <span class="odds"><#=items_map[41003].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41003" data-position="5">
                </td>
                <td>
                    <span class="ball ball-num-4">4</span>
                    <span class="odds"><#=items_map[41004].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41004" data-position="5">
                </td>
                <td>
                    <span class="ball ball-num-5">5</span>
                    <span class="odds"><#=items_map[41005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41005" data-position="5">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="ball ball-num-6">6</span>
                    <span class="odds"><#=items_map[41006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41006" data-position="5">
                </td>
                <td>
                    <span class="ball ball-num-7">7</span>
                    <span class="odds"><#=items_map[41007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41007" data-position="5">
                </td>
                <td>
                    <span class="ball ball-num-8">8</span>
                    <span class="odds"><#=items_map[41008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41008" data-position="5">
                </td>
                <td>
                    <span class="ball ball-num-9">9</span>
                    <span class="odds"><#=items_map[41009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41009" data-position="5">
                </td>
                <td>
                    <span class="ball ball-num-10">10</span>
                    <span class="odds"><#=items_map[41010].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41010" data-position="5">
                </td>
            </tr>
            <tr>
                <th rowspan="2">第七名</th>
                <td>
                    <span class="ball ball-num-1">1</span>
                    <span class="odds"><#=items_map[41001].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41001" data-position="6">
                </td>
                <td>
                    <span class="ball ball-num-2">2</span>
                    <span class="odds"><#=items_map[41002].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41002" data-position="6">
                </td>
                <td>
                    <span class="ball ball-num-3">3</span>
                    <span class="odds"><#=items_map[41003].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41003" data-position="6">
                </td>
                <td>
                    <span class="ball ball-num-4">4</span>
                    <span class="odds"><#=items_map[41004].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41004" data-position="6">
                </td>
                <td>
                    <span class="ball ball-num-5">5</span>
                    <span class="odds"><#=items_map[41005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41005" data-position="6">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="ball ball-num-6">6</span>
                    <span class="odds"><#=items_map[41006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41006" data-position="6">
                </td>
                <td>
                    <span class="ball ball-num-7">7</span>
                    <span class="odds"><#=items_map[41007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41007" data-position="6">
                </td>
                <td>
                    <span class="ball ball-num-8">8</span>
                    <span class="odds"><#=items_map[41008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41008" data-position="6">
                </td>
                <td>
                    <span class="ball ball-num-9">9</span>
                    <span class="odds"><#=items_map[41009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41009" data-position="6">
                </td>
                <td>
                    <span class="ball ball-num-10">10</span>
                    <span class="odds"><#=items_map[41010].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41010" data-position="6">
                </td>
            </tr>
            <tr>
                <th rowspan="2">第八名</th>
                <td>
                    <span class="ball ball-num-1">1</span>
                    <span class="odds"><#=items_map[41001].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41001" data-position="7">
                </td>
                <td>
                    <span class="ball ball-num-2">2</span>
                    <span class="odds"><#=items_map[41002].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41002" data-position="7">
                </td>
                <td>
                    <span class="ball ball-num-3">3</span>
                    <span class="odds"><#=items_map[41003].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41003" data-position="7">
                </td>
                <td>
                    <span class="ball ball-num-4">4</span>
                    <span class="odds"><#=items_map[41004].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41004" data-position="7">
                </td>
                <td>
                    <span class="ball ball-num-5">5</span>
                    <span class="odds"><#=items_map[41005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41005" data-position="7">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="ball ball-num-6">6</span>
                    <span class="odds"><#=items_map[41006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41006" data-position="7">
                </td>
                <td>
                    <span class="ball ball-num-7">7</span>
                    <span class="odds"><#=items_map[41007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41007" data-position="7">
                </td>
                <td>
                    <span class="ball ball-num-8">8</span>
                    <span class="odds"><#=items_map[41008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41008" data-position="7">
                </td>
                <td>
                    <span class="ball ball-num-9">9</span>
                    <span class="odds"><#=items_map[41009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41009" data-position="7">
                </td>
                <td>
                    <span class="ball ball-num-10">10</span>
                    <span class="odds"><#=items_map[41010].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41010" data-position="7">
                </td>
            </tr>
            <tr>
                <th rowspan="2">第九名</th>
                <td>
                    <span class="ball ball-num-1">1</span>
                    <span class="odds"><#=items_map[41001].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41001" data-position="8">
                </td>
                <td>
                    <span class="ball ball-num-2">2</span>
                    <span class="odds"><#=items_map[41002].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41002" data-position="8">
                </td>
                <td>
                    <span class="ball ball-num-3">3</span>
                    <span class="odds"><#=items_map[41003].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41003" data-position="8">
                </td>
                <td>
                    <span class="ball ball-num-4">4</span>
                    <span class="odds"><#=items_map[41004].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41004" data-position="8">
                </td>
                <td>
                    <span class="ball ball-num-5">5</span>
                    <span class="odds"><#=items_map[41005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41005" data-position="8">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="ball ball-num-6">6</span>
                    <span class="odds"><#=items_map[41006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41006" data-position="8">
                </td>
                <td>
                    <span class="ball ball-num-7">7</span>
                    <span class="odds"><#=items_map[41007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41007" data-position="8">
                </td>
                <td>
                    <span class="ball ball-num-8">8</span>
                    <span class="odds"><#=items_map[41008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41008" data-position="8">
                </td>
                <td>
                    <span class="ball ball-num-9">9</span>
                    <span class="odds"><#=items_map[41009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41009" data-position="8">
                </td>
                <td>
                    <span class="ball ball-num-10">10</span>
                    <span class="odds"><#=items_map[41010].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41010" data-position="8">
                </td>
            </tr>
            <tr>
                <th rowspan="2">第十名</th>
                <td>
                    <span class="ball ball-num-1">1</span>
                    <span class="odds"><#=items_map[41001].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41001" data-position="9">
                </td>
                <td>
                    <span class="ball ball-num-2">2</span>
                    <span class="odds"><#=items_map[41002].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41002" data-position="9">
                </td>
                <td>
                    <span class="ball ball-num-3">3</span>
                    <span class="odds"><#=items_map[41003].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41003" data-position="9">
                </td>
                <td>
                    <span class="ball ball-num-4">4</span>
                    <span class="odds"><#=items_map[41004].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41004" data-position="9">
                </td>
                <td>
                    <span class="ball ball-num-5">5</span>
                    <span class="odds"><#=items_map[41005].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41005" data-position="9">
                </td>
            </tr>
            <tr>
                <td>
                    <span class="ball ball-num-6">6</span>
                    <span class="odds"><#=items_map[41006].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41006" data-position="9">
                </td>
                <td>
                    <span class="ball ball-num-7">7</span>
                    <span class="odds"><#=items_map[41007].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41007" data-position="9">
                </td>
                <td>
                    <span class="ball ball-num-8">8</span>
                    <span class="odds"><#=items_map[41008].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41008" data-position="9">
                </td>
                <td>
                    <span class="ball ball-num-9">9</span>
                    <span class="odds"><#=items_map[41009].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41009" data-position="9">
                </td>
                <td>
                    <span class="ball ball-num-10">10</span>
                    <span class="odds"><#=items_map[41010].odds.toFixed(2)#></span>
                    <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="41010" data-position="9">
                </td>
            </tr>
            </tbody>
        </table></div>
</script>

<script src="../js/lib/tpl.js" type="text/javascript"></script>
<script src="../js/lib/countdown.js" type="text/javascript"></script>
<script src="${ctx}/js/lottert/common.js" type="text/javascript"></script>
<script src="../js/lottery/bjsc/member_common_bjsc.js?51155" type="text/javascript"></script>
<script src="../js/lottery/Util.js" type="text/javascript"></script>
<script type="application/javascript">
    //循环输出
    $.ajax({url: "../bjsc/itemDate.do?timeStamp=" + new Date().getTime()+"&Pid=2",type: "get",dataType: "json",
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