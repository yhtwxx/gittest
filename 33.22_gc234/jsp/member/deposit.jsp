<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>公司入款第一步</title>
    <link href="../css/member/deposit.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../js/layer.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/skin/layer.css" id="skinlayercss">
    <link rel="stylesheet" href="../css/showBo.css"/>
</head>
<body huaban_collector_injected="true">
<!--<div class="member_top">-->
<!--<div class="member_logo"><img src="#" width="140" height="42"></div>-->
<!--</div>-->
<div class="card_main">
    <div class="card_width">
        <div class="card_title">
            <p class="color_red">公司银行帐号随时更换! 请每次存款都至 [公司入款] 进行操作。 入款至已过期帐号，公司无法查收，恕不负责!</p>

            <p>欢迎使用公司入款平台!请依照以下步骤进行存款。如需说明请点击 公司入款流程解说。</p>
        </div>
        <div class="bz_tu">
            <ul>
                <li class="bz_tu1">1.选择您的银行</li>
                <li class="bz_tu2">2.选择您要转入的银行</li>
                <li class="bz_tu3">3.填写您的转账资料</li>
                <li class="bz_tu4">4.步骤完成</li>
            </ul>
        </div>
        <div class="bz_bank" style="background-color: #EEE;">
            <form action="deposit2.do" name="form1" id="form1">
            	<input type="hidden" name="payType" id="payType" value="" />
            	<input type="hidden" name="wbankName" id="wbankName" value="" />
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="广州银行" id="radio12" value="12"></td>
                        <td><a href="http://www.gzcb.com.cn/" target="_blank" title="广州银行官网"><img
                                src="../img/member/bank/bank_12.jpg" width="154" height="33"
                                title="广州银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="中国工商银行" id="radio6" value="6"></td>
                        <td><a href="http://www.icbc.com.cn/" target="_blank" title="中国工商银行官网"><img
                                src="../img/member/bank/bank_6.jpg" width="154" height="33"
                                title="中国工商银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="中国建设银行" id="radio4" value="4"></td>
                        <td><a href="http://www.ccb.com/" target="_blank" title="中国建设银行官网"><img
                                src="../img/member/bank/bank_4.jpg" width="154" height="33"
                                title="中国建设银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="中国农业银行" id="radio2" value="2"></td>
                        <td><a href="http://www.abchina.com/" target="_blank" title="中国农业银行官网"><img
                                src="../img/member/bank/bank_2.jpg" width="154" height="33"
                                title="中国农业银行"></a></td>

                    </tr>
                    <tr>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="中国邮政银行" id="radio8" value="8"></td>
                        <td><a href="http://www.chinapost.com.cn/" target="_blank" title="中国邮政银行官网"><img
                                src="../img/member/bank/bank_8.jpg" width="154" height="33"
                                title="中国邮政银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="中国银行" id="radio1" value="1"></td>
                        <td><a href="http://www.boc.cn/" target="_blank" title="中国银行官网"><img
                                src="../img/member/bank/bank_1.jpg" width="154" height="33"
                                title="中国银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="中国招商银行" id="radio5" value="5"></td>
                        <td><a href="http://www.cmbchina.com/" target="_blank" title="中国招商银行官网"><img
                                src="../img/member/bank/bank_5.jpg" width="154" height="33"
                                title="中国招商银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="中国交通银行" id="radio7" value="7"></td>
                        <td><a href="http://www.bankcomm.com/" target="_blank" title="中国交通银行官网"><img
                                src="../img/member/bank/bank_7.jpg" width="154" height="33"
                                title="中国交通银行"></a></td>

                    </tr>
                    <tr>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="中国民生银行" id="radio3" value="3"></td>
                        <td><a href="http://www.cmbc.com.cn/" target="_blank" title="中国民生银行官网"><img
                                src="../img/member/bank/bank_3.jpg" width="154" height="33"
                                title="中国民生银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="中信银行" id="radio24" value="24"></td>
                        <td><a href="http://bank.ecitic.com/" target="_blank" title="中信银行官网"><img
                                src="../img/member/bank/bank_24.jpg" width="154" height="33"
                                title="中信银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="中国兴业银行" id="radio9" value="9"></td>
                        <td><a href="http://www.cib.com.cn" target="_blank" title="中国兴业银行官网"><img
                                src="../img/member/bank/bank_9.jpg" width="154" height="33"
                                title="中国兴业银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="浦发银行" id="radio11" value="11"></td>
                        <td><a href="http://ebank.spdb.com.cn/" target="_blank" title="浦发银行官网"><img
                                src="../img/member/bank/bank_11.jpg" width="154" height="33"
                                title="浦发银行"></a></td>

                    </tr>
                    <tr>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="平安银行" id="radio18" value="18"></td>
                        <td><a href="http://www.18ebank.com/" target="_blank" title="平安银行官网"><img
                                src="../img/member/bank/bank_18.jpg" width="154" height="33"
                                title="平安银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="中国光大银行" id="radio23" value="23"></td>
                        <td><a href="http://www.cebbank.com/" target="_blank" title="中国光大银行官网"><img
                                src="../img/member/bank/bank_23.jpg" width="154" height="33"
                                title="中国光大银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="华夏银行" id="radio10" value="10"></td>
                        <td><a href="http://www.hxb.com.cn/" target="_blank" title="华夏银行官网"><img
                                src="../img/member/bank/bank_10.jpg" width="154" height="33"
                                title="华夏银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="北京银行" id="radio17" value="17"></td>
                        <td><a href="http://www.bankofbeijing.com.cn/" target="_blank" title="北京银行官网"><img
                                src="../img/member/bank/bank_17.jpg" width="154" height="33"
                                title="北京银行"></a></td>

                    </tr>
                    <tr>

                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="上海银行" id="radio30" value="30"></td>
                        <td><a href="http://www.bankofshanghai.com/" target="_blank" title="上海银行官网"><img
                                src="../img/member/bank/bank_30.jpg" width="154" height="33"
                                title="上海银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="广发银行" id="radio31" value="31"></td>
                        <td><a href="http://www.gdb.com.cn/" target="_blank" title="广发银行官网"><img
                                src="../img/member/bank/bank_31.jpg" width="154" height="33"
                                title="广发银行"></a></td>


                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="上海农商银行" id="radio21" value="21"></td>
                        <td><a href="http://www.shrcb.com/" target="_blank" title="上海农商银行官网"><img
                                src="../img/member/bank/bank_21.jpg" width="154" height="33"
                                title="上海农商银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="渤海银行" id="radio32" value="32"></td>
                        <td><a href="http://www.cbhb.com.cn/" target="_blank" title="渤海银行官网"><img
                                src="../img/member/bank/bank_32.jpg" width="154" height="33"
                                title="渤海银行"></a></td>
                       
                    </tr>
                    <tr>
                   		<td><input type="radio" name="mb" data-payType="bank" data-bankName="东莞银行" id="radio33" value="33"></td>
                        <td><a href="http://www.dongguanbank.cn/" target="_blank" title="东莞银行官网"><img
                                src="../img/member/bank/bank_33.jpg" width="154" height="33"
                                title="东莞银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="杭州银行" id="radio34" value="34"></td>
                        <td><a href="http://www.hzbank.com.cn/" target="_blank" title="杭州银行官网"><img
                                src="../img/member/bank/bank_34.jpg" width="154" height="33"
                                title="杭州银行"></a></td>
                                
                  		<td><input type="radio" name="mb" data-payType="bank" data-bankName="浙商银行" id="radio35" value="35"></td>
                        <td><a href="http://www.czbank.com/" target="_blank" title="浙商银行官网"><img
                                src="../img/member/bank/bank_35.jpg" width="154" height="33"
                                title="浙商银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="温州银行" id="radio36" value="36"></td>
                        <td><a href="http://www.wzcb.com.cn/" target="_blank" title="温州银行官网"><img
                                src="../img/member/bank/bank_36.jpg" width="154" height="33"
                                title="温州银行"></a></td>
                    </tr>
                    <tr>
                    	<td><input type="radio" name="mb" data-payType="bank" data-bankName="晋商银行" id="radio37" value="37"></td>
                        <td><a href="http://www.jshbank.com/" target="_blank" title="晋商银行官网"><img
                                src="../img/member/bank/bank_37.jpg" width="154" height="33"
                                title="晋商银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="南京银行" id="radio38" value="38"></td>
                        <td><a href="http://www.njcb.com.cn/" target="_blank" title="南京银行官网"><img
                                src="../img/member/bank/bank_38.jpg" width="154" height="33"
                                title="南京银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="广州农商银行" id="radio39" value="39"></td>
                        <td><a href="http://www.grcbank.com/" target="_blank" title="广州农商银行官网"><img
                                src="../img/member/bank/bank_39.jpg" width="154" height="33"
                                title="广州农商银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="上海农商银行" id="radio40" value="40"></td>
                        <td><a href="http://www.srcb.com/" target="_blank" title="上海农商银行官网"><img
                                src="../img/member/bank/bank_40.jpg" width="154" height="33"
                                title="上海农商银行"></a></td>
                    </tr>
                    <tr>
                    	<td><input type="radio" name="mb" data-payType="bank" data-bankName="漢口银行" id="radio41" value="41"></td>
                        <td><a href="http://www.hkbchina.com/" target="_blank" title="漢口银行官网"><img
                                src="../img/member/bank/bank_41.jpg" width="154" height="33"
                                title="漢口银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="顺德农商银行" id="radio42" value="42"></td>
                        <td><a href="http://www.sdebank.com/" target="_blank" title="顺德农商银行官网"><img
                                src="../img/member/bank/bank_42.jpg" width="154" height="33"
                                title="顺德农商银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="浙江稠州商业银行" id="radio43" value="43"></td>
                        <td><a href="http://www.czcb.com.cn/" target="_blank" title="浙江稠州商业银行官网"><img
                                src="../img/member/bank/bank_43.jpg" width="154" height="33"
                                title="浙江稠州商业银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="北京农商银行" id="radio44" value="44"></td>
                        <td><a href="http://www.bjrcb.com/" target="_blank" title="北京农商银行官网"><img
                                src="../img/member/bank/bank_44.jpg" width="154" height="33"
                                title="北京农商银行"></a></td>
                    </tr>
                    <tr>
                    <td><input type="radio" name="mb" data-payType="bank" data-bankName="自贡市商业银行" id="radio45" value="45"></td>
                        <td><a href="http://www.zgbank.com.cn/" target="_blank" title="自贡市商业银行官网"><img
                                src="../img/member/bank/bank_45.jpg" width="154" height="33"
                                title="自贡市商业银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="东莞农村商业银行" id="radio46" value="46"></td>
                        <td><a href="http://www.drcbank.com/" target="_blank" title="东莞农村商业银行官网"><img
                                src="../img/member/bank/bank_46.jpg" width="154" height="33"
                                title="东莞农村商业银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="甘肃银行" id="radio47" value="47"></td>
                        <td><a href="http://www.gsbankchina.com/" target="_blank" title="甘肃银行官网"><img
                                src="../img/member/bank/bank_47.jpg" width="154" height="33"
                                title="甘肃银行"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="bank" data-bankName="贵阳银行" id="radio48" value="48"></td>
                        <td><a href="http://www.gyccb.cn/" target="_blank" title="贵阳银行官网"><img
                                src="../img/member/bank/bank_48.jpg" width="154" height="33"
                                title="贵阳银行"></a></td>   
                    </tr>
                    <tr>
                    	<td><input type="radio" name="mb" data-payType="weixin" data-bankName="微信支付" id="radio49" value="49"></td>
                        <td><a href="https://pay.weixin.qq.com/" target="_blank" title="微信支付"><img
                                src="../img/member/bank/bank_49.jpg" width="154" height="33"
                                title="微信支付"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="alipay" data-bankName="支付宝" id="radio50" value="50"></td>
                        <td><a href="http://www.alipay.com/" target="_blank" title="支付宝"><img
                                src="../img/member/bank/bank_50.jpg" width="154" height="33"
                                title="支付宝"></a></td>
                                
                        <td><input type="radio" name="mb" data-payType="weixin_ew" data-bankName="微信扫码支付" id="radio52" value="52"></td>
                        <td><a href="https://pay.weixin.qq.com/" target="_blank" title="微信扫码支付"><img
                                src="../img/member/bank/bank_52.jpg" width="154" height="33"
                                title="支付宝"></a></td>
                    </tr>
                    <tr>
                        <td colspan="8" align="center"><a class="nui-btn nui-btn-theme-main" href="javascript:void" onclick="next();">下一步</a></td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../js/layer.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).on('click', "input[name='mb']", function(e){
			$("#payType").val($(this).attr("data-payType"));
			$("#wbankName").val($(this).attr("data-bankName"));
		});
	})
    function next() {
        var check = $("input[name='mb']:checked").val();
        if (typeof (check) == "undefined") {
            layer.msg("选择您的银行", 1, 0);
            return;
        }
        window.location.href = $("#form1").attr("action") + "?" + $("#form1").serialize();
    }
</script>
</body>
</html>