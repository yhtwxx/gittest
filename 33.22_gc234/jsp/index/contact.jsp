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
                    <li role="presentation" class="text-center"><a href="about.do"><spring:message code="public.aboutUs"/></a></li>
                    <li role="presentation" class="text-center active"><a href="contact.do"><spring:message code="public.contactUs"/></a></li>
                    <li role="presentation" class="text-center"><a href="law.do"><spring:message code="public.legalStatement"/></a></li>
                    <li role="presentation" class="text-center"><a href="howcun.do"><spring:message code="public.howToDeposit"/></a></li>
                    <li role="presentation" class="text-center"><a href="howqu.do"><spring:message code="public.howToWithdrawMoney"/></a></li>
                    <li role="presentation" class="text-center"><a href="partner.do"><spring:message code="public.partners"/></a></li>
                </ul>
            </div>
            <div class="col-sm-10">
    <h2>联系我们</h2>
<div class="txt">
    <p>黄金世纪24小时竭诚为您服务，我们为您提供多种联络方式。</p>
    <p>您有任何疑问、意见都可以通过下述方式随时与我们联系，我们期待为您服务。</p>
    <p>1.通过网站24小时在线客服：在线客服</p>
</div>
            </div>
        </div>
    </div>
    </div>

    <!--尾部-->
    <jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>