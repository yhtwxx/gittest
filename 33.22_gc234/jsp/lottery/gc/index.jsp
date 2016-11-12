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
	<jsp:include page="../../common/common_lang.jsp" />
    <!--本页css-->
    <link rel="stylesheet" href="${ctx}/css/lottery/ssc.css" />
</head>

<body>

<!--网站头部-->
<jsp:include page="../../common/header.jsp"></jsp:include>

<!--GC彩票框架-->
<div class="container padding-0">
    <IFRAME ID="GCCaiIframe" Name="GCCaiIframe" FRAMEBORDER=0 scrolling="no" width=100% SRC="index-iframe.do"></IFRAME>
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
startInit('GCCaiIframe', 700);
</script>

<!--尾部-->
<jsp:include page="../../common/footer.jsp"></jsp:include>

</body>
</html>