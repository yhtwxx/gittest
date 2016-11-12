<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>黄金世纪</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
    <!--本页css-->
    <link href="css/index.css" rel="stylesheet">
    <!--本页js-->
    <script type="text/javascript" src="${ctx}/plugin/layer/layer.js"></script>
</head>

<body>

    <!--头部-->
    <jsp:include page="../common/header.jsp"></jsp:include>

    <!--幻灯插件开始-->
    <jsp:include page="../common/carousel.jsp"></jsp:include>

    <!--公告插件开始-->
    <jsp:include page="../common/marquee.jsp"></jsp:include>

    <!--注册成功后跳转处理-->
    <jsp:include page="../common/reg-ok.jsp"></jsp:include>

    <!--轮播插件开始-->
    <link rel="stylesheet" href="plugin/owl.carousel.css">

    <div class="owl-carousel">
        <div><a href="#" onclick="isSession(this,'${ctx}/live/index.do','1','GC')"> <img src="img/ZoomPic/GC-VIP.png"/></a></div>
        <div><a href="#" onclick="isSession(this,'${ctx}/live/indexgj.do','1','GC')"> <img src="img/ZoomPic/GC-LIVE.png"/></a></div>
        <div><a href="#" onclick="isSession(this,'${ctx}/live/agindex.do','1')"> <img src="img/ZoomPic/AG.png"/></a></div>
        <div><a href="#" onclick="isSession(this,'${ctx}/game/ptindex.do','0')"> <img src="img/ZoomPic/PT-DZ.png"/></a></div>
        <div><a href="#" onclick="isSession(this,'${ctx}/game/ptzrindex.do','1')"> <img src="img/ZoomPic/PT-XC.png"/></a></div>
        <div><a href="#" onclick="isSession(this,'${ctx}/ssc/index-iframe.do','0')"> <img src="img/ZoomPic/SSC.png"/></a></div>
        <div><a href="#" onclick="isSession(this,'${ctx}/football/index.do','0')"> <img src="img/ZoomPic/SPORT.png"/></a></div>
    </div>
    <script type="text/javascript" src="plugin/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="plugin/owl.carousel.js"></script>
    <script>
        var owl = $('.owl-carousel');
        owl.owlCarousel({
            items:4,
            loop:true,
            margin:10,
            autoplay:true,
            autoplayTimeout:1000,
            autoplayHoverPause:true
        });

    </script>


    <!--//原先的轮播图-->
    <!--<link rel="stylesheet" type="text/css" href="plugin/ZoomPic.css">-->
    <!--<script type="text/javascript" src="plugin/ZoomPic.js"></script>-->
    <!--<script type="text/javascript">-->
        <!--$(function(){-->

            <!--new ZoomPic("jswbox");-->
        <!--})-->
    <!--</script>-->

    <!--<div class="container popular" id="jswbox">-->
        <!--<pre class="prev">prev</pre>-->
        <!--<pre class="next">next</pre>-->
        <!--<ul>-->
            <!--<li><a href="#" onclick="isSession(this,'${ctx}/live/index.do','1','GC')"> <img src="img/ZoomPic/GC-VIP.png"/></a></li>-->
            <!--<li><a href="#" onclick="isSession(this,'${ctx}/live/indexgj.do','1','GC')"> <img src="img/ZoomPic/GC-LIVE.png"/></a></li>-->
            <!--<li><a href="#" onclick="isSession(this,'${ctx}/live/agindex.do','1')"> <img src="img/ZoomPic/AG.png"/></a></li>-->
            <!--<li><a href="#" onclick="isSession(this,'${ctx}/game/ptindex.do','0')"> <img src="img/ZoomPic/PT-DZ.png"/></a></li>-->
            <!--<li><a href="#" onclick="isSession(this,'${ctx}/game/ptzrindex.do','1')"> <img src="img/ZoomPic/PT-XC.png"/></a></li>-->
            <!--<li><a href="#" onclick="isSession(this,'${ctx}/ssc/index-iframe.do','0')"> <img src="img/ZoomPic/SSC.png"/></a></li>-->
            <!--<li><a href="#" onclick="isSession(this,'${ctx}/football/index.do','0')"> <img src="img/ZoomPic/SPORT.png"/></a></li>-->
        <!--</ul>-->
    <!--</div>-->

    <div class="container padding-0">
        <img class="img-responsive" src="img/process.png">
    </div>

    <div class="container padding-0" style="margin-top: 20px">
        <div class="row margin-0">
            <div class="col-md-5 padding-0">
                <img src="img/index-info-l.png">
            </div>
            <div class="col-md-7 padding-0" style="padding-left:62px;">
                <img src="img/index-info-r.png">
            </div>
        </div>
    </div>

    <div class="container padding-0" style="margin-bottom:30px;">
        <img class="img-responsive center-block" src="img/brand.png">
    </div>

    <!--尾部-->
    <jsp:include page="../common/footer.jsp"></jsp:include>

<%--加载首页弹出层，用于活动，部分客户需要 - by timi
<div id="index-tan">这里是内容</div>
<script>
//页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
layer.ready(function(){
    //官网欢迎页
    layer.open({
        type: 1,
        //skin: 'layui-layer-lan',
        title: '欢迎光临GC234',
        fix: false,
        shadeClose: false,
        maxmin: false,
        area: ['1000px', '500px'],
        content: $('#index-tan'),
    });
});
</script>--%>

</body>
</html>