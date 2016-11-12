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
    <link href="css/about.css" rel="stylesheet">
</head>
<body>

    <!--头部-->
    <jsp:include page="../common/header.jsp"></jsp:include>

    <!--注册成功后跳转处理-->
	<div id="myHiddenredirectView" class="myHiddenDiv" style="display: none">
        <div class="popup">
            <div class="popup-body">

                <h1 align="center"><font color="green" ><spring:message code="register.success"/></font></h1>


            </div>
        </div>
    </div>
<script type="text/javascript">
    $(document).ready(function() {
    	if("${redirectNo}"=="1"){
    		window.parent.location="${ctx}/index.do?redirectNo=0";
		}

    	if("${redirectNo}"=="0"){
    		openredirectViewPopup();
    		setTimeout(function(){
    			$.closePopupLayer('openredirectViewPopup');
            },1000);
		}

    	$.ajax({'url':"${ctx}/index/getRunMassage.do?timeStamp=" + new Date().getTime(),type:"get",dataType:'json',success:
            function(b){
	            if(b.code==0){
	               	var list = b.mesaages;
	               	if(list.length>0){
	               		var html="";
	               		for(var i=0;i<list.length;i++){
	               			html+="<li>"+getMsgType(list[i].type)+list[i].message+"</li>";
	               		}

	               		$("#runmessage").html(html);
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

    function openredirectViewPopup() {
        $.openPopupLayer({
            name: "openredirectViewPopup",
            width: 200,
            height:200,
            target: "myHiddenredirectView"
        });
    }
    </script>

    <!--关于我们系列 开始-->
    <div class="about">
    <div class="container padding-0">
        <div class="row">
            <div class="col-sm-2">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation" class="text-center active"><a href="about.do"><spring:message code="public.aboutUs"/></a></li>
                    <li role="presentation" class="text-center"><a href="contact.do"><spring:message code="public.contactUs"/></a></li>
                    <li role="presentation" class="text-center"><a href="law.do"><spring:message code="public.legalStatement"/></a></li>
                    <li role="presentation" class="text-center"><a href="howcun.do"><spring:message code="public.howToDeposit"/></a></li>
                    <li role="presentation" class="text-center"><a href="howqu.do"><spring:message code="public.howToWithdrawMoney"/></a></li>
                    <li role="presentation" class="text-center"><a href="partner.do"><spring:message code="public.partners"/></a></li>
                </ul>
            </div>
            <div class="col-sm-10">
    <h2>关于我们</h2>
<div class="txt">
    <p>黄金世纪成立于2015年，成功的成为亚洲首屈的在线游戏平台供应商，逐步发展为网络科技发展集团。除了游戏产业，近年来更积极拓展版图至休闲娱乐领域。</p>

    <p>全球拥有超过500位专业人才，不断创新、研发逾百款电子游戏相关产品并获得多项国际认证，提供多元化服务包括在线游戏平台建构、视讯直播及游戏平台API整合等。</p>

    <p>黄金世纪始终以顾客为中心，及满足顾客需求为最高宗旨。</p>

    <p>黄金世纪至今已研发了多种可在线上或移动装置上操作的游戏。</p>
</div>
            </div>
        </div>
    </div>
    </div>

    <!--尾部-->
    <jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>