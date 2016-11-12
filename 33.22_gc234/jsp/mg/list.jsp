<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MG</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="Stylesheet" href="${ctx}/css/jquery-ui.css?1203" />

    <link rel="stylesheet" href="${ctx}/css/common.css?1203" />
    <link rel="stylesheet" href="${ctx}/css/game_mg.css?1"/>
    <style>
    	#search_box{
    		float: right;
    		margin-right: 50px;
    	}
    	input#searchBtn {
		    color: #333;
		    background-color: #fff;
		    border-color: #ccc;
		    display: inline-block;
		    padding: 2px 10px;
		    margin-bottom: 0;
		    font-size: 14px;
		    font-weight: 400;
		    line-height: 1.42857143;
		    text-align: center;
		    white-space: nowrap;
		    vertical-align: middle;
		    -ms-touch-action: manipulation;
		    touch-action: manipulation;
		    cursor: pointer;
		    -webkit-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		    background-image: none;
		    border: 1px solid transparent;
		    border-radius: 4px;
		}
		input#searchBtn:hover {
		    color: #333;
		    background-color: #e6e6e6;
		    border-color: #adadad;
		}
		input#searchGameName{
		    font-size: 14px;
		    line-height: 1.42857143;
		    color: #555;
		    background-color: #fff;
		    background-image: none;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
		    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
		    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
		    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
		    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
		}
    </style>
    </head>

    <body>
    <div id="wrapper">
    <!--content-->
    <div class="container-fluid">
    <div class="brand"><a href="${ctx}/game/iframe.do"><img src="../img/game/brand_pt.png"></a><a href="${ctx}/mg/list.do"><img src="../img/game/brand_mg.png"></a></div>
    <div class="gamecontainer">
    <div class="gamehead">
    <ul id="gamehead">
    <li class="gamehead-btn active"><a data-url="mgGameData" href="#">热门游戏</a></li>
    <li class="gamehead-btn"><a data-url="mgGameDataSlots" href="#">老虎机</a></li>
    <!-- <li class="gamehead-btn"><a data-url="mgGameDataProgressives" href="#">过关游戏</a></li> -->
    <li class="gamehead-btn"><a data-url="mgGameDataScratchCard" href="#">刮刮卡</a></li>
    <li class="gamehead-btn"><a data-url="mgGameDataTableGames" href="#">桌面游戏</a></li>
    <li class="gamehead-btn"><a data-url="mgGameDataVideoPoker" href="#">电子扑克</a></li>
    <li class="gamehead-btn"><a data-url="mgGameDataOthers" href="#">其他游戏</a></li>
    </ul>
    <span id="search_box">
    	<input type="text" name="searchGameName" id="searchGameName">
    	<input type="button" id="searchBtn" value="搜索">
   	</span>
    </div>

    <div  id="locate-box" class="gamecontent">
    <ul class="gamehead-view active" gamehead-view="1" style="display: none;" id="content">

    </ul>

        <div class="clearfix"></div>

        <div id="loading" style="height:580px; background:url(../img/loading.gif) center no-repeat;"></div>

        <div id="page1" class="text-c"></div>
    </div>
    <div class="clearfix"></div>
    </div>
    </div>
    
    <script type="text/template" id="contentTpl">
         <# if(gameData !== null || gameData !== undefined || gameData !== ''){
			for(var i = 0; i < gameData.length; i++) { #>
			 <li>
              <div class="ghover" style="background:url(../img/mgGame/<#=gameData[i].gameImgName#>) left center no-repeat;">
                  <span></span>
                  <p class="newlayer"><a class="start" onclick="openMgGame('<#=gameData[i].gameCode#>')" href="#">&nbsp;</a> </p>
              </div>
              <h3><#=gameData[i].zhName#></h3>
          </li>
		<#}}#>
    </script>

    <script src="${ctx}/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${ctx}/css/showBo.css"/>
    <script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx }/js/page/laypage.js"></script> 
    <script type="text/javascript">
	$(function(){
		var dataUrl = $('#gamehead .gamehead-btn.active a').attr('data-url');
		url = '${ctx}/json/'+dataUrl+'.json?timeStamp=' + new Date().getTime();
		//绑定导航
		$('#gamehead').on('click', '.gamehead-btn a', function(e){
			e.preventDefault();
			var $parent = $(this).parent('li');
			$parent.addClass('active').siblings('li').removeClass('active');
			url = $(this).attr('data-url');
			url = '${ctx}/json/'+url+'.json?timeStamp=' + new Date().getTime();
			getJsonDate(url);
		});
		getJsonDate(url);
		
		$("#searchBtn").on("click", function(){
			var url = $("#gamehead").find("li.active").find("a").attr("data-url");
			url = '${ctx}/json/'+url+'.json?timeStamp=' + new Date().getTime();
    		var searchStr = $("#searchGameName").val();
    		getJsonDate(url,'',searchStr);
    	});
		
	})
	//获取游戏数据
	function getJsonDate(url,curr,searchStr){
		if(url != '' && url.length > 0){
			$.getJSON(url, {
		        page: curr || 1 
		    }, function(res){
		        if(res.code==0){
		        	//判断搜索条件
		        	if(searchStr != null && typeof(searchStr) != "undefined" && searchStr != ""){
                    	var gameData = new Array();
                    	for (var i = 0; i < res.gameData.length; i++) {
                    		var gameName = res.gameData[i].zhName;
    						if(gameName.indexOf(searchStr) >= 0){
    							gameData.push(res.gameData[i]);
    						}
    					}
                    	res.gameData = gameData;
                	}
		        	
		        	var allGameData = res.gameData;//总数据
		        	var itemLength = allGameData.length;
		        	var page = curr || 1;//页码
		        	var pages;//总页码
		        	var nums = 18;//每页显示数量
		        	if(itemLength % nums > 0){
		        		pages = parseInt(itemLength / nums) + 1;
		        	}else{
		        		pages = parseInt(itemLength / nums);
		        	}
		        	var startItemIndex;//本页开始下标
		        	if(page == 1){
		        		startItemIndex = 0;
		        	}else{
		        		startItemIndex = ((page - 1) * nums);
		        	}
		        	var endItemIndex;//本页结束下标
		        	if(page * nums > itemLength){
		        		endItemIndex = itemLength - 1;
		        	}else{
		        		endItemIndex = (page * nums) - 1;
		        	}
		        	var gameData = new Array();//该页数据
		        	for (var i = startItemIndex; i <= endItemIndex; i++) {
		        		gameData.push(allGameData[i]);
					}
		        	
		        	res.gameData = gameData;
		            var html = tpl('#contentTpl', res);
		            $('#content').html(html);
		            $('#content').show();
		            $('#loading').hide();
		            
		          	//显示分页
		            laypage({
		                cont: 'page1', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
		                pages: pages, //通过后台拿到的总页数
		                curr: curr || 1, //当前页
		                jump: function(obj, first){ //触发分页后的回调
		                    if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
		                    	getJsonDate(url, obj.curr, searchStr);
		                    }
		                }
		            });
		        }else{
		            Showbo.Msg.alert('获取游戏数据错误');
		        }
		    });
			
		}
	}
	
    function openMgGame(gameCode){
    	window.open("${ctx}/mg/rungame.do?gameid="+gameCode,"Go_pt_game","width=1076,height=655,status=no,location=no");
    };
    </script>

    </body>
    </html>