<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/css/sport/mem_order_ft.css" type="text/css">

<script language="JavaScript" src="${ctx}/js/sport/${order}.js"></script>

<title>投注页面</title>
</head>
<c:choose>
<c:when test="${code == 0 && order == 'football_order_p3' }">
<body id="OFTP3" class="bodyset" >
<form name="LAYOUTFORM" action="order.do" method="post" onSubmit="return false">
<input type="hidden" id="gtype" name="gtype" value="${ gtype}"/>
	${bet_html }
</form>
</body>
</c:when>
<c:when test="${code == 0 && order != 'football_order_p3' }">
<body  id="OFT" class="bodyset" onSelectStart="self.event.returnValue=false" oncontextmenu="self.event.returnValue=false;window.event.returnValue=false;" >

<form name="LAYOUTFORM" action="order.do" method="post" onSubmit="return false">
    <input type="hidden" id="gtype" name="gtype" value="${ gtype}"/>
     ${bet_html }
</form>
</body>
</c:when>
<c:when test="${code == 40001 }">
<body id="BLUE">
	<div>
		<p>网络繁忙!</p>
		<p><input type="button" name="check" value="确定" onclick="parent.close_bet();" height="20" class="yes"></p>
	</div>
</body>
</c:when>
<c:when test="${code == 40002 }">
<body id="BLUE">
	<div>
		<p>赛事不存在!</p>
		<p><input type="button" name="check" value="确定" onclick="parent.close_bet();" height="20" class="yes"></p>
	</div>
</body>
</c:when>
<c:otherwise>
<body id="BLUE">
	<div>
		<p>请先登录!</p>
		<p><input type="button" name="check" value="确定" onclick="parent.close_bet();" height="20" class="yes"></p>
	</div>
</body>
</c:otherwise>
</c:choose>
</html>