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
            if (m < 1) {
                layer.msg("存款最小金额不能小于1RMB", 1, 0);
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

    填写付款人资料

</div>

<div class="card_main">
    <div class="card_width">
        <form action="j2paypaybank.do" name="orderForm" id="orderForm">
            <input name="cashId" type="hidden" value="">
            <input name="cashIs" id="cashIs" type="hidden" value="">
            <table width="100%" class="bgcolor">
                <tbody>
                <tr>
                    <td width="13%" align="right"> 会员账号：</td>
                    <td width="87%" colspan="4">${accountno }</td>
                </tr>
                <tr>
                    <td align="right">存款金额：</td>
                    <td colspan="4"><input name="money" id="money" type="text" class="input_money">(最低存款额度：1RMB+)
                    </td>
                </tr>

                <!-- <tr>
                    <td align="right">手机号码：</td>
                    <td colspan="4"><input name="phone" id="phone" type="text" class="input_money"></td>
                </tr> -->
                <tr>
                    <td align="right">支付银行：</td>
                    <td>
                        <div class="bz_bank">

                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                <tr>


                                    <td><input type="radio" name="bankCode" id="radio17" value="00050"></td>
                                    <td><label for="radio17"><img
                                            src="${ctx}/img/member/bank/bank_17.jpg" width="154"
                                            height="33" title="北京银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio32" value="00095"></td>
                                    <td><label for="radio32"><img
                                            src="${ctx}/img/member/bank/bank_32.jpg" width="154"
                                            height="33" title="渤海银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio38" value="00055"></td>
                                    <td><label for="radio38"><img
                                            src="${ctx}/img/member/bank/bank_38.jpg" width="154"
                                            height="33" title="南京银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio53" value="00084"></td>
                                    <td><label for="radio53"><img
                                            src="${ctx}/img/member/bank/bank_53.jpg" width="154"
                                            height="33" title="宁波银行"></label></td>

                                </tr>
                                <tr>


                                    <td><input type="radio" name="bankCode" id="radio54" value="00096"></td>
                                    <td><label for="radio54"><img
                                            src="${ctx}/img/member/bank/bank_54.jpg" width="154"
                                            height="33" title="东亚银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio23" value="00057"></td>
                                    <td><label for="radio23"><img
                                            src="${ctx}/img/member/bank/bank_23.jpg" width="154"
                                            height="33" title="光大银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio31" value="00052"></td>
                                    <td><label for="radio31"><img
                                            src="${ctx}/img/member/bank/bank_31.jpg" width="154"
                                            height="33" title="广发银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio30" value="00084A"></td>
                                    <td><label for="radio30"><img
                                            src="${ctx}/img/member/bank/bank_30.jpg" width="154"
                                            height="33" title="上海银行"></label></td>

                                </tr>
                                <tr>


                                    <td><input type="radio" name="bankCode" id="radio18" value="00006"></td>
                                    <td><label for="radio18"><img
                                            src="${ctx}/img/member/bank/bank_18.jpg" width="154"
                                            height="33" title="平安银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio5" value="00021"></td>
                                    <td><label for="radio5"><img
                                            src="${ctx}/img/member/bank/bank_5.jpg" width="154"
                                            height="33" title="招商银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio7" value="00005"></td>
                                    <td><label for="radio7"><img
                                            src="${ctx}/img/member/bank/bank_7.jpg" width="154"
                                            height="33" title="交通银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio4" value="00015"></td>
                                    <td><label for="radio4"><img
                                            src="${ctx}/img/member/bank/bank_4.jpg" width="154"
                                            height="33" title="建设银行"></label></td>

                                </tr>
                                <tr>


                                    <td><input type="radio" name="bankCode" id="radio1" value="00083"></td>
                                    <td><label for="radio1"><img
                                            src="${ctx}/img/member/bank/bank_1.jpg" width="154"
                                            height="33" title="中国银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio11" value="00032"></td>
                                    <td><label for="radio11"><img
                                            src="${ctx}/img/member/bank/bank_11.jpg" width="154"
                                            height="33" title="浦发银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio8" value="00051"></td>
                                    <td><label for="radio8"><img
                                            src="${ctx}/img/member/bank/bank_8.jpg" width="154"
                                            height="33" title="邮政储蓄"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio6" value="00004"></td>
                                    <td><label for="radio6"><img
                                            src="${ctx}/img/member/bank/bank_6.jpg" width="154"
                                            height="33" title="工商银行"></label></td>

                                </tr>
                                <tr>


                                    <td><input type="radio" name="bankCode" id="radio10" value="00041"></td>
                                    <td><label for="radio10"><img
                                            src="${ctx}/img/member/bank/bank_10.jpg" width="154"
                                            height="33" title="华夏银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio3" value="00013"></td>
                                    <td><label for="radio3"><img
                                            src="${ctx}/img/member/bank/bank_3.jpg" width="154"
                                            height="33" title="民生银行"></label></td> 
                                            
                                    <td><input type="radio" name="bankCode" id="radio2" value="00017"></td>
                                    <td><label for="radio2"><img
                                            src="${ctx}/img/member/bank/bank_2.jpg" width="154"
                                            height="33" title="农业银行"></label></td>
                                            
                                            <td><input type="radio" name="bankCode" id="radio24" value="00054"></td>
                                    <td><label for="radio24"><img
                                            src="${ctx}/img/member/bank/bank_24.jpg" width="154"
                                            height="33" title="中信银行"></label></td>


                                </tr>
                                <%-- <tr>
                                    <td><input type="radio" name="bankCode" id="radio31" value="00156"></td>
                                    <td><label for="radio31"><img
                                            src="${ctx}/img/member/bank/bank_31.jpg" width="154"
                                            height="33" title="成都银行"></label></td>

                                    <td><input type="radio" name="bankCode" id="radio21" value="00164"></td>
                                    <td><label for="radio21"><img
                                            src="${ctx}/img/member/bank/bank_32.jpg" width="154"
                                            height="33" title="渣打银行"></label></td> 
                                            
                                    <td><input type="radio" name="bankCode" id="radio33" value="00165"></td>
                                    <td><label for="radio33"><img
                                            src="${ctx}/img/member/bank/bank_33.jpg" width="154"
                                            height="33" title="海口联合农商行"></label></td>
                                </tr> --%>
                                </tbody>
                            </table>


                        </div>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <div style="padding: 10px 0;">
                            <a class="nui-btn nui-btn-theme-default" href="onlinepay.do">返回</a>
                            <a href="javascript:void" onclick="next();" class="nui-btn nui-btn-theme-main">下一步</a>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
        <div style="clear:both"></div>
    </div>
</div>


</body>
</html>