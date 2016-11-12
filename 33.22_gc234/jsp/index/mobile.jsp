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
    <jsp:include page="../common/common_lang.jsp"/>
    <!--本页css-->
    <link href="${ctx}/css/about.css" rel="stylesheet">
    <link href="${ctx}/css/about_mobile.css" rel="stylesheet">
    <!--本页js-->
    <link href="${ctx}/plugin/easyResponsiveTabs.css" rel="stylesheet">
    <script src="${ctx}/plugin/easyResponsiveTabs.js"></script>
    <script src="${ctx}/plugin/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript">
        $(function () {
            //$(".registerform").Validform();  //就这一行代码！;
            $.Tipmsg.r = " ";//更改默认提示信息;
            $(".reg-form").Validform({
                tiptype: 3
            });
            $(".login-form").Validform({
                tiptype: 3
            });
        })

    </script>

</head>
<body>
<c:choose>
    <c:when test="${code == 0}">
        <script language="javascript" type="text/javascript">
            alert('<spring:message code="public.msg.registeredSuccess"/>');
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
    <div class="container padding-0" style="margin:10px auto;">


        <div id="partner">
            <ul class="resp-tabs-list hor_1">
                <li>网页客户端</li>
                <li>GC客户端</li>
                <li>AG客户端</li>
                <li>PT客户端</li>
                <li>欧博客户端</li>
            </ul>
            <div class="resp-tabs-container hor_1">


                <div>
                    <div class="head"><img src="${ctx}/img/mobile/banner1.jpg"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-title">方法一：二维码下载</div>
                            <div class="col-content">
                                <p><img src="http://img.2bai.com.cn/appimg/logosimage/1200/qrcode_2016_08_24_17_38_025.png" width="152px" height="152px"></p>
                                <p class="col-bg">在安卓手机上打开QQ软件或微信软件，点击“扫一扫”并将手机对准以上“二维码”按照系统提示进行下载即可。</p>
                                <p><img src="${ctx}/img/mobile/wechat-qr.jpg"></p>
                            </div>
                            <span class="brdr1"></span>
                        </div>
                        <!--div class="col-md-4">
                            <div class="col-title">方法二：下载到手机</div>
                            <div class="col-content">
                                <p><img src="${ctx}/img/mobile/m-dl.png"></p>
                                <p class="col-bg">通过手机访问 m.gc234.com 或其它官方域名，点击”立即安装APP”</p>
                                <p><img src="${ctx}/img/mobile/install.jpg"></p>
                            </div>
                            <span class="brdr2"></span>
                        </div-->
                        <div class="col-md-6">
                            <div class="col-title">方法二：下载到电脑</div>
                            <div class="col-content">
                                <p><img src="${ctx}/img/mobile/pc-dl.png"></p>
                                <p class="col-bg">点击下载按钮将安装包下载到您的电脑，然后通过数据线将安装包安装到您的手机</p>
                                <p><a href="${ctx}/app/appbet.apk" target="_blank"><img
                                        src="${ctx}/img/mobile/pc-dl-btn.png" alt="点击下载"></a></p>
                            </div>
                        </div>
                    </div>
                </div>


                <div>
                    <div style="margin-left: auto; margin-right: auto; width: 100%; height: 950px; background-image: url(${ctx}/img/mobile/gc.jpg); background-size: 100%; background-repeat: no-repeat;">
                        <img id="qrcode" src="http://liveapi1.gc-links.net/images/qr/${apiCode}/android-download.png" style="margin-top: 35%;margin-left: 60%;width: 200px;"><br>
                        <span style="margin-left:60%;font-size:14px;color:#fff">扫二维码，下载GC安卓客户端</span><br><br>
                    </div>
                </div>


                <div>
                    <div style="margin-left: auto; margin-right: auto; width: 100%; height: 950px; background-image: url(${ctx}/img/mobile/ag.png); background-size: 100%; background-repeat: no-repeat;">
                        <img src="${ctx}/img/mobile/ag-qr-code.png"
                             style="margin-top: 35%;margin-left: 60%;width: 200px;"><br>
                        <span style="margin-left:60%;font-size:14px;">扫二维码，下载AG手机客户端</span><br><br>
                    </div>
                </div>


                <div>
                    <div class="head"><img src="${ctx}/img/mobile/banner-pt.jpg"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-title">PT电子 安卓版</div>
                            <div class="col-content">
                                <p><img src="${ctx}/img/mobile/qr-code-ptgame.jpg"></p>
                            </div>
                            <span class="brdr1" style="height: 172px;"></span>
                        </div>
                        <div class="col-md-6">
                            <div class="col-title">PT真人 安卓版</div>
                            <div class="col-content">
                                <p><img src="${ctx}/img/mobile/qr-code-ptlive.jpg"></p>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <p class="col-bg" style="width: 836px;">
                                在安卓手机上打开QQ软件或微信软件，点击“扫一扫”并将手机对准以上“二维码”按照系统提示进行下载即可。<br><br>
                                <strong>登录PT手机客户端提示：</strong><br><br>
                                用户在登录PT手机客户端时，登录用户名需加上前缀，前缀为“gcgcgc_”,例如网站用户名为：test123，登陆PT手机客户端时用户名为：gcgcgc_test123<br><br>
                                <strong>请注意：</strong>PT手机客户端登陆密码不是用户网站登陆密码，PT手机客户端登陆密码请前往 个人中心 >> 密码管理 >>
                                第三方手机登录密码，进行查看。</p>
                        </div>
                        <div class="col-md-12">
                            <p class="col-bg" style="width: 836px;">
                                Open QQ or Wechat software on Android phones, click on the "Scan QR Code". After
                                scanning the above QR code, follow the system prompt to download accordingly.<br><br>
                                <strong>PT mobile client login prompt:</strong><br><br>
                                When a user login to PT mobile client, a prefix “gcgcgc_”is required to be added in
                                front of the user name. For example: If your user name is “test123”, so when you login,
                                your user name should be: “gcgcgc_test123”.
                                <br><br>
                                <strong>Please Note:</strong>PT mobile client login password is not a website user login
                                password. To view PT mobile client login password, please visit Personal Center >>
                                Password Management >> Third-party mobile password management password.</p>
                        </div>
                    </div>
                </div>


                <div>
                    <div class="head"><img src="${ctx}/img/mobile/banner-allbet.jpg"></div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-title">欧博 安卓&苹果 客户端</div>
                            <div class="col-content">
                                <p><img src="${ctx}/img/mobile/qr-code-allbet.jpg"></p>
                                <p class="col-bg" style="width: 836px;">
                                    在安卓或苹果手机上打开QQ软件或微信软件，点击“扫一扫”并将手机对准以上“二维码”按照系统提示进行下载即可。<br><br>
                                    <strong>登录欧博手机客户端提示：</strong><br><br>
                                    用户在登录欧博手机客户端时，登录用户名需加上前缀和后缀，前缀为“gcgc”,后缀为“hjs”,例如网站用户名为：test123，登陆欧博手机客户端时用户名为：gcgctest123hjs<br><br>
                                    <strong>请注意：</strong>欧博手机客户端登陆密码不是用户网站登陆密码，欧博手机客户端登陆密码请前往个人中心 >> 密码管理 >>
                                    第三方手机登录密码，进行查看。</p>
                                <p class="col-bg" style="width: 836px;">
                                    Open QQ or Wechat software on Android or IOS phones, click on the "Scan QR Code".
                                    After scanning the above QR code, follow the system prompt to download
                                    accordingly.<br><br>
                                    <strong>Allbet mobile client login prompt:</strong><br><br>
                                    When a user login to Allbet mobile client, a front prefix “gcgc”and a back prefix
                                    “hjs” is required.  
                                    For example: If your user name is “test123”, so when you login, your user name
                                    should be: “gcgctest123hjs”.<br><br>
                                    <strong>Please Note:</strong>Allbet mobile client login password is not a website
                                    user login password. To view Allbet mobile client login password, please visit
                                    Personal Center >> Password Management >> Third-party mobile password management
                                    password.</p>
                            </div>
                            <span class="brdr1"></span>
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
    $(document).ready(function () {
        //Horizontal Tab
        $('#partner').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
</script>

</body>
</html>