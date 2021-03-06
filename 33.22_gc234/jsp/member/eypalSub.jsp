<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>资金管理</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    
</head>

<body  onLoad="document.dinpayForm.submit();" >
<form name="dinpayForm" method="post" action="${url }"><!-- 注意 以post的方式提交数据到网关  -->
	<input name="version" type="hidden" value="1.0">
	<input name="partner" type="hidden" value="${partner }">
	<input name="orderid" type="hidden" value="${orderid }">
	<input name="payamount" type="hidden" value="${payamount }">
	<input name="payip" type="hidden" value="${payip }">
	<input name="notifyurl" type="hidden" value="${notifyurl }">
	<input name="returnurl" type="hidden" value="${returnurl }">
	<input name="paytype" type="hidden" value="${paytype }">
	<input name="remark" type="hidden" value="${remark }">
	<input name="sign" type="hidden" value="${sign }">
</form>

<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>
</body>
</html>