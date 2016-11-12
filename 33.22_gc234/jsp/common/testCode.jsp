<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>免费试玩</title>
    <!--本页css-->
    <link href="${ctx}/css/testCode.css" rel="stylesheet">
    <!--本页js-->
    <script src="${ctx}/js/jquery-1.10.2.min.js"></script>
</head>
<body>

<c:choose>
    <c:when test="${test == 0}">
        <script language="javascript" type="text/javascript">
            parent.layer.alert('<spring:message code="public.trial.mark4"/>${sessionScope.accountno},<spring:message code="public.trial.mark5"/>${sessionScope.demopassword},<spring:message code="public.trial.mark6"/>',
                    {icon: 1, title:false,btn: ['<spring:message code="public.Confirm"/>']},
                    function(){
                        top.location.href="${ctx}/index.do";
                    });
        </script>
    </c:when>
    <c:when test="${test == 111}">
        <script language="javascript" type="text/javascript">
            alert('<spring:message code="public.msg.verificationCodeError"/>');
        </script>
    </c:when>
    <c:when test="${test == -1}">
        <script language="javascript" type="text/javascript">
            parent.layer.msg('<spring:message code="public.trial.mark7"/>');
        </script>
    </c:when>
    <c:otherwise>
        <script language="javascript" type="text/javascript">
        </script>
    </c:otherwise>
</c:choose>

<div class="alertify-dialog">
    <article class="alertify-inner">
        <div class="alertify-message">
            <span class="alertifyText"><spring:message code="public.trial.mark1"/><span class="grey"><spring:message code="public.trial.mark2"/></span></span>

            <form class="form-horizontal" action="${ctx}/mflogin.do" method="get" id="loginForm">
                <div class="control-group">
                    <input name="captcha" class="input-large span2 inactive" id="captcha" type="text" autocomplete="off"
                           maxlength="4" pattern="^\d{4}$"
                           placeholder="<spring:message code='public.verificationCode'/>">
                    <img src="${ctx}/xuan/testCode.do" class="verifypic" id="imgObj" onclick="changeImg()"
                         title="<spring:message code='public.clickReplacement'/>">
                    <a class="vagueBtn" href="#" title="<spring:message code="public.trial.mark3"/>" hidefocus="true" onclick="changeImg()"><spring:message code="public.trial.mark3"/></a>
                </div>
            </form>
        </div>
        <nav class="alertify-buttons">
            <a id="closeIframe" class="alertify-button alertify-button-cancel"><spring:message code="abc9.public.Cancel"/></a>
            <a type="btn" class="alertify-button alertify-button-ok" onclick="show()"><spring:message code="public.Confirm"/></a>
        </nav>
    </article>
</div>

<%--<div class="form-group">--%>
    <%--<form action="${ctx}/mflogin.do" method="get" id="loginForm">--%>
        <%--<input type="text" placeholder='<spring:message code="public.verificationCode"/>' class="form-control" name="captcha" id="captcha" maxlength="4" style="width: 50px;display: inline;">--%>
        <%--<img id="imgObj" onclick="changeImg()" title='<spring:message code="public.clickReplacement"/>' src="${ctx}/xuan/testCode.do" style="width: 80px;" />--%>
        <%--<a type="btn" class="btn btn-try" onclick="show()"><spring:message code="public.dome"/></a>--%>
        <%--</form>--%>
    <%--</div>--%>

<script type="text/javascript">

    function show(){
        var captcha = $("#captcha").val();
        if(captcha == null || captcha ==""){
            alert('<spring:message code="public.msg.verificationIsNull"/>');
            return;
        }
        $("#loginForm").submit();
    }

    function changeImg(){
        var imgSrc = $("#imgObj");
        var src = imgSrc.attr("src");
        imgSrc.attr("src",chgUrl(src));
    }

    function chgUrl(url){
        var timestamp = (new Date()).valueOf();
        url=url + "?timestamp=" + timestamp;
        return url;
    }
</script>

<!--layer关闭iframe-->
<script>
    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    //关闭iframe
    $('#closeIframe').click(function(){
        var val = $('#name').val();
        parent.layer.close(index);
    });
</script>

</body>
</html>