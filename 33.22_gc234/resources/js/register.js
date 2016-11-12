function IsQQEmail(email) {
	if (email.indexOf("@qq.com") != -1) {
		return true;
	}
	return false;
}

(function() {
	// 底部触底
	var windowH = $(this).height(); // 窗口高度
	var headerH = $("#header").height();
	var footerH = $("#footer").height();
	$("#content").css({
		"min-height" : (windowH - headerH - footerH - 1) + "px",
		"overflow" : "hidden"
	});
})();

$(function() {
	$("#email").mailAutoComplete();

	// #region bind Event
	$("#captcha-img img, #captcha-refresh").click(function(e) {
		// utility.reloadImg($("#captcha-img img"));
	});
	// #endregion

	// 字符验证
	jQuery.validator.addMethod("stringCheck", function(value, element) {
		return this.optional(element)
				|| /^[a-zA-Z1-9][a-zA-Z0-9]+$/.test(value);

	});
	// 手机号码验证
	jQuery.validator.addMethod("isMobile", function(value, element) {
		var length = value.length;
		var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+d{8})$/;
		return this.optional(element) || (length == 11 && mobile.test(value));
	});
	// 汉字
	jQuery.validator.addMethod("chcharacter", function(value, element) {
		var tel = /^[u4e00-u9fa5]+$/;
		return this.optional(element) || (tel.test(value));
	});

	// 联系电话(手机/电话皆可)验证
	jQuery.validator.addMethod("isContactPhone", function(value, element) {
		var length = value.length;
		var mobile = /^(13[0-9]|15[0-9]|18[8|9])\d{8}$/;
		var tel = /^\b\d{11}\b|\b\d{9}\b$/;
		return this.optional(element)
				|| (tel.test(value) || mobile.test(value));
	});
	
	
	// 实时验证账号是否存在
	jQuery.validator.addMethod("verifyAcctno", function(value, element) {
		var code = "0";
		// 设置同步
		$.ajaxSetup({
			async : false
		});
		$.ajax({
            url : "/verifyAcctno.do?timeStamp=" + new Date().getTime()+"&accountno="+value,data : {},timeout : 2000,type : "post",dataType : "json",
            success : function(b) {
            	code = b.code;
            }
        });
		// 恢复异步
		$.ajaxSetup({
			async : true
		});
		if(code == "1"){
    		return false;
    	}else{
    		return true;
    	}
	});
	
	// 实时验证姓名是否存在
	jQuery.validator.addMethod("verifyName", function(value, element) {
		var code = "0";
		// 设置同步
		$.ajaxSetup({
			async : false
		});
		$.ajax({
            url : "/verifyName.do?timeStamp=" + new Date().getTime()+"&name="+value,data : {},timeout : 2000,type : "post",dataType : "json",
            success : function(b) {
            	code = b.code;
            }
        });
		// 恢复异步
		$.ajaxSetup({
			async : true
		});
		if(code == "1"){
    		return false;
    	}else{
    		return true;
    	}
	});
	
	// 实时验证电话是否存在
	jQuery.validator.addMethod("verifyPhone", function(value, element) {
		var code = "0";
		// 设置同步
		$.ajaxSetup({
			async : false
		});
		$.ajax({
            url : "/verifyPhone.do?timeStamp=" + new Date().getTime()+"&phone="+value,data : {},timeout : 2000,type : "post",dataType : "json",
            success : function(b) {
            	code = b.code;
            }
        });
		// 恢复异步
		$.ajaxSetup({
			async : true
		});
		if(code == "1"){
    		return false;
    	}else{
    		return true;
    	}
	});
	
	// 异步验证验证码
	jQuery.validator.addMethod("checkCode", function(value, element) {
		var result = false;
		// 设置同步
		$.ajaxSetup({
			async : false
		});
		var param = {
			userCode : value
		};
		$.post("/checkCode.do", param, function(data) {
			result = (1 == data);
		});
		// 恢复异步
		$.ajaxSetup({
			async : true
		});
		return result;
	});
	$("#signupForm").validate({
		rules : {
			accountno : {
				required : true,
				rangelength : [ 2, 12 ],
				stringCheck : true,
				verifyAcctno : true,
			},
			cashName_ : {
				required : true,
				verifyName: true
			},
			password : {
				required : true,
				minlength : 6
			},
			cmfpassword : {
				required : true,
				minlength : 6,
				equalTo : "#password_"
			},
			phone : {
				required : true,
				isContactPhone : true,
				verifyPhone: true
			},
			cashPasswd : {
				required : true,
				rangelength : [ 4, 11 ],
			},
			captcha : {
				required : true,
				minlength : 4,
				checkCode : true,
			}
		},
		messages : {
			accountno : {
				required : registerlangpackage['inputAccount'],
				rangelength : registerlangpackage['accountLength'],
				stringCheck : registerlangpackage['stringCheck'],
				verifyAcctno : registerlangpackage['verifyAcctnoError']
			},
			cashName_ : {
				required : registerlangpackage['inputName'],
				verifyName : registerlangpackage['verifyNameError']
			},
			password : {
				required : registerlangpackage['inputPassword'],
				minlength : registerlangpackage['passwordLength']
			},
			cmfpassword : {
				required : registerlangpackage['inputPasswordAgain'],
				minlength : registerlangpackage['passwordAgainLength'],
				equalTo : registerlangpackage['passwordAgainSame']
			},
			phone : {
				required : registerlangpackage['inputPhone'],
				isContactPhone : registerlangpackage['isContactPhone'],
				verifyPhone : registerlangpackage['verifyPhoneError']
			},
			cashPasswd : {
				required : registerlangpackage['inputCashPassword'],
				rangelength : registerlangpackage['cashPasswdLength']
			},
			captcha : {
				required : registerlangpackage['inputVerification'],
				minlength : registerlangpackage['captchaLength'],
				checkCode : registerlangpackage['captchaError']
			}
		},
		errorPlacement : function(error, element) {
			var id$ = element.attr("name");
			var parent = $("#" + id$).parent();
			var logo_sj1 = parent.find(".logo-sj1");
			var errortip = $("div[data-for='" + id$ + "']");
			var ftips = $("span[data-valmsg-for='" + id$ + "']");
			ftips.removeClass("field-valid").addClass("f-tips");
			ftips.html(error[0].textContent);
			errortip.addClass("field-validation-error").show();
			logo_sj1.show();
		},
		success : function(label) {
			var id$ = this_id = label[0].htmlFor;
			var parent = $("#" + id$).parent();
			var logo_sj1 = parent.find(".logo-sj1");
			logo_sj1.hide();
			var ftips = parent.find(".f-tips");
			ftips.removeClass("f-tips").addClass("field-valid");
		},
	});

	/*
	 * //#region utility.initSubmitForm utility.initSubmitForm($("form"),
	 * $("#btn-submit"), function (result) {
	 * window.top.location.href="index.do"; }, function () {
	 * utility.reloadImg($("#captcha-img img")); } ); //#endregion
	 * 
	 * 
	 * $("#email").blur(function(e){
	 * $(this).siblings(".input-valid-tip").find(".t-tips").hide();
	 * if(IsQQEmail($(this).val())) {
	 * $(this).siblings(".input-valid-tip").append("<span class='t-tips'
	 * style='top:10px;left:21px;color:#A00;'>qq邮箱可能无法收到我们的邮件,建议更换别的邮箱</span>");
	 * return false; } });
	 * 
	 * $("#email").keyup(function(e){ if(IsQQEmail($(this).val()) == false) {
	 * $(this).siblings(".input-valid-tip").find(".t-tips").hide(); } });
	 * 
	 * 
	 * $("#top_logo_a").mousedown(function(){ $(this).addClass("press"); });
	 * $("#top_logo_a").mouseup(function(){ $(this).removeClass("press"); });
	 */
})