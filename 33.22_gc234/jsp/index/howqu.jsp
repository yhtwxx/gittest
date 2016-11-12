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
                    <li role="presentation" class="text-center"><a href="howcun.do"><spring:message code="public.howToDeposit"/></a></li>
                    <li role="presentation" class="text-center active"><a href="howqu.do"><spring:message code="public.howToWithdrawMoney"/></a></li>
                    <li role="presentation" class="text-center"><a href="partner.do"><spring:message code="public.partners"/></a></li>
                </ul>
            </div>
            <div class="col-sm-10">
    <h2>如何取款</h2>
<div class="txt">

    <h3>取款方法</h3>

    <p>1.会员登入后点选”取款”。</p>
    <p>2.输入取款密码，确认取款人姓名与您银行账号持有人相符。</p>
    <p>3.输入出款额度，以及有效的手机号码，如有任何问题，请您联系黄金世纪线上娱乐在线客服，我们将在第一时间为您解答问题。</p>
    <p>4.确认取款银行账号正确。</p>
    <p>5.选择公司金流方式出款：</p>

    <p>绑定工商银行(优先)、农业银行、建设银行、招商银行、中国银行、交通银行、中信银行、光大银行、华夏银行、民生银行、广东发展银行、深圳发展银行、邮政储蓄、农村信用合作社为出款银行的会员，取款￥1000000RMB以内，可24小时提出申请，并享受2小时内到帐。</p>

    <h3>取款需知</h3>

    <p>1.黄金世纪线上娱乐最低取款为￥100人民币，单笔最高取款上限￥1,000,000人民币。</p>
    <p>2.会员可在24小时内享有取款￥1,000,000人民币内2小时内到帐，申请取款额度超过￥1,000,000人民币，或距离上次出款未达24小时重复申请者，审核之后如无问题3小时内到帐。</p>
    <p>3.完成全额有效投注，全天24小时不限次数取款，手续费全免。</p>

    <p>黄金世纪线上娱乐保留权利审核会员账户，若由上次出款起，有效下注金额未达“最后一次入款后账户的总余额”，而申请出款者，公司将收取“最后一次入款后账户的总余额”10%的行政费用，附加手续费50元。</p>

    <p>【例1】1月1日 12:00当下额度￥1000,并在存入3000元,则在1月1日 12:00后,有效投注额必须为(1000+3000)以上出款,才不被扣除行政费用。</p>
    <p>【例2】若有效投注未达到(1000+3000)元,则会扣除行政费用(1000+3000)x10%+手续费50元 =须被扣除450元</p>
    <p>**请注意: 各游戏和局/未接受/取消注单，不纳入有效投注计算。 运动博弈游戏项目，大赔率玩法计算有效投注金额，小赔率玩法计算输赢金额为有效投注。**大赔率产品包括: 过关、波胆、总入球、半全场、双胜彩、冠军赛。</p>
    <p>**如有任何问题，请洽谈‘24小时在线客服’。</p>

    <p>**黄金世纪线上娱乐相关优惠，请详见‘优惠活动’</p>
</div>
            </div>
        </div>
    </div>
    </div>

    <!--尾部-->
    <jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>