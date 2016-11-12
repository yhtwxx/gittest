<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

</head>

<body onLoad="document.dinpayForm.submit();">
	<form name="dinpayForm" method="post" action="${url }">
		<!-- 注意 以post的方式提交数据到网关  -->
		<input type="hidden" name="MemberID" value="${MemberID }" /> 
		<input type="hidden" name="TerminalID" value="${TerminalID }" /> 
		<input type="hidden" name="InterfaceVersion" value="${InterfaceVersion }" /> 
		<input type="hidden" name="KeyType" value="${KeyType }" /> 
		<input type="hidden" name="PayID" value="${PayID }" /> 
		<input type="hidden" name="TradeDate" value="${TradeDate }" /> 
		<input type="hidden" name="TransID" value="${TransID }" /> 
		<input type="hidden" name="OrderMoney" value="${OrderMoney }" /> 
		<input type="hidden" name="NoticeType" value="${NoticeType }" /> 
		<input type="hidden" name="PageUrl" value="${PageUrl }"> 
		<input type="hidden" name="ReturnUrl" value="${ReturnUrl }" />
		<input type="hidden" name="Signature" value="${Signature }" />
	</form>

</body>
</html>