<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
    <!--本页css-->
    <link rel="stylesheet" href="${ctx}/css/lottery/ssc.css" />
</head>
<body>

<!--网站头部-->
<jsp:include page="../common/header.jsp"></jsp:include>

<!--GC彩票框架-->
<div class="container padding-0">
    <iframe id="gclotteryiframe" name="gclotteryiframe" frameborder=0 width=100% height="1000px;" src="/gclottery/indexiframe.do"></iframe>
    <div class="clearfix"></div>
</div>

<!--尾部-->
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>