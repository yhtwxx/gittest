<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>UG体育</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common.jsp" />
</head>

<body>

<!--头部-->
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="container padding-0">
    <iframe src="${ctx }/ug/page.do?gameid=1&webtype=PC" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" height=850 id="iframepage" name="iframepage" onLoad="iFrameHeight()" ></iframe>
    <script type="text/javascript" language="javascript">
        function iFrameHeight() {
            var ifm= document.getElementById("iframepage");
            var subWeb = document.frames ? document.frames["iframepage"].document :
                    ifm.contentDocument;
            if(ifm != null && subWeb != null) {
                ifm.height = subWeb.body.scrollHeight;
            }
        }
    </script>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>