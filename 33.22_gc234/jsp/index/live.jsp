<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>黄金世纪</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
	<!--本站css-->
	<%-- <jsp:include page="../common/myCss.jsp"></jsp:include> --%>
	<link type="text/css" href="${ctx}/css/web/live.css" rel="stylesheet" />
	<!--本站js-->
	<%-- <jsp:include page="../common/myJs.jsp"></jsp:include> --%>
</head>
<body>
<!--头部-->
<jsp:include page="../common/header.jsp"></jsp:include>
	
 <div id="bannerbg"></div>

<div id="contentbg">
	<div class="bg bg_top">
		<div class="bg bg_bottom">
			<div class="content">
				<!-- 公告 -->
				<%-- <jsp:include page="../common/gonggao.jsp"></jsp:include> --%>
				<div class="main">
					<div class="lists">
						<div class="list listgcgb">
							<a onclick="isSession(this,'${ctx}/live/index.do','1','GC')">GC贵宾</a>
						</div>
						<div class="list listgcxc">
							<a onclick="isSession(this,'${ctx}/live/indexgj.do','1','GG')">GC现场</a>
						</div>
						<div class="list list1">
							<a onclick="isSession(this,'${ctx}/live/agame.do','1','AG')">AG</a>
						</div>
						<div class="list listptxc">
							<a onclick="isSession(this,'${ctx}/game/ptzrindex.do','0')">PT现场</a>
						</div>
						<div class="list listob">
							<a onclick="isSession(this,'${ctx}/allbet/index.do','1')">欧博</a>
						</div>
						<div class="list listxtd">
							<a onclick="isSession(this,'${ctx}/xtd/index.do','1')">新天地</a>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
       $(function(){
   	    $('#contentbg .list').hover(function(){
			$(this).find('a').stop(true,false).animate({'top':'-10px'},{duration:300,easing : "easeOutElastic"});
       	},function(){
       		$(this).find('a').stop(true,false).animate({'top':'0px'},{duration:300,easing : "easeOutElastic"});
           });
       });
   </script>

<!-- 尾部 -->
<jsp:include page="../common/footer.jsp"></jsp:include>
    <script type="text/javascript">
		$(function(){
	 		var $el, topPos,$move = $(".sidebar ul li.move");
	 		if(!$(".sidebar ul li.on")[0]){
	 			$move.css("top", '-40px').data("origTop", -40);
	 	 	}else{
		 		 $move.css("top", $(".sidebar ul li.on").position().top).data("origTop", $(".sidebar ul li.on").position().top); 
	 	 	}
	 	    $(".sidebar ul li a").hover(function() {
	 	        $el = $(this);
	 	        if(!$el.parent().hasClass('on')) $('.sidebar ul li.on a').stop(true,false).animate({'color':'#ffffff'});
	 	        topPos = $el.parent().position().top;
	 	        $move.stop(true,false).animate({
	 	            top: topPos
	 	        },{duration:200});
		 	       $el.stop(true,false).animate({'color':'#000000'},{duration:"100"});
	 	    }, function() {
	 	    	if(!$el.parent().hasClass('on')) $el.stop(true,false).animate({'color':'#ffffff'});
	 	        $move.stop(true,false).animate({
	 	            top: $move.data("origTop")
	 	        },{duration:200}); 
		 	    $('.sidebar ul li.on a').stop(true,false).animate({'color':'#000000'},{duration:100});  
	 	    });
		});
    </script>
</body>
</html>