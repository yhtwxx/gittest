<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AG</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
    <style>
    html, body { margin: 0; width: 100%; height: 100%;}
    iframe { margin:0; width: 100%; height: 100%;}
    </style>
    <script type="text/javascript">
    function iframeHeight() {
    document.getElementById('iframeId').height="100%";
    }
    </script>
</head>

<body>

    <iframe src="${ctx}/live/agamecw.do" id="iframeId" frameborder="0" scrolling="no"></iframe>
    
	<script type="text/javascript">
	
	$(document).ready(function () {
		window.setInterval(function() {
            $.ajax({url: "../agame/foragsession.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(bb) {
                   
                }})
        }, 60000);
	}); 
	</script>

</body>
</html>