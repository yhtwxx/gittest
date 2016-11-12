<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>GD</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <style>
        html, body { margin: 0; width: 100%; height: 100%;overflow: hidden;}
        iframe { margin:0; width: 100%; height: 100%;}
        </style>
        <script type="text/javascript">
    function iframeHeight() {
    document.getElementById('iframeId').height="100%";
    }
        </script>
        </head>

        <body>
<iframe src="${ctx}/gd/indexiframe.do" id="iframeId" frameborder="0" scrolling="no"></iframe>
        
        </body>
        </html>