<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/liMarquee.css">
<style>
.marquee { width: 98%; margin: 17px auto; font-size: 12px; float:right;}
.marquee a { margin: 0 15px; color: #333; text-decoration: none;}
.marquee a:hover { text-decoration: underline;}
</style>

<div class="container-fluid padding-0 notice">
<div class="container">
<div class="marquee">
	<a href="#">暂无公告</a>
</div>
</div>
    </div>

<script src="js/jquery.liMarquee.js"></script>

<script type="text/javascript">
    $(document).ready(function() {

    	$.ajax({'url':"${ctx}/index/getRunMassage.do?timeStamp=" + new Date().getTime(),type:"get",dataType:'json',success:
            function(b){
	            if(b.code==0){
	               	var list = b.mesaages;
	               	if(list.length>0){
	               		var html="";
	               		for(var i=0;i<list.length;i++){
	               			html+=getMsgType(list[i].type)+list[i].message+"&nbsp;&nbsp;";
	               		}

	               		$(".marquee").html(html).liMarquee(); //输出html并滚动
	               	}
	            }
            }
         });

    });

    function getMsgType(obj){
    	if(obj=="g"){
    		return "【所有游戏】";
    	}else if(obj=="z"){
    		return "【直播游戏】";
    	}else if(obj=="t"){
    		return "【体育赛事】";
    	}else if(obj=="c"){
    		return "【彩票游戏】";
    	}else if(obj=="d"){
    		return "【电子游戏】";
    	}else if(obj=="a"){
    		return "【AG】";
    	}else{
    		return "";
    	}
    }
    </script>