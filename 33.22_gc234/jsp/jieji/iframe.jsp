<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>街机</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="Stylesheet" href="${ctx}/css/jquery-ui.css?1203" />

    <link rel="stylesheet" href="${ctx}/css/common.css?1203" />
    <link rel="stylesheet" href="${ctx}/css/game.css?1"/>
    </head>

    <body>
    <div id="wrapper">
    <!--content-->
    <div class="container-fluid">
    <div class="brand"><a href="#"><img src="../static/imgs/game/brand_pt.png"></a></div>
    <div class="gamecontainer">
    <div class="gamehead">
    <ul id="gamehead">
    <li gamehead="1" class="gamehead-btn active"><a>热门游戏</a></li>
    <li gamehead="2" class="gamehead-btn"><a>电动角子机</a></li>
    </ul>
    </div>

    <div  id="locate-box" class="gamecontent">
    <ul class="gamehead-view active" gamehead-view="1" style="display: none;" id="content">

    </ul>

        <div class="clearfix"></div>

        <div id="loading" style="height:580px; background:url(../static/imgs/loading.gif) center no-repeat;"></div>

        <div id="page1" class="text-c">
            <div class="laypage_main laypageskin_molv clearfix">
        <c:if test="${prv > 0}">
        <a href="iframe.do?page=${prvPage}" class="laypage_prev" data-page="1">上一页</a>
        </c:if>
        <c:choose>
        <c:when test="${page == 1}">
        <span class="laypage_curr">1</span>
        </c:when>

        <c:otherwise>
        <a href="iframe.do?page=1" >1</a>
        </c:otherwise>
        </c:choose>

        <c:choose>
        <c:when test="${page == 2}">
        <span class="laypage_curr">2</span>
        </c:when>

        <c:otherwise>
        <a href="iframe.do?page=2" >2</a>
        </c:otherwise>
        </c:choose>

        <c:choose>
        <c:when test="${page == 3}">
        <span class="laypage_curr">3</span>
        </c:when>

        <c:otherwise>
        <a href="iframe.do?page=3" >3</a>
        </c:otherwise>
        </c:choose>

        <c:choose>
        <c:when test="${page == 4}">
        <span class="laypage_curr">4</span>
        </c:when>

        <c:otherwise>
        <a href="iframe.do?page=4" >4</a>
        </c:otherwise>
        </c:choose>

        <c:choose>
        <c:when test="${page == 5}">
        <span class="laypage_curr">5</span>
        </c:when>

        <c:otherwise>
        <a href="iframe.do?page=5" >5</a>
        </c:otherwise>
        </c:choose>

        <c:choose>
        <c:when test="${page == 6}">
        <span class="laypage_curr">6</span>
        </c:when>

        <c:otherwise>
        <a href="iframe.do?page=6" >6</a>
        </c:otherwise>
        </c:choose>
        <c:if test="${next > 0}">
        <a href="iframe.do?page=${nextPage}" class="laypage_next">下一页</a>
        </c:if>
            </div>


        </div>
    <ul class="gamehead-view active" gamehead-view="2" style="display: none;">
    <li><img src="../static/imgs/game/smallicon/blade.jpg"><h3>轮盘</h3></li>
    </ul>
    </div>

    <div class="clearfix"></div>

    </div>
    </div>


    <script type="text/template" id="contentTpl">
         <# for(var i=16*(${page}-1); i<16*${page}; i++) { #>
          <li><a onclick="PT_game_open('<#=gameData[i].gameCode#>')" href="#">
          <img src="../static/imgs/game/<#=gameData[i].gameImgName#>" width="258" height="100"><h3><#=gameData[i].gameName#></h3>
          </a></li>
         <#}#>
    </script>

    <script src="${ctx}/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${ctx}/css/showBo.css"/>
    <script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>

    <script type="text/javascript">

        $.ajax({'url':"${ctx}/js/ptGameData.json?timeStamp=" + new Date().getTime(),type:"get",data:{},dataType:'json',success:
        function(b){
                if(b.code==0){
        console.log(b.gameData.length);
                    var html = tpl('#contentTpl', b);
                    $("#content").html(html);
                    $("#content").show();
                    $("#loading").hide();
                }else{
                    Showbo.Msg.alert("获取游戏数据错误");
                }
            }
        });


    function PT_game_open(gameCode){

    $.ajax({'url':"../ptgame.do?timeStamp=" + new Date().getTime(),type:"get",data:{'ip':'${IP}','gamecode':gameCode},dataType:'json',success:
    function(b){
    if(b.code==0){
    }else{
        Showbo.Msg.alert(b.msg?b.msg:"记录错误");
        return;
        }
    }
    });
        window.open("http://cache.download.banner.longsnake88.com/casinoclient.html?game="+gameCode+"&language= zh-cn&nolobby=1","Go_pt_game","width=1076,height=655,status=no,location=no");
        };
    </script>

    <script type="text/javascript">
    $(document).ready(function () {
    $("#gamehead li").bind("click", function () {
    var index = $(this).index();
    var divs = $("#locate-box > ul");
    $(this).parent().children("li").attr("class", "gamehead-btn");//将所有选项置为未选中
    $(this).attr("class", "gamehead-btn active"); //设置当前选中项为选中样式
    divs.hide();//隐藏所有选中项内容
    divs.eq(index).show(); //显示选中项对应内容
    });

    });
    </script>

    </body>
    </html>