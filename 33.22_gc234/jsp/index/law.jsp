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
                    <li role="presentation" class="text-center"><a href="contact.do"><spring:message code="public.contactUs"/></a></li>
                    <li role="presentation" class="text-center active"><a href="law.do"><spring:message code="public.legalStatement"/></a></li>
                    <li role="presentation" class="text-center"><a href="howcun.do"><spring:message code="public.howToDeposit"/></a></li>
                    <li role="presentation" class="text-center"><a href="howqu.do"><spring:message code="public.howToWithdrawMoney"/></a></li>
                    <li role="presentation" class="text-center"><a href="partner.do"><spring:message code="public.partners"/></a></li>
                </ul>
            </div>
            <div class="col-sm-10">
    <h2>法律声明</h2>
<div class="txt">
    <p>黄金世纪支持节制性的博彩，并提倡广大玩家对病态赌博的心理有一个基础认识，并做好预防，理解和治疗等相关知识的了解。黄金世纪的"负责博彩"政策清楚表明我公司对试图减小和降低病态赌博心理所带来负面的影响并积极推扩"负责博彩"的相关承诺。</p>
    <p>我们相信我们有责任去确保每位玩家都能在本公司网站上享受到娱乐博彩投注所带来的愉悦体验和经历，但同时亦能警觉到病态赌博心态可能会对玩家和社会的经济上造成一定的危害，因此我们建议您参考以下的指引：</p>
    <p>o	在每次开始赌博投注前设定好您充值存款，下注金额，甚至是亏损的限额。您可以自己在您的帐户内或联系我们的客服去设定您的限额。</p>
    <p>o	在每次开始赌博投注前限定您该次赌博娱乐的时间并严格遵守。</p>
    <p>o	千万不要让赌博影响您的社会日常生活。</p>
    <p>o	如您感到神智不清或正在受到酒精或其他物质的影响，切勿进行赌博投注。</p>
    <p>o	千万不要将赌博作为一种收入的来源或偿还债务的途径。</p>
    <h3>博彩心态测试</h3>
    <p><strong>如您认为自己可能有沉迷赌博投注的问题，可以根据以下的问题对自己做一个判断：</strong></p>
    <p>1.	您是否曾因赌博投注而失学或失业？</p>
    <p>2.	您是否曾通过赌博投注而忘却烦恼和不愉快？</p>
    <p>3.	您是否曾在输钱时，觉得失落和绝望并想尽快再次下注？</p>
    <p>4.	您是否往往赌博投注直至到最后的一分钱也输掉，即使是回家的车费？</p>
    <p>5.	您是否曾为了掩盖因赌博投注所损失的金钱和时间而撒谎？</p>
    <p>6.	您是否曾被人批评您的赌博投注行为？</p>
    <p>7.	您是否曾撒谎，偷窃或借钱来下注或支付赌博投注所欠下的债务？</p>
    <p>8.	您是否不愿意在赌博投注之外花费任何的开销？</p>
    <p>9.	您是否由于赌博投注而失去对跟亲人或朋友联络的兴趣？</p>
    <p>10.	您是否在输钱后觉得必须要尽快返本？</p>
    <p>11.	您是否曾由于沮丧失落而赌博投注？</p>
    <p>12.	您是否曾觉得沮丧，甚至因为您的赌博投注而有自杀的念头？</p>
    <p>您的答案如若 "是" 的越多，有沉迷赌博娱乐问题的机会越高 ，那您便需要尽早寻求以下几种的援助方法。</p>
    <p><strong>自我禁止赌博</strong></p>
    <p>大多数的客户都能享受博彩所带来的激情和乐趣，只有极少数人过度沉迷赌博游戏投注，此类通常被视为问题赌徒。对于那些希望能控制自己沉迷赌博游戏的客户，黄金世纪提供了一种自我禁止赌博的方式，在客户的要求下，关闭其帐户最少1个月。在该禁赌期间 ，帐户不能重开，如客户想在禁赌期完满后重开帐户，那必须跟我们的客服联络。如欲参考有关此设施的资料，请联络我们的客户服务部。</p>
    <p><strong>限制自我赌博意愿</strong></p>
    <p>黄金世纪提供各种不同的限制自我赌博意愿的设施给用户，包括提供充值存款额度，投注额度和投注次数的限制等，使用户能限制自已每天，每周或每月内的充值存款或投注额度。上限可以随时被减低并立即生效，但如欲增加的话 ，那便会在申请的7天后才能生效.</p>
    <p><strong>限制未成年人进入赌博投注网站</strong></p>
    <p>黄金世纪建议及鼓励客户防止未成年人进入本网站。 ICRA（互联网内容评级委员会）是家庭网上安全协会组织的成员之一，并提供有关互联网安全的一般资讯和意见。您可以进入其网站www.fosi.org去查询更详细的信息。</p>
    <p>另外，我们还建议您安装过滤功能的相关软件。该软件能够帮助您限制未成年人上网。您可以进入www.saferinternet.org去查询关于这方面更多信息。 某些过滤软件例如在www.netnanny.com上的过滤软体亦能提供进一步的过滤保护。</p>
    <p><strong>限制未成年人赌博游艺</strong></p>
    <p>黄金世纪坚决不允许年未满 18岁的未成年人士在本网站上开设账户或进行赌博投注。黄金世纪对此责任相当严谨以及重视。黄金世纪保留要求用户提供年龄证明和检查的相关权利，以核实所提供的资料。用户的账号有可能会被暂停而帐户里的资金亦会暂时性地被冻结扣押，直至用户提供有效的年龄证明或其他相关文件。不同的国家对网上赌博游戏的合法年龄有所不同，如有疑问，我们建议您所在当地作进一步的查询和确认。</p>
    <p>为了避免非法赌博投注，我们可能会使用第三方去协助我们调查和核实您是否18岁或以上。同时，我们希望你能确保您的账户号码，帐户名称及密码保密以防止资料泄漏从而被滥用。</p>
    <p>请注意，任何人士未满 18岁而被发现使用本网站的话，我们将会把帐户里所有的奖金全部没收，并有可能向警方报案。</p>
    </div>
            </div>
        </div>
    </div>
    </div>

    <!--尾部-->
    <jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>