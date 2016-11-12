<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>存取款记录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
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

</head>

<body>

<div id="MMainData" style="margin-top: 8px;">


    <div class="tabs">
        <ul id="tabs">
            <li class="tabs-btn"><a href="moneyView.do"><spring:message code="public.member.AmountOfMoney" /></a></li>
            <li class="tabs-btn"><a href="moneyCun.do"><spring:message code="public.deposit"/></a></li>
            <li class="tabs-btn"><a href="moneyQu.do"><spring:message code="public.withdrawal"/></a></li>
            <li class="tabs-btn active"><a href="moneyRec.do"><spring:message code="public.DepositWithdrawalRecord"/></a></li>
            <!-- <li class="tabs-btn active"><a href="moneyDividend.do">退水记录</a></li> -->
        </ul>
        <form action="" datatype="html" call="recordSearch" target="_self" style="float: right;margin:12px 75px 0 0;">
            <select id="type" name="type" style="width:75px;">
                <option value="" selected="selected"><spring:message code="public.AllTypes" /></option>
                <option value="1"><spring:message code="public.deposit"/></option>
                <option value="0"><spring:message code="public.withdrawal"/></option>

            </select>
            <select id="state" name="state" style="width:75px;">
                <option value="" selected="selected"><spring:message code="public.AllStates" /></option>
                <option value="1"><spring:message code="public.Reviewing" /></option>
                <option value="2"><spring:message code="public.Succeeded" /></option>
                <option value="3"><spring:message code="public.Failed" /></option>
                <option value="4"><spring:message code="public.Canceled" /></option>
            </select>

            <input id="start" name="fromTime" class="laydate-icon" style="width: 100px;height: 19px;line-height: 19px;" />
            -
            <input id="end" name="toTime" class="laydate-icon" style="width: 100px;height: 19px;line-height: 19px;" />
            <input type="button" value="<spring:message code="public.Search" />" class="pagemain_btn chazhao" style="line-height: 19px;height: 19px;width: 44px;padding: 0;" />
        </form>
    </div>

    <div id="locate-box">
        <table class="MMain" border="1" style="width:900px;margin:20px auto;">
            <thead>
            <tr>
            	<th align="center"><spring:message code="public.OrderNumber" /></th>
                <th align="center"><spring:message code="public.OperationTime" /></th>
                <th align="center"><spring:message code="public.OperationType" /></th>
                <th align="center"><spring:message code="public.OperationAmount" />(<spring:message code="public.currency.THB" />)</th>
                <th align="center"><spring:message code="public.Bonus" />(<spring:message code="public.currency.THB" />)</th>
                <th align="center"><spring:message code="public.Postscript" /></th>
                <th align="center"><spring:message code="public.Status" /></th>
                <th align="center"><spring:message code="public.Operation" /></th>
            </tr>
            </thead>
            <tbody id="content" class="table_b_tr"></tbody>
        </table>
        <div id="page1" class="text-c"></div>
    </div>

<script type="text/template" id="contentTpl">
	<# for(var i=0; i<list.length; i++){#>
		<tr class="text-c">
				<td><#=list[i].orderid #></td>
				<td><#=list[i].reqTimeStr #></td>
                <td>
					<# if(list[i].type == 1) {#>
					<spring:message code="public.msg.DW.Type.ManualDeposit" />
					<# }else if(list[i].type == 2){ #>
					<spring:message code="public.msg.DW.Type.ManualWithdrawal" />
					<# }else if(list[i].type == 3){ #>
					<spring:message code="public.msg.DW.Type.AutomaticDeposit" />
					<# }else if(list[i].type == 4){ #>
					<spring:message code="public.msg.DW.Type.AutomaticWithdrawal" />
					<# }else if(list[i].type == 5){ #>
					<spring:message code="public.msg.DW.Type.Discount" />
					<# }else if(list[i].type == 6){ #>
					<spring:message code="public.msg.DW.Type.CompanyWithdrawal" />
					<# } #>
				</td>
                <td>
					<# if(list[i].money != null){ #>
					<#=list[i].money/100 #>
					<# } #>
				</td>
                <td><#=list[i].bonus/100 #></td>
 				<td><#=list[i].dwdesc #></td>
				<td>
					<# if(list[i].status == "0"){ #>
					<span class="red"><spring:message code="public.IncompleteOrder" /></span>
					<# }else if(list[i].status == "1"){ #>
					<span><spring:message code="public.Reviewing" /></span>
					<# }else if(list[i].status == "2"){ #>
					<span><spring:message code="public.Succeeded" /></span>
					<# }else if(list[i].status == "3"){ #>
					<span><spring:message code="public.Failed" /></span>
					<# }else if(list[i].status == "4"){ #>
					<span><spring:message code="public.Canceled" /></span>
					<# } #>
				</td>
				<td>
					<# if(list[i].status == "0"){ #>
					<a href="javascript:void(0)" onclick="openWin('deposit3.do','<spring:message code="public.ContinueOrder" />');"><spring:message code="public.ContinueOrder" /></a>
					<a href="javascript:void(0)" onclick="delOrder();"><spring:message code="public.DeleteOrder" /></a>
					<# } #>
				</td>
		</tr>
 	<#}#>
</script>
</div>
<script src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/js/laydate.js"></script>
<script>
    laydate({
        elem: '#start', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        event: 'focus' //响应事件。如果没有传入event，则按照默认的click
    });
    laydate({
        elem: '#end'
    });
</script>

<script type="text/javascript" src="${ctx }/js/page/layer.min.js"></script>
<script type="text/javascript" src="${ctx }/js/page/laypage.js"></script> 
<script type="text/javascript" src="${ctx }/js/page/tpl.js"></script>
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
			if(res.tallCount > 0){
				var view = $('#content'); 
				var html =  tpl('#contentTpl', res);
				var count = res.count;
	        	var poweritem = res.poweritem;			
				//$('#count').html(count);
	        	view.html(html);
			}
      });
    }
  });
});
</script>
<script type="text/javascript">
    $(function(){
    	
    	$("#start").val("${fromTime}");
    	$("#end").val("${toTime}");
    	$("#type").val("${type}");
    	$("#state").val("${state}");

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
    
    function openWin(url,name){
    	window.open(url,name,"width=1076,height=625,status=no,location=no,scrollbars=yes");
    }
    
    function delOrder(){
    	layer.confirm(commonlangpackage['AreYouSureWantToDelete'], function(){
    		$.post('cancelOrder.do', function(result){
        		if(result.status == 0){
        			layer.msg(commonlangpackage['DeleteSuccess'], 2, function(){
        				window.location.reload();
        			});
        		}else{
        			layer.msg(commonlangpackage['DeleteFailed'], 2, 0);
        		}
       		},'json');
    	});
    }
   
</script>



</body>
</html>