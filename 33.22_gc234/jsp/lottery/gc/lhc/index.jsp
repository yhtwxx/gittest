<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>黄金世纪</title>
<!--本页css-->
<link rel="stylesheet" href="${ctx}/css/lottery/pitaya.css" />
<!-- 引用公用头部文件（包含公用css和公用js） -->
<jsp:include page="../../../common/common_lang.jsp" />
<link rel="stylesheet" href="${ctx}/css/lottery/View.css" />
<link rel="stylesheet" href="${ctx}/css/lottery/ssc.css" />
</head>

<body>
	<div class="caicontainer">
		<!--头部区域-->
		<jsp:include page="title.jsp"></jsp:include>
		<!--开奖区域 -->
		<jsp:include page="ramdomball.jsp" />

		<div class="row">
			<!--左侧边栏开始-->
			<%--<jsp:include page="left.jsp"></jsp:include>--%>
			<!--左侧边栏开始-->
			<!--投注区域开始-->
			<div id="betSection" class="cqsc col-xs-12"></div>
			<!--投注区域结束-->
		</div>
		<div class="clearfix"></div>
	</div>
	<jsp:include page="../../../common/showSg.jsp"></jsp:include>
	<jsp:include page="../../../common/showGz.jsp"></jsp:include>
	<!--开奖方法   不能修改位置 -->
	<script src="${ctx}/js/lib/countdown.js" type="text/javascript"></script>
	<script src="${ctx}/js/lottery/lhc/lhc_commom.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			var pream = $("#caiplaynav").find("li.active a").attr("data-flag");
			var gameType = $("#caiplaynav").find("li.active a").attr("data-type");
			getBetDiv(pream);
			function getBetDiv(pream){
				if(pream != "home"){
					$.get("${ctx}/lottery/gc/getHtmlByflag.do", {gameType: gameType,flag: pream}, function(result){
						$("#betSection").html(result);
					},"html");
				}
			}
			$(document).on('click', '#caiplaynav li a', function(){
				var flag = $(this).attr('data-flag');
				getBetDiv(flag);
			});
		});
	</script>
</body>
</html>