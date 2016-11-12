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
	<jsp:include page="../common/common_lang.jsp" />


</head>

<body>

<!--头部-->
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="container padding-0" style="min-width:1200px;">
    <iframe src="${ctx}/ssc/index.do" width=100% id="frame_content" onload="this.height=100" align="middle" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" allowTransparency="true" ></iframe>
</div>

<!--iframe自适应高度-->
<script type="text/javascript">
function reinitIframe(){
var iframe = document.getElementById("frame_content");
try{
var bHeight = iframe.contentWindow.document.body.scrollHeight;
var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
var height = Math.max(bHeight, dHeight);
iframe.height =  height;
}catch (ex){}
}
window.setInterval("reinitIframe()", 200);

$(function(){
	var itemType = "${itemType}";
	if(itemType !== null || itemType !== undefined || itemType !== ''){
		var url = "";
		switch (itemType) {
		case "ssc":
			url = "${ctx}/ssc/index.do?poolId=7";
			break;
		case "gdsf":
			url = "${ctx}/gdsf/zhupan.do";
			break;
		case "jssb":
			url = "${ctx}/jssb/zhupan.do";
			break;
		case "bjsc":
			url = "${ctx}/bjsc/zhupan.do";
			break;
		case "bjkl8":
			url = "${ctx}/bjkl8/xuanhao.do";
			break;
		case "lhc":
			url = "${ctx}/lhc/tbh.do";
			break;
		default:
			break;
		}
		if(url != ""){
			$("#frame_content").attr("src", url);
		}
	}
})

</script>

<jsp:include page="../common/footer.jsp"></jsp:include>


<jsp:include page="../common/showSg.jsp"></jsp:include>
<jsp:include page="../common/showGz.jsp"></jsp:include>

</body>
</html>