<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
    <!--本页css-->
</head>

<body>

<!--头部-->
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="container padding-0">
    <iframe src="register-iframe.do?autoLogin=${autoLogin }" width=100% height=700 align=middle marginwidth=0 marginheight=0 frameborder=no scrolling=no></iframe>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>