<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>街机</title>
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
 <iframe src="${ctx}/jieji/wsgame.do?gameId=${gameId}" id="iframeId" frameborder="0" scrolling="no"></iframe>
        
</body>
</html>
