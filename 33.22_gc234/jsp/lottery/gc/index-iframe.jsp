<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GC彩票框架</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../../common/common_lang.jsp" />
    <!--本页css-->
    <link rel="stylesheet" href="${ctx}/css/lottery/ssc.css" />
</head>

<body>

<!--彩票头部-->
<jsp:include page="cainav.jsp"></jsp:include>

<!--玩法投注区-->
<div class="caicontainer" style="margin-top:10px;">
    <IFRAME ID="CaiZhongIframe" Name="CaiZhongIframe" FRAMEBORDER=0 scrolling="no" width=100% SRC="${ctx}/lottery/gc/cqssc.do"></IFRAME>
    <div class="clearfix"></div>
</div>

<!--iframe自适应子页面高度-->
<script type="text/javascript">
	var browserVersion = window.navigator.userAgent.toUpperCase();
	var isOpera = false, isFireFox = false, isChrome = false, isSafari = false, isIE = false;
	function reinitIframe(iframeId, minHeight) {
		try {
			var iframe = document.getElementById(iframeId);
			var bHeight = 0;
			if (isChrome == false && isSafari == false)
				bHeight = iframe.contentWindow.document.body.scrollHeight;

			var dHeight = 0;
			if (isFireFox == true)
				dHeight = iframe.contentWindow.document.documentElement.offsetHeight + 2;
			else if (isIE == false && isOpera == false)
				dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
			else if (isIE == true && !-[ 1, ] == false) {
			} //ie9+
			else
				bHeight += 3;

			var height = Math.max(bHeight, dHeight);
			if (height < minHeight)
				height = minHeight;
			iframe.style.height = height + "px";
		} catch (ex) {
		}
	}
	function startInit(iframeId, minHeight) {
		isOpera = browserVersion.indexOf("OPERA") > -1 ? true : false;
		isFireFox = browserVersion.indexOf("FIREFOX") > -1 ? true : false;
		isChrome = browserVersion.indexOf("CHROME") > -1 ? true : false;
		isSafari = browserVersion.indexOf("SAFARI") > -1 ? true : false;
		if (!!window.ActiveXObject || "ActiveXObject" in window)
			isIE = true;
		window.setInterval("reinitIframe('" + iframeId + "'," + minHeight + ")", 100);
	}
</script>
<script type="text/javascript">
startInit('CaiZhongIframe', 700);
</script>

<jsp:include page="../../common/showSg.jsp"></jsp:include>
<jsp:include page="../../common/showGz.jsp"></jsp:include>
</body>
</html>