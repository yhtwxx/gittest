<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/css/sport/mem_order_ft.css" type="text/css">
<title>Insert title here</title>
</head>

<c:choose>
<c:when test="${code == 0 }">
<body  id="OFIN" class="bodyset" onSelectStart="self.event.returnValue=false" oncontextmenu="self.event.returnValue=false;window.event.returnValue=false;">
<div class="ord">
	<div class="title">
	<h1>
	<c:choose>
	<c:when test="${gtype=='FT' }">足球</c:when>
	<c:when test="${gtype=='BK' }">篮球</c:when>
	<c:when test="${gtype=='TN' }">网球</c:when>
	<c:when test="${gtype=='VB' }">排球</c:when>
	<c:when test="${gtype=='BM' }">羽毛球</c:when>
	<c:when test="${gtype=='TT' }">乒乓球</c:when>
	<c:otherwise>其他</c:otherwise>
	</c:choose>
	</h1>
	</div>
	<div class="fin_title">
		<div class="fin_acc">成功提交注单！</div>
		<%-- <div class="fin_uid">注单号：${tickNo }</div> --%>
	</div>
    <div class="main">
      	${con_html }
      	<div class="betdata">
          	<p class="minBet">交易金额：<span class="fin_gold">${betMoney }</span></p>
    	</div>
    </div>
  	<div class="betBox"> 
  		<input type="button" name="PRINT" value="列印" onClick="window.print()" class="yes">
    	<input type="button" name="FINISH" value="关闭" onClick="parent.close_bet();" class="no">
  	</div>
</div>
</body>
</c:when>

<c:otherwise>
<body id="BLUE">
	<div>
		<p><spring:message code="${code}"/></p>
		<c:choose>
		<c:when test="${code == 20011 }">
			<p><input type="button" name="check" value="确定" onclick="history.go(-1);" height="20" class="yes"></p>
			<script type="text/javascript">
				setTimeout(
                    function(){
                    	window.history.go(-1);
                    },500
                )
				
			</script>
		</c:when>
		<c:otherwise>
			<p><input type="button" name="check" value="确定" onclick="parent.close_bet();" height="20" class="yes"></p>
		</c:otherwise>
		</c:choose>
		
	</div>
</body>
</c:otherwise>
</c:choose>

</html>