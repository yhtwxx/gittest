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

                <h1 align="center"><font color="green" >注册成功</font></h1>


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
                    <li role="presentation" class="text-center"><a href="contact.do"><spring:message code="public.contactUs"/></a></li>
                    <li role="presentation" class="text-center"><a href="law.do"><spring:message code="public.legalStatement"/></a></li>
                    <li role="presentation" class="text-center active"><a href="howcun.do"><spring:message code="public.howToDeposit"/></a></li>
                    <li role="presentation" class="text-center"><a href="howqu.do"><spring:message code="public.howToWithdrawMoney"/></a></li>
                    <li role="presentation" class="text-center"><a href="partner.do"><spring:message code="public.partners"/></a></li>
                </ul>
            </div>
            <div class="col-sm-10">
    <h2>如何存款</h2>
<div class="txt">
    <p>◎您现在可以透过以下方式存款给黄金世纪线上娱乐：</p>

    <h3>一、银行卡划款</h3>

    <p>银行划款是通过公司指定的银行卡号进行存款支付，银行划款可以用网银转账、ATM转账、ATM现金存款、柜台存款、手机银行支付等方式存款，具体步骤如下：</p>

    <p>1.请您登陆会员账户，点击“存款”，选择“银行卡入款”，进入查看最新的银行划款收款银行账户信息或向24小时在线客服人员索取。</p>
    <p>2.目前公司提供中国工商银行、中国建设银行、中国招商银行可选择。跨行转账请您使用跨行快汇，存款到账时间约为3-5分钟。如会员需要其它银行汇款，请联系我们的24小时-在线客服。</p>
    <p>3.转账成功请您在“银行划款”上提交您存入的金额，我们将于确认到账后立刻为您游戏账户充值。</p>
    <p>4.会员通过银行划款满 100元 系统将自动增加 1.3% 存款优惠。</p>
    <p>5.请您存款时在金额后面加个尾数（例如：欲入5000元，请转5000.18元），方便快速到账，谢谢！</p>

    <h3>二、线上支付</h3>

    <p>1.会员登入后点选”在线支付”。（在你第一次入款时，需先绑定你的出款银行）</p>
    <p>2.选择入款额度，并请确实填写 ”联络电话” ，如有任何问题，方便黄金世纪线上娱乐客服第一时间与您联系。</p>
    <p>3.选择”支付银行”。</p>
    <p>4.确认送出后，将请您确认您的支付订单无误，并建议您记录您的支付订单号后，确认送出，并耐心等待载入网络银行页面，传输中已将您账户数据加密，请耐心等待。</p>
    <p>5.会员线上单次存款最低金额为100元以上。</p>
    <p>6.进入网上银行页面，请确实填写您银行账号信息，支付成功，额度系统将即时为您添加到您的黄金世纪线上娱乐会员账户。</p>

    <p><strong>◎存款需知：</strong></p>

    <p>1.黄金世纪线上娱乐单笔最低存款为 ￥100人民币， 单笔最高存款上限为￥5,000,000人民币（500万）。</p>
    <p>2.未开通网银的会员，请亲洽您的银行柜台办理。</p>
    <p>3.如有任何问题，请您联系24小时线上客服。</p>
    <p>4.黄金世纪线上娱乐相关优惠，请详见‘优惠活动’。</p>
</div>
            </div>
        </div>
    </div>
    </div>

    <!--尾部-->
    <jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>