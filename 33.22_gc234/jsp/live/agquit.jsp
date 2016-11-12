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
</head>
<body>
    <div class="jumbotron">
  		<h1>您已经退出游戏！</h1>
		<p>请点击下方按钮关闭此窗口</p>
		<p><a class="btn btn-primary btn-lg" href="#" id="closeWinBtn" role="button">点击关闭</a></p>
	</div>
	
	<script>
	$(document).on('click', '#closeWinBtn', function(){
		window.close();
	})
	</script>
</body>

</html>