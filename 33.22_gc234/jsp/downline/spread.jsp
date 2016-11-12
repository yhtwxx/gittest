<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的下线 - 黄金世纪</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
            border-top: none;
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
        table.MMain input {width: 200px;}
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
            <li tabs="1" class="tabs-btn active"><a href="spread.do">推广资源</a></li>
            <li tabs="2" class="tabs-btn"><a href="report.do">下线统计</a></li>
            <li tabs="3" class="tabs-btn"><a href="${ctx}/register.do?autoLogin=0" target="_top">下线开户</a></li>
        </ul>
    </div>

<div id="locate-box">
    <table class="MMain" border="1">
 
        <tr>
            <td width="100%" colspan="2" align="center">客服QQ：xxxxxx xxxxxx</td>
        </tr>
        <tr>
            <td width="100%" colspan="2" align="center">从以下链接注册的正式会员将成为您的下线会员</td>
        </tr>
        <tr>
            <td align="right" width="20%">主页：</td>
            <td id="DownLineUrlwww">
            <textarea readonly="readonly" cols="60" name="content1" rows="2" id="content1"></textarea>
            <input type=button value="复制" onclick="jsCopy1()">
            </td>
        </tr>
        <tr>
            <td align="right">会员注册：</td>
            <td  id="DownLineUrlreg">
            <textarea readonly="readonly" cols="60" name="content2" rows="2" id="content2"></textarea>
            <input type=button value="复制" onclick="jsCopy2()">
            </td>
        </tr>
        <tr>
            <td align="right">素材图片：</td>
            <td >
            <img src="${ctx}/img/logo.png">
            <input type=button value="新页面打开" onclick="savepic('${ctx}/img/logo.png')">
            </td>
        </tr>
        <tr>
            <td align="right">温馨提示：</td>
            <td id="bankAddress">
            作为我们的合作伙伴，我们提供3种简易快速帮助您的下线新会员开户：<br><br>
            1. 合作伙伴可以直接在自己的专属后台开户；<br>
            2. 点击合作伙伴专属链接进入网站开户；<br>
            3. 联系我们24/7全天候的专业客服为您开出下线会员新账户。</td>
        </tr>
        <!-- <tr>
            <td></td>
            <td>
            <a href="javascript:void" onclick="submit();" class="nui-btn nui-btn-theme-main">确定修改</a></td>
        </tr> -->
    </table>
</div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>

<script type="text/javascript">
    function jsCopy1(){
        var e=document.getElementById("content1");//对象是content1
        e.select(); //选择对象
        document.execCommand("Copy"); //执行浏览器复制命令
        alert("已复制好，可贴粘。");
    }
    function jsCopy2(){
        var e=document.getElementById("content2");//对象是content2
        e.select(); //选择对象
        document.execCommand("Copy"); //执行浏览器复制命令
        alert("已复制好，可贴粘。");
    }
    function jsCopy3(){
        var e=document.getElementById("content3");//对象是content2
        e.select(); //选择对象
        document.execCommand("Copy"); //执行浏览器复制命令
        alert("已复制好，可贴粘。");
    }
    function savepic(url) {
        window.open(url);
    }
    
    $(function(){
    	var host = window.location.host;
    	var onlineCode = "${sessionScope.onlineCode }";
    	$("#content1").val(host+"?onlineCode="+onlineCode);
    	$("#content2").val(host+"/register.do?onlineCode="+onlineCode);
    })
    
</script>


</body>
</html>