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

<body  onLoad="document.dinpayForm.submit();" >
<form name="dinpayForm" method="post" action="${url }"><!-- 注意 以post的方式提交数据到网关  -->
	<input type="hidden" name="Mer_code"          value="${Mer_code }" />
	<input type="hidden" name="Billno" value="${Billno }" />
	<input type="hidden" name="Amount" value="${Amount }" />
	<input type="hidden" name="Date" value="${Date }" />
	<input type="hidden" name="Currency_Type"     value="${Currency_Type }"/>
	<input type="hidden" name="Gateway_Type"      value="${Gateway_Type }"/>
	<input type="hidden" name="Lang"  value="${Lang }"/>
	<input type="hidden" name="Merchanturl"  value="${ Merchanturl}"/>
	<input type="hidden" name="FailUrl" value="${FailUrl }"/>
	<input type="hidden" name="OrderEncodeType"    value="${OrderEncodeType }">
	<input type="hidden" name="RetEncodeType" value="${RetEncodeType }"/>
	<input type="hidden" name="Rettype"     value="${Rettype }"/>
	<input type="hidden" name="ServerUrl"    value="${ServerUrl }"/>
	<input type="hidden" name="SignMD5"  value="${SignMD5 }"/>
	</form>

<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>



</body>
</html>