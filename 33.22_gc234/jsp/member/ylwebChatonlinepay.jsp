<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>在线入款</title>
    <link href="../css/member/deposit.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../plugin/layer/layer.js"></script>
    <link type="text/css" rel="stylesheet" href="../plugin/layer/skin/layer.css" id="skinlayercss">
    <link rel="stylesheet" href="../css/showBo.css"/>
    <script type="text/javascript">
    
    	var xmlstr = "";
    	var yollyflow = "";
    	var flownumber = "";
    	
        var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
        function next() {
        	//var check = $("input[name='bankCode']:checked").val();
        	
        	var index = layer.load(1, {
			  shade: [0.5, '#393D49'] //0.1透明度的白色背景
			});
        	
        	
             var money = $("#money").val();
            
            if (!exp.test(money)) {
                layer.msg("请输入正确的存款金额", 1, 0);
                $("#money").focus();
                return;
            } 
            /* if (m < 100) {
                layer.msg("存款最小金额不能小于100RMB", 1, 0);
                $("#order_amount").focus();
                return;
            } */
            
            //生成二维码
            var code = "0";
            var errormsg = "";
            $.ajax({
		        url : "${ctx}/member/ylwebChatpaybank.do?money="+money,
		        data : {},
		        timeout : 2000, //超时时间设置，单位毫秒
		        type : "get",
		        dataType : "json",
		        success : function(b) {
		            if (b.code == "0") {
		            	xmlstr = encodeURI(encodeURI(b.xmlstr));
		            	yollyflow = b.yollyflow;
		            	flownumber = b.flownumber;
		            	Qrcodeimg(xmlstr);
		            	$("#webchatqrcode").show();
		            	layer.close(index);
		            }else {
		            	layer.close(index);
		            	layer.msg(b.errormsg);
		            }
		        }
		    });
        }
        
        //生成二维码的公共方法 
        function Qrcodeimg(xmlstr){
        	var timestamp = (new Date()).valueOf();
        	$("#qrcode").attr("src", "${ctx}/qrCode.do?timestamp="+timestamp+"&xmlstr="+xmlstr);
        }
    </script>

</head>
<body huaban_collector_injected="true">
<!--<div class="member_top">-->
<!--<div class="member_logo"><img src="#" width="140" height="42"></div>-->
<!--</div>-->
<div class="line_title">

    微信扫码支付

</div>

<div class="card_main">
    <div class="card_width">
        <form action="" name="orderForm" id="orderForm">

            <input name="cashId" type="hidden" value="" />
            <input name="sessionId" type="hidden" value="${sessionId }" />
            <input name="cashIs" id="cashIs" type="hidden" value="" />
            <table width="100%" class="bgcolor">
                <tbody>
                <tr>
                    <td width="13%" align="right"> 会员账号：</td>
                    <td width="87%" colspan="4">${accountno }</td>
                </tr>
                <tr>
                    <td align="right">存款金额：</td>
                    <td colspan="4"><input name="money" id="money" type="text" class="input_money" />(最低存款额度：)
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <div style="padding: 10px 0;">
                            <a class="nui-btn nui-btn-theme-default" href="onlinepay.do">返回</a>
                            <a id="abutton" href="javascript:void" onclick="next();" class="nui-btn nui-btn-theme-main">微信支付</a>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
        <div style="clear:both"></div>
    </div>
    
    <div id="webchatqrcode" style="display: none"  class="card_width">
       <div class="head">
       <div class="row">
        <div class="col-md-12">
              <div class="col-title"><span style='color: red'>请扫下方二维码进行支付,支付过程中请勿关闭页面</span></div>
              <div class="col-content">
              <p><img id="qrcode" src=""></p>
              <p class="col-bg">在手机上打开微信软件，点击“扫一扫”并将手机对准以上“二维码”按照系统提示进行支付。</p>
              <p><img src="${ctx}/img/mobile/wechat-qr.jpg"></p>
              </div>
              <span class="brdr1"></span>
              </div>
			</div>
     </div>
	</div>
</div>

<script language="javascript" type="text/javascript">
            //获取用户信息
            var closecode = "0";
            var balanceInterval = window.setInterval(function() {
                if(flownumber != ""){
                	$.ajax({
        		        url : "${ctx}/member/webChatreturn.do?yollyflow="+yollyflow+"&flownumber="+flownumber,
        		        data : {},
        		        timeout : 2000, //超时时间设置，单位毫秒
        		        type : "get",
        		        dataType : "json",
        		        success : function(b) {
        		        	if(b.code=="2"){
        		        		closecode = "2";
                        		window.location="${ctx}/member/moneyPromptget.do";
                        	}
        		        }
        		    });
                	
                }
            }, 10000)
</script>
<script type="text/javascript">
//绑定beforeunload事件
	$(window).bind('beforeunload', function() {
		if(closecode =="0"){
			return '关闭页面请确认微信支付已经成功，确定离开此页面吗？';
		}else{return;}
	});
</script>
</body>
</html>