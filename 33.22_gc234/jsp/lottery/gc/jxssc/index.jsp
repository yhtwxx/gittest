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
<!-- 引用公用头部文件（包含公用css和公用js） -->
<jsp:include page="../../../common/common_lang.jsp" />
<!--本页css-->
<link rel="stylesheet" href="${ctx}/css/lottery/ssc.css" />
<link rel="stylesheet" href="${ctx}/css/lottery/View.css" />
</head>
<body>
	<div class="caicontainer">
		<!--头部区域-->
		<jsp:include page="title.jsp"></jsp:include>
		<div class="row">
			<!--左侧边栏开始-->
			<%--<jsp:include page="left.jsp"></jsp:include>--%>
			<!--左侧边栏开始-->
			<!--投注区域开始-->
			<div id="betSection" class="col-xs-12">
			
			</div>
			<!--投注区域结束-->
		</div>
		<div class="clearfix"></div>
	</div>
	
	<%-- <jsp:include page="../../../common/showSg.jsp"></jsp:include>
	<jsp:include page="../../../common/showGz.jsp"></jsp:include> --%>
	
	<script src="${ctx}/js/lottery/jxssc/common.js"></script>
	
	<script type="text/javascript">
	//鼠标悬浮投注区域
	$(document).on("mouseover",".choose-item", function(){
		if(!$(this).hasClass("selected-bet")){
			$(this).addClass("bc");
		}
	});
	//鼠标离开投注区域
	$(document).on("mouseout",".choose-item", function(){
		$(this).removeClass("bc");
	});
	//点击投注区域
	$(document).on("click",".choose-item", function(){
		//if(currentBetMode == 1 && currentGame[gameType].gameTime > currentGame[gameType].closeTime){
			//$(this).toggleClass("selected-bet");
			var flaseORtrue = $(this).find("input").is(':focus');
			//alert(flaseORtrue);
			if(!flaseORtrue){
				/* $(this).find(".fontBlue").toggleClass("selected-bet"); */
				$(this).toggleClass("selected-bet");
				$(this).find(".odds").toggleClass("selected-bet");
				$(this).find("input").toggleClass("selectedinput");				
			}
			if($("#kuaijiexiaju_input").val() != ""){
				$(this).find("input").val($("#kuaijiexiaju_input").val()).change();
			}			
			if(!$(this).find(".odds").hasClass("selected-bet")){
				$(this).find("input").val("").change();
			}
		//}
	});
	</script>
	
</body>
</html>