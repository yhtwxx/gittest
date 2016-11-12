<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>投注记录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="../css/common.css?1203">
    <link href="../css/record.css" rel="stylesheet">
    <style type="text/css">
    	.tabs li a {text-decoration: none; color: #666; display: block;padding:0 10px;}
    	.tabs{height: 40px;
            border-bottom: 1px solid #a5a5a5;}
        .tabs li{border-top: 1px solid #a5a5a5;
            border-left: 1px solid #a5a5a5;
            border-right: 1px solid #a5a5a5;
            border-bottom: 0px solid #a5a5a5;
            height: 26px;
            text-align: center;
            line-height: 26px;
            font-size: 14px;
            background-color: #efefef;
            top: 13px;
            float: left;
            cursor: pointer;}
        .tabs .active {border-bottom: 1px solid #fff;background-color: #fff;}
    </style>
</head>
<body>


<!-- Contenedor -->
<div class="pagemain">
	<div class="tabs">
        <ul id="tabs">
            <li class="tabs-btn"><a href="record.do">彩票游戏</a></li>
            <li class="tabs-btn"><a href="footballrecord.do">皇冠体育</a></li>
            <li class="tabs-btn"><a href="zbrecord.do">GC直播</a></li>3
            <li class="tabs-btn"><a href="ptrecord.do">PT</a></li>
            <li class="tabs-btn"><a href="agrecord.do">AG</a></li>
            <li class="tabs-btn"><a href="abrecord.do">欧博</a></li>
            <li class="tabs-btn"><a href="xtdrecord.do">新天地</a></li>
            <li class="tabs-btn"><a href="mgrecord.do">MG</a></li>
            <li class="tabs-btn"><a href="gdrecord.do">GD</a></li>
            <li class="tabs-btn active"><a href="tbsrecord.do">TBS体育</a></li>
            <li class="tabs-btn"><a href="bbinrecord.do">BBIN</a></li>
        </ul>
    </div>
    <br/>
    <div class="search">
        <form action="" datatype="html" call="recordSearch" target="_self">
			<input id="start" name="fromTime" class="laydate-icon" />至
			<input id="end" name="toTime" class="laydate-icon" />
            <input type="button" value="查 询" class="btn chazhao" />
        </form>
    </div>
    <div class="display biao-cont">  
        <table width="100%" class="table_b">
					 	<thead>
				            <tr class="table_b_th">
				                <td>投注时间</td>
				                <td>投注内容</td>
				                <td>赔率</td>
				                <td>结果</td>
				                <td>投注金额(元)</td>
				                <td>输赢(元)</td>
				                <td>状态</td>
				            </tr>
				           </thead>
					
            <tbody id="content">
            </tbody>
        </table>

        <div id="page1" class="text-c"></div>

    </div>
</div>
<script type="text/template" id="contentTpl">
	<# for(var i=0; i<list.length; i++){ 
	#>
		<tr class="text-c">

				<td><#=list[i].betdateStr #></td>
                <td align="left" valign="top"><#=list[i].html #></td>
				<td valign="top"><font color="red"><#=list[i].betodd #></font></br><#=list[i].oddstyle #></td>
				<td><#if(list[i].result=="Lose"){ #>
					输
					<#}else if(list[i].result=="Win"){ #>
					赢
					<#} #>
				</td>
                <td><#=list[i].betamount/100 #></td>
                <td><#=list[i].win/100 #></td>
				<td><#if(list[i].status=="Running"){ #>
					进行中
					<#}else if(list[i].status=="Settled"){ #>
					已派彩
					<#}else if(list[i].status=="Rejected"){ #>
					取消
					<#} #>
				</td>
		</tr>
 	<#}#>
	<tr class="text-c">

				<td></td>
                <td></td>
                <td></td>
				<td></td>
                
                <td><#=formatMoney(tallBet/100) #></td>
                <td><#=formatMoney(tallPay/100) #></td>
                <td></td><td></td>
		</tr>

</script>
	
<script src="${ctx}/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/laydate.js"></script>
<script src="${ctx}/js/lib/jquery.jmpopups-0.5.1.js" type="text/javascript"></script>
<script type="text/javascript">
/**
 * 获取上一个月
 * @date 格式为yyyy-mm-dd的日期，如：2014-01-25
 */
function getPreMonth(date) {
    var arr = date.split('-');
    var year = arr[0]; //获取当前日期的年份
    var month = arr[1]; //获取当前日期的月份
    var day = arr[2]; //获取当前日期的日
    var days = new Date(year, month, 0);
    days = days.getDate(); //获取当前日期中月的天数
    var year2 = year;
    var month2 = parseInt(month) - 1;
    if (month2 == 0) {
        year2 = parseInt(year2) - 1;
        month2 = 12;
    }
    var day2 = day;
    var days2 = new Date(year2, month2, 0);
    days2 = days2.getDate();
    if (day2 > days2) {
        day2 = days2;
    }
    if (month2 < 10) {
        month2 = '0' + month2;
    }
    var t2 = year2 + '-' + month2 + '-' + day2;
    return t2;
}
var fromTime = "${fromTime}";
var toTime = "${toTime}";
if(fromTime != "" && fromTime != undefined && fromTime != null){
	$("#start").val(fromTime);
}else{
	$("#start").val(getPreMonth(laydate.now()));
}
if(toTime != "" && toTime != undefined && toTime != null){
	$("#end").val(toTime);
}else{
	$("#end").val(laydate.now());
}

$(function(){
    $('.chazhao').click(function(){
        $(this).closest('form').submit();
    });
});
</script>

<script>
//时间控件
var start = {
	elem: '#start', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
	event: 'focus', //响应事件。如果没有传入event，则按照默认的click
	format: 'YYYY-MM-DD',
	min: getPreMonth(laydate.now()), //最小日期
	max: laydate.now(), //最大日期
	choose: function(datas){
		end.min = datas; //开始日选好后，重置结束日的最小日期
		end.start = datas //将结束日的初始值设定为开始日
	}
};
var end = {
elem: '#end',
	event: 'focus', //响应事件。如果没有传入event，则按照默认的click
   	format: 'YYYY-MM-DD',
   	min: getPreMonth(laydate.now()), //最小日期
	max: laydate.now(), //最大日期
	choose: function(datas){
		start.max = datas; //结束日选好后，重置开始日的最大日期
	}
};
laydate(start);
laydate(end);
</script>
<script type="text/javascript" src="${ctx }/js/page/layer.min.js"></script>
<script type="text/javascript" src="${ctx }/js/page/laypage.js"></script> 
<script type="text/javascript" src="${ctx }/js/page/tpl.js"></script>
<script type="text/javascript">
var startTime = $("#start").val();
var endTime = $("#end").val();
var url = "tbsrecordJson.do?timeStamp=" + new Date().getTime() + "&fromTime=" + startTime + "&toTime=" + endTime;
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
        	view.html(html);
      });
    }
  });
});  
</script>
</body>
</html>