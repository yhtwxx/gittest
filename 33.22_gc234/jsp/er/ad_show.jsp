<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>仿qq空间图片展示效果</title>
<link rel="stylesheet" type="text/css" href="web/er/css/styles.css">
<link rel="stylesheet" type="text/css" href="web/er/css/touchTouch.css">
<script type="text/javascript" src="web/er/js/jquery-1.11.3.min.js"></script>
<script src="web/er/js/touchTouch.jquery.js"></script>
<script>

$(function(){

	//图片事件,img-gather处为仿qq空间图片效果展示

	$('#thumbs a').touchTouch();

});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body>

    <!--content-->   	


        <!--img-gather-->

        <div class="clearfix img-gather" id="thumbs">
            <a href="web/er/images/1.png" style="background-image:url(web/er/images/1.png)" title="步骤一"></a>
            <a href="web/er/images/2.png" style="background-image:url(web/er/images/2.png)" title="步骤二"></a>
            <a href="web/er/images/3.png" style="background-image:url(web/er/images/3.png)" title="步骤三"></a>
            <a href="web/er/images/4.png" style="background-image:url(web/er/images/4.png)" title="步骤四"></a>
            <a href="web/er/images/5.png" style="background-image:url(web/er/images/5.png)" title="步骤五"></a>
            <a href="web/er/images/6.png" style="background-image:url(web/er/images/6.png)" title="步骤六"></a>
            <a href="web/er/images/7.png" style="background-image:url(web/er/images/7.png)" title="步骤七"></a>
            <a href="web/er/images/8.png" style="background-image:url(web/er/images/8.png)" title="步骤八"></a>
        </div>

        <!--img-gather end-->




</body>

</html>

