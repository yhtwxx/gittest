<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>资金管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
    <link rel="stylesheet" rel="stylesheet" href="${ctx}/css/showBo.css"/>
    <link type="text/css" rel="stylesheet" href="${ctx}/js/skin/layer.css">
    <style type="text/css">
        <!--
        /*共用*/
        input{
            padding-left:6px;
            padding-right:6px;
        }
        body{
            padding:0;
            margin:0;
            color:#272A31;
            background-color: #fff;
            padding: 2px 10px;
            font-family: "Microsoft YaHei", Arial;
            color: #666;
        }
        .tabs li a {text-decoration: none; color: #666; width: 102px;display: block;}

        /*table*/
        table.MMain {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            text-align: left;
            font-size: 12px;
            color: #FFF;
        }
        table.MMain th {
            background: #DFDFDF;
            height: 1.8em;
            color: #333;
            font-weight: normal;
            text-align: center;
        }
        table.MMain td {
            background: #FFF;
            line-height: 1.5em;
            color: #666;
            padding: 6px 8px;
        }
        table.MMain, table.MMain th, table.MMain td {
            border: 1px solid #CCC;
        }
        table.MNoBorder, table.MNoBorder th, table.MNoBorder td {
            background: none;
            border: none;
        }
        table.MMain th.MContent, table.MMain td.MContent {
            word-break: break-all;
            text-align: left;
        }
        table.MMain td.MNumber {
            text-align: right;
        }
        table.MMain td.MNotice {
            color: #555;
        }
        table.MMain td.MBgcolor {
            background: #600;
            color: #FFF;
        }
        table.MMain td.MBgcolor2 {
            background: #006;
            color: #FFF;
        }
        .MSubTitle { font-size: 14px;}
        .tabs{height: 40px;
            border-bottom: 1px solid #a5a5a5;}
    .tabs li {
    border: 1px solid #a5a5a5;
    border-bottom: none;
    width: 100px;
    height: 26px;
    text-align: center;
    line-height: 26px;
    font-size: 14px;
    background-color: #efefef;
    top: 13px;
    float: left;
    margin-top:13px;
    cursor: pointer;
    list-style: none;
    }
        .tabs .active {border-bottom: 1px solid #fff;background-color: #fff;}

    </style>

</head>

<body>

<div id="MMainData" style="margin-top: 8px;">


    <div class="tabs">
        <ul id="tabs">
            <li class="tabs-btn"><a href="moneyView.do"><spring:message code="public.member.AmountOfMoney" /></a></li>
            <li class="tabs-btn active"><a href="moneyCun.do"><spring:message code="public.deposit"/></a></li>
            <li class="tabs-btn"><a href="moneyQu.do"><spring:message code="public.withdrawal"/></a></li>
            <li class="tabs-btn"><a href="moneyRec.do"><spring:message code="public.DepositWithdrawalRecord"/></a></li>
            <!-- <li tabs="4" class="tabs-btn"><a href="moneyDividend.do">退水记录</a></li> -->
        </ul>
    </div>

    <div id="locate-box">
        <div style="width:790px;margin:20px auto;padding:30px 0 0 110px;">
        <!-- <p><a class="nui-btn nui-btn-theme-main" href="#3" onclick="openLayer('alipay.do')">微信/支付宝入款</a></p>
        <p>3秒到账，最低存款为100元人民币。</p> -->
        <p><a class="nui-btn nui-btn-theme-main" href="#1" onclick="openWin('compay.do','bank_open')"><spring:message code="public.member.Companydeposit"/></a></p>
        <p><spring:message code="public.msg.MembershipMinimumDepositIs"/>100RMB</p>
        <p><a class="nui-btn nui-btn-theme-main" href="#2" onclick="openWin('onlinepay.do','online_open')"><spring:message code="public.member.Onlinepayment"/></a></p>
        <p><spring:message code="public.msg.recommendationinformation"/></p>
        </div>
        
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/layer.min.js"></script>
<script>
    function openWin(url,name){
    	window.open(url,name,"width=1076,height=625,status=no,location=no,scrollbars=yes");
    }
    function openLayer(url){
    	$.layer({
    	    type: 2,
    	    shadeClose: true,
    	    title: false,
    	    closeBtn: [1, true],
    	    shade: [0.6, '#000'],
    	    border: [0],
    	    offset: ['20px',''],
    	    area: ['800px', '460px'],
    	    iframe: {src: url}
    	}); 
    }
</script>

</body>
</html>