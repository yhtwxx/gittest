<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title></title>
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<style type="text/css">
	body{
		height: 850px;
		background-color: #eee;
	}
</style>
</head>
<body>
	<div class="jumbotron">
	  <h1>进入游戏失败</h1>
	  <p>您无权进入游戏，请注册正式账户并登录您的正式账户进行游戏！</p>
	  <p><div class="alert alert-danger" role="alert"><span id="time">5</span>秒后将跳转到主页</div></p>
	  <p><a href="${ctx}/index.do" target="_top">如果没有自动跳转，请点击我跳转到主页！</a></p>
	</div>
	<script>
		$(function(){
			var time = 5;
			setInterval(function(){
				if(time == 0){
					top.location.href = "${ctx}/index.do";
				}else{
					time--;
				}
				$('#time').html(time);
			},1000); 
		})
	</script>
</body>
</html>