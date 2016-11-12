<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>投注记录</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
    <jsp:include page="../common/common_lang.jsp" />
    <!--本页css/js-->
    <link href="../css/record.css" rel="stylesheet">
    <script type="text/javascript" src="${ctx}/js/laydate.js"></script>
    <script type="text/javascript" src="${ctx}/js/page/laypage.js"></script>
    <script type="text/javascript" src="${ctx}/js/page/tpl.js"></script>
</head>
<body>
<!-- Contenedor -->
<div class="pagemain">
    <div class="navbar-fixed-top">
        <ul class="nav nav-tabs my-nav">
            <li role="presentation"><a href="record.do"><spring:message code="public.BettingRecords.lotteryGames" /></a></li>
            <li role="presentation"><a href="footballrecord.do"><spring:message code="public.BettingRecords.crownSports" /></a></li>
            <li role="presentation"><a href="zbrecord.do"><spring:message code="public.BettingRecords.GC" /></a></li>
            <li role="presentation"><a href="ptrecord.do"><spring:message code="public.BettingRecords.PT" /></a></li>
            <li role="presentation"><a href="agrecord.do"><spring:message code="public.BettingRecords.AG" /></a></li>
            <li role="presentation"><a href="abrecord.do"><spring:message code="public.BettingRecords.AB" /></a></li>
            <li role="presentation"><a href="xtdrecord.do"><spring:message code="public.BettingRecords.XTD" /></a></li>
            <li role="presentation"><a href="mgrecord.do"><spring:message code="public.BettingRecords.MG" /></a></li>
            <li role="presentation"><a href="gdrecord.do"><spring:message code="public.BettingRecords.GD" /></a></li>
            <li role="presentation" class="active"><a href="ugrecord.do"><spring:message code="public.BettingRecords.TBS" /></a></li>
            <li role="presentation"><a href="bbinrecord.do"><spring:message code="public.BettingRecords.BBIN" /></a></li>
            <li role="presentation"><a href="imrecord.do"><spring:message code="public.BettingRecords.imSports" /></a></li>
            <li role="presentation"><a href="garecord.do"><spring:message code="public.BettingRecords.GA" /></a></li>
        </ul>
        <div class="search">
            <form action="" datatype="html" call="recordSearch" target="_self">
                <input id="start" name="fromTime" class="laydate-icon" /><spring:message code="public.to" />
                <input id="end" name="toTime" class="laydate-icon" />
                <input type="button" value="<spring:message code="public.Search" />" class="btn chazhao" />
            </form>
        </div>
    </div>

    <div class="display biao-cont">
        <table width="100%" class="table_b">
            <thead>
            <tr class="table_b_th">
                <td><spring:message code="public.BettingRecords.BettingTime" /></td>
                <td><spring:message code="public.BettingRecords.BettingContent" /></td>
                <td><spring:message code="public.BettingRecords.Odds" /></td>
                <td><spring:message code="public.BettingRecords.Results" /></td>
                <td><spring:message code="public.BettingRecords.BetAmount" />(<spring:message code="public.currency.rmb" />)</td>
                <td><spring:message code="public.BettingRecords.WinningOrLosing" />(<spring:message code="public.currency.rmb" />)</td>
                <td><spring:message code="public.BettingRecords.Status" /></td>
            </tr>
            </thead>
            <tbody id="content">

            </tbody>
        </table>
        <div id="page1" class="text-c"></div>
    </div>
</div>
<script type="text/template" id="contentTpl">
    <# for(var i=0; i<list.length; i++){ #>
    <tr class="text-c">
        <td><#=list[i].betdateStr #></td>
        <td align="left"><#=list[i].betinfo #></td>
        <td><font color="red"><#=list[i].betodds #></font></br><#=list[i].oddsstyle #></td>
        <td><#if(list[i].result=="0"){ #>
                <spring:message code="public.BettingRecords.draw" />
            <#}else if(list[i].result=="1"){ #>
                <spring:message code="public.BettingRecords.winning" />
            <#}else if(list[i].result=="2"){ #>
                <spring:message code="public.BettingRecords.losing" />
            <#}else if(list[i].result=="3"){ #>
                <spring:message code="public.BettingRecords.winningdraw" />
            <#}else if(list[i].result=="4"){ #>
                <spring:message code="public.BettingRecords.losingdraw" />
            <#} #>
        </td>
        <td><#=formatMoney(list[i].betamount/100) #></td>
        <td><#=formatMoney(list[i].win/100) #></td>
        <td><#if(list[i].status=="0"){ #>
                <spring:message code="public.BettingRecords.Status.waiting" />
            <#}else if(list[i].status=="1"){ #>
                <spring:message code="public.BettingRecords.Status.going" />
            <#}else if(list[i].status=="2"){ #>
                <spring:message code="public.BettingRecords.Status.AlreadyPrize" />
            <#}else if(list[i].status=="3"){ #>
                <spring:message code="public.BettingRecords.Status.canceled" />
            <#}else if(list[i].status=="4"){ #>
                <spring:message code="public.BettingRecords.Status.refused" />
            <#} #>
        </td>
    </tr>
    <#}#>
        <tr class="text-c">
            <td><spring:message code="public.BettingRecords.total" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td><#=formatMoney(totalBet/100) #></td>
            <td><#=formatMoney(totalPay/100) #></td>
            <td></td>
        </tr>
</script>

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

<script type="text/javascript">
    var startTime = $("#start").val();
    var endTime = $("#end").val();
    var url = "ugrecordJson.do?timeStamp=" + new Date().getTime() + "&fromTime=" + startTime + "&toTime=" + endTime;
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
    function formatMoney(num) {
        num = num.toFixed(2);
        var parts = num.toString().split(".");
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return parts.join(".");
    };
</script>
</body>
</html>