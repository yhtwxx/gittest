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
            /* if (m < 100) {
                layer.msg("存款最小金额不能小于100RMB", 1, 0);
                $("#order_amount").focus();
                return;
            } */
            
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
        <form action="gfbpaybank.do" name="orderForm" id="orderForm">

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
                    <td colspan="4"><input name="money" id="money" type="text" class="input_money">(最低存款额度：100+)
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


                                    <td><input type="radio" name="bankCode" id="radio6" value="icbc"></td>
                                    <td><label for="radio6"><img
                                            src="${ctx}/img/member/bank/bank_6.jpg" width="154"
                                            height="33" title="中国工商银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio4" value="ccb"></td>
                                    <td><label for="radio4"><img
                                            src="${ctx}/img/member/bank/bank_4.jpg" width="154"
                                            height="33" title="中国建设银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio2" value="abc"></td>
                                    <td><label for="radio2"><img
                                            src="${ctx}/img/member/bank/bank_2.jpg" width="154"
                                            height="33" title="中国农业银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio8" value="post"></td>
                                    <td><label for="radio8"><img
                                            src="${ctx}/img/member/bank/bank_8.jpg" width="154"
                                            height="33" title="中国邮政银行"></label></td>

                                </tr>
                                <tr>


                                    <td><input type="radio" name="bankCode" id="radio1" value="boc"></td>
                                    <td><label for="radio1"><img
                                            src="${ctx}/img/member/bank/bank_1.jpg" width="154"
                                            height="33" title="中国银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio5" value="cmb"></td>
                                    <td><label for="radio5"><img
                                            src="${ctx}/img/member/bank/bank_5.jpg" width="154"
                                            height="33" title="中国招商银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio7" value="comm"></td>
                                    <td><label for="radio7"><img
                                            src="${ctx}/img/member/bank/bank_7.jpg" width="154"
                                            height="33" title="中国交通银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio3" value="cmbc"></td>
                                    <td><label for="radio3"><img
                                            src="${ctx}/img/member/bank/bank_3.jpg" width="154"
                                            height="33" title="中国民生银行"></label></td>

                                </tr>
                                <tr>


                                    <td><input type="radio" name="bankCode" id="radio24" value="ecitic"></td>
                                    <td><label for="radio24"><img
                                            src="${ctx}/img/member/bank/bank_24.jpg" width="154"
                                            height="33" title="中信银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio9" value="cib"></td>
                                    <td><label for="radio9"><img
                                            src="${ctx}/img/member/bank/bank_9.jpg" width="154"
                                            height="33" title="中国兴业银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio11" value="spdb"></td>
                                    <td><label for="radio11"><img
                                            src="${ctx}/img/member/bank/bank_11.jpg" width="154"
                                            height="33" title="浦发银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio18" value="sdb"></td>
                                    <td><label for="radio18"><img
                                            src="${ctx}/img/member/bank/bank_18.jpg" width="154"
                                            height="33" title="平安银行"></label></td>

                                </tr>
                                <tr>


                                    <td><input type="radio" name="bankCode" id="radio23" value="ceb"></td>
                                    <td><label for="radio23"><img
                                            src="${ctx}/img/member/bank/bank_23.jpg" width="154"
                                            height="33" title="中国光大银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio10" value="hxb"></td>
                                    <td><label for="radio10"><img
                                            src="${ctx}/img/member/bank/bank_10.jpg" width="154"
                                            height="33" title="华夏银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio17" value="bccb"></td>
                                    <td><label for="radio17"><img
                                            src="${ctx}/img/member/bank/bank_17.jpg" width="154"
                                            height="33" title="北京银行"></label></td>


                                    <td><input type="radio" name="bankCode" id="radio30" value="bos"></td>
                                    <td><label for="radio30"><img
                                            src="${ctx}/img/member/bank/bank_30.jpg" width="154"
                                            height="33" title="上海银行"></label></td>

                                </tr>
                                <tr>


                                    <td><input type="radio" name="bankCode" id="radio31" value="gdb"></td>
                                    <td><label for="radio31"><img
                                            src="${ctx}/img/member/bank/bank_31.jpg" width="154"
                                            height="33" title="广发银行"></label></td>


                                   <%--  <td><input type="radio" name="bankCode" id="radio21" value="cbhb"></td>
                                    <td><label for="radio21"><img
                                            src="${ctx}/img/member/bank/bank_32.jpg" width="154"
                                            height="33" title="渤海银行"></label></td> --%>
                                            
                                           <%--  <td><input type="radio" name="bankCode" id="radio21" value="bea"></td>
                                    <td><label for="radio21"><img
                                            src="${ctx}/img/member/bank/bank_33.jpg" width="154"
                                            height="33" title="东亚银行"></label></td> --%>
                                            
                                            <td><input type="radio" name="bankCode" id="radio22" value="nb"></td>
                                    <td><label for="radio22"><img
                                            src="${ctx}/img/member/bank/bank_34.jpg" width="154"
                                            height="33" title="宁波银行"></label></td>


                                </tr>
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