<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>资金管理-黄金世纪</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <style type="text/css">
        <!--
        /*共用*/
        input {
            padding-left: 6px;
            padding-right: 6px;
        }

        body {
            padding: 0;
            margin: 0;
            color: #272A31;
            background-color: #fff;
            padding: 2px 10px;
            font-family: "Microsoft YaHei", Arial;
            color: #666;
        }

        .tabs li a {
            text-decoration: none;
            color: #666;
            width: 102px;
            display: block;
        }

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

        .MSubTitle {
            font-size: 14px;
        }

        .tabs {
            height: 40px;
            border-bottom: 1px solid #a5a5a5;
        }

        .tabs li {
            border-top: 1px solid #a5a5a5;
            border-left: 1px solid #a5a5a5;
            border-right: 1px solid #a5a5a5;
            border-bottom: 0px solid #a5a5a5;
            width: 100px;
            height: 26px;
            text-align: center;
            line-height: 26px;
            font-size: 14px;
            background-color: #efefef;
            top: 13px;
            float: left;
            margin-top: 13px;
            cursor: pointer;
        }

        .tabs .active {
            border-bottom: 1px solid #fff;
            background-color: #fff;
        }

    </style>
    <script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
</head>

<body>
<div id="MMainData" style="margin-top: 8px;">

    <div id="locate-box" style="width: 400px;margin: 0 auto;">
        <h2 class="MSubTitle" style="margin-top: 100px;">温馨提示:</h2>
        <table class="MMain" border="1" style="margin-bottom: 8px;">
            <tbody>
            <p style="color:green;">您的充值已提交到银行,请稍候到存取记录中查询充值结!</p>
             <div id="ahref"><span  id="jumpTo"  style="color: green">5</span><a href="#" id="bhref" style="text-decoration:none;font-size:16px;color: green">后返回首页，点击此处立即跳转！</a></div>
            </tbody>
        </table>
    </div>
</div>


<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>


</body>
<script type="text/javascript">
    var url=window.location.href;
    var star = url.substring(0, location.href.indexOf('/', 8));
    $("#ahref").bind("click",function (){
        $('#bhref').attr('href',star);
    })

    function jump(secs) {
        var jumpTo = document.getElementById('jumpTo');

        console.log(star);
        jumpTo.innerHTML = secs;
        if (--secs > 0) {
            setTimeout("jump(" + secs + ")", 1000)
        } else {
            location.href = star;
        }
    }

</script>


<script type="text/javascript">

    jump(5);

</script>
</html>