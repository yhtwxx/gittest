<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>皇冠投注记录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   	<link rel="stylesheet" href="../css/common.css?1203">
    <link href="../css/record.css" rel="stylesheet">
    <style>
    body{
    	padding: 0px;
    	margin: 0px;
    }
    </style>
</head>
<body>

<!-- Contenedor -->
<div class="pagemain">
    <div class="display biao-cont">
        <table width="100%" class="table_b">
            <thead>
            <tr class="table_b_th">
                <td><spring:message code="public.footballRecords.transactiontime" /></td>
                <td><spring:message code="public.footballRecords.typeofEvent" /></td>
                <td><spring:message code="public.footballRecords.event" /></td>
                
                <td><spring:message code="public.BettingRecords.BetAmount" />(<spring:message code="public.currency.rmb" />)</td>
                <td><spring:message code="public.footballRecords.winningamont" />(<spring:message code="public.currency.rmb" />)</td>
                <td><spring:message code="public.BettingRecords.PrizeMoney" />(<spring:message code="public.currency.rmb" />)</td>
                <td><spring:message code="public.BettingRecords.Status" /></td>
            </tr>
            </thead>
             <tbody id="content">
            
            </tbody>
        </table>

    </div>
</div>

<script src="../js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
    $(function(){
    	var json = ${json};
    	var detail = json.list;
    	
    	var html="";
    	var betMoneySum=0,payMoneySum=0;
    	for(var i=0;i<detail.length;i++){
    		var core="";
    		if(detail[i].h_core!=null && (detail[i].h_core+"")!=""){
    			core = "<font color='red'>("+detail[i].h_core+":"+detail[i].c_core+")</font>"
    		}
    		betMoneySum+=detail[i].betMoney/100;
    		payMoneySum+=detail[i].payMoney/100;
    		var oddtype = "";
    		if(detail[i].odd_type=="H"){
    			oddtype = "<spring:message code='public.oddstype.hk' />";
    		}else if(detail[i].odd_type=="M"){
    			oddtype = "<spring:message code='public.oddstype.malay' />";
    		}else if(detail[i].odd_type=="I"){
    			oddtype = "<spring:message code='public.oddstype.Indonesia' />";
    		}else if(detail[i].odd_type=="E"){
    			oddtype = "<spring:message code='public.oddstype.euro' />";
    		}
    		var gameType = "";
    		if(detail[i].gameType=="TF"){
    			gameType = "<spring:message code='public.gameType.Soccer' />";
    		}else if(detail[i].gameType=="TB"){
    			gameType = "<spring:message code='public.gameType.Basketball' />";
    		}else if(detail[i].gameType=="TN"){
    			gameType = "<spring:message code='public.gameType.Tennis' />";
    		}else if(detail[i].gameType=="TP"){
    			gameType = "<spring:message code='public.gameType.TableTennis' />";
    		}else if(detail[i].gameType=="TV"){
    			gameType = "<spring:message code='public.gameType.Volleyball' />";
			}else if(detail[i].gameType=="TM"){
				gameType = "<spring:message code='public.gameType.Badminton' />";
			}
    		html+="<tr>";
    		html+="<td>"+detail[i].betDate_str+"</br>"+oddtype+"</td>";
    		html+="<td>"+gameType+"</td>";
    		if(detail[i].betItem=="p3"){
    			var betContain = detail[i].betContain;
    			var reg1=new RegExp("class=\"his_result\"","g");
    			var reg2=new RegExp("class=\"his_odd\"","g");
    			betContain = betContain.replace(reg1,"color=\"red\"");
    			betContain = betContain.replace(reg2,"color=\"red\"");
    			html+="<td align=\"left\"><font color=\"red\">"+detail[i].betItemName+"</font><br/>"+betContain+"</td>";
    		}else{
    		html+="<td align=\"left\">"+detail[i].betContain+"@<font color=\"blue\">"+detail[i].payRate+"</font><br/>"+detail[i].betItemName+"<br/>"+detail[i].h_teamName+" vs "+detail[i].c_teamName+core+"<br/>"+detail[i].league+"</td>";
    		}
    		html+="<td>"+formatMoney(detail[i].betMoney/100)+"</td>";
    		html+="<td>"+formatMoney(detail[i].winMoney/100)+"</td>";
    		html+="<td>"+formatMoney(detail[i].payMoney/100)+"</td>";
    		html+="<td>"+detail[i].status+"</td>";
    		html+="</tr>";  
    	}
    	html+="<tr>";
		html+="<td><spring:message code='public.BettingRecords.total' /></td>";
		html+="<td></td>";
		html+="<td></td>";
		html+="<td>"+formatMoney(betMoneySum)+"</td>";
		html+="<td></td>";
		
		html+="<td>"+formatMoney(payMoneySum)+"</td>";
		html+="<td></td>";
		html+="</tr>"; 
    	$("#content").html(html);
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