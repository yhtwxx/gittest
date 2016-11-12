<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>街机</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- 引用公用头部文件（包含公用css和公用js） -->
    <jsp:include page="../common/common.jsp"/>
</head>

<body>

<!--  <form action="" method="post" id="from1">
      <input type="hidden" name="params" id="params"/>
      <input type="hidden" name="key" id="key"/>
 </form> -->
<script type="text/javascript">

    $(document).ready(function () {
        $.ajax({
            'url': "../jieji/tydforward.do?timeStamp=" + new Date().getTime(),
            type: "get",
            dataType: 'json',
            success: function (b) {
                if (b.code == 0) {
                    window.location = b.cashName;
                } else {
                    Showbo.Msg.alert("捕鱼达人登录失败！");
                    setTimeout(
                        function () {
                            window.close();
                        }, 1000
                    );
                }
            }
        });
    });
</script>
</body>
</html>