<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/css/sport/mem_header_ft_cn.css" type="text/css">
<SCRIPT language="JavaScript" src="${ctx}/js/sport/football/header.js"></SCRIPT>
<title>头部导航</title>
</head>
<body id="H${gtype}" class="bodyset" onLoad="SetRB('${gtype}');onloaded();">
<div id="container">
  	<div id="header"><span><h1></h1></span></div>
	<!--足球帮助-->
	<div id="topMenu">
			<ul id="back">
				<li class="help" onmouseover="OnMouseOverEvent();"><a href="javascript:void(0)" style="cursor:hand">帮助</a><span></span></li>
				<!--li class="exit" onMouseOver="OnMouseOutEvent()"><a href="http://www.ks1381.com/app/member/logout.php?uid=6dd399f0e15e41f083ded&langx=zh-cn" target="_top">退出</a></li-->
			</ul>
			<div class="info" id="informaction" onmouseover="OnMouseOverEvent()" style="display: none;">
				<ul id="mose" onmouseout="OnMouseOutEvent();">
					<li class="help_on"><a href="javascript:void(0)">帮助</a></li>
					<!--li class="msg"><a href="javascript:void(0)" onclick="parent.mem_order.showMoreMsg();">&nbsp; 公告栏</a></li-->
					<li class="roul"><a href="javascript:void(0)" onclick="winOpen('${ctx}/web/football/QA_sport.html',805,674,null,null,'规则说明')">&nbsp; 规则说明</a></li>
					<!--li class="uImfo"><a href="javascript:void(0)" onclick="winOpen('${ctx}/web/football/member/account/mem_data.php?uid=6dd399f0e15e41f083ded&amp;langx=zh-cn',606,655,null,null,'会员资料')">&nbsp; 会员资料</a></li-->
					<li class="odd"><a href="javascript:void(0)" onclick="winOpen('${ctx}/web/football/QA_way.html',620,602,null,null,'盘口使用方法')">&nbsp; 盘口使用方法</a></li>
				</ul>
			</div>
	</div>
  	<div id="welcome">
		<ul class="level1">
      		<!--会员帐号-->
      		<li class="name">
      			<div id="head_date" style="">
      			<!-- <span id="head_year">2015</span>年<span id="head_month">4</span>月<span id="head_day">27</span>日 <span id="head_hour">02</span>:<span id="head_min">03</span>
      			 --></div>
      		</li>
			<!-- 滚球Menu Start -->
			<li class="rb" id="rb_btn"><span id="rbType"></span>
			    <c:choose>
			    <c:when test="${gtype=='FT' }">
			    <a href="#" onclick="chg_head('FT_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2'); chg_button_bg('FT','rb');" id="rbyshow" style="display:;">滚球</a>	        	     
     	 		</c:when>
     	 		 <c:when test="${gtype=='BK' }">
			    <a href="#" onclick="chg_head('BK_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.BK_lid_type,'SI2'); chg_button_bg('BK','rb');" id="rbyshow" style="display:;">滚球</a>	        	     
     	 		</c:when>
     	 		 <c:when test="${gtype=='TN' }">
			    <a href="#" onclick="chg_head('TN_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.TN_lid_type,'SI2'); chg_button_bg('TN','rb');" id="rbyshow" style="display:;">滚球</a>	        	     
     	 		</c:when>
     	 		 <c:when test="${gtype=='VB' }">
			    <a href="#" onclick="chg_head('VB_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.VB_lid_type,'SI2'); chg_button_bg('VB','rb');" id="rbyshow" style="display:;">滚球</a>	        	     
     	 		</c:when>
     	 		 <c:when test="${gtype=='BM' }">
			    <a href="#" onclick="chg_head('BM_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.BM_lid_type,'SI2'); chg_button_bg('BM','rb');" id="rbyshow" style="display:;">滚球</a>	        	     
     	 		</c:when>
     	 		 <c:when test="${gtype=='TT' }">
			    <a href="#" onclick="chg_head('TT_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.TT_lid_type,'SI2'); chg_button_bg('TT','rb');" id="rbyshow" style="display:;">滚球</a>	        	     
     	 		</c:when>
     	 		
			    <c:otherwise>
			    <a href="#" onclick="chg_head('FT_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2'); chg_button_bg('FT','rb');" id="rbyshow" style="display:;">滚球</a>	        	     
     	 		</c:otherwise>
			    </c:choose>
				</li>
     	 	<!-- 滚球Menu End--> 
      		<li class="today_on" id="today_btn"><span id="todayType" style="display:none;">今日赛事</span>
      			 <c:choose>
			    <c:when test="${gtype=='FT' }">
			    <a href="#" onclick="chg_head('FT_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2');chg_button_bg('FT','today');" id="todayshow" style="display:;">今日赛事</a>
      			</c:when>
      			<c:when test="${gtype=='BK' }">
			    <a href="#" onclick="chg_head('BK_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.BK_lid_type,'SI2');chg_button_bg('BK','today');" id="todayshow" style="display:;">今日赛事</a>
      			</c:when>
      			<c:when test="${gtype=='TN' }">
			    <a href="#" onclick="chg_head('TN_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.TN_lid_type,'SI2');chg_button_bg('TN','today');" id="todayshow" style="display:;">今日赛事</a>
      			</c:when>
      			<c:when test="${gtype=='VB' }">
			    <a href="#" onclick="chg_head('VB_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.VB_lid_type,'SI2');chg_button_bg('VB','today');" id="todayshow" style="display:;">今日赛事</a>
      			</c:when>
      			<c:when test="${gtype=='BM' }">
			    <a href="#" onclick="chg_head('BM_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.BM_lid_type,'SI2');chg_button_bg('BM','today');" id="todayshow" style="display:;">今日赛事</a>
      			</c:when>
      			<c:when test="${gtype=='TT' }">
			    <a href="#" onclick="chg_head('TT_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.TT_lid_type,'SI2');chg_button_bg('TT','today');" id="todayshow" style="display:;">今日赛事</a>
      			</c:when>
      			
			    <c:otherwise>
			    <a href="#" onclick="chg_head('FT_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2');chg_button_bg('FT','today');" id="todayshow" style="display:;">今日赛事</a>
      			</c:otherwise>
			    </c:choose>
      				</li>  
      				
      				
      		  
      		<%-- <li class="early" id="early_btn"><span id="earlyType" style="display:none;">早盘</span>
      			
      			<c:choose>
			    <c:when test="${gtype=='FT' }">
			    <a href="#" onclick="javascript:chg_button_bg('FT','early');chg_index_head('header.do?showtype=future&langx=zh-cn&mtype=3gtype=FT','FT_browse/future.do?rtype=ft_r&showtype=future&langx=zh-cn&mtype=3',parent.FU_lid_type,'SI2','future');" id="earlyshow" style="display:;cursor:hand;">早盘|${gtype}</a>
      			</c:when>
      			<c:when test="${gtype=='BK' }">
			    <a href="#" onclick="javascript:chg_button_bg('BK','early');chg_index_head('header.do?showtype=future&langx=zh-cn&mtype=3gtype=BK','BK_browse/future.do?rtype=ft_r&showtype=future&langx=zh-cn&mtype=3',parent.BU_lid_type,'SI2','future');" id="earlyshow" style="display:;cursor:hand;">早盘|${gtype}</a>
      			</c:when>
      			<c:when test="${gtype=='TN' }">
      			
			   <a href="#" onclick="javascript:chg_button_bg('TN','early');chg_index_head('header.do?showtype=future&langx=zh-cn&mtype=3gtype=TN','TN_browse/future.do?rtype=ft_r&showtype=future&langx=zh-cn&mtype=3',parent.TU_lid_type,'SI2','future');" id="earlyshow" style="display:;cursor:hand;">早盘|${gtype}</a>
      			 </c:when>
      			<c:when test="${gtype=='VB' }">
			    <a href="#" onclick="javascript:chg_button_bg('VB','early');chg_index_head('header.do?showtype=future&langx=zh-cn&mtype=3&gtype=VB','VB_browse/future.do?rtype=ft_r&showtype=future&langx=zh-cn&mtype=3',parent.VU_lid_type,'SI2','future');" id="earlyshow" style="display:;cursor:hand;">早盘|${gtype}</a>
      			</c:when>
      			<c:when test="${gtype=='BM' }">
			    <a href="#" onclick="javascript:chg_button_bg('BM','early');chg_index_head('header.do?showtype=future&langx=zh-cn&mtype=3gtype=BM','BM_browse/future.do?rtype=ft_r&showtype=future&langx=zh-cn&mtype=3',parent.BM_lid_type,'SI2','future');" id="earlyshow" style="display:;cursor:hand;">早盘|${gtype}</a>
      			</c:when>
      			<c:when test="${gtype=='TT' }">
			    <a href="#" onclick="javascript:chg_button_bg('TT','early');chg_index_head('header.do?showtype=future&langx=zh-cn&mtype=3gtype=TT','TT_browse/future.do?rtype=ft_r&showtype=future&langx=zh-cn&mtype=3',parent.TT_lid_type,'SI2','future');" id="earlyshow" style="display:;cursor:hand;">早盘|${gtype}</a>
      			</c:when>
			    <c:otherwise>
			    <a href="#" onclick="javascript:chg_button_bg('FT','early');chg_index_head('header.do?showtype=future&langx=zh-cn&mtype=3gtype=FT','FT_browse/future.do?rtype=ft_r&showtype=future&langx=zh-cn&mtype=3',parent.FU_lid_type,'SI2','future');" id="earlyshow" style="display:;cursor:hand;">早盘|${gtype}</a>
      			</c:otherwise>
			    </c:choose>
      		</li>     --%>
      		
      		
      		<li class="early" id="early_btn"><span id="earlyType" style="display:none;">早盘</span>
      			
      			<c:choose>
			    <c:when test="${gtype=='FT' }">
			    <a href="#" onclick="javascript:chg_button_bg('FT','early');chg_head('FT_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.FT_lid_type,'SI2');" id="earlyshow" style="display:;">早盘</a>
    			</c:when>
      			<c:when test="${gtype=='BK' }">
			    <a href="#" onclick="javascript:chg_button_bg('BK','early');chg_head('BK_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.BK_lid_type,'SI2');" id="earlyshow" style="display:;">早盘</a>
      			</c:when>
      			<c:when test="${gtype=='TN' }">
			   <a href="#" onclick="javascript:chg_button_bg('TN','early');chg_head('TN_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.TN_lid_type,'SI2');" id="earlyshow" style="display:;">早盘</a>
      		    </c:when>
      			<c:when test="${gtype=='VB' }">
			    <a href="#" onclick="javascript:chg_button_bg('VB','early');chg_head('VB_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.VB_lid_type,'SI2');" id="earlyshow" style="display:;">早盘</a>
      		   </c:when>
      			<c:when test="${gtype=='BM' }">
			    <a href="#" onclick="javascript:chg_button_bg('BM','early');chg_head('BM_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.BM_lid_type,'SI2');" id="earlyshow" style="display:;">早盘</a>
      		   </c:when>
      			<c:when test="${gtype=='TT' }">
			    <a href="#" onclick="javascript:chg_button_bg('TT','early');chg_head('TT_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.TT_lid_type,'SI2');" id="earlyshow" style="display:;">早盘</a>
      		    </c:when>
			    <c:otherwise>
			    <a href="#" onclick="javascript:chg_button_bg('TN','early');chg_head('TN_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.FT_lid_type,'SI2');" id="earlyshow" style="display:;">早盘</a>
      		   </c:otherwise>
			    </c:choose>
      		</li>    
      		
      		
      		
      			
	      			      			
		</ul>
  	</div>
	<!-- Today Menu Start -->
  	<div id="nav">  		
    	<ul class="level1">
    	  <li class="ft"><span class="ball"><a href="javascript:chg_button_bg('FT','today');chg_index('header.do?showtype=browse&langx=zh-cn&mtype=3&gtype=FT','FT_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2');">足球(<strong class="game_sum" id="FT_games"></strong>)</a></span></li>
    	  <li class="bk"><span class="ball"><a href="javascript:chg_button_bg('BK','today');chg_index('header.do?showtype=browse&langx=zh-cn&mtype=3&gtype=BK','BK_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.BK_lid_type,'SI2');">篮球 <span class="ball_nf"><img src="${ctx}/img/sport/head_ball_nf.gif"  class="nf_icon" border="0"></span>美式足球 <span style="display:inline-block;vertical-align: text-bottom; margin:0 4px; width:16px; height:17px;background: url(${ctx}/img/sport/head_ball_rl.gif) no-repeat 0 4px;"><img src="${ctx}/img/sport/head_ball_rl.gif"  border="0"></span>橄榄球(<strong class="game_sum" id="BK_games"></strong>)</a></span></li>
    	  <li class="tn"><span class="ball"><a href="javascript:chg_button_bg('TN','today');chg_index('header.do?showtype=browse&langx=zh-cn&mtype=3&gtype=TN','TN_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.TN_lid_type,'SI2');">网球(<strong class="game_sum" id="TN_games"></strong>)</a></span></li>
    	  <li class="vb"><span class="ball"><a href="javascript:chg_button_bg('VB','today');chg_index('header.do?showtype=browse&langx=zh-cn&mtype=3&gtype=VB','VB_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.VB_lid_type,'SI2');">排球(<strong class="game_sum" id="VB_games"></strong>)</a></span></li>
    	  <li class="bm"><span class="ball"><a href="javascript:chg_button_bg('BM','today');chg_index('header.do?showtype=browse&langx=zh-cn&mtype=3&gtype=BM','BM_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.BM_lid_type,'SI2');">羽毛球(<strong class="game_sum" id="BM_games"></strong>)</a></span></li>
    	  <li class="tt"><span class="ball"><a href="javascript:chg_button_bg('TT','today');chg_index('header.do?showtype=browse&langx=zh-cn&mtype=3&gtype=TT','TT_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.TT_lid_type,'SI2');">乒乓球(<strong class="game_sum" id="TT_games"></strong>)</a></span></li>
    	  <li class="bs" style="display:none"><span class="ball"><a href="javascript:chg_button_bg('BS','today');chg_index('header.do?showtype=browse&langx=zh-cn&mtype=3&gtype=BS','BS_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.BS_lid_type,'SI2');">棒球(<strong class="game_sum" id="BS_games"></strong>)</a></span></li>
   	  	  <li class="op" style="display:none"><span class="ball"><a href="javascript:chg_button_bg('OP','today');chg_index('header.do?showtype=browse&langx=zh-cn&mtype=3&gtype=OP','OP_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.OP_lid_type,'SI2');">其他(<strong class="game_sum" id="OP_games"></strong>)</a></span></li>	
     	
     </ul>    	
  	</div>
  	<div id="type">  		
		<c:choose>
   		<c:when test="${gtype == 'FT'}">
   		<!-- 足球 -->
    	<ul>    			   
	      	<li class="re"><a id="re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('FT','today');chg_type('FT_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让球 ＆ 大小 ＆ 单 / 双</a></li>
	      	<li class="pd"><a id="pd_class" class="type_out" href="javascript:void(0);" onclick="chg_button_bg('FT','today');chg_type('FT_browse/index.do?rtype=pd&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2');chg_type_class('pd_class');">波胆</a></li>
	      	<li class="to"><a id="to_class" class="type_out" href="javascript:void(0);" onclick="chg_button_bg('FT','today');chg_type('FT_browse/index.do?rtype=t&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2');chg_type_class('to_class');">总入球</a></li>
	      	<li class="hf"><a id="hf_class" class="type_out" href="javascript:void(0);" onclick="chg_button_bg('FT','today');chg_type('FT_browse/index.do?rtype=f&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2');chg_type_class('hf_class');">半场 / 全场</a></li>
 	      	<li class="hp3"><a id="hp3_class" class="type_out" href="FT_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse" target="body" onclick="chg_button_bg('FT','today');chg_type_class('hp3_class');">综合过关</a></li>
		  	<!--<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=FT&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="FT_browse/result.do" target="body" onclick="chg_button_bg('FT','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>    	
    	</c:when>
    	<c:when test="${gtype == 'BK'}">
    	<!-- 篮球 -->
    	<ul>    			   
	      	<li class="re"><a id="re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('BK','today');chg_type('BK_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.BK_lid_type,'SI2');chg_type_class('re_class');">独赢 盘＆ 让球 ＆ 大小 </a></li>
 	      	<li class="hp3"><a id="hp3_class" class="type_out" href="BK_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse&g_date=T" target="body" onclick="chg_button_bg('BK','today');chg_type_class('hp3_class');">综合过关</a></li>
		  	<!--<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=FT&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=FT&langx=zh-cn" target="body" onclick="chg_button_bg('BK','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'TN'}">
    	<!-- 网球 -->
    	<ul>    			   
	      	<li class="re"><a id="re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('TN','today');chg_type('TN_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.TN_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让盘 ＆ 大小 </a></li>
 	      	<li class="hp3"><a id="hp3_class" class="type_out" href="TN_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse&g_date=T" target="body" onclick="chg_button_bg('TN','today');chg_type_class('hp3_class');">综合过关</a></li>
		  	<!--<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=TN&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=TN&langx=zh-cn" target="body" onclick="chg_button_bg('TN','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'VB'}">
    	<!-- 排球 -->
    	<ul>    			   
	      	<li class="re"><a id="re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('VB','today');chg_type('VB_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.VB_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让分 ＆ 大小 ＆ 单 / 双</a></li>
	      <!-- 	<li class="pd"><a id="pd_class" class="type_out" href="javascript:void(0);" onclick="chg_button_bg('VB','today');chg_type('VB_browse/index.do?rtype=pd&langx=zh-cn&mtype=3&showtype=browse',parent.VB_lid_type,'SI2');chg_type_class('pd_class');">赛盘投注</a></li>	      		       -->
	      	<li class="hp3"><a id="hp3_class" class="type_out" href="VB_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse&g_date=T" target="body" onclick="chg_button_bg('VB','today');chg_type_class('hp3_class');">综合过关</a></li>
		  <!-- 	<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=VB&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=VB&langx=zh-cn" target="body" onclick="chg_button_bg('VB','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'BM'}">
    	<!-- 羽毛球 -->
    	<ul>    			   
	      	<li class="re"><a id="re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('BM','today');chg_type('BM_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.BM_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让局 ＆ 大小</a></li>
 	      	<li class="hp3"><a id="hp3_class" class="type_out" href="BM_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse&g_date=T" target="body" onclick="chg_button_bg('BM','today');chg_type_class('hp3_class');">综合过关</a></li>
		  	<!--<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=FT&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=FT&langx=zh-cn" target="body" onclick="chg_button_bg('FT','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'TT'}">
    	<!-- 乒乓球 -->
    	<ul>    			   
	      	<li class="re"><a id="re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('TT','today');chg_type('TT_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.TT_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让局 ＆ 大小 </a></li>	      	
 	      	<li class="hp3"><a id="hp3_class" class="type_out" href="TT_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse&g_date=T" target="body" onclick="chg_button_bg('TT','today');chg_type_class('hp3_class');">综合过关</a></li>
		  	<!--<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=TT&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=TT&langx=zh-cn" target="body" onclick="chg_button_bg('TT','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'BS'}">
    	<!-- 棒球 -->
    	<ul>    			   
	      	<li class="re"><a id="re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('BS','today');chg_type('BS_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.BS_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让分 ＆ 大小 ＆ 单 / 双</a></li>
<!-- 	      	<li class="hp3"><a id="hp3_class" class="type_out" href="BS_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse" target="body" onclick="chg_button_bg('BS','today');chg_type_class('hp3_class');">综合过关</a></li>
		  	<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=BS&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=BS&langx=zh-cn" target="body" onclick="chg_button_bg('BS','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'OP'}">
    	<!-- 其他 -->
    	<ul>    			   
	      	<li class="re"><a id="re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('OP','today');chg_type('OP_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=browse',parent.OP_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让球 ＆ 大小 ＆ 单 / 双</a></li>
<!-- 	      	<li class="hp3"><a id="hp3_class" class="type_out" href="OP_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse" target="body" onclick="chg_button_bg('OP','today');chg_type_class('hp3_class');">综合过关</a></li>
		  	<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=OP&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=OP&langx=zh-cn" target="body" onclick="chg_button_bg('OP','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
		</c:choose>
	</div>
	<!-- Today Menu end -->
	<!-- zao pan Menu Start -->
  	<div id="nav_early"  style="display:none">  		
    	<ul class="level1">
    	  <li class="ft"><span class="ball"><a href="javascript:chg_button_bg('FT','early');chg_index('header.do?showtype=future&langx=zh-cn&mtype=3&gtype=FT','FT_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.FT_lid_type,'SI2');">足球(<strong class="game_sum" id="FT_games_r"></strong>)</a></span></li>
    	  <li class="bk"><span class="ball"><a href="javascript:chg_button_bg('BK','early');chg_index('header.do?showtype=future&langx=zh-cn&mtype=3&gtype=BK','BK_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.BK_lid_type,'SI2');">篮球 <span class="ball_nf"><img src="${ctx}/img/sport/head_ball_nf.gif"  class="nf_icon" border="0"></span>美式足球 <span style="display:inline-block;vertical-align: text-bottom; margin:0 4px; width:16px; height:17px;background: url(${ctx}/img/sport/head_ball_rl.gif) no-repeat 0 4px;"><img src="${ctx}/img/sport/head_ball_rl.gif"  border="0"></span>橄榄球(<strong class="game_sum" id="BK_games_r"></strong>)</a></span></li>
    	  <li class="tn"><span class="ball"><a href="javascript:chg_button_bg('TN','early');chg_index('header.do?showtype=future&langx=zh-cn&mtype=3&gtype=TN','TN_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.TN_lid_type,'SI2');">网球(<strong class="game_sum" id="TN_games_r"></strong>)</a></span></li>
    	  <li class="vb"><span class="ball"><a href="javascript:chg_button_bg('VB','early');chg_index('header.do?showtype=future&langx=zh-cn&mtype=3&gtype=VB','VB_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.VB_lid_type,'SI2');">排球(<strong class="game_sum" id="VB_games_r"></strong>)</a></span></li>
    	  <li class="bm"><span class="ball"><a href="javascript:chg_button_bg('BM','early');chg_index('header.do?showtype=future&langx=zh-cn&mtype=3&gtype=BM','BM_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.BM_lid_type,'SI2');">羽毛球(<strong class="game_sum" id="BM_games_r"></strong>)</a></span></li>
    	  <li class="tt"><span class="ball"><a href="javascript:chg_button_bg('TT','early');chg_index('header.do?showtype=future&langx=zh-cn&mtype=3&gtype=TT','TT_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.TT_lid_type,'SI2');">乒乓球(<strong class="game_sum" id="TT_games_r"></strong>)</a></span></li>
    	 <li class="bs" style="display:none"><span class="ball"><a href="javascript:chg_button_bg('BS','early');chg_index('header.do?showtype=future&langx=zh-cn&mtype=3&gtype=BS','BS_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.BS_lid_type,'SI2');">棒球(<strong class="game_sum" id="BS_games_r"></strong>)</a></span></li>
   	  	  <li class="op" style="display:none"><span class="ball"><a href="javascript:chg_button_bg('OP','early');chg_index('header.do?showtype=future&langx=zh-cn&mtype=3&gtype=OP','OP_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.OP_lid_type,'SI2');">其他(<strong class="game_sum" id="OP_games_r"></strong>)</a></span></li>	
    	 </ul>
  	</div>
  	<div id="type_early"  style="display:none">
		<c:choose>
   		<c:when test="${gtype == 'FT'}">
   		<!-- 足球 -->
    	<ul>    			   
	      	<li class="re"><a id="ft_re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('FT','early');chg_type('FT_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.FT_lid_type,'SI2');chg_type_class('ft_re_class');">独赢 ＆ 让球 ＆ 大小 ＆ 单 / 双</a></li>
	      	<li class="pd"><a id="ft_pd_class" class="type_out" href="javascript:void(0);" onclick="chg_button_bg('FT','early');chg_type('FT_browse/future.do?rtype=ft_pd&langx=zh-cn&mtype=3&showtype=future',parent.FT_lid_type,'SI2');chg_type_class('ft_pd_class');">波胆</a></li>
	      	<li class="to"><a id="ft_to_class" class="type_out" href="javascript:void(0);" onclick="chg_button_bg('FT','early');chg_type('FT_browse/future.do?rtype=ft_t&langx=zh-cn&mtype=3&showtype=future',parent.FT_lid_type,'SI2');chg_type_class('ft_to_class');">总入球</a></li>
	      	<li class="hf"><a id="ft_hf_class" class="type_out" href="javascript:void(0);" onclick="chg_button_bg('FT','early');chg_type('FT_browse/future.do?rtype=ft_f&langx=zh-cn&mtype=3&showtype=future',parent.FT_lid_type,'SI2');chg_type_class('ft_hf_class');">半场 / 全场</a></li>
 	      	<li class="hp3"><a id="ft_hp3_class" class="type_out" href="FT_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse" target="body" onclick="chg_button_bg('FT','early');chg_type_class('ft_hp3_class');">综合过关</a></li>
		  	<!--<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=FT&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>-->
	      	<li class="result"><a id="result_class" class="type_out" href="FT_browse/result.do" target="body" onclick="chg_button_bg('FT','today');chg_type_class('result_class');">赛果</a></li>
    	</ul>    	
    	</c:when>
    	<c:when test="${gtype == 'BK'}">
    	<!-- 篮球 -->
    	<ul>    			   
	      	<li class="re"><a id="bk_re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('BK','early');chg_type('BK_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.BK_lid_type,'SI2');chg_type_class('ft_re_class');">独赢 盘＆ 让球 ＆ 大小 </a></li>
	      	<li class="hp3"><a id="bk_hp3_class" class="type_out" href="BK_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse" target="body" onclick="chg_button_bg('BK','early');chg_type_class('bk_hp3_class');">综合过关</a></li>
		  	<!-- <li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=FT&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=FT&langx=zh-cn" target="body" onclick="chg_button_bg('BK','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'TN'}">
    	<!-- 网球 -->
    	<ul>    			   
	      	<li class="re"><a id="tn_re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('TN','early');chg_type('TN_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.TN_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让盘 ＆ 大小 </a></li>
 	      	<li class="hp3"><a id="tn_hp3_class" class="type_out" href="TN_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse" target="body" onclick="chg_button_bg('TN','early');chg_type_class('tn_hp3_class');">综合过关</a></li>
		  	<!--<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=TN&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=TN&langx=zh-cn" target="body" onclick="chg_button_bg('TN','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'VB'}">
    	<!-- 排球 -->
    	<ul>    			   
	      	<li class="re"><a id="vb_re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('VB','early');chg_type('VB_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.VB_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让分 ＆ 大小 ＆ 单 / 双</a></li>
	      	<!-- <li class="pd"><a id="pd_class" class="type_out" href="javascript:void(0);" onclick="chg_button_bg('VB','early');chg_type('VB_browse/index.do?rtype=pd&langx=zh-cn&mtype=3&showtype=future',parent.VB_lid_type,'SI2');chg_type_class('pd_class');">赛盘投注</a></li>	      		       -->
 	      	<li class="hp3"><a id="vb_hp3_class" class="type_out" href="VB_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse" target="body" onclick="chg_button_bg('VB','early');chg_type_class('vb_hp3_class');">综合过关</a></li>
		  	<!--<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=VB&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=VB&langx=zh-cn" target="body" onclick="chg_button_bg('VB','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'BM'}">
    	<!-- 羽毛球 -->
    	<ul>    			   
	      	<li class="re"><a id="bm_re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('BM','early');chg_type('BM_browse/future.do?rtype=ft_r&langx=zh-cn&mtype=3&showtype=future',parent.BM_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让局 ＆ 大小</a></li>
 	      	<li class="hp3"><a id="bm_hp3_class" class="type_out" href="BM_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse" target="body" onclick="chg_button_bg('BM','early');chg_type_class('bm_hp3_class');">综合过关</a></li>
		  	<!--<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=FT&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=FT&langx=zh-cn" target="body" onclick="chg_button_bg('FT','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'TT'}">
    	<!-- 乒乓球 -->
    	<ul>    			   
	      	<li class="re"><a id="re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('TT','early');chg_type('TT_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=future',parent.TT_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让局 ＆ 大小 </a></li>	      	
 	      	<li class="hp3"><a id="tt_hp3_class" class="type_out" href="TT_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse" target="body" onclick="chg_button_bg('TT','early');chg_type_class('tt_hp3_class');">综合过关</a></li>
		  	<!--<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=TT&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=TT&langx=zh-cn" target="body" onclick="chg_button_bg('TT','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'BS'}">
    	<!-- 棒球 -->
    	<ul>    			   
	      	<li class="re"><a id="re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('BS','early');chg_type('BS_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=future',parent.BS_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让分 ＆ 大小 ＆ 单 / 双</a></li>
<!-- 	      	<li class="hp3"><a id="hp3_class" class="type_out" href="BS_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse" target="body" onclick="chg_button_bg('BS','today');chg_type_class('hp3_class');">综合过关</a></li>
		  	<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=BS&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=BS&langx=zh-cn" target="body" onclick="chg_button_bg('BS','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'OP'}">
    	<!-- 其他 -->
    	<ul>    			   
	      	<li class="re"><a id="re_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('OP','early');chg_type('OP_browse/index.do?rtype=r&langx=zh-cn&mtype=3&showtype=future',parent.OP_lid_type,'SI2');chg_type_class('re_class');">独赢 ＆ 让球 ＆ 大小 ＆ 单 / 双</a></li>
<!-- 	      	<li class="hp3"><a id="hp3_class" class="type_out" href="OP_browse/index.do?rtype=p3&langx=zh-cn&mtype=3&showtype=browse" target="body" onclick="chg_button_bg('OP','today');chg_type_class('hp3_class');">综合过关</a></li>
		  	<li class="fs"><a id="fs_class" class="type_out" href="browse_FS/loadgame_R.do?langx=zh-cn&FStype=OP&mtype=3" onclick="chg_button_bg('BK','today');parent.sel_league='';parent.sel_area='';chg_type_class('fs_class');" target="body">冠军</a></li>
	      	<li class="result"><a id="result_class" class="type_out" href="result/result.do?game_type=OP&langx=zh-cn" target="body" onclick="chg_button_bg('OP','today');chg_type_class('result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
		</c:choose>
	</div>
	<!-- zao pan Menu end -->
	<!-- 滚球Menu Start -->
	<div id="nav_re" style="display:none">
    	<ul class="level1">
    	  <li class="ft"><span class="ball"><a href="#" onclick="Go_RB_page('FT');chg_button_bg('FT','rb');">足球(<strong class="game_sum" id="RB_FT_games"></strong>)</a></span></li>
    	  <li class="bk"><span class="ball"><a href="#" onclick="Go_RB_page('BK');chg_button_bg('BK','rb');">篮球 <span class="ball_nf"><img src="${ctx}/img/sport/head_ball_nf.gif"  class="nf_icon" border="0"></span>美式足球 <span style="display:inline-block;vertical-align: text-bottom; margin:0 4px; width:16px; height:17px;background: url(${ctx}/img/sport/head_ball_rl.gif) no-repeat 0 4px;"><img src="${ctx}/img/sport/head_ball_rl.gif"  border="0"></span>橄榄球(<strong class="game_sum" id="RB_BK_games"></strong>)</a></span></li>
    	  <li class="tn"><span class="ball"><a href="#" onclick="Go_RB_page('TN');chg_button_bg('TN','rb');">网球(<strong class="game_sum" id="RB_TN_games"></strong>)</a></span></li>
    	  <li class="vb"><span class="ball"><a href="#" onclick="Go_RB_page('VB');chg_button_bg('VB','rb');">排球(<strong class="game_sum" id="RB_VB_games"></strong>)</a></span></li>
    	  <li class="bm"><span class="ball"><a href="#" onclick="Go_RB_page('BM');chg_button_bg('BM','rb');">羽毛球(<strong class="game_sum" id="RB_BM_games"></strong>)</a></span></li>
    	  <li class="tt"><span class="ball"><a href="#" onclick="Go_RB_page('TT');chg_button_bg('TT','rb');">乒乓球(<strong class="game_sum" id="RB_TT_games"></strong>)</a></span></li>
    	 <!--  <li class="bs"><span class="ball"><a href="#" onclick="Go_RB_page('BS');chg_button_bg('BS','rb');">棒球(<strong class="game_sum" id="RB_BS_games"></strong>)</a></span></li>
   	  	  <li class="op"><span class="ball"><a href="#" onclick="Go_RB_page('OP');chg_button_bg('OP','rb');">其他(<strong class="game_sum" id="RB_OP_games"></strong>)</a></span></li>	
     -->	</ul>
  	</div>
  	<div id="type_re" style="display:none">
  		<c:choose>
  		<c:when test="${gtype == 'FT'}">
  		<!-- 足球 -->
    	<ul>
	      	<li class="re"><a id="rb_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('FT','rb');chg_type('FT_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2');chg_type_class('rb_class');">独赢 ＆ 让球 ＆ 大小 ＆ 单 / 双</a></li>
	      	<li class="pd"><a id="rpd_class" class="type_out" href="javascript:void(0);" onclick="chg_button_bg('FT','rb');chg_type('FT_browse/index.do?rtype=rpd&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2');chg_type_class('rpd_class');">波胆</a></li>
	      	<li class="to"><a id="rto_class" class="type_out" href="javascript:void(0);" onclick="chg_button_bg('FT','rb');chg_type('FT_browse/index.do?rtype=rt&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2');chg_type_class('rto_class');">总入球</a></li>
	      	<li class="hf"><a id="rhf_class" class="type_out" href="javascript:void(0);" onclick="chg_button_bg('FT','rb');chg_type('FT_browse/index.do?rtype=rf&langx=zh-cn&mtype=3&showtype=browse',parent.FT_lid_type,'SI2');chg_type_class('rhf_class');">半场 / 全场</a></li>
	      	<li class="result"><a id="rb_result_class" class="type_out" href="FT_browse/result.do" target="body" onclick="chg_button_bg('FT','rb');chg_type_class('rb_result_class');">赛果</a></li>
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'BK'}">
  		<!-- 篮球 -->
    	<ul>
	      	<li class="re"><a id="rb_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('BK','rb');chg_type('BK_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.BK_lid_type,'SI2');chg_type_class('rb_class');">独赢盘 ＆ 让球 ＆ 大小 </a></li>
	      	<!-- <li class="result"><a id="rb_result_class" class="type_out" href="result/result.do?game_type=BK&langx=zh-cn" target="body" onclick="chg_button_bg('BK','rb');chg_type_class('rb_result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'TN'}">
  		<!-- 网球 -->
    	<ul>
	      	<li class="re"><a id="rb_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('TN','rb');chg_type('TN_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.TN_lid_type,'SI2');chg_type_class('rb_class');"> 让盘 ＆ 大小 </a></li>
	      	<!-- <li class="result"><a id="rb_result_class" class="type_out" href="result/result.do?game_type=TN&langx=zh-cn" target="body" onclick="chg_button_bg('TN','rb');chg_type_class('rb_result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'VB'}">
  		<!-- 排球 -->
    	<ul>
	      	<li class="re"><a id="rb_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('VB','rb');chg_type('VB_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.VB_lid_type,'SI2');chg_type_class('rb_class');"> 让分 ＆ 大小</a></li>
	      	<!-- <li class="result"><a id="rb_result_class" class="type_out" href="result/result.do?game_type=VB&langx=zh-cn" target="body" onclick="chg_button_bg('VB','rb');chg_type_class('rb_result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'BM'}">
  		<!-- 羽毛球 -->
    	<ul>
	      	<li class="re"><a id="rb_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('BM','rb');chg_type('BM_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.BM_lid_type,'SI2');chg_type_class('rb_class');">独赢 ＆ 让局 ＆ 大小 </a></li>
	      	<!-- <li class="result"><a id="rb_result_class" class="type_out" href="result/result.do?game_type=BM&langx=zh-cn" target="body" onclick="chg_button_bg('BM','rb');chg_type_class('rb_result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'TT'}">
  		<!-- 乒乓球 -->
    	<ul>
	      	<li class="re"><a id="rb_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('TT','rb');chg_type('TT_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.TT_lid_type,'SI2');chg_type_class('rb_class');">独赢 ＆ 让局 ＆ 大小</a></li>
	      	<!-- <li class="result"><a id="rb_result_class" class="type_out" href="result/result.do?game_type=TT&langx=zh-cn" target="body" onclick="chg_button_bg('TT','rb');chg_type_class('rb_result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'BS'}">
  		<!-- 棒球 -->
    	<ul>
	      	<li class="re"><a id="rb_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('BS','rb');chg_type('BS_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.BS_lid_type,'SI2');chg_type_class('rb_class');">让分 ＆ 大小 </a></li>
	      	<!-- <li class="result"><a id="rb_result_class" class="type_out" href="result/result.do?game_type=BS&langx=zh-cn" target="body" onclick="chg_button_bg('BS','rb');chg_type_class('rb_result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	<c:when test="${gtype == 'OP'}">
  		<!-- 其他 -->
    	<ul>
	      	<li class="re"><a id="rb_class" class="type_on" href="javascript:void(0);" onclick="chg_button_bg('OP','rb');chg_type('OP_browse/index.do?rtype=re&langx=zh-cn&mtype=3&showtype=browse',parent.OP_lid_type,'SI2');chg_type_class('rb_class');">让球 ＆ 大小 </a></li>
	      	<!-- <li class="result"><a id="rb_result_class" class="type_out" href="result/result.do?game_type=OP&langx=zh-cn" target="body" onclick="chg_button_bg('OP','rb');chg_type_class('rb_result_class');">赛果</a></li> -->
    	</ul>
    	</c:when>
    	</c:choose>
	</div>
	<!-- 滚球Menu end -->
</div>

	<div id="mem_box">
	  <div id="mem_main">
	  	<span class="his"><a href="history.do?langx=zh-cn" target="body">帐户历史</a></span> | 
	  	<span class="wag"><a href="today.do?langx=zh-cn" target="body">交易状况</a></span></div>
	  <!-- <div id="credit_main"><span id="credit">人民币 8,000</span><input name="" type="button" class="re_credit" value="" onclick="javascript:reloadCrditFunction();"></div> -->
	</div>
		
<!-- 	<div id="chat" style="display: none; width: 671px; height: 87px; left: 220px; top: 20px; position: absolute; z-index: 1000; background-color: rgb(255, 255, 255);">
	<table width="581" border="0" cellpadding="0" cellspacing="3" bgcolor="#CA6500">
		<tbody>
			<tr>
				<td><img src="${ctx}/img/sport/kefu.jpg" width="94" height="81"></td>
				<td>
					<iframe name="chat" src="about:blank" width="580" height="81" frameborder="0" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
				</td>
			</tr>
		</tbody>
	</table>
	</div> -->
	<iframe id="reloadPHP" name="reloadPHP"  width="0" height="0"></iframe>
	<!-- <iframe id="reloadPHP" name="reloadPHP1" src="reloadCredit.php?&langx=zh-cn" width="0" height="0"></iframe> -->
	<iframe id=memOnline name=memOnline  width=0 height=0></iframe>

</body>
</html>