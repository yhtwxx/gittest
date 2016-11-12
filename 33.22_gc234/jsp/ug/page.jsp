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
    <jsp:include page="../common/common.jsp"/>
</head>

<body>

<form action="${returnUrl }" method="post" id="from1">

</form>
<script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="../js/lib/showBo.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var code =${code};
        if (code == 0) {
            $("#from1").submit();
        } else if (code == 70001) {
            Showbo.Msg.alert("UG体育登陆失败");
        } else {
            Showbo.Msg.alert(langpackage[b.code]);
        }
    });
</script>
</body>
</html>