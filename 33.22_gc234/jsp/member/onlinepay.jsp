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
    <script type="text/javascript" src="../js/layer.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/skin/layer.css" id="skinlayercss">
    <link rel="stylesheet" href="../css/showBo.css"/>
    <script type="text/javascript">
        var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
        function next() {
        	var check = $("input[name='bankCode']:checked").val();
        	
             var m = $("#money").val();
            
            if (!exp.test(m)) {
                layer.msg("请输入正确的存款金额", 1, 0);
                $("#money").focus();
                return;
            } 
            if (m < 100) {
                layer.msg("存款最小金额不能小于100RMB", 1, 0);
                $("#order_amount").focus();
                return;
            }
            
            /* var phone = $("#phone").val();
            if (phone==null || phone == "") {
                layer.msg("请输入正确的手机号码", 1, 0);
                $("#phone").focus();
                return;
            } */
            
            if (typeof (check) == "undefined") {
                layer.msg("选择您的银行", 1, 0);
                return;
            }
            
            document.orderForm.submit();
            return;
            
        }
        function checkSubmit() {
            if ("" === "1") {
                var way = $("input[name='dpFlag']:checked").val();
                if (typeof (way) == 'undefined') {
                    layer.msg("请选择存款优惠是获取还是放弃", 2, 0);
                    return;
                }
                $("#cashIs").val(way);
            } else {
                $("#cashIs").val("1");
            }

            $("#form1").submit();
        }
        

    </script>

</head>
<body huaban_collector_injected="true">
<!--<div class="member_top">-->
<!--<div class="member_logo"><img src="#" width="140" height="42"></div>-->
<!--</div>-->
<div class="line_title">

    选择第三方支付平台

</div>

<div class="card_main">
    <div class="card_width">
        <form action="${url }member/paybank.do" name="orderForm" id="orderForm">

            <input name="cashId" type="hidden" value="">
            <input name="sessionId" type="hidden" value="${sessionId }">
            <input name="cashIs" id="cashIs" type="hidden" value="">
            <table width="100%" class="bgcolor">
                <tbody>
                <%--<tr>--%>
                    <%--<td width="13%" align="right"> 会员账号：</td>--%>
                    <%--<td width="87%" colspan="4">${accountno }</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td align="right">存款金额：</td>--%>
                    <%--<td colspan="4"><input name="money" id="money" type="text" class="input_money">(最低存款额度：100+)--%>
                    <%--</td>--%>
                <%--</tr>--%>

                <!-- <tr>
                    <td align="right">手机号码：</td>
                    <td colspan="4"><input name="phone" id="phone" type="text" class="input_money"></td>
                </tr> -->
                <tr>
                    <td>
                        <div class="bz_bank">
						    <p>
						    <a id="zf" href="zfonlinepay3.do" style="display: none;">
						    <img  src="${ctx }/img/member/paybank/logo_zf.png" width="150" height="60"/>
						    </a>
						    <a id="gfb" href="gfbonlinepay.do" style="display: none;">
						    <img src="${ctx }/img/member/paybank/logo_gfb.jpg" width="150" height="60"/>
						    </a>
						    <a id="ips" href="ipsonlinepay.do" style="display: none;">
						    <img src="${ctx }/img/member/paybank/logo_hx.jpg" width="150" height="60"/>
						    </a>
						    <a id="bf" href="bfonlinepay.do" style="display: none;">
						    <img src="${ctx }/img/member/paybank/logo_bf.png" width="150" height="60"/>
						    </a>
						    <a id="xs" href="javascript:void(0);" style="display: none;">
						    <img src="${ctx }/img/member/paybank/logo_xs.jpg" width="150" height="60"/>
						    </a>
						    <a id="j2pay" href="j2payonlinepay.do" style="display: none;">
						    <img src="${ctx }/img/member/paybank/logo_j2pay.png" width="150" height="60"/>
						    </a>
						    <a id="wechatpay" href="ylwebChatonlinepay.do" style="display: none;">
						    <img src="${ctx }/img/member/paybank/logo_wechatpay.png" width="150" height="60"/>
						    </a>
						    <a id="yeepay" href="yeepayonline.do" style="display: none;">
						    <img src="${ctx }/img/member/paybank/logo_yeepay.png" width="150" height="60"/>
						    </a>
						    <a id="mobao" href="mobaoonlinepay.do" style="display: none;">
						    <img src="${ctx }/img/member/paybank/logo_mobao.png" width="150" height="60"/>
						    </a>
						    <a id="eypal" href="eypalonlinepay.do" style="display: none;">
						    <img src="${ctx }/img/member/paybank/logo_eypal.png" width="150" height="60"/>
						    </a>
						    <a id="sdpay" href="sdpayonlinepay.do" style="display: none;">
						    <img src="${ctx }/img/member/paybank/logo_sdpay.png" width="150" height="60"/>
						    </a>
						    <a id="zf3" href="zfonlinepay3.do" style="display: none;">
						    <img  src="${ctx }/img/member/paybank/logo_zf.png" width="150" height="60"/>
						    </a>
						    </p>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
        <div style="clear:both"></div>
    </div>
</div>

<script>
    $(function(){
		$.ajax({url: "paymentData.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
		    success: function(b) {
		        if(b.list.length > 0){
		        	var list = b.list;
		        	for (var i = 0; i < list.length; i++) {
						if(list[i].paystatus == 1){
							var fileName = list[i].fileName;
							$("#" + fileName).show();
						}
					}
		        }
		    }
		});
    })
    
</script>
<script type="text/javascript">
$(".card_main .card_width .bz_bank a").on('click',function(){
    var href = $(this).attr("href");
    var id = $(this).attr("id");
    /* $(this).attr("href","#"); */
    var code = "0";
    $.ajax({url: "verifypayment.do?timeStamp=" + new Date().getTime() + "&id="+id,type: "get",async:false,dataType: "json",
	    success: function(b) {
	    	code = b.code;
	    }
	});
    if(code == "1"){
    	layer.msg("前后台商户号不匹配!",3,3);
    	return false;
    }else if (code == "2") {
    	layer.msg("商户号验证不成功!",3,3);
    	return false;
	}else{
    	$(this).attr("href",href);
    }
});
</script>

</body>
</html>