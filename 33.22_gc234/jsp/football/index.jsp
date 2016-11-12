<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>黄金世纪</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
</head>

<body>

<!--头部-->
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="container padding-0">
	<iframe src="football.do" width=100% height=800 align=middle marginwidth=0 marginheight=0 frameborder=no scrolling=no></iframe>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>