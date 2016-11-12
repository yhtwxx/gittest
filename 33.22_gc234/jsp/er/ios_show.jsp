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

            <a href="web/er/images/img1-large.png" style="background-image:url(web/er/images/img1-large.png)" title="图片一"></a>
            <a href="web/er/images/img1-large.png" style="background-image:url(web/er/images/img1-large.png)" title="图片一"></a>
            <a href="web/er/images/img1-large.png" style="background-image:url(web/er/images/img1-large.png)" title="图片一"></a>
            <a href="web/er/images/img1-large.png" style="background-image:url(web/er/images/img1-large.png)" title="图片一"></a>
            <a href="web/er/images/img1-large.png" style="background-image:url(web/er/images/img1-large.png)" title="图片一"></a>
            <a href="web/er/images/img1-large.png" style="background-image:url(web/er/images/img1-large.png)" title="图片一"></a>
            <a href="web/er/images/img1-large.png" style="background-image:url(web/er/images/img1-large.png)" title="图片一"></a>
            <a href="web/er/images/img1-large.png" style="background-image:url(web/er/images/img1-large.png)" title="图片一"></a>
            <a href="web/er/images/img1-large.png" style="background-image:url(web/er/images/img1-large.png)" title="图片一"></a>
            <a href="web/er/images/img1-large.png" style="background-image:url(web/er/images/img1-large.png)" title="图片一"></a>
           

        </div>

        <!--img-gather end-->




</body>

</html>

