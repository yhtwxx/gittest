<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="shortcut icon" href="${ctx}/img/favicon.ico" type="image/x-icon" />

<!-- Bootstrap core CSS -->
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/css/bootstrap.min.add.css" rel="stylesheet">

<!--自定义公用css-->
<%-- <link href="${ctx}/css/common.css" rel="stylesheet"> --%>
<c:choose>
	<c:when test="${sessionScope.clientlanguage == 'en_US'}">
		<link rel="stylesheet" href="${ctx}/css/common.en_us.css" />
	</c:when>
	<c:when test="${sessionScope.clientlanguage == 'zh_CN'}">
		<link rel="stylesheet" href="${ctx}/css/common.css" />
	</c:when>
	<c:otherwise>
		<link rel="stylesheet" href="${ctx}/css/common.css" />
	</c:otherwise>
</c:choose>

<link rel="stylesheet" href="${ctx}/css/showBo.css" />

<!--公用js-->
<script type="text/javascript" src="${ctx}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx}/js/lib/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="${ctx}/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script type="text/javascript" src="${ctx}/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx}/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${ctx}/js/respond.min.js"></script>
<![endif]-->

<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>
<script src="${ctx}/js/lib/jquery.jmpopups-0.5.1.js" type="text/javascript"></script>
<script src="${ctx}/plugin/layer-v2.4/layer/layer.js"></script>
<c:choose>
	<c:when test="${sessionScope.clientlanguage == 'en_US'}">
		<script type="text/javascript" src="${ctx}/js/lang/en_us.js"></script>
	</c:when>
	<c:when test="${sessionScope.clientlanguage == 'zh_CN'}">
		<script type="text/javascript" src="${ctx}/js/lang/zh_cn.js"></script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript" src="${ctx}/js/lang/zh_cn.js"></script>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
var ctx = "${ctx}";
var clientlanguage = '${sessionScope.clientlanguage}';
</script>
<script src="${ctx}/js/common.js" type="text/javascript"></script>