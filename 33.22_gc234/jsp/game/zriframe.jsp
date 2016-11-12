<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>PT</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="${ctx}/css/common.css?1203" />
    <link rel="stylesheet" href="${ctx}/css/game.css?1"/>
</head>

<body>
<div id="wrapper">
    <!--content-->
    <div class="container-fluid">
        <div class="brand"><a href="#"><img src="../img/game/zr_pt.png"></a></div>
        <div class="gamecontainer">

            <div  id="locate-box" class="gamecontent">
                <ul class="gamehead-view active" gamehead-view="1" style="display: none;" id="content">

                </ul>

                <div class="clearfix"></div>

                <div id="loading" style="height:580px; background:url(../img/loading.gif) center no-repeat;"></div>


            </div>

            <div class="clearfix"></div>

        </div>
    </div>
</div>


<script type="text/template" id="contentTpl">
    <# for(var i=0; i<gameData.length; i++) {
            if("${sessionScope.testcode}" == "0" ){
            gameData[i].gameShi='9';
            }
            if(gameData[i].gameShi=='1'){
            #>
    <li>
        <div class="ghover" style="background:url(../img/game/<#=gameData[i].gameImgName#>) center center no-repeat;background-size: 100%;">
            <span></span>
            <p class="newlayer"><a class="start" onclick="PT_game_open('<#=gameData[i].gameCode#>')" href="#">&nbsp;</a><a class="try" onclick="PT_game_open_sw('<#=gameData[i].gameCode#>')" href="#">&nbsp;</a> </p>
        </div>
        <h3><#=gameData[i].gameName#></h3>
    </li>
    <#}else if(gameData[i].gameShi=='9'){#>
        <li>
            <div class="ghover" style="background:url(../img/game/<#=gameData[i].gameImgName#>) center center no-repeat;background-size: 100%;">
                <span></span>
                <p class="newlayer"><a class="start" onclick="PT_game_open_two('<#=gameData[i].gameCode#>')" href="#">&nbsp;</a></p>
            </div>
            <h3><#=gameData[i].gameName#></h3>
        </li>
        <#}else{#>
            <li>
                <div class="ghover" style="background:url(../img/game/<#=gameData[i].gameImgName#>) center center no-repeat;background-size: 100%;">
                    <span></span>
                    <p class="newlayer"><a class="start" onclick="PT_game_open('<#=gameData[i].gameCode#>')" href="#">&nbsp;</a></p>
                </div>
                <h3><#=gameData[i].gameName#></h3>
            </li>
            <#}}#>
</script>

<script src="${ctx}/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>

<script type="text/javascript">
    var console=console||{log:function(){}};
    $.ajax({'url':"${ctx}/json/zrGameData.json?timeStamp=" + new Date().getTime(),type:"get",data:{},dataType:'json',success:
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

        /*  $.ajax({'url':"../ptgame.do?timeStamp=" + new Date().getTime(),type:"get",data:{'ip':'${IP}','gamecode':gameCode},dataType:'json',success:
         function(b){
         if(b.code==0){
         }else{
         Showbo.Msg.alert(b.msg?b.msg:"记录错误");
         return;
         }
         }
         }); */
        window.open("${ctx}/game/index.do?gameCode="+gameCode,"Go_pt_game","width=1076,height=655,status=no,location=no");
    };

    function PT_game_open_two(gameCode){
        alert("请注册或登陆正式账号");
    };

    function PT_game_open_sw(gameCode){
        window.open("http://cache.download.banner.mightypanda88.com/casinoclient.html?mode=offline&affiliates=1&language=zh-cn&game="+gameCode+"&currency=CNY","Go_pt_game","width=1076,height=655,status=no,location=no");
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