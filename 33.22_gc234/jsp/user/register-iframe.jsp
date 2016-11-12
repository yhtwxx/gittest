<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- 引用公用头部文件（包含公用css和公用js） -->
    <jsp:include page="../common/common_lang.jsp" />

    <link rel="stylesheet" href="css/main.css?20150505" />
    <link rel="stylesheet" href="css/register.css?20150505" />
    <style>
        #wrapper{background:none;}
        /*html{filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);-webkit-filter: grayscale(100%); -moz-filter: grayscale(100%); -o-filter: grayscale(100%);}*/
        #owl-demo .item img{
            display: block;
            width: 100%;
            height: auto;
        }
        .owl-buttons{display: none}
        .owl-theme .owl-controls {
            position: absolute;
            bottom: 10px;
            right: 400px;
        }
    </style>
</head>

<body>
<div id="wrapper">
    <!--[if lt IE 9]>
    <div class="browser-updatetips">
        <div class="mw">
            系统检测到您浏览器版本太低，黑客容易利用其植入木马或病毒，从而对您的游戏体验和资金管理构成威胁。建议您下载&nbsp;<a href="http://chrome.360.cn/" target="_blank" class="brow">360极速浏览器</a>，并保持打开右上角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;极速模式
            <div class="speed"></div>
            <span></span>
        </div>
    </div>
    <![endif]-->

    <div id="content" class="rgs_c">
        <div class="rgs_form">
            <div class="rgs_f_top">
                <div class="rgsf_t_title"><spring:message code="register.title" /></div>
                <div class="rgsf_t_note"><spring:message code="register.described" /></div>
            </div>
            <div id="rgs_form">
                <form action="register_action.do" id="signupForm" method="post" onsubmit="change()">
                    <input name="autoLogin" id="autoLogin" type="hidden" value="${autoLogin }" />
                    <div class="rgs_f_ctn" style="float: left;">
                        <div class="rgs_f_item">
                            <div class="rgs_f_lb"><span style="color: red">*</span><spring:message code="public.username" />：</div>
                            <div class="rgs_f_ipt">
                                <input type="text" name="accountno" id="accountno" value="" tabindex="1" maxlength="15" placeholder="" autocomplete="off" data-val="true" data-val-required="用户名不能为空" data-val-enlength-range="[2,15]" data-val-enlength="用户名长度必须是2-15位" data-val-regex="英文或数字组成(首位不为0)" data-val-regex-pattern="^[a-zA-Z1-9][a-zA-Z0-9]+$" />
                                <!-- <div class="input-valid-tip">
                                    <span class="" data-valvalid-for="accountno"></span>
                                </div> -->
                                <div class="input-tips" data-for="accountno">
                                    <span class="logo-sj1"></span>
                                    <span class="f-tips" data-valmsg-for="accountno">第一印象很重要，起个响亮的名号吧</span>
                                </div>

                            </div>
                        </div>

                        <div class="rgs_f_item">
                            <div class="rgs_f_lb"><span style="color: red">*</span><spring:message code="public.password" />：</div>
                            <div class="rgs_f_ipt">
                                <input type="password" name="password" id="password_" value="" tabindex="1" maxlength="20" placeholder="" autocomplete="off" data-val="true" data-val-required="密码不能为空" data-val-length-min="6" data-val-length-max="20" data-val-length="密码长度6～20个字符" />
                                <!-- <div class="input-valid-tip">
                                    <span class="" data-valvalid-for="password"></span>
                                    <span class="pwd-strong"></span>
                                </div> -->
                                <div class="input-tips" data-for="password">
                                    <span class="logo-sj1"></span>
                                    <span class="f-tips" data-valmsg-for="password">最短6个字符，区分大小写哦</span>
                                </div>
                            </div>
                        </div>

                        <div class="rgs_f_item">
                            <div class="rgs_f_lb"><span style="color: red">*</span><spring:message code="public.confirmPassword" />：</div>
                            <div class="rgs_f_ipt">
                                <input type="password" name="cmfpassword" id="cmfpassword" maxlength="20" value="" tabindex="1" placeholder="" autocomplete="off" data-val="true" data-val-required="此处不能为空" data-val-equalto="密码不一致，请注意大小写" data-val-equalto-other="password" />
                                <!-- <div class="input-valid-tip">
                                    <span class="" data-valvalid-for="cmfpassword"></span>
                                </div> -->
                                <div class="input-tips" data-for="cmfpassword">
                                    <span class="logo-sj1"></span>
                                    <span class="f-tips" data-valmsg-for="cmfpassword">与上次输入密码一致</span>
                                </div>
                            </div>
                        </div>

                        <div class="rgs_f_item">
                            <div class="rgs_f_lb"><span style="color: red">*</span><spring:message code="public.cashPassword" />：</div>
                            <div class="rgs_f_ipt">
                                <input type="password" name="cashPasswd" id="cashPasswd" value="" tabindex="1" maxlength="15" placeholder="" autocomplete="off" data-val="true" data-val-required="取现密码不能为空" data-val-enlength-range="[2,15]" data-val-enlength="用户名长度必须是2-15位" data-val-regex="英文或数字组成(首位不为0)" data-val-regex-pattern="^[a-zA-Z1-9][a-zA-Z0-9]+$" />
                                <!-- <div class="input-valid-tip">
                                    <span class="" data-valvalid-for="cashPasswd"></span>
                                </div> -->
                                <div class="input-tips" data-for="cashPasswd">
                                    <span class="logo-sj1"></span>
                                    <span class="f-tips" data-valmsg-for="cashPasswd"></span>
                                </div>
                            </div>
                        </div>

                        <%-- <div class="rgs_f_item">
                        <div class="rgs_f_lb"><span style="color: red">*</span><spring:message code="public.phone" />：</div>
                        <div class="rgs_f_ipt">
                            <input type="text" name="phone" id="phone" value="" tabindex="1" maxlength="15" placeholder="" autocomplete="off" data-val="true" data-val-required="联系电话不能为空" data-val-enlength-range="[2,15]" data-val-enlength="用户名长度必须是2-15位" data-val-regex="英文或数字组成(首位不为0)" data-val-regex-pattern="^[a-zA-Z1-9][a-zA-Z0-9]+$" />
                            <!-- <div class="input-valid-tip">
                                <span class="" data-valvalid-for="phone"></span>
                            </div> -->
                            <div class="input-tips" data-for="phone">
                                <span class="logo-sj1"></span>
                                <span class="f-tips" data-valmsg-for="phone"></span>
                            </div>
                        </div>
                    </div> --%>

                        <div class="rgs_f_item">
                            <div class="rgs_f_lb"><span style="color: red">*</span><spring:message code="public.verificationCode" />：</div>
                            <div class="rgs_f_ipt">
                                <input type="text" name="captcha" id="captcha" value="" tabindex="1" maxlength="4" placeholder='<spring:message code="public.verificationCode" />' autocomplete="false" data-val="true" data-val-required="请填写验证码" data-val-remote="验证码有误" />
                                <!-- <div class="input-valid-tip">
                                    <span class="" data-valvalid-for="captcha"></span>
                                </div> -->
                                <div class="input-tips" data-for="captcha">
                                    <span class="logo-sj1"></span>
                                    <span class="f-tips" data-valmsg-for="captcha">输入验证码</span>
                                </div>

                                <div class="vc-img" id="captcha-img"><img id="imgObj" onclick="changeImg()" title='<spring:message code="public.clickReplacement" />' src="${ctx }/xuan/verifyCode.do" />
                                    <a href="javascript:changeImg()"><spring:message code="public.changeImg" /></a>
                                </div>
                                <!-- <div class="btn-refresh" id="captcha-refresh"></div> -->
                            </div>
                        </div>
                    </div>

                    <div class="rgs_f_ctn" style="float: right;">

                        <div class="rgs_f_item">
                            <div class="rgs_f_lb"><spring:message code="public.recommended" />：</div>
                            <div class="rgs_f_ipt">
                                <c:choose>
                                    <c:when test="${empty onlineCode}">
                                        <input type="text" class="disabled" name="onlineCode" id="onlineCode" value="" tabindex="1" maxlength="15" placeholder="" autocomplete="off" data-val="true" readonly="readonly" />
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" name="onlineCode" id="onlineCode" value="${onlineCode}" tabindex="1" maxlength="15" placeholder="" autocomplete="off" data-val="true" readonly="readonly" />
                                    </c:otherwise>
                                </c:choose>
                                <!-- <div class="input-valid-tip">
                                    <span class="" data-valvalid-for="onlineCode"></span>
                                </div> -->
                                <div class="input-tips" data-for="onlineCode">
                                    <span class="logo-sj1"></span>
                                    <span class="f-tips" data-valmsg-for="onlineCode"></span>
                                </div>
                            </div>
                        </div>

                        <div class="rgs_f_item">
                            <div class="rgs_f_lb"><spring:message code="public.email" />：</div>
                            <div class="rgs_f_ipt">
                                <input type="text" name="email" id="email" value="" tabindex="1" autocomplete="off" placeholder="" autocomplete="off" data-val="true" data-val-required="邮箱不能为空" data-val-email="邮箱格式有误，例ued@163.com"/>
                                <!-- <div class="input-valid-tip">
                                    <span class="" data-valvalid-for="email"></span>
                                </div> -->
                                <div class="input-tips" data-for="email">
                                    <span class="logo-sj1"></span>
                                    <span class="f-tips" data-valmsg-for="email">忘记密码时可用注册邮箱找回哦</span>
                                </div>
                            </div>
                        </div>

                        <div class="rgs_f_item">
                            <div class="rgs_f_lb"><spring:message code="public.bankName" />：</div>
                            <div class="rgs_f_ipt">
                                <input type="text" name="cashBankname_" id="cash_bankname" value="" tabindex="1" placeholder="" autocomplete="off" data-val="true" data-val-required="银行名称不能为空" data-val-enlength-range="[2,15]" data-val-enlength="用户名长度必须是2-15位" data-val-regex="英文或数字组成(首位不为0)" data-val-regex-pattern="^[a-zA-Z1-9][a-zA-Z0-9]+$" />
                                <input type="hidden" name="cashBankname" id="cashBankname" />
                                <!-- <div class="input-valid-tip">
                                    <span class="" data-valvalid-for="cash_bankname"></span>
                                </div> -->
                                <div class="input-tips" data-for="cash_bankname">
                                    <span class="logo-sj1"></span>
                                    <span class="f-tips" data-valmsg-for="cash_bankname"></span>
                                </div>
                            </div>
                        </div>

                        <div class="rgs_f_item">
                            <div class="rgs_f_lb"><spring:message code="public.bankNumber" />：</div>
                            <div class="rgs_f_ipt">
                                <input type="text" name="cashBankaccount" id="cash_bankaccount" value="" tabindex="1" placeholder="" autocomplete="off" data-val="true" data-val-required="取现人不能为空" data-val-enlength-range="[2,15]" data-val-enlength="用户名长度必须是2-15位" data-val-regex="英文或数字组成(首位不为0)" data-val-regex-pattern="^[a-zA-Z1-9][a-zA-Z0-9]+$" />
                                <!-- <div class="input-valid-tip">
                                    <span class="" data-valvalid-for="cash_bankaccount"></span>
                                </div> -->
                                <div class="input-tips" data-for="cash_bankaccount">
                                    <span class="logo-sj1"></span>
                                    <span class="f-tips" data-valmsg-for="cash_bankaccount"></span>
                                </div>
                            </div>
                        </div>

                        <%-- <div class="rgs_f_item">
                        <div class="rgs_f_lb"><span style="color: red">*</span><spring:message code="public.name" />：</div>
                        <div class="rgs_f_ipt">
                            <input type="text" name="cashName_" id="cashName" value="" tabindex="1" placeholder="" autocomplete="off" data-val="true" data-val-required="取现人不能为空" data-val-enlength-range="[2,15]" data-val-enlength="用户名长度必须是2-15位" data-val-regex="英文或数字组成(首位不为0)" data-val-regex-pattern="^[a-zA-Z1-9][a-zA-Z0-9]+$" />
                            <input type="hidden" name="cashName" id="cashName1" />
                            <!-- <div class="input-valid-tip">
                                <span class="" data-valvalid-for="cashName"></span>
                            </div> -->
                            <div class="input-tips" data-for="cashName_">
                                <span class="logo-sj1"></span>
                                <span class="f-tips" data-valmsg-for="cashName_"></span>
                            </div>
                        </div>
                    </div> --%>

                        <div class="rgs_f_item">
                            <div class="rgs_f_lb"><spring:message code="public.bankAddress" />：</div>
                            <div class="rgs_f_ipt">
                                <input type="text" name="cashAddress_" id="cash_address" value="" tabindex="1" placeholder="" autocomplete="off" data-val="true" data-val-required="开户行地址不能为空" data-val-enlength-range="[2,15]" data-val-enlength="用户名长度必须是2-15位" data-val-regex="英文或数字组成(首位不为0)" data-val-regex-pattern="^[a-zA-Z1-9][a-zA-Z0-9]+$" />
                                <input type="hidden" name="cashAddress" id="cashAddress" />
                                <!-- <div class="input-valid-tip">
                                    <span class="" data-valvalid-for="cash_bankaccount"></span>
                                </div> -->
                                <div class="input-tips" data-for="cash_bankaccount">
                                    <span class="logo-sj1"></span>
                                    <span class="f-tips" data-valmsg-for="cash_bankaccount"></span>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="clear"></div>
                    <button class="btn-blue rgs_btn_mrg" id="btn-submit"><spring:message code="public.openAccount" /></button>
                    <div class="rgs_txt">
                        <spring:message code="register.remarks" />
                        <a href="#"><spring:message code="public.userProtocol" /></a>
                        <spring:message code="public.and" />
                        <a href="#"><spring:message code="public.privacyClause" /></a>
                    </div>
                </form>
            </div>

        </div>
        <div class="rgs_f_btm"></div>

    </div>

    <script type="text/javascript" src="js/jquery.validate.js?1203"></script>
    <script type="text/javascript" src="js/jquery.mailAutoComplete-4.0.js?1220"></script>
    <script type="text/javascript" src="js/register.js?1203"></script>

    <c:choose>
        <c:when test="${code == 0}">
            <script language="javascript" type="text/javascript">
                alert('<spring:message code="public.msg.registeredSuccess" />');
            </script>
        </c:when>
        <c:when test="${code == 1}">
            <script language="javascript" type="text/javascript">
                alert('<spring:message code="00001" />');
            </script>
        </c:when>
        <c:when test="${code == 2}">
            <script language="javascript" type="text/javascript">
                alert('<spring:message code="00002" />');
            </script>
        </c:when>
        <c:when test="${code == 3}">
            <script language="javascript" type="text/javascript">
                alert('<spring:message code="00003" />');
            </script>
        </c:when>
        <c:when test="${code == 4}">
            <script language="javascript" type="text/javascript">
                alert('<spring:message code="00004" />');
            </script>
        </c:when>
        <c:when test="${code == 5}">
            <script language="javascript" type="text/javascript">
                alert('<spring:message code="00005" />');
            </script>
        </c:when>
        <c:when test="${code == 111}">
            <script language="javascript" type="text/javascript">
                alert('<spring:message code="public.msg.verificationCodeError" />');
            </script>
        </c:when>
        <c:when test="${code == null}">
            <script language="javascript" type="text/javascript">
            </script>
        </c:when>
        <c:otherwise>
            <script language="javascript" type="text/javascript">
                alert('<spring:message code="public.msg.registrationFailure" />');
            </script>
        </c:otherwise>

    </c:choose>

    <script language="javascript" type="text/javascript">
        function changeImg(){
            var imgSrc = $("#imgObj");
            var src = imgSrc.attr("src");
            imgSrc.attr("src",chgUrl(src));
        }

        function chgUrl(url){
            url = url.split("?");
            var timestamp = (new Date()).valueOf();
            url=url[0] + "?timestamp=" + timestamp;
            return url;
        }
    </script>
    <script type="text/javascript">
        function change(){
            var cashBankname=encodeURI($("#cash_bankname").val());
            $("#cashBankname").val(cashBankname);
            var cashName=encodeURI($("#cashName").val());
            $("#cashName1").val(cashName);
            var cashAddress=encodeURI($("#cash_address").val());
            $("#cashAddress").val(cashAddress);
        }
    </script>
</body>
</html>