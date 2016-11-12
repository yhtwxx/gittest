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
	<input name="apiName" type="hidden" value="${apiName }">
	<input name="apiVersion" type="hidden" value="${apiVersion }">
	<input name="platformID" type="hidden" value="${platformID }">
	<input name="merchNo" type="hidden" value="${merchNo }">
	<input name="orderNo" type="hidden" value="${orderNo }">
	<input name="tradeDate" type="hidden" value="${tradeDate }">
	<input name="amt" type="hidden" value="${amt }">
	<input name="merchUrl" type="hidden" value="${merchUrl }">
	<input name="signMsg" type="hidden" value="${signMsg }">
	<input name="bankCode" type="hidden" value="${bankCode }">
</form>

<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>
</body>
</html>