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
	<input name="e_orderno" type="hidden" value="${e_orderno }">
	<input name="e_url" type="hidden" value="${e_url }">
	<input name="e_backend_url" type="hidden" value="${e_backend_url }">
	<input name="e_no" type="hidden" value="${e_no }">
	<input name="e_storename" type="hidden" value="">
	<input name="e_Cur" type="hidden" value="${e_Cur }">
	<input name="e_Lang" type="hidden" value="${e_Lang }">
	<input name="e_bank" type="hidden" value="${e_bank }">
	<input name="e_money" type="hidden" value="${e_money }">
	<input name="str_check" type="hidden" value="${str_check }">
</form>

<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>



</body>
</html>