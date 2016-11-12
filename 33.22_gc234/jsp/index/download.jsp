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
	<link type="text/css" href="${ctx}/css/web/about.css" rel="stylesheet" />
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

				<!--公告-->
				<%-- <jsp:include page="../common/gonggao.jsp"></jsp:include> --%>
				
				<div class="main">
					<div class="sidebar">
						<ul>
							<li class="move"></li>
							<li><a href="${ctx}/register.do">免费开户</a></li>
							<li><a href="${ctx}/about.do">关于我们</a></li>
							<li><a href="${ctx}/contact.do">联系我们</a></li>
							<li><a href="${ctx}/partner.do">合作伙伴</a></li>
							<li><a href="${ctx}/notice.do">最新公告</a></li>
							<li><a href="${ctx}/faq.do">常见问题</a></li>
							<li class="on"><a href="${ctx}/download.do">软件下载</a></li>
							<li><a href="http://www.110113.com/" target="_blank">线路检测</a></li>
						</ul>
					</div>
					<div class="right">
						<h2 style="font-size:28px;">软件下载</h2>

	<br><br><p><a href="https://www.google.com/chrome" target="_blank"><img style="display:inline-block; width:13%;" src="images/web/download_01a.png" alt=""></a><img style="display:inline-block; width:87%;" src="images/web/download_01b.png" alt=""> </p>
	<hr>
	<p> <a href="http://moztw.org" target="_blank"><img style="display:inline-block; width:13%;" src="images/web/download_02a.png" alt=""></a><img style="display:inline-block; width:87%;" src="images/web/download_02b.png" alt=""> </p>
    <hr>
	<p> <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie" target="_blank"><img style="display:inline-block; width:13%;" src="images/web/download_03a.png" alt=""></a><img style="display:inline-block; width:87%;" src="images/web/download_03b.png" alt=""> </p>
	<hr>
	<p> <a href="https://get.adobe.com/tw/flashplayer/?no_ab=1" target="_blank"><img style="display:inline-block; width:13%;" src="images/web/download_04a.png" alt=""></a><img style="display:inline-block; width:87%;" src="images/web/download_04b.png" alt=""> </p>
    <hr>
	<p><a href="/u80_9856_setup_1.13.zip" target="_blank"><img style="display:inline-block; width:32%;" src="images/web/clientdownload.png"></a><a style="font-size:12px;color:#DDCACA;display:inline;padding:5px 90px;">太阳城游戏大厅</a></p>


					</div>
				</div>
			
		
			</div>
		</div>
	</div>
</div>

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