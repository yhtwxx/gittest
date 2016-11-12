<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%--动态调用幻灯开始--%>
	<script type="text/javascript" src="${ctx }/js/page/tpl.js"></script>
    <script type="text/template" id="carouselTpl">
        <# for(var i=0; i<list.length; i++){
            var swfpath = list[i].picPath+"/"+list[i].picName;
        #>
            <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"
                WIDTH="100%" HEIGHT="100%" id="myMovieName">
            <PARAM NAME=movie VALUE="<#=swfpath#>">
            <PARAM NAME=quality VALUE=high>
            <EMBED src="<#=swfpath#>" quality=high bgcolor=#FFFFFF WIDTH="100%" HEIGHT="100%"
                NAME="myMovieName" ALIGN="" TYPE="application/x-shockwave-flash"
                PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer">
            </EMBED>
            </OBJECT>
        <#}#>
    </script>
    <script type="text/javascript">
        $(function(){
        	// 设置同步
    		$.ajaxSetup({
    			async : false
    		});
            var pictype = "1";
            $.ajax({'url':"picChange.do?picType="+pictype,
                type:"get",
                dataType:'json',
                success:
                function(b){
                    if(b.code==0){
                           var list = b.list;
                           if(list.length>0){
                               var html="";
                               var htmlfocus="";
                               if(pictype=="1"){
                                   for(var i=0;i<list.length;i++){
                                       html+="<li><a href="+list[i].url+" target='_self'><img src="+list[i].picPath+"/"+list[i].picName+" ></a></li>";
                                       if(i==0)
                                       	   htmlfocus += "<a href='javascript:void(0)' class='on'></a>";
                                       else{
                                    	   htmlfocus += "<a href='javascript:void(0)'></a>";
                                       }
                                   }
                                   $(".carousel ul").html(html);
                                   $(".carousel .focus").html(htmlfocus);
                               }else if(pictype=="3"){
                                   //这里显示flash
                                   var html =  tpl('#carouselTpl', b);
                                   $(".carousel ul").html(html);
                               }
                               
                           }
                    }
                }
             });
         	// 恢复异步
    		$.ajaxSetup({
    			async : true
    		});
        });
    </script>
    <%--动态调用幻灯结束--%>

<style>
	.carousel {width:100%; position:relative;height:460px;overflow:hidden;width:100%;min-width:1170px;background-color:#EEEEEE;}
	.carousel .show {width:2500px;position:absolute;left:50%;top:0px;margin-left:-1250px;height:460px;overflow:hidden;}
	.carousel .show ul {position:relative;height:460px;overflow:hidden;width:2500px;float:left;}
	.carousel .show ul li {text-align:center;width:2500px;float:left;height:460px;position:absolute;display:none}
	.carousel .focus {width:100px; margin:0 auto;padding-top:13px;height:42px;}
	.carousel .focus a {width:14px;height:14px;background:url(img/ico01.png) no-repeat left -24px;float:left;margin-left:10px;display:inline-block}
	.carousel .focus a.on {background:url(img/ico01.png) no-repeat left top}
	.carousel .wrapper {width:1170px;margin:0 auto;}
	.carousel .hot {width:100%;height:42px;line-height:42px;position:absolute;bottom:0;z-index:2;}
	.carousel .hot .list {float:left;width:860px;height:42px;float:left;}
</style>

<div class="carousel">
    <div class="show">
        <ul>
            <!-- <li><img src="images/carousel/banner1.jpg" /></li>
            <li><a href="#" target="_blank"><img src="images/carousel/banner2.jpg" /></a></li>
            <li><img src="images/carousel/banner3.jpg" /></li> -->
        </ul>
    </div>
    <div class="hot">
        <div class="wrapper">
            <div class="focus"> <!-- <a href="javascript:void(0)" class="on"></a> <a href="javascript:void(0)"></a> <a href="javascript:void(0)"></a> --> </div>
        </div>
    </div>
</div>

<script src="js/index.js"></script>