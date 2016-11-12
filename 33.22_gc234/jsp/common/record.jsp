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
    <style type="text/css">
        #content span.ball{
        	border: 1px solid rgb(187, 187, 187);
		    border-image-source: initial;
		    border-image-slice: initial;
		    border-image-width: initial;
		    border-image-outset: initial;
		    border-image-repeat: initial;
		    background: url('${ctx}/img/lottery/tab_bg.png') 50% 100% repeat-x rgb(255, 255, 255);
		    font-weight: bold;
	        font-size: 14px;
		    padding: 2px;
		    margin: 1px;
		    border-radius: 12px;
	        width: 18px;
    		height: 18px;
    		display: inline-block;
    		-webkit-box-sizing: initial;
    		-moz-box-sizing: initial;
    		box-sizing: initial;
        }
	    #content span.b01, 
	    #content span.b02, 
	    #content span.b07, 
	    #content span.b08, 
	    #content span.b12, 
	    #content span.b13, 
	    #content span.b18, 
	    #content span.b19, 
	    #content span.b23, 
	    #content span.b24, 
	    #content span.b29, 
	    #content span.b30, 
	    #content span.b34, 
	    #content span.b35, 
	    #content span.b40, 
	    #content span.b45, 
	    #content span.b46 {
	    	color: red;
		}
		#content span.b03, 
		#content span.b04, 
		#content span.b09, 
		#content span.b10, 
		#content span.b14, 
		#content span.b15, 
		#content span.b20, 
		#content span.b25, 
		#content span.b26, 
		#content span.b31, 
		#content span.b36, 
		#content span.b37, 
		#content span.b41, 
		#content span.b42, 
		#content span.b47, 
		#content span.b48 {
		    color: blue;
		}
		#content span.b05, 
		#content span.b06, 
		#content span.b11, 
		#content span.b16, 
		#content span.b17, 
		#content span.b21, 
		#content span.b22, 
		#content span.b27, 
		#content span.b28, 
		#content span.b32, 
		#content span.b33, 
		#content span.b38, 
		#content span.b39, 
		#content span.b43, 
		#content span.b44, 
		#content span.b49 {
		    color: green;
		}
    </style>
	<script type="text/javascript" src="${ctx}/js/laydate.js"></script>
	<script type="text/javascript" src="${ctx }/js/page/laypage.js"></script> 
	<script type="text/javascript" src="${ctx }/js/page/tpl.js"></script>
	<script type="text/javascript" src="${ctx}/plugin/layer/layer.js"></script>
</head>
<body>
<div class="pagemain">
	<div class="navbar-fixed-top">
	    <ul class="nav nav-tabs my-nav">
	        <li role="presentation" class="active"><a href="record.do"><spring:message code="public.BettingRecords.lotteryGames" /></a></li>
	  		<li role="presentation"><a href="footballrecord.do"><spring:message code="public.BettingRecords.crownSports" /></a></li>
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
	            <select id="type" name="type">
	                <option value="" selected="selected"><spring:message code="public.BettingRecords.allLotterytypes" /></option>
	                <option value="1"><spring:message code="public.LotteryTicket.cqssc" /></option>
	                <option value="B"><spring:message code="public.LotteryTicket.tjssc" /></option>
	                <option value="C"><spring:message code="public.LotteryTicket.xjssc" /></option>
	                <option value="D"><spring:message code="public.LotteryTicket.jxssc" /></option>
	                <option value="E"><spring:message code="public.LotteryTicket.ynssc" /></option>
	               <%--  <option value="F"><spring:message code="public.LotteryTicket.shssc" /></option> --%>
	                <option value="2"><spring:message code="public.LotteryTicket.gdklsf" /></option>
	                <option value="8"><spring:message code="public.LotteryTicket.gxklsf" /></option>
	                <option value="9"><spring:message code="public.LotteryTicket.hnklsf" /></option>
	                <option value="7"><spring:message code="public.LotteryTicket.tjklsf" /></option>
	                <option value="3"><spring:message code="public.LotteryTicket.jssb" /></option>
	                <option value="G"><spring:message code="public.LotteryTicket.ahk3" /></option>
	                <option value="I"><spring:message code="public.LotteryTicket.jlk3" /></option>
	                <option value="H"><spring:message code="public.LotteryTicket.gxk3" /></option>
	                <option value="4"><spring:message code="public.LotteryTicket.bjsc" /></option>
	                <option value="5"><spring:message code="public.LotteryTicket.bjkl8" /></option>
	                <option value="6"><spring:message code="public.LotteryTicket.hklnc" /></option>
					<option value="p"><spring:message code="public.LotteryTicket.pcdd" /></option>
	            </select>
	            <select id="state" name="state">
	                <option value="" selected="selected"><spring:message code="public.AllStates" /></option>
	                <option value="N"><spring:message code="public.BettingRecords.normal" /></option>
	                <option value="P"><spring:message code="public.BettingRecords.Status.AlreadyPrize" /></option>
	                <option value="C"><spring:message code="public.Canceled" /></option>
	            </select>
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
                <td><spring:message code="public.BettingRecords.Lotterytypes" /></td>
                <td><spring:message code="public.BettingRecords.Issue" /></td>
                <td><spring:message code="public.BettingRecords.BetAmount" />(<spring:message code="public.currency.rmb" />)</td>
                <td><spring:message code="public.BettingRecords.PrizeMoney" />(<spring:message code="public.currency.rmb" />)</td>
                <td><spring:message code="public.BettingRecords.WinningNumbers" /></td>
                <td><spring:message code="public.Status" /></td>
                <td><spring:message code="public.Operating" /></td>
            </tr>
            </thead>
            <tbody id="content" class="table_b_tr">
            
            </tbody>
        </table>
        <div id="page1" class="text-c"></div>
    </div>
</div>
<script type="text/template" id="contentTpl">
	<# for(var i=0; i<history.length; i++){ 
var jssb = ["","${ctx}/img/lottery/dice_01.png","${ctx}/img/lottery/dice_02.png","${ctx}/img/lottery/dice_03.png","${ctx}/img/lottery/dice_04.png","${ctx}/img/lottery/dice_05.png","${ctx}/img/lottery/dice_06.png"];
		var html="";
		if(history[i].gameType=='3'){
			if(history[i].result!=null && history[i].result!=''){

    			var betContain = history[i].result;
				var betArr = betContain.split(",");
			
				for(var k=0;k<betArr.length;k++){
					html+="<img src="+jssb[betArr[k]]+" />";
				}
			}
    	}else if(history[i].gameType=='5'){
			var resultStr = history[i].result;
			if(resultStr != null && resultStr != undefined && resultStr != ''){
				var resultStr1 = resultStr.split(',');
				for(var j=0; j<resultStr1.length; j++){
					if(resultStr1[j] == ""){
						continue;
					}
					if(j == resultStr1.length / 2){
						html += "<br/>";
					}
					html += "<span class='ball b"+resultStr1[j]+"'>"+resultStr1[j]+"</span>";
				}
			}else{
				html = history[i].result;
			}
    	}else if(history[i].gameType=='6'){
			var resultStr = history[i].result;
			if(resultStr != null && resultStr != undefined && resultStr != ''){
				var resultStr1 = resultStr.split(',');
				html += "<a href='javascript:void(0)' onclick='myHiddenLhcDivPopup()' title='点击查看赛果' alt='点击查看赛果'>"
				for(var j=0; j<resultStr1.length; j++){
					if(resultStr1[j] == ""){
						continue;
					}
					html += "<span class='ball b"+resultStr1[j]+"'>"+resultStr1[j]+"</span>";
				}
				html += "</a>";
			}else{
				html = history[i].result;
			}
    	}else{
			var resultStr = history[i].result;
			if(resultStr != null && resultStr != undefined && resultStr != ''){
				var resultStr1 = resultStr.split(',');
				for(var j=0; j<resultStr1.length; j++){
					if(resultStr1[j] == ""){
						continue;
					}
					html += "<span class='ball'>"+resultStr1[j]+"</span>";
				}
			}else{
				html = history[i].result;
			}
		}
#>
		<tr class="text-c">
			<td><#=history[i].betTimeStr #></td>
            <td><#=history[i].gameTypeStr #></td>
            <td><#=history[i].gameNo #></td>
            <td><#=formatMoney(history[i].betAmount/100) #></td>
            <td><#=formatMoney(history[i].payAmount/100) #></td>
            <td><#= html #></td>
            <td><#=history[i].status #></td>
            <td><a href="#" style="color:blue;" onclick="openLayerHistory('<#=history[i].recorderId #>')"><spring:message code="public.view.details" /></a></td>
		</tr>
 	<#}#>
		<tr class="text-c">
			<td>总计</td>
            <td></td>
            <td></td>
            <td><#=formatMoney(tallBet/100) #></td>
            <td><#=formatMoney(tallPay/100) #></td>
            <td></td>
            <td></td>
            <td></td>
		</tr>
</script>
<script>
//layer弹出投注记录明细
function openLayerHistory(hid){
	layer.ready(function(){
	//官网欢迎页
	layer.open({
	type: 2,
	title: '查看明细',
	shadeClose: true,
	shade: 0.2,
	area: ['800px', '460px'],
	offset: '100px',
	content: '${ctx}/common/recordDetail.do?id=' + hid //iframe的url
	});
	});
}

</script>
<div id="myHiddenRecordDetailView" class="myHiddenDiv" style="display: none">
    <div class="popup">
        <div class="popup-header">
            <h2>投注记录明细</h2>
            <a href="javascript:void(0)" onclick="$.closePopupLayer('openStaticTZDetailPopup')" class="closeBtn"><spring:message code="public.close" /></a>
        </div>
        <div class="popup-body">
            <iframe src="" id="iframeName" marginwidth="0" marginheight="0" border="0" scrolling="yes" frameborder="0"
                    width="699" height="500"></iframe>
        </div>
        <a href="javascript:;" class="close" onclick="$.closePopupLayer('openStaticTZDetailPopup')" title="<spring:message code="public.close" />" ><spring:message code="public.close" /></a>
    </div>
</div>

<div id="myHiddenLhcDiv" class="myHiddenDiv" style="display: none">
    <div class="popup">
        <div class="popup-header">
            <h2>六合彩开奖结果</h2>
            <a href="javascript:void(0)" onclick="$.closePopupLayer('myHiddenLhcDivPopup')" class="closeBtn"><spring:message code="public.close" /></a>
        </div>
        <div class="popup-body">
            <iframe id="lhcSG" src="" marginwidth="0" marginheight="0" border="0" scrolling="yes" frameborder="0"
                    width="699" height="500"></iframe>
        </div>
        <a href="javascript:;" class="close" onclick="$.closePopupLayer('myHiddenLhcDivPopup')" title="<spring:message code="public.close" />"><spring:message code="public.close" /></a>
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
$("#type").val("${type}");
$("#state").val("${state}");
$(function(){
	$('.search form input[name=betId]')
		.focus(function(){
			if(this.value=='输入单号') this.value='';
		})
		.blur(function(){
			if(this.value=='') this.value='输入单号';
		})
		.keypress(function(e){
			if(e.keyCode==13) $(this).closest('form').submit();
		});

	$('.chazhao').click(function(){
		$(this).closest('form').submit();
	});
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
function openStaticTZDetailPopup(id) {
	$("#iframeName").attr("src","${ctx}/common/recordDetail.do?id="+id); 
	$.openPopupLayer({
		name: "openStaticTZDetailPopup",
		width: 700,
		target: "myHiddenRecordDetailView"
	});
}

//lhc赛果
function myHiddenLhcDivPopup() {
	$("#lhcSG").attr("src","${ctx}/lhc/todaySga.do"); 
	$.openPopupLayer({
		name: "myHiddenLhcDivPopup",
		width: 700,
		target: "myHiddenLhcDiv"
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
var url = "recordJson.do?timeStamp=" + new Date().getTime()+"&type=${type}&state=${state}&fromTime="+startTime+"&toTime="+endTime;
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

function formatMoney(num) {
	num = num.toFixed(2);
	var parts = num.toString().split(".");
	parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	return parts.join(".");
};
</script>
</body>
</html>