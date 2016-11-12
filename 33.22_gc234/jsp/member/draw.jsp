<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>会员取款</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
	
    <link href="../css/member/deposit.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/layer.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/skin/layer.css" id="skinlayercss">
    <script type="text/javascript">
        var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
        function next() {
            var m = $("#money").val();
            var bankName = "${bankName}";
            var balance = ${getBalance/100};
            if (!exp.test(m)) {
            	layer.msg(commonlangpackage['PleaseEnterCorrectAmount'], 1, 0);
                $("#money").focus();
                return;
            }
            if (m < 100) {
            	layer.msg(commonlangpackage['WithdrawalAmountCanNotLessThan']+"100"+currencylangpackage['RMB'], 1, 0)
                $("#money").focus();
                return;
            }
            if(m>balance){
            	layer.msg(commonlangpackage['InsufficientBalance'], 1, 0);
                $("#money").focus();
                return;
            }
            
            if (bankName == null || bankName == "" || typeof (bankName) == "undefined") {
            	layer.msg(commonlangpackage['ChooseYourBank'], 1, 0);
                return;
            }
            var bankId = "${bankAccount}";
            var userName = "${accountName}";
            if (bankId==null || bankId =="") {
            	layer.msg(commonlangpackage['PleaseEnterBankCardNumber'], 1, 0);
                $("#bankId").focus();
                return;
            }
            
            if (userName==null || userName =="") {
            	layer.msg(commonlangpackage['RemitteeCannotEmpty'], 1, 0);
                $("#userName").focus();
                return;
            }
            var userQxpassword = $("#userQxpassword").val();
            if (userQxpassword==null || userQxpassword =="") {
            	layer.msg(commonlangpackage['WithdrawalPasswordCannotEmpty'], 1, 0);
                $("#userQxpassword").focus();
                return;
            }
            submit(m,bankName,bankId,userName,userQxpassword);
        }
        

        function submit(money,bankName,bankId,userName,userQxpassword){
        	var userName1=encodeURI(encodeURI(userName));
            var bankname1=encodeURI(encodeURI(bankName));
        	$.ajax({'url':"../member/drawSubmit.do?timeStamp=" + new Date().getTime()+"&money="+money+"&bankName="+bankname1+"&bankId="+bankId+"&userName="+userName1+"&userQxpassword="+userQxpassword,type:"post",dataType:'json',success:
                function(b){
                    if(b.code==0){
                    	layer.msg(commonlangpackage['WithdrawalSubmitted'], 1, 0);
                    	 setTimeout(
                                 function(){
                                	 window.location.href="${ctx}/member/moneyQu.do";
                                 },1000
                             )
	                     
                    }else{
                    	layer.msg(langpackage[b.code],1,0);
                    }
                }
        });
        }

    </script>

</head>
<body huaban_collector_injected="true">
<!--<div class="member_top">-->
<!--<div class="member_logo"><img src="#" width="140" height="42"></div>-->
<!--</div>-->
<div class="line_title"><spring:message code="public.msg.Withdraw.msg1"/></div>

<div class="card_main">
    <div class="card_width">
        
            <table width="100%" border="0" cellspacing="1" cellpadding="0" class="bgcolor">
                <tbody>
                <tr>
                    <td width="13%" align="right"> <spring:message code="public.msg.Withdraw.UserName"/>：</td>
                    <td width="87%" colspan="4">${accountno }</td>
                </tr>
                <tr>
                    <td align="right"><spring:message code="public.msg.Withdraw.UserBalance"/>：</td>
                    <td colspan="4">${getBalance/100 }
                    </td>
                </tr>
				<tr>
                    <td align="right"><spring:message code="public.msg.Withdraw.WithdrawingMoney"/>：</td>
                    <td><input name="money" id="money" type="text" class="input_money" style="width: 180px" /></td>
                </tr>
                <tr>
                    <td align="right"><spring:message code="public.msg.Withdraw.SelectBank"/>：</td>
                    <td colspan="4">
                    	<!-- <select name="bankName" id="bankName"  class="MFormStyle1">
	                        <option value="工商银行">工商银行</option>
	                        <option value="农业银行">农业银行</option>
	                        <option value="建设银行">建设银行</option>
	                        <option value="中国银行">中国银行</option>
	                        <option value="交通银行">交通银行</option>
	                        <option value="招商银行">招商银行</option>
	                        <option value="民生银行">民生银行</option>
	                        <option value="兴业银行">兴业银行</option>
	                        <option value="浦发银行">浦发银行</option>
	                        <option value="华夏银行">华夏银行</option>
	                        <option value="中信银行">中信银行</option>
	                        <option value="广大银行">广大银行</option>
	                        <option value="邮政储蓄">邮政储蓄</option>
	                        <option value="平安银行">平安银行</option>
	                        <option value="上海银行">上海银行</option>
	                        <option value="渤海银行">渤海银行</option>
	                        <option value="东亚银行">东亚银行</option>
	                        <option value="宁波银行">宁波银行</option>
	                        <option value="北京银行">北京银行</option>
	                    </select> -->
	                    <input name="bankName" id="bankName" type="text" class="input_money" style="width: 180px" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td align="right"><spring:message code="public.msg.Withdraw.BankCardNumber"/>：</td>
                    <td><input name="bankId" id="bankId" type="text" class="input_money" style="width: 180px" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td align="right"><spring:message code="public.msg.Withdraw.NameOfWithdrawal"/>：</td>
                    <td><input name="userName" id="userName" type="text" class="input_money" style="width: 180px" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td align="right"><spring:message code="public.msg.Withdraw.WithdrawalPassword"/>：</td>
                    <td><input name="userQxpassword" id="userQxpassword" type="password" class="input_money" style="width: 180px" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <div style="margin-top: 10px;">
	                        <a href="javascript:history.go(-1)" class="nui-btn nui-btn-theme-default"><spring:message code="public.return"/></a> 
	                        <a href="javascript:void" onclick="next();" class="nui-btn nui-btn-theme-main"><spring:message code="public.Confirm"/></a>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        
        <div style="clear:both"></div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
    	$("#bankName").val("${bankName}");
    	$("#bankId").val("${bankAccount}");
    	$("#userName").val("${accountName}");
    });
 </script>
</body>
</html>