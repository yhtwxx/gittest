<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>退水-黄金世纪</title>
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
        .tabs{height: 40px;border-bottom: 1px solid #a5a5a5;}
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
        .MFormStyle {font-family: "Microsoft YaHei", Arial;}

    </style>

</head>

<body>

<div id="MMainData" style="margin-top: 8px;">


    <div class="tabs">
        <ul id="tabs">
            <li class="tabs-btn"><a href="moneyView.do">目前额度</a></li>
            <li class="tabs-btn"><a href="moneyCun.do">存款</a></li>
            <li class="tabs-btn"><a href="moneyQu.do">取款</a></li>
            <li class="tabs-btn"><a href="moneyRec.do">存取款记录</a></li>
            <li class="tabs-btn active"><a href="moneyDividend.do">退水记录</a></li>
        </ul>
    </div>

<div id="locate-box">
    <table class="MMain" border="1" style="width:900px;margin:20px auto;">
        <thead>
        <tr>
            <th width="30%" align="center">时间</th>
            <th width="70%">退水金额</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td align="center">2015-06-08 17:00</td>
            <td><span id="GCCredit">1200.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
        </tr>
        </tbody>
    </table>
    <div id="page1" class="text-c"></div>
    
    <script type="text/template" id="contentTpl">
	<# for(var i=0; i<list.length; i++){#>
		<tr class="text-c">
				<td><#=list[i].reqTimeStr #></td>
                <td><#=list[i].type #></td>
                <td><#=list[i].money/100 #></td>
                <td><#=list[i].bonus/100 #></td>
				<td><#=list[i].status #></td>
		</tr>
 	<#}#>
</script>
</div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${ctx }/js/page/layer.min.js"></script>
<script type="text/javascript" src="${ctx }/js/page/laypage.js"></script>
<script type="text/javascript">
var url = "moneyRecJson.do?timeStamp=" + new Date().getTime()+"&type=${type}&state=${state}&fromTime=${fromTime}&toTime=${toTime}";

var addhtml = '';

$.getJSON(url, {page: 1}, function(res){
  laypage({
    cont: 'page1',
    pages: res.pages,
    curr: 1,
    skin: 'molv',
    jump: function(e){
		$.getJSON(url, {page: e.curr}, function(res){

        	var view = $('#content');
			var html =  tpl('#contentTpl', res);
			var count = res.count;
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