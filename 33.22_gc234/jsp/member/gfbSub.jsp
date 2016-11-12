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
	<input type="hidden" name="version"          value="${version }" />
	<input type="hidden" name="charset" value="${charset }" />
	<input type="hidden" name="language" value="${language }" />
	<input type="hidden" name="signType" value="${signType }" />
	<input type="hidden" name="tranCode"     value="${tranCode }"/>
	<input type="hidden" name="merchantID"      value="${merchantID }"/>
	<input type="hidden" name="merOrderNum"  value="${merOrderNum }"/>
	<input type="hidden" name="tranAmt"  value="${ tranAmt}"/>
	<input type="hidden" name="currencyType" value="${currencyType }"/>
	<input type="hidden" name="frontMerUrl"    value="${frontMerUrl }">
	<input type="hidden" name="backgroundMerUrl" value="${backgroundMerUrl }"/>
	<input type="hidden" name="tranDateTime"     value="${tranDateTime }"/>
	<input type="hidden" name="virCardNoIn"    value="${virCardNoIn }"/>
	<input type="hidden" name="tranIP"  value="${tranIP }"/>
	<input Type="hidden" name="goodsName"     value="${goodsName }"/>
	<input Type="hidden" name="bankCode"     value="${bankCode }"/>
	<input Type="hidden" name="userType"     value="${userType }"/>
	<input Type="hidden" name="signValue"     value="${signValue }"/>
	</form>

<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>



</body>
</html>