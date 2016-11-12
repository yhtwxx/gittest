<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GC</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
    <jsp:include page="../common/common_lang.jsp" />
    <style>
    html, body { margin: 0; width: 100%; height: 100%; overflow: hidden;}
    iframe { margin:0; width: 100%; height: 100%;}
    </style>
    <script type="text/javascript">
    function iframeHeight() {
    document.getElementById('iframeId').height="100%";
    }
    </script>
</head>

<body>
    <iframe id="iframeId" src="../livegame/index.html?sid=${SessionId}&location=GC&lang=${sessionScope.clientlanguage}" frameborder="0" scrolling="no"></iframe>
</body>

</html>