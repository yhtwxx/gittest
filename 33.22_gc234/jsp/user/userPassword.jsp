<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
    <jsp:include page="../common/common_lang.jsp" />
    <style type="text/css">
        <!--
        /*共用*/
        input{
            padding-left:6px;
            padding-right:6px;
        }
        body{
            padding:0;
            margin:0;
            color:#272A31;
            background-color: #fff;
            padding: 2px 10px;
            font-family: "Microsoft YaHei", Arial;
            color: #666;
        }
        .tabs li a {text-decoration: none; color: #666;display: block;}

        /*table*/
        table.MMain {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            text-align: left;
            font-size: 12px;
            color: #FFF;
        }
        table.MMain th {
            background: #DFDFDF;
            height: 1.8em;
            color: #333;
            font-weight: normal;
            text-align: center;
        }
        table.MMain td {
            background: #FFF;
            line-height: 1.5em;
            color: #666;
            padding: 6px 8px;
        }
        table.MMain, table.MMain th, table.MMain td {
            border: 1px solid #CCC;
            border-top: none;
        }
        table.MNoBorder, table.MNoBorder th, table.MNoBorder td {
            background: none;
            border: none;
        }
        table.MMain th.MContent, table.MMain td.MContent {
            word-break: break-all;
            text-align: left;
        }
        table.MMain td.MNumber {
            text-align: right;
        }
        table.MMain td.MNotice {
            color: #555;
        }
        table.MMain td.MBgcolor {
            background: #600;
            color: #FFF;
        }
        table.MMain td.MBgcolor2 {
            background: #006;
            color: #FFF;
        }
        .MSubTitle { font-size: 14px;}
        .tabs{height: 40px;
            border-bottom: 1px solid #a5a5a5;}
        .tabs li {
            border: 1px solid #a5a5a5;
            border-bottom: none;
            height: 26px;
            text-align: center;
            line-height: 26px;
            font-size: 14px;
            background-color: #efefef;
            top: 13px;
            float: left;
            margin-top:13px;
            cursor: pointer;
            list-style: none;
            padding: 0 5px;
        }
        .tabs .active {border-bottom: 1px solid #fff;background-color: #fff;}

    </style>

</head>

<body>

<div id="MMainData" style="margin-top: 8px;">


    <div class="tabs">
        <ul id="tabs">
            <li tabs="1" class="tabs-btn"><a href="userView.do"><spring:message code="public.member.MemberInformation" /></a></li>
            <li tabs="2" class="tabs-btn active"><a href="userPassword.do"><spring:message code="public.member.PasswordManagement" /></a></li>
        </ul>
    </div>

    <div id="locate-box">
        <table class="MMain" border="1">

            <tr>
                <td width="100%" colspan="2" align="center"><spring:message code="public.username" />：${accountno }</td>
            </tr>
            <tr>
                <td width="20%" align="right"><spring:message code="public.loginPwd" />：</td>
                <td><a href="updatePassword.do" class="nui-btn nui-btn-theme-main"><spring:message code="public.modify" /></a></td>
            </tr>
            <tr>
                <td align="right"><spring:message code="public.cashPassword" />：</td>
                <td><a href="updateQxPassword.do" class="nui-btn nui-btn-theme-main">
                    <c:choose>
                        <c:when test="${flag == '1'}">
                            <spring:message code="public.set" />
                        </c:when>
                        <c:otherwise>
                            <spring:message code="public.modify" />
                        </c:otherwise>
                    </c:choose>
                </a>
                    <c:if test="${flag == '1'}">
                        &nbsp;&nbsp;<spring:message code="public.msg.drawPwdNotEmpty" />
                    </c:if>
                </td>
            </tr>
            <c:if test="${not empty thirdPassword}">
                <tr>
                    <td align="right"><spring:message code="public.member.ThirdLoginPassword" />:</td>
                    <td>
                        <span id="hidethirdPassword">******</span>
                        <span id="showthirdPassword" style="display: none;">${thirdPassword}</span>
                        <a href="javascript:void(0)" title="<spring:message code="public.member.ThirdLoginPassword" />" id="showhidebtn" class="glyphicon glyphicon-eye-open" aria-hidden="true" style="margin-left: 10px;"></a>
                    	<span class="alert alert-warning" role="alert" style="padding:2px;"><spring:message code="public.member.ThirdLoginPasswordTip" /></span>
                    </td>
                </tr>
            </c:if>
        </table>
    </div>
</div>
<script>
    $(function(){
        $(document).on('click', '#showhidebtn', function(){
            if($(this).hasClass('glyphicon-eye-open')){
                $('#hidethirdPassword').hide();
                $('#showthirdPassword').show();
                $(this).removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close').attr('title', '点击隐藏第三方密码');
            }else{
                $('#showthirdPassword').hide();
                $('#hidethirdPassword').show();
                $(this).removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open').attr('title', '点击显示第三方密码');
            }
        })
    });
</script>

</body>
</html>