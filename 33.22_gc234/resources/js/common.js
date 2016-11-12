$(function(){
	//设置时间
	GetTime();
	var setTimeF = setInterval(function() {
	    GetTime()
	}, 1000);
	//语言切换
	if(clientlanguage == 'en_US'){
		$('#current-lang').children('span').removeClass().addClass('lengb');
	}else{
		$('#current-lang').children('span').removeClass().addClass('lzhcn');
	}
	$("#current-lang").click(function(){
        $("#langSwitch").toggle();
    });
})

/*//个人中心
function openStaticUserPopup() {
    $.openPopupLayer({
        name : "openStaticUserPopup",
        width : 1000,
        target : "myHiddenUserView"
    });
}
//免费试玩
function openStaticTryCode() {
    $.openPopupLayer({
        name : "openStaticTryCode",
        width : 300,
        target : "myHiddenTryCode"
    });
}
//存款
function openStaticCun() {
    $.openPopupLayer({
        name : "openStaticMoneyCun",
        width : 1000,
        target : "myHiddenMoneyCun"
    });
}
//取款
function openStaticQu() {
    $.openPopupLayer({
        name : "openStaticMoneyQu",
        width : 1000,
        target : "myHiddenMoneyQu"
    });
}
//资金管理
function openStaticMVPopup() {
    $.openPopupLayer({
        name : "openStaticMVPopup",
        width : 1000,
        target : "myHiddenMoneyView"
    });
}
//投注记录
function openStaticTZPopup() {
    $.openPopupLayer({
        name : "openStaticTZPopup",
        width : 1000,
        target : "myHiddenRecordView"
    });
}
//我的下线
function openStaticDownLine() {
    $.openPopupLayer({
        name : "openStaticDownLine",
        width : 1000,
        target : "myHiddenDownLineView"
    });
}
//邮件记录
function openStaticUserEmail() {
    $.openPopupLayer({
        name : "openStaticUserEmail",
        width : 1000,
        target : "myHiddenUserEmailView"
    });
}*/

//登录验证
function checkLogin() {
    var username$ = $("#accountno");
    var userpwd$ = $("#password");
    var logincode$ = $("#captcha");
    delErrorInfo();
    //验证验证码
    if (logincode$.val().length != 4) {
        var msg = loginlangpackage['verificationLength'];
        showErrorInfo(logincode$, msg);
        return false;
    }
    $.ajaxSetup({
        async : false
        // 设置同步
    });
    var param = {
        userCode : logincode$.val()
    };
    $.post("/checkLoginCode.do", param, function(data) {
        result = (1 == data);
    });
    $.ajaxSetup({
        async : true
        // 恢复异步
    });
    if (!result) {
        var msg = loginlangpackage['verificationCodeError'];
        showErrorInfo(logincode$, msg);
        var imgSrc = $("#imgObj");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
        return false;
    }
    chanceErrorInfo(logincode$);
    //验证用户名
    if (username$.val().length < 2 || username$.val().length > 12) {
        var msg = loginlangpackage['accountLength'];
        showErrorInfo(username$, msg);
        return false;
    }
    if (!/^[a-zA-Z1-9][a-zA-Z0-9]+$/.test(username$.val())) {
        username$.val("");
        var msg = loginlangpackage['accountRule'];
        showErrorInfo(username$, msg);
        return false;
    }
    chanceErrorInfo(username$);
    //验证密码
    if (userpwd$.val() == '') {
        var msg = loginlangpackage['pwdNotEmpty'];
        showErrorInfo(userpwd$, msg);
        return false;
    }
    chanceErrorInfo(userpwd$);
    return true;
}
//显示错误提示
function showErrorInfo(element, msg) {
    element.parent(".form-group").addClass("has-error").css("position",
        "relative").children(".popover").css({
            "margin-top" : "44px",
            "width" : "100%",
            "text-align" : "center"
        }).show(300).delay(3000).hide(300);
    element.siblings(".popover").find("p").html(msg);
}
//改变错误提示状态
function chanceErrorInfo(element) {
    element.parent(".form-group").removeClass("has-error").addClass(
        "has-success");
}
//清除所有错误状态跟提示
function delErrorInfo() {
    $("#loginForm .form-group").removeClass("has-error").removeClass(
        "has-success");
}

/*$(document).ready(function() {
    var hoverTimer;

    $("#nav_casino").click(function() {
        $(".live_nav_wp").toggle();
    });
    $("#nav_casino").mouseleave(function() {//鼠标离开事件
        hoverTimer = setTimeout(function() {
            $(".live_nav_wp").hide()
        }, 500);
    });

    $(".live_nav_wp").mouseenter(function() {//鼠标滑过事件
        clearTimeout(hoverTimer);
    });
    $(".live_nav_wp").mouseleave(function() {//鼠标滑过事件
        $(this).hide()
    });

})*/

//设置时间方法
function GetTime() {
    var timebox = $('#time');
    var date = new Date;
    var Year = date.getFullYear();
    var Month = parseInt(date.getMonth()) + 1;
    var Day = date.getDate();
    var Hours = parseInt(date.getHours());
    var Minutes = parseInt(date.getMinutes());
    var Seconds = parseInt(date.getSeconds());
    if (Hours < 10) {
        Hours = "0" + Hours;
    }
    if (Minutes < 10) {
        Minutes = "0" + Minutes;
    }
    if (Seconds < 10) {
        Seconds = "0" + Seconds;
    }
    timebox.html(Year + "-" + Month + "-" + Day + " " + Hours + ":"
        + Minutes + ":" + Seconds);

};

function isSession(obj, url, type, gameType, msg) {
	//取屏幕宽高
	var winWidth = window.screen.availWidth;
	var winHeight = window.screen.availHeight;
	//计算出弹出框的占屏幕比例
	var openWidth = winWidth * 0.8;
	var openHeight = winHeight * 0.8;
	
	var centerWidth = (window.screen.availWidth - 10 - openWidth) / 2;
	var centerHeight = (window.screen.availHeight - 30 - openHeight) / 2;
	
	if(type==1){
		var gamewindow = window.open('', msg, "width="+openWidth+",height="+openHeight+",top="+centerHeight+",left="+centerWidth+",scrollbars=no,location=no,status=no");
	}
	//检验用户是否登录
	$.post("/user/checkUser.do",function(result){
		if(result.status == 0){//未登录
			if(type==1){
				gamewindow.close();
			}
            isLogin();
		}else if(result.status == 1){//试玩帐号
			if(gameType == 'GC'){
				if (type == "1") {
					gamewindow.location = url;
			    } else {
			        window.location.href = url;
			    }
			}else{
                layer.alert(commonlangpackage['usePlayAccount'],{title :'提示'});
			}
		}else if(result.status == 2){//代理帐号
            layer.alert(commonlangpackage['usePlayAccount'],{title :'提示'});
		}else if(result.status == 3){//正式帐号
			if (type == "1") {
				gamewindow.location = url;
		    } else {
		        window.location.href = url;
		    }
		}
	},'json');
}

//请登录
function isLogin() {
    layer.alert(commonlangpackage['pleaseLogin'],{title :'提示'});
    return;
}

//确认退出
function logout() {
    layer.confirm('确定退出？', {title:'提示'}, function(index){
        window.location.href = "/logout.do";
        layer.close(index);
    });
}

//刷新验证码
function changeImg(obj) {
    var imgSrc = $("#" + obj.id);
    var src = imgSrc.attr("src");
    imgSrc.attr("src", chgUrl(src));
}

//更换验证码链接
function chgUrl(url) {
	url = url.split('?')[0];
    var timestamp = (new Date()).valueOf();
    url = url + "?timestamp=" + timestamp;
    return url;
}

//弹出维护页面
function openError(src) {
    window.location.href = src;
}

//格式化金额
function fmoney(s, n) {
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, ""))
            .toFixed(n)
        + "";
    var l = s.split(".")[0].split("").reverse(), r = s
        .split(".")[1];
    t = "";
    for (i = 0; i < l.length; i++) {
        t += l[i]
            + ((i + 1) % 3 == 0 && (i + 1) != l.length ? ","
                : "");
    }
    return t.split("").reverse().join("") + "." + r;
}

//公共读取用户信息
function readUserDate_() {
    $.ajax({
        url : "/userDate.do?timeStamp="
        + new Date().getTime(),
        data : {},
        timeout : 2000, //超时时间设置，单位毫秒
        type : "get",
        dataType : "json",
        success : function(b) {
        	//console.debug(b);
            if (0 == b.code) {
                var balance = b.balance / 100;
                $("#balance").html(fmoney(balance) + '' + b.currency);
                //调用读取未读邮件的方法
                reademail_();
            } else if (99999 == b.code || 99998 == b.code) {
                //window.clearInterval(balanceInterval);
                if (confirm(commonlangpackage['loginTimeout'])) {
                    window.location.href = "/logout.do";
                } else {
                	 window.location.href = "/logout.do";
                }
            } else {
                //Showbo.Msg.alert(langpackage[b.code]);
                setTimeout(function() {
                	 window.location.href = "/logout.do";
                }, 1000);
            }
        }
    });
}

//登录时第一加载邮件信息
//flag 0,表示第一次加载时只查询未读邮件信息，如果传1，则查询全部  status为邮件状态 0-未读，1-已读
function reademail_() {
	$.ajax({
        url : "/common/reademailrecord.do?flag=0&state=0",
        data : {},
        timeout : 2000, //超时时间设置，单位毫秒
        type : "get",
        dataType : "json",
        success : function(b) {
        	//console.debug(ctx);
        	var path = "<img src='/img/email.png' style='width:24px;height:24px;' />" ;
          	var path1 = "<img src='/img/email_c2.png' style='width:24px;height:24px;'/>" ;
            if (1 == b.counts) {
                $("#userEmail").html(path1); 
            } else if (0 == b.counts) {
              	$("#userEmail").html(path);
            }
        }
    })
}

//2016.7.25-修改弹出框-hzy
//弹出框函数
function openByLayer(url, title, width, height){
	if(!width){
		width = '1200';
	}
	if(!height){
		height = '675';
	}
	layer.open({
		type: 2,
		title: title,
		closeBtn: 1,
		shadeClose: true,
		shade: 0.3,
		area: [width+'px', height+'px'],
		content: url
	});
}
//个人中心
function openStaticUserPopup(title) {
  openByLayer('/user/userView.do', title);
}
//免费试玩
function openStaticTryCode(title) {
  openByLayer('/testCode.do', title, 550, 210);
}
//存款
function openStaticCun(title) {
  openByLayer('/member/moneyCun.do', title);
}
//取款
function openStaticQu(title) {
	openByLayer('/member/moneyQu.do', title);
}
//资金管理
function openStaticMVPopup(title) {
  openByLayer('/member/moneyView.do', title);
}
//投注记录
function openStaticTZPopup(title) {
  openByLayer('/common/record.do', title);
}
//我的下线
function openStaticDownLine(title) {
  openByLayer('/downline/spread.do', title);
}
//邮件记录
function openStaticUserEmail(title) {
  openByLayer('/common/emailrecord.do', title);
}