<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>PT</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="${ctx}/css/common.css?1203" />
    <link rel="stylesheet" href="${ctx}/css/game.css"/>
    <script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js?1203"></script>
    <link rel="stylesheet" href="${ctx}/css/showBo.css"/>
    <script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>
    <script src="${ctx}/js/lib/jquery.jmpopups-0.5.1.js" type="text/javascript"></script>
</head>

<body>
<div id="wrapper">

    <%-- <jsp:include page="../common/header.jsp"></jsp:include> --%>

    <!--content-->
    <div class="container-fluid">

        <div id="iframe" style="width:1200px; margin:0 auto;display:none">
            <!--  <iframe src="iframe.do" marginwidth="0" marginheight="0" border="0" scrolling="yes" frameborder="0"
             width="1300" height="1000"></iframe> -->

        </div>

        <div class="clearfix"></div>

        <div id="loading" style="height:500px; background:url(../static/imgs/loading.gif) center no-repeat;"></div>

    </div>

    <div style="display:none">
        <script type="text/javascript" src="http://cache.download.banner.longsnake88.com/integrationjs.php"></script>
        <script type="text/javascript">
            iapiSetCallout('Login', calloutLogin);
            iapiSetCallout('Logout', calloutLogout);

            function login(realMode) {
                iapiLogin(document.getElementById("loginform").username.value.toUpperCase(), document.getElementById("loginform").password.value, realMode, "en");
            }

            function logout(allSessions, realMode) {
                iapiLogout(allSessions, realMode);
            }

            function calloutLogin(response) {
                if (response.errorCode) {
                    alert("连接错误,请联系客服,错误代码:66");
                    setTimeout(
                            function(){
                                window.close();
                            },1000
                    )
                }
                else {
                    $("#loading").hide();
                    //$("#iframe").show();
                    window.location = "http://cache.download.banner.longsnake88.com/casinoclient.html?game=${gameCode}&language=ZH-CN&nolobby=1";
                }
            }

            function calloutLogout(response) {
                if (response.errorCode) {
                    alert("Logout failed, " + response.errorCode);
                }
                else {
                    alert("Logout OK");
                }
            }
        </script>
        <form id="loginform">
            Username: <input type="text" name="username" id="c_username"><br>
            Password: <input type="text" name="password" id="c_password">
        </form>

    </div>

    <%-- <jsp:include page="../common/footer.jsp"></jsp:include> --%>

    <script type="text/javascript">

        $(document).ready(function () {
            $.ajax({'url':"../ptindex.do?timeStamp=" + new Date().getTime(),type:"get",dataType:'json',success:
                    function(b){
                        if(b.code==0){
                            $("#c_username").attr("value",b.accountno);
                            $("#c_password").attr("value",b.password);
                            login(1);
                        }else{
                            Showbo.Msg.alert(b.msg?b.msg:"未登录！");
                            setTimeout(
                                    function(){
                                        window.close();
                                    },1000
                            )
                        }
                    }
            });
        });
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