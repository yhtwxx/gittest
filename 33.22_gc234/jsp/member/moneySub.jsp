<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>资金管理-黄金世纪</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    
</head>

<body  onLoad="document.dinpayForm.submit();">
<form name="dinpayForm" method="post" action="${url }"><!-- 注意 以post的方式提交数据到智付网关 -->
	<input type="hidden" name="sign"          value="${sign }" />
	<input type="hidden" name="service_type" value="${service_type }" />
	<input type="hidden" name="merchant_code"     value="${merchant_code }"/>
	<input type="hidden" name="input_charset"      value="${input_charset }"/>
	<input type="hidden" name="notify_url"  value="${notify_url }"/>
	<input type="hidden" name="return_url"  value="${ return_url}"/>
	<input type="hidden" name="interface_version" value="${interface_version }"/>
	<input type="hidden" name="sign_type"    value="${sign_type }">
	<input type="hidden" name="order_no" value="${order_no }"/>
	<input type="hidden" name="order_time"     value="${order_time }"/>
	<input type="hidden" name="order_amount"    value="${order_amount }"/>
	<input type="hidden" name="product_name"  value="${product_name }"/>
	<input Type="hidden" name="bank_code"     value="${bank_code }"/>
	</form>

<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>



</body>
</html>