<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>投注记录</title>
     <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
    <!--本页css/js-->
    <link href="../css/record.css" rel="stylesheet">
    <script type="text/javascript" src="${ctx}/js/layer.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/laydate.js"></script>
	<script type="text/javascript" src="${ctx }/js/page/laypage.js"></script> 
	<script type="text/javascript" src="${ctx }/js/page/tpl.js"></script>
</head>
<body>
<div class="pagemain">
	<div class="navbar-fixed-top">
	    <ul class="nav nav-tabs my-nav">
	  		<li role="presentation"><a href="record.do"><spring:message code="public.BettingRecords.lotteryGames" /></a></li>
	  		<li role="presentation" class="active"><a href="footballrecord.do"><spring:message code="public.BettingRecords.crownSports" /></a></li>
	  		<li role="presentation"><a href="zbrecord.do"><spring:message code="public.BettingRecords.GC" /></a></li>
	  		<li role="presentation"><a href="ptrecord.do"><spring:message code="public.BettingRecords.PT" /></a></li>
	        <li role="presentation"><a href="agrecord.do"><spring:message code="public.BettingRecords.AG" /></a></li>
	        <li role="presentation"><a href="abrecord.do"><spring:message code="public.BettingRecords.AB" /></a></li>
	        <li role="presentation"><a href="xtdrecord.do"><spring:message code="public.BettingRecords.XTD" /></a></li>
	        <li role="presentation"><a href="mgrecord.do"><spring:message code="public.BettingRecords.MG" /></a></li>
	        <li role="presentation"><a href="gdrecord.do"><spring:message code="public.BettingRecords.GD" /></a></li>
	        <li role="presentation"><a href="ugrecord.do"><spring:message code="public.BettingRecords.TBS" /></a></li>
	        <li role="presentation"><a href="bbinrecord.do"><spring:message code="public.BettingRecords.BBIN" /></a></li>
	        <li role="presentation"><a href="imrecord.do"><spring:message code="public.BettingRecords.imSports" /></a></li>
	        <li role="presentation"><a href="garecord.do"><spring:message code="public.BettingRecords.GA" /></a></li>
		</ul>
		<div class="search">
	        <form action="" datatype="html" call="recordSearch" target="_self">
	        	<input type="hidden" name="type" value="${type }" />
	            <input id="start" name="fromTime" class="laydate-icon" /><spring:message code="public.to" /><input id="end" name="toTime" class="laydate-icon" />
	            <input type="button" value="<spring:message code="public.Search" />" class="btn chazhao" />
	        </form>
	    </div>
    </div>

    <div class="display biao-cont">
        <table width="100%" class="table_b">
            <thead>
            <tr class="table_b_th">
                <td><spring:message code="public.BettingRecords.BettingTime" /></td>
                <td><spring:message code="public.BettingRecords.BetAmount" />(<spring:message code="public.currency.rmb" />)</td>
                <td><spring:message code="public.BettingRecords.PrizeMoney" />(<spring:message code="public.currency.rmb" />)</td>
                <td><spring:message code="public.Operating"/></td>
            </tr>
            </thead>
            <tbody id="content" class="table_b_tr">
            
            </tbody>
        </table>
        <div id="page1" class="text-c"></div>
    </div>
</div>
<script type="text/template" id="contentTpl">
	<# var  betAmountSum=0,payAmountSum=0;
	for(var i=0; i<list.length; i++){ 
		betAmountSum+=list[i].betAmount/100;
		payAmountSum+=list[i].payAmount/100;
		#>
		<tr class="text-c">
			<td><#=list[i].date_str #></td>
            <td><#=formatMoney(list[i].betAmount/100) #></td>
            <td><#=formatMoney(list[i].payAmount/100) #></td>
            <td><a href="#" style="color:blue;" onclick="openFootBallDetail('<#=list[i].datestr #>')"><spring:message code="public.view.details" /></a></td>
		</tr>
 	<#}#>
		<tr class="text-c">
			<td><spring:message code="public.BettingRecords.total" /></td>
            <td><#=formatMoney(betAmountSum) #></td>
            <td><#=formatMoney(payAmountSum) #></td>
            <td></td>
		</tr>
</script>
<div id="myHiddenRecordDetailView" class="myHiddenDiv" style="display: none">
	<div class="popup">
	    <div class="popup-header">
	        <h2><spring:message code="public.BettingRecords.details" /></h2>
	        <a href="javascript:void(0)" onclick="$.closePopupLayer('openStaticTZDetailPopup')" class="closeBtn"><spring:message code="public.close" /></a>
		</div>
		<div class="popup-body">
			<iframe src="" id="iframeName" marginwidth="0" marginheight="0" border="0" scrolling="yes" frameborder="0"
		            width="899" height="500"></iframe>
		</div>
		<a href="javascript:;" class="close" onclick="$.closePopupLayer('openStaticTZDetailPopup')" title="<spring:message code="public.close" />" ><spring:message code="public.close" /></a>
	</div>
</div>
    
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
    	/* var type= "${type}";
    	if(type==null || type==""){
    		$("#type").val("FT");
    	}else{
    		$("#type").val("${type}");
    	}
    	$("#year").val("${year}");
    	$("#month").val("${month}"); */
    	

        /* $('.search form input[name=betId]')
                .focus(function(){
                    if(this.value=='输入单号') this.value='';
                })
                .blur(function(){
                    if(this.value=='') this.value='输入单号';
                })
                .keypress(function(e){
                    if(e.keyCode==13) $(this).closest('form').submit();
                });
    	*/

        $('.chazhao').click(function(){
            $(this).closest('form').submit();
        });

      /*  $('.bottompage a[href]').live('click', function(){
            $('.biao-cont').load($(this).attr('href'));
            return false;
        });*/

});

function recordSearch(err, data){
	if(err){
		alert(err);
	}else{
		$('.biao-cont').html(data);
	}
}
  
function recodeRefresh(){
	$('.biao-cont').load(
		$('.bottompage .pagecurrent').attr('href')
	);
}

function deleteBet(err, code){
	if(err){
		alert(err);
	}else{
		recodeRefresh();
	}
}

//投注记录
/* function openStaticTZDetailPopup(id) {
var type= "${type}";
$("#iframeName").attr("src","${ctx}/common/ftbrecordDetail.do?dateStr="+id+"&type="+type); 
	$.openPopupLayer({
		name: "openStaticTZDetailPopup",
		width: 900,
		target: "myHiddenRecordDetailView"
	});  
} */

function openFootBallDetail(id){
	var type= "${type}";
	$.layer({
	    type: 2,
	    shadeClose: true,
	    title: false,
	    closeBtn: [1, true],
	    shade: [0.8, '#000'],
	    border: [0],
	    area: ['900px', ($(window).height() - 50) +'px'],
	    iframe: {src: "${ctx}/common/ftbrecordDetail.do?dateStr="+id+"&type="+type}
	}); 
}
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

<script type="text/javascript">
var startTime = $("#start").val();
var endTime = $("#end").val();
var type = "${type}";
var url = "ftbrecordJson.do?timeStamp="+new Date().getTime()+"&type="+type+"&toTime="+endTime+"&fromTime="+startTime;
var addhtml = '';
$.getJSON(url, {page: 1}, function(res){ 
  laypage({
    cont: 'page1', 
    pages: res.pages, 
    curr: 1, 
    skin: 'molv',
    jump: function(e){ 
		$.getJSON(url, {page: e.curr}, function(res){ 
			if(res.list){
				var view = $('#content'); 
				var html =  tpl('#contentTpl', res);
	        	view.html(html);
			}
        	
      });
    }
  });
});
function formatMoney(num) {
	num = num.toFixed(2);
	var parts = num.toString().split(".");
	parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	return parts.join(".");
};
</script>
</body>
</html>