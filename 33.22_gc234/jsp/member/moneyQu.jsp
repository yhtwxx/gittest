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
            padding: 6px 8px;
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
            <li class="tabs-btn"><a href="moneyCun.do"><spring:message code="public.deposit"/></a></li>
            <li class="tabs-btn active"><a href="moneyQu.do"><spring:message code="public.withdrawal"/></a></li>
            <li class="tabs-btn"><a href="moneyRec.do"><spring:message code="public.DepositWithdrawalRecord"/></a></li>
            <!-- <li tabs="4" class="tabs-btn"><a href="moneyDividend.do">退水记录</a></li> -->
        </ul>
    </div>

<div id="locate-box">
    <table class="MMain" border="1" style="width:900px;margin:20px auto;">
        <thead>
        <tr>
            <th style="width: 30%;" nowrap=""><spring:message code="public.Account"/></th>
            <th style="width: 40%;" nowrap=""><spring:message code="public.Amount"/></th>
            <th style="width: 30%;" nowrap=""><spring:message code="public.Operating"/></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td style="width: 30%;text-align: center"><spring:message code="public.MainWallet"/></td>
            <td style="width: 40%;text-align: center"><span id="GCCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
       		<td style="width: 30%;text-align: center"><a href="draw.do" class="nui-btn nui-btn-theme-main"><spring:message code="public.withdrawal"/></a></td>
        </tr>
        </tbody>
    </table>
</div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>
<script>
    $(function(){

        function format_gold(gold) {
            return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
        }
        $( document ).on( "change", "#changeNum", function(){
            var el = this;
            el.value = format_gold(el.value);

        }).on( "keyup", "#changeNum", function(){
            var el = this;
            el.value = format_gold(el.value);
        });

        //实时获取余额
        var getBalance = function(){
            $.ajax({url: "../userDate.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(0 == b.code){
                        var balance = b.balance/100;
                        $("#GCCredit").html(balance.toFixed(2));

                    }else{


                    }
                }})
        };

        getBalance();

        window.setInterval(function() {
            //getBalance();
        }, 5000)

    })

</script>




</body>
</html>