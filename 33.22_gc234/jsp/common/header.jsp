<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
    <!--顶部开始-->
    <nav class="topbar topbar-inverse">
        <div class="container">
            <div class="topbar-header">
                GMT +8 <span id="time">2015-7-17 18:16:27</span>
            </div>
            <div class="header-lang fleft">
                <div class="flag" id="current-lang">
                    <span class="lzhcn"></span>
                </div>
                <!-- 语言切换 start -->
                <div class="lang-switch" id="langSwitch" style="display: none;">
                    <div class="triangle"></div>
                    <ul>
                        <li>
                            <a href="?locale=zh_CN">
								<span class="flag">
									<span class="lzhcn"></span>
								</span>简体中文
                            </a>
                        </li>
                        <!-- <li>
                            <a href="?lang=zh-tw">
                            <span class="flag">
                                <span class="lzhtw"></span>
                            </span>繁体中文
                            </a>
                        </li> -->
                        <li>
                            <a href="?locale=en_US">
								<span class="flag">
									<span class="lengb"></span>
								</span>English
                            </a>
                        </li>
                        <!-- <li>
                            <a href="?lang=vi-vn">
                            <span class="flag">
                                <span class="lvivn"></span>
                            </span>Việt Nam
                            </a>
                        </li> -->
                    </ul>
                </div>
            </div>
            <!-- 语言切换 end -->

            <div class="topbar-collapse collapse clearfix" id="headerLogin">
                <form class="topbar-form topbar-right" action="${ctx}/login.do" method="post" id="loginForm" onsubmit="return checkLogin()">
                    <!-- <input name="ioBB" id="ioBB" type="hidden" /> 
<input name="sbmt" id="sbmt" type="hidden" value="1" /> -->
                    <div class="form-group">
                        <input type="text" placeholder='<spring:message code="public.username"/>' class="form-control" id="accountno" name="accountno">
                        <!--<a type="btn" class="btn btn-forget">忘记？</a>-->
                        <div class="popover bottom">
                            <div class="arrow"></div>
                            <div class="popover-content">
                                <p style="margin: 0px; padding: 5px; color: red;"></p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="password" placeholder='<spring:message code="public.password"/>' class="form-control" id="password" name="password">
                        <!--<a type="btn" class="btn btn-forget">忘记？</a>-->
                        <div class="popover bottom">
                            <div class="arrow"></div>
                            <div class="popover-content">
                                <p style="margin: 0px; padding: 5px; color: red;"></p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" placeholder='<spring:message code="public.verificationCode"/>' class="form-control" name="captcha" id="captcha" maxlength="4" style="width: 80px;">
                        <div class="popover bottom">
                            <div class="arrow"></div>
                            <div class="popover-content">
                                <p style="margin: 0px; padding: 5px; color: red;"></p>
                            </div>
                        </div>
                        <img id="imgObj" onclick="changeImg(this)" title='<spring:message code="public.clickReplacement"/>' src="${ctx }/xuan/loginCode.do" style="width: 80px;" />
                    </div>
                    <button class="btn btn-login" id="btn-login"><spring:message code="public.login"/></button>
                    <a type="btn" class="btn btn-reg" href="${ctx}/register.do"><spring:message code="public.registered"/></a> <a type="btn" class="btn btn-try" onclick="openStaticTryCode('<spring:message code="public.dome"/>')"><spring:message code="public.dome"/></a> <a class="btn btn-ck" onclick="isLogin()"><spring:message code="public.deposit"/></a> <a class="btn btn-qk" onclick="isLogin()"><spring:message code="public.withdrawal"/></a> <a type="btn" class="btn btn-kefu"><spring:message code="public.customerService"/></a>
                </form>
            </div>
            <style>
                #emailpic {
                	width:24px;
                	height:24px;
                }
        	</style>
            <div class="topbar-collapse collapse clearfix" id="headerPanel">
                <div class="topbar-form topbar-right">
                    <a href="#" title="" class="loginednav-a"><span id="accountno" style="background: url('${ctx}/img/icon_man.png') no-repeat 0 center; padding-left: 18px; color: #fff">${accountno}</span></a>
                    <a href="javascript:void(0);" id="userEmail" onclick="openStaticUserEmail('<spring:message code="public.myemail"/>')"><img id="emailpic" src="${ctx}/img/email.png" /></a>
                    <c:if test="${sessionScope.testcode != 0}">
                    	<c:if test="${sessionScope.getRoleid != 1}">
                    		<a class="loginednav-a" style="color: #fff; margin-left: 8px;"><spring:message code="public.mainWallet"/>:<span id="balance" onclick="openStaticMVPopup('<spring:message code="public.moneyManagement"/>')"><spring:message code="public.loading"/>...</span></a>
	                        <a type="btn" id="user_money_c" class="btn btn-ck" onclick="openStaticCun('<spring:message code="public.deposit"/>')"><spring:message code="public.deposit"/></a>
	                        <a type="btn" id="user_money_q" class="btn btn-qk" onclick="openStaticQu('<spring:message code="public.withdrawal"/>')"><spring:message code="public.withdrawal"/></a>
	                        <!-- <a class="g-num-tips lognavi2-num" href="#" class="loginednav-a" id="new-msg"><span></span></a> -->
	                        <a type="btn" id="user_center" class="btn btn-login" onclick="openStaticUserPopup('<spring:message code="public.personalCenter"/>')"><spring:message code="public.personalCenter"/></a>
	                        <a type="btn" id="user_money" class="btn btn-login" onclick="openStaticMVPopup('<spring:message code="public.moneyManagement"/>')"><spring:message code="public.moneyManagement"/></a>
	                        <a type="btn" class="btn btn-login" onclick="openStaticTZPopup('<spring:message code="public.bettingRecord"/>')"><spring:message code="public.bettingRecord"/></a> 
                    	</c:if>
                        <c:if test="${sessionScope.getRoleid == 1}">
                        	<a type="btn" id="user_center" class="btn btn-login" onclick="openStaticUserPopup('<spring:message code="public.personalCenter"/>')"><spring:message code="public.personalCenter"/></a>
                        	<a id="myDownLine" type="btn" class="btn btn-login" onclick="openStaticDownLine('<spring:message code="public.myOffline"/>')"><spring:message code="public.myOffline"/></a> 
                        </c:if>
                    </c:if>
                    <c:if test="${sessionScope.testcode == 0}">
                        <a href="#" title="" class="loginednav-a" style="color: #fff; margin-left: 15px;"><spring:message code="public.mainWallet"/>:<span id="balance"><spring:message code="public.loading"/>...</span></a>
                        <a type="btn" class="btn btn-login" onclick="openStaticTZPopup('<spring:message code="public.bettingRecord"/>')"><spring:message code="public.bettingRecord"/></a> 
                    </c:if>
                    <a type="submit" class="btn btn-reg" onclick="logout()" id="btn-logout"><spring:message code="public.signOut"/></a> <a type="btn" class="btn btn-kefu"><spring:message code="public.customerService"/></a>
                </div>
            </div>
        </div>
    </nav>
    <!--导航开始-->
    <nav class="navbar navbar-inverse">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${ctx}/index.do"><img src="${ctx}/img/logo.png"></a>
            </div>
            <!--导航开始-->
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li <c:if test="${headId=='1'}">class="active"</c:if>><a href="${ctx }/index.do"><spring:message code="navigation.home" /></a></li>
                    <li role="presentation" class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="navigation.gcgaming"/><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#" onclick="isSession(this,'${ctx}/gclive/index.do','1','GC','GCLIVE')"><spring:message code="navigation.gcVip" /></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/gclive/indexgj.do','1','GC','GCLIVE')"><spring:message code="navigation.gcLive" /></a></li>
                        </ul>
                    </li>
                    <li role="presentation" class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="navigation.liveGame" /> <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#" onclick="isSession(this,'${ctx}/live/agindex.do','1','AG','AGLIVE')"><spring:message code="navigation.agSonWallet"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/live/agindexcw.do','1','AG','AGLIVE')"><spring:message code="navigation.agSharedAmount"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/allbet/index.do','1','ALLBET','ALLBETLIVE')"><spring:message code="navigation.ab"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/bbin/indexiframe.do','1','BBIN','BBINLIVE')"><spring:message code="navigation.bbinLive"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/game/zriframe.do','1','PT','PTLIVE')"><spring:message code="navigation.ptLive"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/mg/index.do','1','MG','MGLIVE')"><spring:message code="navigation.mgLive"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/gd/index.do','1','GD','GDLIVE')"><spring:message code="navigation.gd"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/xtd/index.do','1','XTD','XTDLIVE')"><spring:message code="navigation.xtd"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/ga/index.do','1','GA','GALIVE')">GA现场</a></li>
                        </ul>
                    </li>
                    <li role="presentation" class="dropdown <c:if test="${headId=='2'}">active</c:if>">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="navigation.electronicGame" /><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#" onclick="isSession(this,'${ctx}/jieji/index.do?gameId=1','1','GC','GCEGAME')"><spring:message code="navigation.fishingOfPeople"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/game/ptindex.do','0','PT','PTEGAME')"><spring:message code="navigation.ptArcadeGames"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/mg/game.do','0','MG','MGEGAME')"><spring:message code="navigation.mgArcadeGames"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/bbin/gameindexiframe.do','1','BBIN','BBINEGAME')"><spring:message code="navigation.bbinArcadeGames"/></a></li>
                        </ul>
                    </li>
                    <li role="presentation" class="dropdown <c:if test="${headId=='3'}">active</c:if>">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="navigation.lotteryGames"/><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#" onclick="isSession(this,'${ctx}/gclottery/index.do','0','GC','GCLOTTERY')"><spring:message code="navigation.lotteryGames"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/bbin/cpindexiframe.do','1','BBIN','BBINLOTTERY')"><spring:message code="navigation.bbinLottery"/></a></li>
                        </ul>
                    </li>
                    <li role="presentation" class="dropdown <c:if test="${headId=='4'}">active</c:if>">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="navigation.sportsGame" /><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#" onclick="isSession(this,'${ctx}/gcsport/index.do','1','GC','GCSPORTS')"><spring:message code="navigation.crownSports"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/ug/index.do','0','UG','UGSPORTS')"><spring:message code="navigation.tbsSports"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/bbin/sportsindexiframe.do','1','BBIN','BBINSPORTS')"><spring:message code="navigation.bbinSports"/></a></li>
                            <li><a href="#" onclick="isSession(this,'${ctx}/imsport/index.do','0','IM','IMSPORTS')"><spring:message code="navigation.imsportGame"/></a></li>
                        </ul>
                    </li>
                    <li <c:if test="${headId=='5'}">class="active"</c:if>><a href="${ctx}/promotion.do"><spring:message code="navigation.preferentialActivities"/></a></li>
                    <li <c:if test="${headId=='6'}">class="active"</c:if>><a href="${ctx}/mobile.do"><spring:message code="navigation.mobile"/></a></li>
                    <li <c:if test="${headId=='7'}">class="active"</c:if>><a href="${ctx}/partner.do"><spring:message code="navigation.partners" /></a></li>
                </ul>
            </div>
            <!--导航结束-->
        </div>
    </nav>
</header>

<c:choose>
    <c:when test="${sessionId != null}">
        <script language="javascript" type="text/javascript">
            //获取用户信息
            readUserDate_();
            var balanceInterval = window.setInterval(function() {
                readUserDate_();
            }, 5000)

            $("#headerLogin").hide();
            $("#headerPanel").show();

            if ("${sessionScope.testcode}" == "0") {
                $("#user_center").hide(); 
            }
        </script>
    </c:when>
    <c:otherwise>
        <script language="javascript" type="text/javascript">
            $("#headerPanel").hide();
            $("#headerLogin").show();
        </script>
    </c:otherwise>
</c:choose>