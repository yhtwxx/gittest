<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- 引用公用头部文件（包含公用css和公用js） -->
    <jsp:include page="../common/common_lang.jsp" />
    <style type="text/css">
        <!-- /*共用*/
        input {
            padding-left: 6px;
            padding-right: 6px;
        }

        body {
            padding: 0;
            margin: 0;
            color: #272A31;
            background-color: #fff;
            padding: 2px 10px;
            font-family: "Microsoft YaHei", Arial;
            color: #666;
        }

        .tabs li a {
            text-decoration: none;
            color: #666;
            display: block;
        }

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

        table.MMain input {
            width: 200px;
        }

        .MSubTitle {
            font-size: 14px;
        }

        .tabs {
            height: 40px;
            border-bottom: 1px solid #a5a5a5;
        }

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
            margin-top: 13px;
            cursor: pointer;
            list-style: none;
            padding: 0 5px;
        }

        .tabs .active {
            border-bottom: 1px solid #fff;
            background-color: #fff;
        }
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


    <div class="tabs">
        <ul id="tabs">
            <li tabs="1" class="tabs-btn active"><a href="userView.do"><spring:message code="public.member.MemberInformation" /></a></li>
            <li tabs="2" class="tabs-btn"><a href="userPassword.do"><spring:message code="public.member.PasswordManagement" /></a></li>
        </ul>
    </div>

    <div id="locate-box">
        <table class="MMain" border="1">
            <tr>
                <td width="100%" colspan="2" align="center"><spring:message code="public.username" />：${accountno }</td>
            </tr>
            <tr>
                <td align="right" width="20%"><spring:message code="public.email" />：</td>
                <td>
                	<c:choose>
						<c:when test="${not empty email}">  
							${email}
						</c:when>
						<c:otherwise>
							<input type="text" name="email" id="email" /><span class="errorMsg"></span>
						</c:otherwise>
					</c:choose>
                </td>
            </tr>
            <tr>
                <td align="right"><spring:message code="public.name" />：</td>
                <td>
                    <c:choose>
						<c:when test="${not empty userName}">  
							${userName}
						</c:when>
						<c:otherwise>
							<input type="text" name="userName" id="userName" /><span class="errorMsg"></span>
						</c:otherwise>
					</c:choose>
                </td>
            </tr>
            <tr>
                <td align="right"><spring:message code="public.phone" />：</td>
                <td>
                    <c:choose>
						<c:when test="${not empty phone}">  
							${phone}
						</c:when>
						<c:otherwise>
							<input type="text" name="phone" id="phone" /><span class="errorMsg"></span>
						</c:otherwise>
					</c:choose>
                </td>
            </tr>
            <tr>
                <td align="right"><spring:message code="public.wechat" />：</td>
                <td>
                    <c:choose>
						<c:when test="${not empty qq}">  
							${qq}
						</c:when>
						<c:otherwise>
							<input type="text" name="qq" id="qq" /><span class="errorMsg"></span>
						</c:otherwise>
					</c:choose>
                </td>
            </tr>
            <tr>
                <td align="right"><spring:message code="public.bankName" />：</td>
                <td>
                    <c:choose>
						<c:when test="${not empty bankname}">  
							${bankname}
						</c:when>
						<c:otherwise>
							<input type="text" name="bankname" id="bankname" /><span class="errorMsg"></span>
						</c:otherwise>
					</c:choose>
                </td>
            </tr>
            <tr>
                <td align="right"><spring:message code="public.bankNumber" />：</td>
                <td>
                    <c:choose>
						<c:when test="${not empty bankId}">  
							${bankId}
						</c:when>
						<c:otherwise>
							<input type="text" name="bankId" id="bankId" /><span class="errorMsg"></span>
						</c:otherwise>
					</c:choose>
                </td>
            </tr>
            <tr>
                <td align="right"><spring:message code="public.bankAddress" />：</td>
                <td>
                    <c:choose>
						<c:when test="${not empty bankAddress}">  
							${bankAddress}
						</c:when>
						<c:otherwise>
							<input type="text" name="bankAddress" id="bankAddress" /><span class="errorMsg"></span>
						</c:otherwise>
					</c:choose>
                </td>
            </tr>
            <c:if test="${empty bankAddress || empty bankId || empty bankname || empty qq || empty phone || empty userName || empty email}">
            <tr>
				<td></td>
				<td>
				<a href="javascript:void(0);" onclick="submit();" class="nui-btn nui-btn-theme-main"><spring:message code="public.modify" /></a></td>
			</tr>
			</c:if>
        </table>
    </div>
</div>

<script type="text/javascript" src="${ctx}/plugin/Validform_v5.3.2_min.js"></script>
<script>
    function submit(){
        var email = "";
        var phone = "";
        var qq = "";
        var cashname = "";
        var bankname = "";
        var bankId = "";
        var bankAddress = "";
        
        if($("#email").length > 0){
        	email = $("#email").val();
        	if(email==null || email==""){
            	$("#email").siblings('.errorMsg').css('color','red').html('Email不能为空');
                return false;
            }else{
            	$("#email").siblings('.errorMsg').html('');
            }
        }
        if($("#phone").length > 0){
        	phone = $("#phone").val();
        	if(phone==null || phone==""){
            	$("#phone").siblings('.errorMsg').css('color','red').html(commonlangpackage['PhoneNoCannotEmpty']);
                return false;
            }else{
            	$("#phone").siblings('.errorMsg').html('');
            }
        }
        if($("#qq").length > 0){
        	qq = $("#qq").val();
        }
        if($("#userName").length > 0){
        	cashname = $("#userName").val();
        	if(cashname==null || cashname==""){
            	$("#userName").siblings('.errorMsg').css('color','red').html(commonlangpackage['CashNameCannotEmpty']);
                return false;
            }else{
            	$("#userName").siblings('.errorMsg').html('');
            }
        }
        if($("#bankname").length > 0){
        	bankname = $("#bankname").val();
        	if(bankname==null || bankname==""){
            	$("#bankname").siblings('.errorMsg').css('color','red').html(commonlangpackage['BankNameCannotEmpty']);
                return false;
            }else{
            	$("#bankname").siblings('.errorMsg').html('');
            }
        }
        if($("#bankId").length > 0){
        	bankId = $("#bankId").val();
        	if(bankId==null || bankId==""){
            	$("#bankId").siblings('.errorMsg').css('color','red').html(commonlangpackage['BankAccountCannotEmpty']);
                return false;
            }else{
            	$("#bankId").siblings('.errorMsg').html('');
            }
        }
        if($("#bankAddress").length > 0){
        	bankAddress = $("#bankAddress").val();
        	if(bankAddress==null || bankAddress==""){
            	$("#bankAddress").siblings('.errorMsg').css('color','red').html(commonlangpackage['BankAddressCannotEmpty']);
                return false;
            }else{
            	$("#bankAddress").siblings('.errorMsg').html('');
            }
        }

        var url = "&email=" + email + "&phone=" + phone + "&pqq=" + qq
                + "&cashName=" + cashname + "&cashBankname=" + bankname
                + "&cashBankaccount=" + bankId + "&cashAddress="
                + bankAddress;
        $.ajax({
            url : "../user/updateuserDataJson.do?timeStamp="
            + new Date().getTime() + url,
            type : "post",
            dataType : "json",
            success : function(b) {
                if (0 == b.code) {
                	layer.msg(commonlangpackage['PersonalDataModificationSuccess']);
                	setTimeout(
                            function(){
                           	 window.location.href="${ctx}/user/userView.do";
                            },1000
                        )
                } else {
                	layer.msg(parent.langpackage[b.code]);
                }
            }
        });
    }
</script>
</body>
</html>