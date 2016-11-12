<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${ctx}/css/about.css" rel="stylesheet">
    <link href="${ctx}/css/about_partner.css" rel="stylesheet">
    <!--本页js-->
    <link href="${ctx}/plugin/easyResponsiveTabs.css" rel="stylesheet">
    <script src="${ctx}/plugin/easyResponsiveTabs.js"></script>
    <script src="${ctx}/plugin/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript">
        $(function(){
            //$(".registerform").Validform();  //就这一行代码！;
            $.Tipmsg.r=" ";//更改默认提示信息;
            $(".reg-form").Validform({
                tiptype:3
            });
            $(".login-form").Validform({
                tiptype:3
            });
        })

    </script>
</head>
<body>
<c:choose>
	<c:when test="${code == 0}">
	<script language="javascript" type="text/javascript">
			alert('<spring:message code="public.msg.proxy.registeredsuccessfully"/>');
	   </script>
	</c:when>
	<c:when test="${code == 1}">
	<script language="javascript" type="text/javascript">
			alert('<spring:message code="public.msg.accountAlreadyExists"/>');
	   </script>
	</c:when>
	<c:when test="${code == 2}">
	<script language="javascript" type="text/javascript">
			alert('<spring:message code="public.msg.accountFormatError"/>');
	   </script>
	</c:when>
	<c:when test="${code == 3}">
	<script language="javascript" type="text/javascript">
			alert('<spring:message code="public.msg.passwordLengthError"/>');
	   </script>
	</c:when>
	<c:when test="${code == 4}">
	<script language="javascript" type="text/javascript">
			alert('<spring:message code="public.msg.passwordFormatError"/>');
	   </script>
	</c:when>
	<c:when test="${code == 111}">
	<script language="javascript" type="text/javascript">
			alert('<spring:message code="public.msg.verificationCodeError"/>');
	   </script>
	</c:when>
	<c:when test="${code == 10004}">
	<script language="javascript" type="text/javascript">
			alert('<spring:message code="public.msg.loginAgentAccount"/>');
	   </script>
	</c:when>
	<c:when test="${code == null}">
	<script language="javascript" type="text/javascript">
	   </script>
	</c:when>
	<c:otherwise>
			  <script language="javascript" type="text/javascript">
			  		alert('<spring:message code="public.msg.registrationFailure"/>');
	  	  </script>
	</c:otherwise>
</c:choose>
<!--头部-->
<jsp:include page="../common/header.jsp"></jsp:include>

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
                    <li role="presentation" class="text-center"><a href="howqu.do"><spring:message code="public.howToWithdrawMoney"/></a></li>
                    <li role="presentation" class="text-center active"><a href="partner.do"><spring:message code="public.partners"/></a></li>
                </ul>
            </div>
            <div class="col-sm-10">


                <div id="partner">
                    <ul class="resp-tabs-list hor_1">
                        <li>代理登录</li>
                        <li>合作加盟</li>
                        <li>申请合作</li>
                        <li>联盟方案</li>
                    </ul>
                    <div class="resp-tabs-container hor_1">



                        <div>
                                <form class="login-form" method="post" action="${ctx}/login.do">
                                	<input type="hidden" name="loginType" value="1">
                                    <h2 class="login-header">登录</h2>
                                    <label for="accountno">
                                        <input type="text" value="" name="accountno" id="accountno" class="form-control" placeholder="代理账号" datatype="*" nullmsg="请输入代理帐号" errormsg="请输入代理帐号">
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <label for="password">
                                        <input type="password" value="" name="password" id="password" class="form-control" placeholder="登录密码" datatype="*6-16" nullmsg="请输入密码" errormsg="密码范围在6~16位之间">
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <label for="captcha">
                                        <input type="text" value="" name="captcha" id="captcha" class="form-control" placeholder="验证码" datatype="*4-4" nullmsg="请输入验证码" errormsg="验证码为4位">
                                        <img id="captchaObj" onclick="changeImg(this)" title="点击更换" src="${ctx }/xuan/loginCode.do"/>
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
                                </form>
                        </div>



                        <div>
                            <h2>专属客服团队</h2>
                            <p>我们专属的合作计划客服团队将为您提供各类专业的咨询并协助使用提供的管理系统，以便您在提供的申博太阳城产品中获取丰厚的佣金。</p>

                            <h2>提供专业管理系统</h2>
                            <p>我们提供丰富而全面的业务管理系统及报告功能，您可以更有效的管理自己的业务。我们更提供各类的广告支持与技术，让您得到更多的业务效益。</p>

                            <h2>最值得您信赖的品牌</h2>
                            <p>糅合最新的游戏技术﹑富吸引力的优惠活动﹑快速的支付系统﹑多样性的游戏选择和全天候的24/7的客服团队。加盟我们申博太阳城，马上让您成为世界最好线上博彩集团中的成员之一。</p>
                        </div>



                        <div>
								
                                <form class="reg-form" method="post" action="registerPartner.do">
                                	<input type="hidden" name="roleid" value="54">
                                    <h2 class="reg-header">注册</h2>
                                    <label for="username">
                                        <input type="text" value="" name="accountno" id="accountno" width="" class="form-control" placeholder="用户名(6~18个字符,包含字母/数字)" datatype="s6-18" errormsg="昵称至少6个字符,最多18个字符！">
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <label for="password">
                                        <input type="password" value="" name="password" id="password" class="form-control" placeholder="密码" datatype="/^[a-zA-Z]\w{5,15}$/" nullmsg="请设置密码！" errormsg="密码必须为6-16位，首位必须为字母！">
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <label for="password2">
                                        <input type="password" value="" name="cmfpassword" id="cmfpassword" class="form-control" placeholder="确认密码" datatype="*" recheck="password" nullmsg="请再输入一次密码！" errormsg="您两次输入的账号密码不一致！">
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <label for="captcha">
                                        <input type="text" value="" name="captcha" id="captcha" class="form-control" placeholder="验证码" datatype="*4-4"  nullmsg="请输入验证码！" errormsg="验证码错误！">
                                        <img id="imgObj2" onclick="changecaptcha(this)" title="点击更换" src="${ctx }/xuan/verifyCode.do" />
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <h2 class="reg-header"></h2>
                                    <label for="cashName">
                                        <input type="text" value="" name="cashName" id="cashName" class="form-control" placeholder="真实姓名" datatype="s2-18" errormsg="请输入真实姓名！">
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <label for="phone">
                                        <input type="text" value="" name="phone" id="phone" class="form-control" placeholder="手机号" datatype="*6-16" errormsg="请输入手机号！">
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <label for="email">
                                        <input type="email" value="" name="email" id="email" class="form-control" placeholder="邮箱" datatype="e" errormsg="请输入邮箱！">
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <label for="cashBankname">
                                        <input type="text" value="" name="cashBankname" id="cashBankname" class="form-control" placeholder="出款银行" datatype="s2-16" errormsg="请输入出款银行名称！">
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <label for="cashBankaccount">
                                        <input type="text" value="" name="cashBankaccount" id="cashBankaccount" class="form-control" placeholder="银行账号" datatype="s6-16" errormsg="请输入出款银行帐号！">
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <label for="cashBankname">
                                        <input type="text" value="" name="cashAddress" id="cashAddress" class="form-control" placeholder="开户行地址" datatype="s6-16" errormsg="请输入开户行地址！">
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <label>
                                        <input type="checkbox" value="" name="agree" datatype="*" errormsg="请接受条款！" nullmsg="请接受！"> 我已阅读并接受黄金世纪条款
                                        <div class="Validform_checktip"></div>
                                    </label>
                                    <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
                                </form>
                        </div>



                        <div>
                            <h2>联盟方案</h2>
                            <div class="txt">
                                <p><strong>一、黄金世纪线上娱乐对代理联盟的权利与义务</strong></p>
                                <p>黄金世纪线上娱乐的客服部会登记联盟的会员并会观察他们的投注状况。联盟及会员必须同意并遵守黄金世纪线上娱乐的会员条例，政策及操作程式。黄金世纪线上娱乐保留拒绝或冻结联盟/会员帐户权利</p>
                                <p>代理联盟可随时登入界面观察旗下会员的下注状况及会员在网站的活动概况。 黄金世纪线上娱乐的客服部会根据代理联盟旗下的会员计算所得的佣金。</p>
                                <p>黄金世纪线上娱乐保留可以修改合约书上的任何条例，包括:现有的佣金范围、佣金计划、付款程式、及参考计划条例的权力黄金世纪线上娱乐会以电邮、网站公告等方法通知代理联盟。代理联盟对于所做的修改有异议，代理联盟可选择终止合约，或洽客服人员反映意见。如修改后代理联盟无任何异议，便视作默认合约修改，代理联盟必须遵守更改后的相关规定。</p>
                                <p><strong>二、代理联盟对黄金世纪线上娱乐的权力及义务</strong></p>
                                <p>代理联盟应尽其所能，广泛地宣传、销售及推广黄金世纪线上娱乐使代理本身及黄金世纪线上娱乐的利润最大化。代理联盟可在不违反法律下，以正面形象宣传、销售及推广黄金世纪线上娱乐，并有责任义务告知旗下会员所有黄金世纪线上娱乐的相关优惠条件及产品。</p>
                                <p>代理联盟选择的黄金世纪线上娱乐推广手法若需付费，则代理应承担该费用。</p>
                                <p>任何黄金世纪线上娱乐相关资讯包括:标志、报表、游戏画面、图样、文案等，代理联盟不得私自复制、公开、分发有关材料，黄金世纪线上娱乐保留法律追诉权。如代理在做业务推广有相关需要，请随时洽黄金世纪线上娱乐</p>
                                <p><strong>三、规则条款</strong></p>
                                <p>各阶层代理联盟不可在未经黄金世纪线上娱乐许可情况下开设双/多个的代理帐号，也不可从黄金世纪线上娱乐帐户或相关人士赚取佣金。请谨记任何阶层代理不能用代理帐户下注，黄金世纪线上娱乐有权终止并封存帐号及所有在游戏中赚取的佣金。</p>
                                <p>为确保所有黄金世纪线上娱乐会员账号隐私与权益，黄金世纪线上娱乐不会提供任何会员密码，或会员个人资料。各阶层代理联盟亦不得以任何方式取得会员资料，或任意登入下层会员账号，如发现代理联盟有侵害黄金世纪线上娱乐会员隐私行为，黄金世纪线上娱乐有权取消代理联盟红利，并取消代理联盟账号。</p>
                                <p>代理联盟旗下的会员不得开设多于一个的帐户。黄金世纪线上娱乐有权要求会员提供有效的身份证明以验证会员的身份，并保留以IP判定是否重复会员的权利。如违反上述事项，黄金世纪线上娱乐有权终止玩家进行游戏并封存帐号及所有于游戏中赚取的佣金。</p>
                                <p>代理联盟不可为自己或其他联盟下的有效投注会员,只能是公司直属下的有效投注会员，代理每月需有5个下线有效投注（有效投注为每周至少上线3次进行正常投注），如有违反联盟协议黄金世纪线上娱乐有权终止并封存帐号及所有在游戏中赚取的佣金。</p>
                                <p>如代理联盟旗下的会员因为违反条例而被禁止享用黄金世纪线上娱乐的游戏，或黄金世纪线上娱乐退回存款给会员，黄金世纪线上娱乐将不会分配相应的佣金给代理联盟。如代理联盟旗下会员存款用的信用卡、银行资料须经审核，黄金世纪线上娱乐保留相关佣金直至审核完成。</p>
                                <p>合约内的条件会以黄金世纪线上娱乐通知接受代理联盟加入后开始执行。黄金世纪线上娱乐及代理联盟可随时终止此合约，在任何情况下，代理联盟如果想终止合约，都必须以书面/电邮方式提早于七日内通知黄金世纪线上娱乐。代理联盟的表现会3个月审核一次，如代理联盟已不是现有的合作成员则本合约书可以在任何时间终止。如合作伙伴违反合约条例，黄金世纪线上娱乐有权立即终止合约。</p>
                                <p>在没有黄金世纪线上娱乐许可下，代理联盟不能透露及授权黄金世纪线上娱乐相关资料，包括代理联盟所获得的回馈、佣金报表、计算等;代理联盟有义务在合约终止后仍执行机密档及资料的保密。</p>
                                <p>在合约终止后，代理联盟及黄金世纪线上娱乐将不须要履行双方的权利及义务。终止合约并不会解除代理联盟于终止合约前应履行的义务。</p>
                                <h3>合作加盟</h3>
                                <p>黄金世纪作为知名的在线博彩公司，提供最广范围并最具竞争力的产品。我们真诚为您打造最高档次合作平台，最好的代理加盟方案。八大加盟优势让您无法抗拒！</p>
                                <p>
                                    高达50%的代理佣金，让你轻松月入百万<br />
                                    零风险，高回报，每月准时出佣<br />
                                    优惠多多，满足各种类型玩家需求<br />
                                    提款快速金额不封顶，实力雄厚<br />
                                    营运多年，用户过万，深受玩家爱戴<br />
                                    拥有体育博彩与线上娱乐场执照，信誉保证<br />
                                    多年大力推广，品牌热度十足，代理可坐享广告品牌效应<br />
                                    数据信息详尽，可查阅下线投注记录<br />
                                </p>
                                <p>还等什么？马上加盟吧。注册加入，开始推广，赚取佣金，简单三步开始成就梦想之旅。</p>
                                <h3>代理申请</h3>
                                <p>请点击 [<a target="mem_index">代理注册</a>] 在线提出申请，填写正确的各项资料，邮箱，手机，名字必须写真实的，方便以后支付给您佣金，如果以后在支付佣金的时候发现资料错误，一律不给予支付佣金。</p>
                                <p>请代理注册成功之后，编辑您以后要领取彩金的银行帐号,银行用户名,代理帐号,发送到邮箱,我们进行绑定,每个月系统就会自动把佣金转到您提供的银行帐号上,请代理要 更改银行帐号的,必须提前一个星期联系在线客服进行修改，否则本公司一律不负责。黄金世纪会评估审核联盟申请讯息，3日内由专员与您联系开通，并提供您的註册帐号、密码及推广链接。</p>

                                <h3>代理佣金方案</h3>
                                <table border="1" cellspacing="0" cellpadding="0" width="699" style="width:524.25pt;">
                                    <tbody>
                                    <tr>
                                        <td rowspan="4">
                                            <p align="center" style="text-align:center;">
                                                当月营利
                                            </p>
                                        </td>
                                        <td rowspan="4">
                                            <p align="center" style="text-align:center;">
                                                当月最低有效会员
                                            </p>
                                        </td>
                                        <td colspan="3">
                                            <p align="center" style="text-align:center;">
                                                当月退佣比例
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                真人视讯
                                            </p>
                                        </td>
                                        <td rowspan="3">
                                            <p align="center" style="text-align:center;">
                                                体育投注
                                            </p>
                                        </td>
                                        <td rowspan="3">
                                            <p align="center" style="text-align:center;">
                                                彩票(有效交易额)
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                BB体育
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                电子游艺
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                1-50000
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                5或以上
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                30%
                                            </p>
                                        </td>
                                        <td rowspan="5">
                                            <p align="center" style="text-align:center;">
                                                10%
                                            </p>
                                        </td>
                                        <td rowspan="5">
                                            <p align="center" style="text-align:center;">
                                                0.1%
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                50001-300000
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                10或以上
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                35%
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                300001-800000
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                30或以上
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                40%
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                800001-1000000
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                50或以上
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                45%
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                1000001以上
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                100或以上
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                50%
                                            </p>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <p>请谨记任何使用不诚实方法以骗取佣金将会永久冻结账户，佣金一律不予发还！</p>
                                <p><strong>回馈/佣金计算</strong></p>
                                <p>请注意：<br /><br />
                                    视讯、球类、机率等项目，以报表中【派彩】字段，扣除相应费用后，依照上表门坎 X 佣金百分比。<br />
                                    彩票项目以报表中【实际投注】字段，扣除相应费用后 X 0.1% 佣金百分比。<br />
                                    当月联盟体系【派彩/投注量/总额公点金额】，依照：视讯、球类、机率、彩票等顺序扣除相应费用。<br />
                                    相应费用包括：会员各项优惠、存/取款相应费用(请留意：会员重复出款￥手续费/未达100%投注出款的手续费由会员吸收，不纳入计算)。<br /><br />
                                    ＊【当月最低有效会员】定义为，在月结区间内进行过最少1000RMB有效下注的会员，如联盟体系当月未达【当月最低有效会员】最低门坎5人，则该月无法领取佣金回馈。联盟体系当月营利达到标准，而【当月最低有效会员】人数未达相应最低门坎，则该月佣金比例依照【当月最低有效会员】人数所达门坎相应的百分比进行退佣。<br /><br />
                                    例：<br />
                                    体系当月营利为￥200001，而当月有效会员人数为5人，联盟虽达到营利为￥200001，却未达到有效会员10人以上，故依照联盟有效会员人数5人的门坎的退佣比例核算。<br />
                                    <br />
                                    黄金世纪注册于澳门，是亚洲最具规模且成长最快的在线娱乐场之一，提供刺激好玩的真人荷官娱乐场，快乐彩，体育博彩，娱乐场老虎机，虚拟游戏，和扑克游戏等。拥有 Cagayan Economic Zone Authority 体育博彩与娱乐场公司执照。<br />
                                    <br />
                                    黄金世纪作为知名的在线博彩公司，提供最广范围并最具竞争力的产品。
                                </p>

                                <table border="1" cellspacing="0" cellpadding="0" width="645" style="width:483.75pt;">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                视讯
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                球类
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                机率
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                彩票
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                体育投注
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                30%
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                30%
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                30%
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                0.1%
                                            </p>
                                        </td>
                                        <td>
                                            <p align="center" style="text-align:center;">
                                                10%
                                            </p>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                                <p>联盟体系当月最低有效会员达12人，当月派彩：视讯￥300000，球类￥-120000，机率￥20000，彩票有效投注￥800000。如联盟体系当月相应费用统计为￥14000，则佣金计算方式为：<br />
                                    <br />
                                    当月佣金计算：<br />
                                    (总派彩金额￥200000，退佣百分比为35%)<br />
                                    彩票比例佣金 - ￥14000 相应费用 = ￥-13200<br />
                                    (￥-13200 佣金 + ￥派彩金额200000）x 35% 返点百分比 = ￥65380 总退佣金额<br />
                                    *佣金百分比，依未扣除相应费用前之"总派彩"金额为准。<br />
                                    *假若本月可获得佣金为负数﹐ 派彩及费用将会带到下个月继续累计至可获得佣金为正数并高於￥500即可领取。<br />
                                    <br />
                                    回馈/佣金支付<br />
                                    联盟佣金计算，结算区间为本月第一个礼拜一至下月第一个礼拜一前的周日，将会员盈利，以联盟方案分红公式计算，扣除联盟体系会员相应的优惠、行政费用后，佣金由代理客服于每个月的第一个礼拜四开始与代理核对佣金后，在每个月的第一个礼拜日以前将佣金直接汇入代理联盟指定之银行帐号。
                                </p>
                            </div>
                        </div>


                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!--尾部-->
<jsp:include page="../common/footer.jsp"></jsp:include>



<!--Plugin Tabs-->
<script type="text/javascript">
    $(document).ready(function() {
        //Horizontal Tab
        $('#partner').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
    
    
</script>

<script language="javascript" type="text/javascript">
function changecaptcha(obj){     
    var imgSrc = $(obj);     
    var src = imgSrc.attr("src");
    var ImgUrl = src.split("?");
    var timestamp = (new Date()).valueOf();
    var url = ImgUrl[0] + "?timestamp=" + timestamp;  
    imgSrc.attr("src", url);     
}   
</script>

</body>
</html>