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
            <li tabs="1" class="tabs-btn"><a href="spread.do">推广资源</a></li>
            <li tabs="2" class="tabs-btn active"><a href="report.do">下线统计</a></li>
            <li tabs="3" class="tabs-btn"><a href="${ctx}/register.do?autoLogin=0" target="_top">下线开户</a></li>
        </ul>
    </div>

<div id="locate-box">
    <table class="MMain" border="1">
    	<thead>
	    	<tr>
		    	<td width="100%" colspan="4" align="center">客服QQ：xxxxxx xxxxxx</td>
		    </tr>
            <tr class="table_b_th">
                <td>下线帐号</td>
                <td>注册时间</td>
                <td>最后登入时间</td>
                <td>登入次数</td>
            </tr>
            </thead>
   		<tbody id="content" class="table_b_tr">
        </tbody>   
    </table>
    <div id="page1" class="text-c"></div>
</div>
</div>

<script type="text/template" id="contentTpl">
	<# for(var i=0; i<list.length; i++){ #>
		<tr>
            <td width="20%"><#=list[i].accountno #></td>
            <td><#=list[i].createtimeStr #></td>
            <td><#=list[i].lastLoginTimeStr #></td>
            <td><#=list[i].loginCount #></td>
        </tr>
 	<#}#>
</script>

<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/js/page/laypage.js"></script>
<script type="text/javascript" src="${ctx }/js/page/tpl.js"></script>
<script type="text/javascript">
var startTime = $("#start").val();
var endTime = $("#end").val();
var url = "${ctx }/user/downlineJson.do";
var addhtml = '';
$.getJSON(url, {page: 1}, function(res){
  laypage({
    cont: 'page1',
    pages: res.pages,
    curr: 1,
    skin: 'molv',
    jump: function(e){
		$.getJSON(url, {page: e.curr}, function(res){
			console.debug(res);
        	var view = $('#content');
			var html =  tpl('#contentTpl', res);
			var count = res.tallCount;
        	var poweritem = res.poweritem;
			//$('#count').html(count);
        	view.html(html);
      });
    }
  });
});
</script>




</body>
</html>