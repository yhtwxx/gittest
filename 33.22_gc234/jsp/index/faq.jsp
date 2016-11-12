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
							<li class="on"><a href="${ctx}/faq.do">常见问题</a></li>
							<li><a href="${ctx}/download.do">软件下载</a></li>
							<li><a href="http://www.110113.com/" target="_blank">线路检测</a></li>
						</ul>
					</div>
					<div class="right">
						<h2 style="font-size:28px;">常见问题</h2>

	<br><br><h2>Q1. 你们的游戏会用多少副牌？</h2>
	<br><br><p>在百家乐游戏中我们会用8副牌，其他游戏则会根据其性质有所调整。</p>
	<br><br><h2>Q2.我可以免费试玩吗？</h2>
	<br><br><p>可以，我们诚挚邀请您免费试玩。无须登入，只要点击“<a href="/acc/try.htm">免费试玩</a>”即可!</p>
	<br><br><h2>Q3. 我在那里可以找到游戏的规则？</h2>
	<br><br><p>在未登入前，您可以在游戏的最外层看到"游戏规则"选项，清楚告诉您游戏的玩法、规则及派彩方式。 在游戏视窗中,也有"规则"选项，让您在享受游戏乐趣的同时，可以弹跳视窗随时提醒您游戏规则。</p>
	<br><br><h2>Q4. 你们何时会洗牌?</h2>
	<br><br><p>所有纸牌游戏，当红的洗牌记号出现或游戏因线路问题中断时便会进行重新洗牌。</p>
	<br><br><h2>Q5. 我的注码的限制是多少？</h2>
	<br><br><p>您的注码会根据您的存款有所不同，运动博弈单场单注最低是10至1000~20000元人民币， 娱乐场单场单注最低是1至3000元人民币。特殊VIP客户，请见"优惠活动"。</p>

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