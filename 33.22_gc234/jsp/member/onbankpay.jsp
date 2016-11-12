<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>在线入款</title>
    <link href="../css/member/deposit.css" rel="stylesheet" type="text/css">
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
</head>
<body huaban_collector_injected="true">
<div class="line_title">
<spring:message code="public.msg.Deposit.Supplementary" />
</div>
<div class="card_main">
    <div class="card_width">
    <c:choose>
			<c:when test="${openType == 'cun'}">  
				<form action="" name="orderForm" id="orderForm">
			        <table width="100%" class="bgcolor">
			            <tr>
			                <td align="right"><spring:message code="public.msg.Withdraw.UserName" /></td>
			                <td width="80%"><span id="userId"></span></td>
			            </tr>
			            <tr>
			                <td align="right"><spring:message code="public.phone" /></td>
			                <td><input name="phone" id="phone" type="text" class="input_money" style="width: 20%" ><span class="errorMsg"></span>
			                </td>
			            </tr>
			            <tr>
			               	<td>&nbsp;</td>
		                    <td>
		                        <div style="padding: 10px 0;"><input type="submit" value="<spring:message code="jzmy.msg.Submit" />" class="nui-btn nui-btn-theme-main" /></div>
		                    </td>
			            </tr>
			        </table>
		        </form>
			</c:when>
			<c:otherwise>
		        <form action="" name="orderForm" id="orderForm">
		            <table width="100%" class="bgcolor">
		                <tbody>
		                <tr>
		                    <td width="20%" align="right"><spring:message code="public.username" />：</td>
		                    <td width="80%"><span id="userId"></span></td>
		                </tr>
		                <tr>
		                    <td align="right"><spring:message code="public.msg.Withdraw.NameOfWithdrawal" />：</td>
		                    <td>
		                    	<input type="text" name="cashName" id="cashName" class="input_money" style="width: 20%" /><span class="errorMsg"></span>
		                  	</td>
		                </tr>
		                <tr>
		                    <td align="right"><spring:message code="public.bankName" />：</td>
		                    <td>
		                  		<input type="text" name="bankname" id="bankname" class="input_money" style="width: 20%" />
		                  		<span class="errorMsg"></span>
		                  	</td>
		                </tr>
		                <tr>
		                    <td align="right"><spring:message code="public.msg.Withdraw.BankCardNumber" />：</td>
		                    <td>
		                    	<input type="text" name="bankId" id="bankId" class="input_money" style="width: 40%" />
		                    	<span class="errorMsg"></span>
		                  	</td>
		                </tr>
		                <tr>
		                    <td align="right"><spring:message code="public.bankAddress" />：</td>
		                    <td>
		                    	<input type="text" name="bankAddress" id="bankAddress" class="input_money" style="width: 40%" />
		                    	<span class="errorMsg"></span>
		                  	</td>
		                </tr>
		                <tr>
		                    <td align="right"><spring:message code="public.cashPassword" />：</td>
		                    <td>
		                    	<input type="text" name="cashPasswd" id="cashPasswd" class="input_money" style="width: 40%" />
		                    	<span class="errorMsg"></span>
		                  	</td>
		                </tr>
		                <tr>
		                    <td>&nbsp;</td>
		                    <td>
		                        <div style="padding: 10px 0;"><input type="submit" value="<spring:message code="jzmy.msg.Submit" />" class="nui-btn nui-btn-theme-main" /></div>
		                    </td>
		                </tr>
		                </tbody>
		            </table>
		        </form>
        </c:otherwise>
	</c:choose>
        <div style="clear:both"></div>
    </div>
</div>

<c:choose>
<c:when test="${openType == 'cun'}"> 
<script>
    $(function(){
    	
    	var openType = "${openType}";
    	var reurl = "../${url}";
    	
    	 //获取用户信息
        var getBalance = function(){
            $.ajax({url: "../user/userDataJson.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(0 == b.code){
                        $("#userId").html(b.accountno);
                    }else{
                    	layer.msg(langpackage[b.code]);
                    }
                }
            })
        };
        getBalance();
        
        $(document).on('blur','#phone',function(){
        	var code = verifyPhone();
        	if(code=="1"){
            	$("#phone").siblings('.errorMsg').css('color','red').html(registerlangpackage['verifyPhoneError']);
            }else{
            	$("#phone").siblings('.errorMsg').html('');
            }
        });
        
        function verifyPhone(){
        	var phone=$("#phone").val();
        	var code = "";
            if(phone==null || phone==""){
            }else{
            	// 设置同步
        		$.ajaxSetup({
        			async : false
        		});
	        	$.ajax({
	                url : "/verifyPhone.do?timeStamp=" + new Date().getTime()+"&phone="+phone,data : {},timeout : 2000,type : "post",dataType : "json",
	                success : function(b) {
	                    code = b.code; 
	                }
	            });
	        	// 恢复异步
	    		$.ajaxSetup({
	    			async : true
	    		});
            }
            return code;
        }
        
        $("#orderForm").submit(function(e){
            var phone=$("#phone").val();
            if(phone==null || phone==""){
            	$("#phone").siblings('.errorMsg').css('color','red').html(commonlangpackage['PhoneNoCannotEmpty']);
                return false;
            }else{
            	var code = verifyPhone();
            	if(code=="1"){
                	$("#phone").siblings('.errorMsg').css('color','red').html(registerlangpackage['verifyPhoneError']);
                	return false;
                }else{
                	$("#phone").siblings('.errorMsg').html('');
                	 var url="&phone="+phone;
                     $.ajax({url: "../user/updateuserDataJson.do?timeStamp=" + new Date().getTime()+url,type: "post",dataType: "json",
                         success: function(b) {
                             if(0 == b.code){
                                 layer.msg(commonlangpackage['PersonalDataEntrySuccess']);
                                 window.setInterval(function() {
                                 	window.location=reurl;
                                 }, 1000);
                             }else{
                                 layer.msg(langpackage[b.code]);
                             }
                         }
                     });
                }
            }
            e.preventDefault();
        });
    });
</script>
</c:when>
<c:otherwise>
<script>
    $(function(){
    	var openType = "${openType}";
        function format_gold(gold) {
            return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
        }
        $( document ).on( "change", "#changeNum", function(){
            var el = this;
            el.value = format_gold(el.value);
        }).on( "keyup", "#changeNum", function(){
            var el = this;
            el.value = format_gold(el.value);
        });
        //获取用户信息
        var getBalance = function(){
            $.ajax({url: "../user/userDataJson.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(0 == b.code){
                        $("#userId").html(b.accountno);
                        if(b.cashName != "" && b.cashName != undefined && b.cashName != null){
                        	$("#cashName").val(b.cashName);
                        	$("#cashName").attr("disabled","disabled");
                        }
                        if(b.bankName != "" && b.bankName != undefined && b.bankName != null){
                        	$("#bankname").val(b.bankName);
                        	$("#bankname").attr("disabled","disabled");
                        }
                        if(b.bankAccount != "" && b.bankAccount != undefined && b.bankAccount != null){
                        	$("#bankId").val(b.bankAccount);
                        	$("#bankId").attr("disabled","disabled");
                        }
                        if(b.cashAddress != "" && b.cashAddress != undefined && b.cashAddress != null){
                        	$("#bankAddress").val(b.cashAddress);
                        	$("#bankAddress").attr("disabled","disabled");
                        }
                        if(b.cashPasword != "" && b.cashPasword != undefined && b.cashPasword != null){
                        	$("#cashPasswd").val("******");
                        	$("#cashPasswd").attr("disabled","disabled");
                        }
                    }else{
                    	layer.msg(langpackage[b.code]);
                    }
                }
            })
        };
        getBalance();
        
        
        $(document).on('blur','#cashName',function(){
        	 var code = verifyName();
        	 if(code=="1"){
             	$("#cashName").siblings('.errorMsg').css('color','red').html(registerlangpackage['verifyNameError']);
             }else{
             	$("#cashName").siblings('.errorMsg').html('');
             }
        });
        
        
        function verifyName(){
        	var cashName=$("#cashName").val();
        	var code = "";
        	if(cashName==null || cashName==""){
        		$("#cashName").siblings('.errorMsg').css('color','red').html(commonlangpackage['CashNameCannotEmpty']);
            }else{
            	// 设置同步
        		$.ajaxSetup({
        			async : false
        		});
        		$.ajax({
	                url : "/verifyName.do?timeStamp=" + new Date().getTime()+"&name="+cashName,data : {},async:false,timeout : 2000,type : "post",dataType : "json",
	                success : function(b) {
	                    code = b.code;
	                }
	            });
	        	// 恢复异步
	    		$.ajaxSetup({
	    			async : true
	    		});
            }
            return code;
        }
        
        $("#orderForm").submit(function(e){
        	var cashName=$("#cashName").val();
            var bankname=$("#bankname").val();
            var bankId=$("#bankId").val();
            var bankAddress=encodeURI(encodeURI($("#bankAddress").val()));
            var cashPasswd=$("#cashPasswd").val();
            if(bankname==null || bankname==""){
            	$("#bankname").siblings('.errorMsg').css('color','red').html(commonlangpackage['BankNameCannotEmpty']);
                return false;
            }else{
            	$("#bankname").siblings('.errorMsg').html('');
            }
            if(bankId==null || bankId==""){
            	$("#bankId").siblings('.errorMsg').css('color','red').html(commonlangpackage['BankAccountCannotEmpty']);
            	return false;
            }else{
            	$("#bankId").siblings('.errorMsg').html('');
            }
            if(bankAddress==null || bankAddress==""){
            	$("#bankAddress").siblings('.errorMsg').css('color','red').html(commonlangpackage['BankAddressCannotEmpty']);
            	return false;
            }else{
            	$("#bankAddress").siblings('.errorMsg').html('');
            }
            if(!$('#cashPasswd').prop("disabled")){
            	if(cashPasswd==null || cashPasswd==""){
                	$("#cashPasswd").siblings('.errorMsg').css('color','red').html(commonlangpackage['WithdrawalPasswordCannotEmpty']);
                	return false;
                }else if(cashPasswd.length < 4 || cashPasswd.length > 15){
                	$("#cashPasswd").siblings('.errorMsg').css('color','red').html(commonlangpackage['WithdrawalPasswordCannotEmpty']);
                }else{
                	$("#cashPasswd").siblings('.errorMsg').html('');
                }
            }
            if(cashName==null || cashName==""){
            	$("#cashName").siblings('.errorMsg').css('color','red').html(commonlangpackage['CashNameCannotEmpty']);
            	return false;
            }else{
            	var code = "0";
            	if(!$("#cashName").prop("disabled")){
            		code = verifyName();
            	}
           	 	if(code=="1"){
                	$("#cashName").siblings('.errorMsg').css('color','red').html(registerlangpackage['verifyNameError']);
                }else{
                	$("#cashName").siblings('.errorMsg').html('');
                	cashName=encodeURI(encodeURI(cashName));
                    bankname=encodeURI(encodeURI(bankname));
                    var url="&cashName="+cashName+"&cashBankname="+bankname+"&cashBankaccount="+bankId+"&cashAddress="+bankAddress;
                    if(!$('#cashPasswd').prop("disabled")){
                    	url += "&cashPasswd="+cashPasswd;
                    }
                    $.ajax({url: "../user/updateuserDataJson.do?timeStamp=" + new Date().getTime()+url,type: "post",dataType: "json",
                        success: function(b) {
                            if(0 == b.code){
                                layer.msg(commonlangpackage['PersonalDataEntrySuccess']);
                                window.setInterval(function() {
                                	if(openType == "qu"){
                                		window.location="${ctx}/member/draw.do";
                                	} else {
                                		window.history.go(-1);
                                	}
                                }, 1000);
                            }else{
                                layer.msg(langpackage[b.code]);
                            }
                        }
                    });
                }
            }
            
            e.preventDefault();
        });

    })
</script>
</c:otherwise>
</c:choose>
</body>
</html>