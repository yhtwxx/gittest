<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登陆密码修改-h3bet</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
        .tabs li a {text-decoration: none; color: #666; width: 102px;display: block;}

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
        .tabs li{border-top: 1px solid #a5a5a5;
            border-left: 1px solid #a5a5a5;
            border-right: 1px solid #a5a5a5;
            border-bottom: 0px solid #a5a5a5;
            width: 100px;
            height: 26px;
            text-align: center;
            line-height: 26px;
            font-size: 14px;
            background-color: #efefef;
            top: 13px;
            float: left;
            margin-top:13px;
            cursor: pointer;}
        .tabs .active {border-bottom: 1px solid #fff;background-color: #fff;}

    </style>
	<c:choose>
	<c:when test="${sessionScope.clientlanguage == 'en_US'}">
		<script type="text/javascript" src="${ctx}/js/lang/en_us.js"></script>
	</c:when>
	<c:when test="${sessionScope.clientlanguage == 'zh_CN'}">  
		<script type="text/javascript" src="${ctx}/js/lang/zh_cn.js"></script>
	</c:when>
	<c:otherwise>  
		<script type="text/javascript" src="${ctx}/js/lang/zh_cn.js"></script>
	</c:otherwise>
</c:choose>
</head>

<body>

<div id="MMainData" style="margin-top: 8px;">
<div id="locate-box">
    <table class="MMain" border="1" style="margin-bottom: 8px;">
 		<tr>
            <td width="100%" colspan="2" align="center"><h2><spring:message code="public.member.ModifyLoginPassword" /></h2></td>
        </tr>
        <tr>
            <td width="100%" colspan="2" align="center"><spring:message code="public.username" />: ${accountno }</td>
        </tr>
        <tr>
            <td width="41%" class="" align="right"><spring:message code="public.oldPwd" />:</td>
            <td>
            <input type="password" name="oldpassword" id="oldpassword" /></td>
        </tr>
        <tr>
            <td width="41%" class="" align="right"><spring:message code="public.newPwd" />:</td>
            <td>
            <input type="password" name="newpassword" id="newpassword" /></td>
        </tr>
        <tr>
            <td width="41%" class="" align="right"><spring:message code="public.confirmNewPwd" />:</td>
            <td>
            <input type="password" id="newpassword2" /></td>
        </tr>
        <tr>
                    <td>&nbsp;</td>
                    <td>
                        <div class="Next_btn"><a href="javascript:history.go(-1)" class="nui-btn nui-btn-theme-default"><spring:message code="public.return" /></a> <a href="javascript:void(0);" onclick="submit();" class="nui-btn nui-btn-theme-main"><spring:message code="public.modify" /></a></div>
                    </td>
         </tr>
    </table>
</div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/layer.min.js"></script>
<script>
    function submit(){
			var oldpassword = $("#oldpassword").val();
			if (oldpassword==null || oldpassword == "") {
				layer.msg(commonlangpackage['PleaseEnterOldPassword'], 1, 0);
                $("#oldpassword").focus();
                return;
            }
			var newpassword = $("#newpassword").val();
			if (newpassword==null || newpassword == "") {
				layer.msg(commonlangpackage['PleaseEnterNewPassword'], 1, 0);
                $("#newpassword").focus();
                return false;
            }
			if(oldpassword==newpassword){
				layer.msg(commonlangpackage['NewPwdCannotSameOldPwd'], 2, 0);
                $("#newpassword").focus();
                return false;
			}
			var newpassword2 = $("#newpassword2").val();
			if (newpassword2==null || newpassword2 == "") {
				layer.msg(commonlangpackage['ConfirmNewPassword'], 1, 0);
                $("#newpassword2").focus();
                return;
            }
			if(newpassword2!=newpassword){
				layer.msg(commonlangpackage['ConfirmPasswordNotCorrect'], 1, 0);
                $("#newpassword2").focus();
                return;
			}
            $.ajax({url: "../user/updatePasswordJson.do?timeStamp=" + new Date().getTime()+"&pwdtype=1&oldpassword="+oldpassword+"&newpassword="+newpassword,type: "get",dataType: "json",
                success: function(b) {
                    if(0 == b.code){
                    	layer.msg(commonlangpackage['LoginPwdModificationSuccess'], 1, 0);
                    	setTimeout(
                                function(){
                               	 window.location.href="${ctx}/user/userPassword.do";
                                },1000
                            )
                    }else{
                    	Showbo.Msg.alert(langpackage[b.code]);
		
                    }
                }});

    }

</script>
</body>
</html>