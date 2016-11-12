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
        <!--
        /*共用*/
        input, select {
            vertical-align: middle;
            display: inline-block;
            margin: 0;
            padding: 0;
            border: 1px solid #ccc;
            outline: none;
            color: #666;
            font-family: "Microsoft yahei",Tahoma,Consolas,Arial,Simsun;
            font-size: 12px;
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
		.pagemain_btn {
		    background: #fe7c31;
		    line-height: 20px;
		    height: 30px;
		    width: 80px;
		    padding: 5px;
		    padding-left: 20px;
		    padding-right: 20px;
		    border: 0;
		    margin-left: 5px;
		    margin-right: 5px;
		    color: #fff;
		    border-radius: 5px;
		    background-repeat: repeat-x;
		    border: 1px #dc4545 solid;
		    cursor: pointer;
		}
        .table_b_th {
            background: #efefef;
            height: 33px;
            text-align: center;
            color: #000000;
            font-weight: bold;
            font-size: 14px;
            border-top: 3px #dc0000 solid;
        }
        .table_b td {
            border: 1px solid #dbdbdb;
            padding: 5px;
        }
        .text-c {
            text-align: center;
        }
        span.red {
        	color: red;
        }
    </style>
	<script type="text/javascript" src="${ctx}/js/laydate.js"></script>
	<script type="text/javascript" src="${ctx }/js/page/laypage.js"></script> 
	<script type="text/javascript" src="${ctx }/js/page/tpl.js"></script>
	<script type="text/javascript" src="${ctx}/js/page/layer.min.js"></script>
</head>
<body>
<div id="MMainData" style="margin-top: 8px;">
	
	<div class="tabs">
	    <ul id="tabs">
	  		<li class="tabs-btn"><a href="#"><spring:message code="public.myemail"/></a></li>
		</ul>
	    <form name="a" datatype="html" target="_self" style="float: right;margin:12px 75px 0 0;">
	         <select id="state" name="state" style="width:75px;">
	              <option value="" selected="selected"><spring:message code="public.myemail.status"/></option>
	              <option value="1"><spring:message code="public.myemail.status.haveread"/></option>
	              <option value="0"><spring:message code="public.myemail.status.unread"/></option>
	         </select>
	         <input id="start" name="fromTime" class="laydate-icon"  style="width: 100px;height: 19px;line-height: 19px;"/><spring:message code="public.to" />
	         <input id="end" name="toTime" class="laydate-icon" style="width: 100px;height: 19px;line-height: 19px;"/>
	         <input type="button" value="<spring:message code="public.Search" />" class="pagemain_btn chazhao" style="line-height: 19px;height: 19px;width: 44px;padding: 0;"/>
	    </form>
    </div>
    
    <div id="locate-box">
        <table class="MMain" border="1" style="width:900px;margin:20px auto;">
            <thead>
            <tr class="table_b_th">
                <td><spring:message code="public.myemail.accountno"/></td>
                <td><spring:message code="public.myemail.types"/></td>
                <td><spring:message code="public.myemail.writetime"/></td>
                <td><spring:message code="public.myemail.status.status"/></td>
                <td><spring:message code="public.Operating"/></td>
            </tr>
            </thead>
            <tbody id="emailcontent" class="table_b_tr">
            </tbody>
        </table>
        <div id="page1" class="text-c"></div>
    </div>

<script type="text/template" id="emailcontentTpl">
	<# for(var i=0; i<list.length; i++){ 
		var html="";
		var html1="";
		if(list[i].emailtype=='1'){
			html = "<spring:message code="public.myemail.normalmail"/>"
    	}else{
			html = "<spring:message code="public.myemail.changePassword"/>"
		}
		
		if(list[i].emailstatue=='0'){
			html1 = "<spring:message code="public.myemail.status.unread"/>"
    	}else{
			html1 = "<spring:message code="public.myemail.status.haveread"/>"
		}
#>
		<tr class="text-c">
            <td><#=list[i].accountno #></td>
            <td><#= html #></td>
            <td><#=list[i].emailtimeStr #></td>
            <td><#= html1 #></td>
            <td><a style="color:blue;" onclick="reademail('<#=list[i].id #>','<#=list[i].content #>')"><spring:message code="public.myemail.view"/></a>&nbsp;&nbsp;
			</td>
		</tr>
 	<#}#>
</script>
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
$("#status").val("${status}");
$(function(){
	$('.chazhao').click(function(event){
		_resubmit();
		var e = e || window.event;
		if($("form[name='a'] input").val() == ''){
			if(document.all) 
				e.returnValue = false;	//IE,window.event.returnValue = false 阻止元素默认行为
			else 
				e.preventDefault();//Chrome,oprea,firefox event.preventDefault() 阻止元素默认行为
		}
	});
});


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
    
//读取邮件内容，并且标示为已读
function _updatemail(id) {
	$.ajax({
        url : ctx + "common/reademailrecord.do?flag=2&id="+id,
        data : {},
        timeout : 2000, //超时时间设置，单位毫秒
        type : "get",
        dataType : "json",
        success : function(b) {
        	console.debug(b);
            if (0 == b.code) {
            	console.debug(b.code);
            }
        }
    });
}

//弹出一个页面层
function reademail(id,content){
	//更新标识
	_updatemail(id);
	var htmlstr = "<div style='padding:50px;'>"+content+"</div>"
	$.layer({
	    type: 1,   //0-4的选择,（1代表page层）
	    area: ['500px', '300px'],
	    //shade: [0],  //不显示遮罩
	    border: [0], //不显示边框
	    title: [
	        '我的邮件',
	        //自定义标题风格，如果不需要，直接title: '标题' 即可
	        'border:none; background:#61BA7A; color:#fff;' 
	    ],
	    bgcolor: '#eee', //设置层背景色
	    page: {
	        html: htmlstr
	    },
	    fadeIn: 300,
	    close: function(index){
	    	//回调函数刷新页面值
	    	_resubmit();
	    }
	});            
}

</script>

<script>
//时间控件
var start = {
	elem: '#start', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
	event: 'focus', //响应事件。如果没有传入event，则按照默认的click
	format: 'YYYY-MM-DD',
	//min: getPreMonth(laydate.now()), //最小日期
	//max: laydate.now(), //最大日期
	choose: function(datas){
		end.min = datas; //开始日选好后，重置结束日的最小日期
		end.start = datas //将结束日的初始值设定为开始日
	}
};
var end = {
elem: '#end',
	event: 'focus', //响应事件。如果没有传入event，则按照默认的click
   	format: 'YYYY-MM-DD',
   	//min: getPreMonth(laydate.now()), //最小日期
	//max: laydate.now(), //最大日期
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
//第一次查询一个月的数据
var url = "/common/reademailrecord.do?flag=1&fromTime="+startTime+"&toTime="+endTime;
var addhtml = '';
$.getJSON(url, {page: 1}, function(res){ 
  laypage({
    cont: 'page1', 
    pages: res.pages, 
    curr: 1, 
    skin: 'molv',
    jump: function(e){ 
		$.getJSON(url, {page: e.curr}, function(res){
        	var view = $('#emailcontent');
        	//console.debug(res);
        	var count = res.totalCount;
        	if(count>0){
        		var html =  tpl('#emailcontentTpl', res);
				view.html(html);
        	}else{
				view.html("");
			}
      });
    }
  });
});

function _resubmit(){
	var startTime = $("#start").val();
	var endTime = $("#end").val();
	var state = $("#state").val();
	var url = ctx + "common/reademailrecord.do?flag=1&state="+state+"&fromTime="+startTime+"&toTime="+endTime;
	var addhtml = '';
	$.getJSON(url, {page: 1}, function(res){ 
	  laypage({
	    cont: 'page1', 
	    pages: res.pages, 
	    curr: 1, 
	    skin: 'molv',
	    jump: function(e){ 
			$.getJSON(url, {page: e.curr}, function(res){
	        	var view = $('#emailcontent');
	        	//console.debug(res);
	        	var count = res.totalCount;
	        	if(count>0){
	        		var html =  tpl('#emailcontentTpl', res);
					view.html(html);
	        	}else{
					view.html("");
				}
	      });
	    }
	  });
	});
}


</script>
</body>
</html>