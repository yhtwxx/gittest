<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>公司入款完成</title>
    <link href="../css/member/deposit.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../js/layer.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/skin/layer.css" id="skinlayercss">
    <link rel="stylesheet" href="../css/showBo.css"/>
</head>
<body huaban_collector_injected="true">
<!--<div class="member_top">-->
<!--<div class="member_logo"><img src="#" width="140" height="42"></div>-->
<!--</div>-->
<div class="card_main">

    <div class="card_width">
        <div class="card_title">
            <p class="color_red">公司银行帐号随时更换! 请每次存款都至 [公司入款] 进行操作。 入款至已过期帐号，公司无法查收，恕不负责!</p>

            <p>欢迎使用公司入款平台!请依照以下步骤进行存款。如需说明请点击 公司入款流程解说。</p>
        </div>
        <div class="bz3_tu">
            <ul>
                <li class="bz1_tu1">1.选择您的银行</li>
                <li class="bz_tu2">2.选择您要转入的银行</li>
                <li class="bz_tu3">3.填写您的转账资料</li>
                <li class="bz3_tu4">4.步骤完成</li>
            </ul>
        </div>
        <div class="bz_bank">


            <p class="sqcg" id="msg">
            </p>

            <div style="text-align: center"><a class="nui-btn nui-btn-theme-main" href="#" onclick="closewin();">离开本页</a></div>
            <script>
            $(document).ready(function () {
            	var code=${code};
            	var msg="";
            	if(code=="99998"||code=="99999"){
            		msg="未登录或者登录失效,请重新登陆!";
            		$("#msg").html(msg);
            		setTimeout(
                            function(){
                            	 window.close();
                            },2000
                        );
            		return;
            	}else if(code=="0"){
            		msg="提交转账申请成功!";
            	}else{
            		msg="提交转账申请失败,请联系客服!";
            	}
            	$("#msg").html(msg);
            });
            
                function closewin() {
                    window.close();
                }
                //window.setInterval(closewin, 2000);
            </script>
            <div style="clear:both"></div>
        </div>
    </div>
</div>


</body>
</html>