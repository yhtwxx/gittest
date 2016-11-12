<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <jsp:include page="../common/common_lang.jsp" />
    <!-- private js/css -->
</head>
<body>
<div style="height: 800px;">
	<img src="${ctx}/img/loading_mini.gif" style="position: absolute; top: 50%; left: 50%;">
</div>
<script type="text/javascript">
   $(document).ready(function () {
        $.ajax({
        	'url':"${ctx}/gclottery/gclotteryforward.do?location=${location}&timeStamp=" + new Date().getTime(),
       		type:"get",
       		dataType:'json',
       		success: function(b){
				if(b.code == 0){
				    window.location = b.url;
				}else{
					layer.msg(langpackage[b.code], {icon: 2});
				}
			}
        });
    });

</script>
</body>
</html>