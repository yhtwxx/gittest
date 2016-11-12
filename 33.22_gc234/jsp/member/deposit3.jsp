<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>公司入款第三步</title>
    <link href="../css/member/deposit.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../js/layer.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/skin/layer.css" id="skinlayercss">
    <link rel="stylesheet" href="../css/showBo.css"/>
    <script type="text/javascript">
        var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
        var expName = /[\u4E00-\u9FA5]{2,4}/;
        function next() {
        	
            var m = $("#money").val();
            var name = $("#depositName").val();
            var min = 100;
            var way = $("input[name='wdType']:checked").val();

            if (!exp.test(m)) {
                layer.msg("请输入正确的金额", 1, 0);
                $("#money").focus();
                return;
            }
            if (m < min) {
                layer.msg("金额小于最小存款额度：" + min, 1, 0);
                $("#money").focus();
                return;
            }
            if(name==null || name==""){
            	layer.msg("请输入存款人姓名", 1, 0);
            	$("#depositName").focus();
                return;
            }

            /* if (!expName.test(name)) {
                layer.msg("请输入正确的存款人姓名",1, 0);
                $("#depositName").focus();
                return;
            } */
            if (typeof (way) == 'undefined') {
                layer.msg("请选择存款方式", 1, 0);
                return;
            }
            
            var dispotTime = $("#dispotTime").val();
        	var Time_Hour = $("#Time_Hour").val();
        	var Time_Minute = $("#Time_Minute").val();
            if(dispotTime==null || dispotTime==""){
            	layer.msg("存款时间不能为空", 1, 0);
                return;
            }
            var dateStr = dispotTime+" ";
            if(Time_Hour<10){
            	dateStr = dateStr+"0"+Time_Hour+":";
            }else{
            	dateStr = dateStr+Time_Hour+":";
            }
            if(Time_Minute<10){
            	dateStr = dateStr+"0"+Time_Minute;
            }else{
            	dateStr = dateStr+Time_Minute;
            }
            //alert(dateStr);
            
            $("#reqTime").val(dateStr);
            
            /* $("#wbankName").val(getwbankName()); */
            
            $("#form1").submit();
            

        }
        
        /* function getwbankName(){
        	var mb = ${mb};
        	if(mb=="12"){return "广州银行";}else if(mb=="6"){return "中国工商银行";}else 
        		if(mb=="4"){return "中国建设银行";}else if(mb=="2"){return "中国农业银行";}else
        			if(mb=="8"){return "中国邮政银行";}else if(mb=="1"){return "中国银行";}else 
        				if(mb=="5"){return "中国招商银行";}else if(mb=="7"){return "中国交通银行";}else 
        					if(mb=="3"){return "中国民生银行";}else if(mb=="24"){return "中信银行";}else
        						if(mb=="9"){return "中国兴业银行";}else if(mb=="11"){return "浦发银行";}else
        							if(mb=="18"){return "平安银行";}else if(mb=="23"){return "中国光大银行";}else
        								if(mb=="10"){return "华夏银行";}else if(mb=="17"){return "北京银行";}else
        									if(mb=="30"){return "上海银行";}else if(mb=="31"){return "广发银行";}else
        										if(mb=="21"){return "上海农商银行";}else if(mb=="32"){return "渤海银行";}else
        											if(mb=="33"){return "东莞银行";}else if(mb=="34"){return "杭州银行";}else
        												if(mb=="35"){return "浙商银行";}else if(mb=="36"){return "温州银行";}else
        													if(mb=="37"){return "晋商银行";}else if(mb=="38"){return "南京银行";}else
        														if(mb=="39"){return "广州农商银行";}else if(mb=="40"){return "上海农商银行";}else
        															if(mb=="41"){return "漢口银行";}else if(mb=="42"){return "顺德农商银行";}else
        																if(mb=="43"){return "浙江稠州商业银行";}else if(mb=="44"){return "北京农商银行";}else
        																	if(mb=="45"){return "自贡市商业银行";}else if(mb=="46"){return "东莞农村商业银行";}else
        																		if(mb=="47"){return "甘肃银行";}else if(mb=="48"){return "贵阳银行";}else 
        																			if(mb=="49"){return "微信支付";}else if(mb=="50"){return "支付宝";}
        } */
        
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
        var flag = true;
        $(document).ready(function () {
            /* $("input[name='wdType']").click(function () {
                var t = $(this).val();
                if (t == '3' || t == '4' || t == '5') {
                    flag = false;
                    $("#address").css("display", "block");
                } else {
                    flag = true;
                    $("#address").css("display", "none");
                }
            }); */
            
        	var status = "${status}";
            if(status == 0){//出错
            	layer.msg("存款出错，请联系客服处理！", 3, function(){
            		window.close();
            	});
            }else if(status == 1){//正常下一步
            	var json = '${json}';
            	var jsonData = eval("(" + json + ")");
            	showInfo(jsonData);
            }else if(status == 2){//有未完成的订单
            	layer.msg("您有未完成的订单，请继续完成您未完成的订单！", 3, 0);
            	var json = '${json}';
            	var jsonData = eval("(" + json + ")");
            	showInfo(jsonData);
            }else if(status == 3){//有未审核的订单
            	layer.msg("您还有订单没有通过审核，请前往存款记录进行查询！", 3, function(){
            		window.close();
            	});
            }
            //getGMT();
        });
        
        function showInfo(json){
        	console.debug(json);
            var mdr = json.memberDWRecord;
            if(json.payType == 4){
            	$("#address").html("<img width='100px' height='100px' src='"+mdr.bankAdress+"' /><span style='color: red'>请先扫描二维码进行支付，再填写订单！</span>");
            }else{
            	$("#address").html(mdr.bankAdress);
            }
            
            $("#bankname").html(mdr.bankName);
            $("#username").html(mdr.bankAcount);
            $("#bankcode").html(mdr.bankCode);
            $("#OrderNum").html(mdr.orderid);
            
            $("#bankAdress").val(mdr.bankAdress);
            $("#bankName").val(mdr.bankName);
            $("#bankAcount").val(mdr.bankAcount);
            $("#bankCode").val(mdr.bankCode);
            $("#orderid").val(mdr.orderid);
            
            var bankInfo = mdr.wbankName;
            var bankArr = bankInfo.split("-");
            var mb = bankArr[0];
            var wbankName = bankArr[1];
            
            $("#wbankName").val(bankInfo);
            
            $("#bank"+mb).show();
            
            getTime();
        }
        
        function getGMT() {
            var d = new Date()
            var gmtHours = d.getTimezoneOffset() / 60
            alert("gmtHours====="+gmtHours);
            $("#gmt").html(gmtHours);

        }
        
        function getTime(){
        	var now = new Date();
            
            var year = now.getFullYear();       //年
            var month = now.getMonth() + 1;     //月
            var day = now.getDate();            //日
           
            var hh = now.getHours();            //时
            var mm = now.getMinutes();          //分
            var dateStr = year+"-";
            if(month<10){
            	dateStr =dateStr+"0"+month+"-";
            }else{
            	dateStr =dateStr+month+"-";
            }
            if(day<10){
            	dateStr =dateStr+"0"+day;
            }else{
            	dateStr =dateStr+day;
            }
            
        	$("#dispotTime").val(dateStr);
        	$("#Time_Hour").val(hh);
        	$("#Time_Minute").val(mm);
        }


    </script>

</head>
<body huaban_collector_injected="true">
<!--<div class="member_top">-->
<!--<div class="member_logo"><img src="#" width="140" height="42"></div>-->
<!--</div>-->
<script type="text/javascript" src="${ctx}/js/laydate.js"></script>
<script>
    laydate({
        elem: '#start', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        event: 'focus' //响应事件。如果没有传入event，则按照默认的click
    });
    laydate({
        elem: '#end'
    });
</script>
<div class="card_main">
    <div class="card_width">
        <div class="card_title">
            <p class="color_red">公司银行帐号随时更换! 请每次存款都至 [公司入款] 进行操作。 入款至已过期帐号，公司无法查收，恕不负责!</p>

            <p>欢迎使用公司入款平台!请依照以下步骤进行存款。如需说明请点击 公司入款流程解说。</p>
        </div>
        <div class="bz2_tu">
            <ul>
                <li class="bz1_tu1">1.选择您的银行</li>
                <li class="bz_tu2">2.选择您要转入的银行</li>
                <li class="bz2_tu3">3.填写您的转账资料</li>
                <li class="bz_tu4">4.步骤完成</li>
            </ul>
        </div>
        <div class="bz_bank">
            <p class="color_red">选择银行已完成!以下是您欲转帐的银行帐户资料.</p>
            <table width="100%" border="0" cellspacing="1" cellpadding="0" class="bgcolor">
                <tbody>
                <tr>
                    <td width="50%">
                        <table width="100%" border="0" cellspacing="1" cellpadding="0" class="bgcolor">
                            <tbody>
                            <tr>

                                <td width="85%"><strong>开户行网点：</strong><span id="address"></span></td>
                            </tr>
                            <tr>
                                <td><strong>收款人：</strong><span id="username"></span></td>
                            </tr>
                            <tr>
                                <td><strong>银行：</strong><span id="bankname"></span></td>
                            </tr>
                            <tr>
                                <td><strong>账号：</strong><span id="bankcode"></span></td>
                            </tr>
                            <tr>
                                <td><strong>订单号：</strong><span id="OrderNum"></span></td>
                            </tr>
                            <tr>
                                <td>※请备份订单号，并复制进您的工作汇款备注栏</td>
                            </tr>
                            <tr>
                                <td>※转帐完成后请保留单据作为核对证明</td>
                            </tr>
                            </tbody>
                        </table>
                        <p class="color_red">接下来您可以透过以下方式完成转帐...</p>
                        <table width="100%" border="0" cellspacing="1" cellpadding="0" class="bgcolor"
                               bgcolor="#eee">
                            <tbody>
                            <tr>

                                <td width="85%">1.网路银行转帐：登入您的网路银行完成转帐</td>
                            </tr>
                            <tr>
                                <td>
                                <a href="http://www.gzcb.com.cn/"  id="bank12" target="_blank" title="广州银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_12.jpg" width="154" height="33"
                                title="广州银行"></a>
                                <a href="http://www.icbc.com.cn/" id="bank6" target="_blank" title="中国工商银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_6.jpg" width="154" height="33"
                                title="中国工商银行" ></a> 
                                <a href="http://www.ccb.com/" id="bank4" target="_blank" title="中国建设银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_4.jpg" width="154" height="33"
                                title="中国建设银行" ></a> 
                                <a href="http://www.abchina.com/" id="bank2" target="_blank" title="中国农业银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_2.jpg" width="154" height="33"
                                title="中国农业银行"  ></a> 
                                <a href="http://www.chinapost.com.cn/" id="bank8" target="_blank" title="中国邮政银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_8.jpg" width="154" height="33"
                                title="中国邮政银行" ></a> 
                                <a href="http://www.boc.cn/" id="bank1" target="_blank" title="中国银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_1.jpg" width="154" height="33"
                                title="中国银行" ></a>
                                <a href="http://www.cmbchina.com/" id="bank5" target="_blank" title="中国招商银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_5.jpg" width="154" height="33"
                                title="中国招商银行" ></a>
                                <a href="http://www.bankcomm.com/" id="bank7" target="_blank" title="中国交通银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_7.jpg" width="154" height="33"
                                title="中国交通银行" ></a>
                                <a href="http://www.cmbc.com.cn/" id="bank3" target="_blank" title="中国民生银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_3.jpg" width="154" height="33"
                                title="中国民生银行" ></a>
                                <a href="http://bank.ecitic.com/" id="bank24" target="_blank" title="中信银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_24.jpg" width="154" height="33"
                                title="中信银行" ></a>
                                <a href="http://www.cib.com.cn" id="bank9" target="_blank" title="中国兴业银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_9.jpg" width="154" height="33"
                                title="中国兴业银行" ></a>
                                <a href="http://ebank.spdb.com.cn/" id="bank11" target="_blank" title="浦发银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_11.jpg" width="154" height="33"
                                title="浦发银行" ></a>
                                <a href="http://www.18ebank.com/" id="bank18" target="_blank" title="平安银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_18.jpg" width="154" height="33"
                                title="平安银行" ></a>
                                <a href="http://www.cebbank.com/" id="bank23" target="_blank" title="中国光大银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_23.jpg" width="154" height="33"
                                title="中国光大银行" ></a>
                                <a href="http://www.hxb.com.cn/" id="bank10" target="_blank" title="华夏银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_10.jpg" width="154" height="33"
                                title="华夏银行" ></a>
                                <a href="http://www.bankofbeijing.com.cn/" id="bank17" target="_blank" title="北京银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_17.jpg" width="154" height="33"
                                title="北京银行" ></a>
                                <a href="http://www.bankofshanghai.com/"  id="bank30" target="_blank" title="上海银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_30.jpg" width="154" height="33"
                                title="上海银行"></a>
                                <a href="http://www.gdb.com.cn/" id="bank31" target="_blank" title="广发银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_31.jpg" width="154" height="33"
                                title="广发银行"></a>
                                <a href="http://www.shrcb.com/" id="bank21" target="_blank" title="上海农商银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_21.jpg" width="154" height="33"
                                title="上海农商银行"></a>
                                <a href="http://www.cbhb.com.cn/" id="bank32" target="_blank" title="渤海银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_32.jpg" width="154" height="33"
                                title="渤海银行"></a>
                                <a href="http://www.dongguanbank.cn/" id="bank33" target="_blank" title="东莞银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_33.jpg" width="154" height="33"
                                title="东莞银行"></a>
                                <a href="http://www.hzbank.com.cn/" id="bank34" target="_blank" title="杭州银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_34.jpg" width="154" height="33"
                                title="杭州银行"></a>
                                <a href="http://www.czbank.com/" id="bank35" target="_blank" title="浙商银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_35.jpg" width="154" height="33"
                                title="浙商银行"></a>
                                <a href="http://www.wzcb.com.cn/" id="bank36" target="_blank" title="温州银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_36.jpg" width="154" height="33"
                                title="温州银行"></a>
                                <a href="http://www.jshbank.com/" id="bank37" target="_blank" title="晋商银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_37.jpg" width="154" height="33"
                                title="晋商银行"></a>
                                <a href="http://www.njcb.com.cn/" id="bank38" target="_blank" title="南京银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_38.jpg" width="154" height="33"
                                title="南京银行"></a>
                                <a href="http://www.grcbank.com/" id="bank39" target="_blank" title="广州农商银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_39.jpg" width="154" height="33"
                                title="广州农商银行"></a>
                                <a href="http://www.srcb.com/" id="bank40" target="_blank" title="上海农商银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_40.jpg" width="154" height="33"
                                title="上海农商银行"></a>
                                <a href="http://www.hkbchina.com/" id="bank41" target="_blank" title="漢口银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_41.jpg" width="154" height="33"
                                title="漢口银行"></a>
                                <a href="http://www.sdebank.com/" id="bank42" target="_blank" title="顺德农商银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_42.jpg" width="154" height="33"
                                title="顺德农商银行"></a>
                                <a href="http://www.czcb.com.cn/" id="bank43" target="_blank" title="浙江稠州商业银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_43.jpg" width="154" height="33"
                                title="浙江稠州商业银行"></a>
                                <a href="http://www.bjrcb.com/" id="bank44" target="_blank" title="北京农商银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_44.jpg" width="154" height="33"
                                title="北京农商银行"></a>
                                <a href="http://www.zgbank.com.cn/" id="bank45" target="_blank" title="自贡市商业银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_45.jpg" width="154" height="33"
                                title="自贡市商业银行"></a>
                                <a href="http://www.drcbank.com/" id="bank46" target="_blank" title="东莞农村商业银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_46.jpg" width="154" height="33"
                                title="东莞农村商业银行"></a>
                                <a href="http://www.gsbankchina.com/" id="bank47" target="_blank" title="甘肃银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_47.jpg" width="154" height="33"
                                title="甘肃银行"></a>
                                <a href="http://www.gyccb.cn/" id="bank48" target="_blank" title="贵阳银行官网" style="display: none;"><img
                                src="../img/member/bank/bank_48.jpg" width="154" height="33"
                                title="贵阳银行"></a>
                                <a href="https://pay.weixin.qq.com/" id="bank49" target="_blank" title="微信支付" style="display: none;"><img
                                src="../img/member/bank/bank_49.jpg" width="154" height="33"
                                title="微信支付"></a>
                                <a href="http://www.alipay.com/" id="bank50" target="_blank" title="支付宝" style="display: none;"><img
                                src="../img/member/bank/bank_50.jpg" width="154" height="33"
                                title="支付宝"></a>
                                <a href="https://pay.weixin.qq.com/" id="bank52" target="_blank" title="微信扫码支付" style="display: none;"><img
                                src="../img/member/bank/bank_52.jpg" width="154" height="33"
                                title="微信支付"></a>
                               </td>
                            </tr>
                            <tr>
                                <td>2. ATM转帐: 到您最近的ATM将款项转到上述银行账号。</td>
                            </tr>
                            <tr>
                                <td>3. ATM现存: 到上述银行ATM以现金存入银行账号</td>
                            </tr>
                            <tr>
                                <td>4. 银行柜台: 到您最近的银行将款项转到上述银行账号。</td>
                            </tr>
                            <tr>
                                <td>※请备份订单号，并复制进您的工作汇款备注栏</td>
                            </tr>
                            </tbody>
                        </table>

                    </td>
                    <td width="50%">

                        <p class="color_red">填写您的转账资料</p>

                        <form name="form1" id="form1"
                              action="deposit4.do" method="post">

                            <table width="100%" border="0" cellspacing="1" cellpadding="0" class="bgcolor">
                                <input name="bankName" id="bankName" type="hidden"/>
                                <input name="bankAcount" id="bankAcount" type="hidden"/>
                                <input name="bankAdress" id="bankAdress" type="hidden"/>
                                <input name="bankCode" id="bankCode" type="hidden"/>
                                <input name="reqTimeStr"  id="reqTime" type="hidden"/>
                                <input name="wbankName"  id="wbankName" type="hidden"/>
                                <tbody>
                                <tr>
                                    <td width="22%"><span class="color_red">*</span>订单号</td>
                                    <td  width="78%"><input type="text" name="orderid" id="orderid"
                                               readonly="readonly" class="input_money"></td>
                                </tr>
                                <tr>
                                    <td><span class="color_red">*</span>存入金额:</td>
                                    <td><input type="text" name="money" id="money" class="input_money"></td>
                                </tr>
                                <tr>
                                    <td><span class="color_red">*</span>存入时间:</td>

                                    <td><input type="text" id="dispotTime" class="input_money"
                                               onclick="laydate({istime: true, format: 'YYYY-MM-DD', istoday: true, istime: false})"
                                                readonly="readonly"> <span class="laydate-icon"
                                                                                             onclick="laydate({elem: '#dispotTime'});"></span>
                                        <select id="Time_Hour" class="MFormStyle1">
                                            <option label="00" value="0">00</option>
                                            <option label="01" value="1">01</option>
                                            <option label="02" value="2">02</option>
                                            <option label="03" value="3">03</option>
                                            <option label="04" value="4">04</option>
                                            <option label="05" value="5">05</option>
                                            <option label="06" value="6">06</option>
                                            <option label="07" value="7">07</option>
                                            <option label="08" value="8">08</option>
                                            <option label="09" value="9">09</option>
                                            <option label="10" value="10">10</option>
                                            <option label="11" value="11">11</option>
                                            <option label="12" value="12">12</option>
                                            <option label="13" value="13">13</option>
                                            <option label="14" value="14">14</option>
                                            <option label="15" value="15">15</option>
                                            <option label="16" value="16">16</option>
                                            <option label="17" value="17">17</option>
                                            <option label="18" value="18">18</option>
                                            <option label="19" value="19">19</option>
                                            <option label="20" value="20">20</option>
                                            <option label="21" value="21">21</option>
                                            <option label="22" value="22">22</option>
                                            <option label="23" value="23">23</option>
                                        </select>
                                        <select id="Time_Minute" class="MFormStyle1">
                                            <option label="00" value="0">00</option>
                                            <option label="01" value="1">01</option>
                                            <option label="02" value="2">02</option>
                                            <option label="03" value="3">03</option>
                                            <option label="04" value="4">04</option>
                                            <option label="05" value="5">05</option>
                                            <option label="06" value="6">06</option>
                                            <option label="07" value="7">07</option>
                                            <option label="08" value="8">08</option>
                                            <option label="09" value="9">09</option>
                                            <option label="10" value="10">10</option>
                                            <option label="11" value="11">11</option>
                                            <option label="12" value="12">12</option>
                                            <option label="13" value="13">13</option>
                                            <option label="14" value="14">14</option>
                                            <option label="15" value="15">15</option>
                                            <option label="16" value="16">16</option>
                                            <option label="17" value="17">17</option>
                                            <option label="18" value="18">18</option>
                                            <option label="19" value="19">19</option>
                                            <option label="20" value="20">20</option>
                                            <option label="21" value="21">21</option>
                                            <option label="22" value="22">22</option>
                                            <option label="23" value="23">23</option>
                                            <option label="24" value="24">24</option>
                                            <option label="25" value="25">25</option>
                                            <option label="26" value="26">26</option>
                                            <option label="27" value="27">27</option>
                                            <option label="28" value="28">28</option>
                                            <option label="29" value="29">29</option>
                                            <option label="30" value="30">30</option>
                                            <option label="31" value="31">31</option>
                                            <option label="32" value="32">32</option>
                                            <option label="33" value="33">33</option>
                                            <option label="34" value="34">34</option>
                                            <option label="35" value="35">35</option>
                                            <option label="36" value="36">36</option>
                                            <option label="37" value="37">37</option>
                                            <option label="38" value="38">38</option>
                                            <option label="39" value="39">39</option>
                                            <option label="40" value="40">40</option>
                                            <option label="41" value="41">41</option>
                                            <option label="42" value="42">42</option>
                                            <option label="43" value="43">43</option>
                                            <option label="44" value="44">44</option>
                                            <option label="45" value="45">45</option>
                                            <option label="46" value="46">46</option>
                                            <option label="47" value="47">47</option>
                                            <option label="48" value="48">48</option>
                                            <option label="49" value="49">49</option>
                                            <option label="50" value="50">50</option>
                                            <option label="51" value="51">51</option>
                                            <option label="52" value="52">52</option>
                                            <option label="53" value="53">53</option>
                                            <option label="54" value="54">54</option>
                                            <option label="55" value="55">55</option>
                                            <option label="56" value="56">56</option>
                                            <option label="57" value="57">57</option>
                                            <option label="58" value="58">58</option>
                                            <option label="59" value="59">59</option>
                                        </select>
                                        （当地时间）
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="color_red">*</span>存款人:</td>
                                    <td><input type="text" name="wbankAccountName" id="depositName" class="input_money"></td>
                                </tr>

                               <!--  <tr>
                                    <td><span class="color_red">*</span>优惠代码 ：</td>
                                    <td><input type="text" name="bounsNo" id="bounsNo" class="input_money"></td>
                                </tr> -->

                                <tr>
                                    <td><span class="color_red">*</span>存款方式:</td>
                                    <td>

                                        <input type="radio" name="wdType" id="depositMethod1" value="1">
                                        <label for="depositMethod1">网银转帐</label>

                                        <input type="radio" name="wdType" id="depositMethod2" value="2">
                                        <label for="depositMethod2">手机转帐</label>

                                        <input type="radio" name="wdType" id="depositMethod3" value="3">
                                        <label for="depositMethod3">银行柜台</label>

                                        <input type="radio" name="wdType" id="depositMethod4" value="4">
                                        <label for="depositMethod4">ATM自动柜员机</label>
                                        
                                        <br/>

                                        <input type="radio" name="wdType" id="depositMethod5" value="5">
                                        <label for="depositMethod5">ATM现金入款</label>

                                        <input type="radio" name="wdType" id="depositMethod6" value="6">
                                        <label for="depositMethod6">微信支付</label>
                                        
                                        <input type="radio" name="wdType" id="depositMethod7" value="7">
                                        <label for="depositMethod7">支付宝转账</label>
                                        
                                        <input type="radio" name="wdType" id="depositMethod8" value="8">
                                        <label for="depositMethod8">微信扫码支付</label>

                                    </td>
                                </tr>
                                <tr>
                                <td>参考号码或附言:</td>
                                <td><input type="text" name="dwdesc" id="dwdesc" class="input_money"></td>
                                </tr>
                                </tbody>
                            </table>
                            <!-- <table id="address" style="display: none" width="100%" border="0" cellspacing="1"
                                   cellpadding="0" class="bgcolor" bgcolor="#333333">
                                <tbody>
                                <tr>
                                    <td><span class="color_red">*</span>存款银行地址：</td>
                                    <td><input type="text" name="province" id="province" class="input_money">省
                                        <input type="text" name="city" id="city" class="input_money">市/县
                                        <input type="text" name="subBankName" id="subBankName" class="input_money">
                                        （例：广东省 东莞市 岭南支行）
                                    </td>
                                </tr>
                                </tbody>
                            </table> -->
                        </form>
                        <div><a class="nui-btn nui-btn-theme-default" href="deposit2.do?mb=${mb }">上一步</a> <a class="nui-btn nui-btn-theme-main" href="javascript:void" onclick="next();">提交申请</a></div>
                    </td>
                </tr>
                </tbody>
            </table>


            <p>※1.请确实填写转帐金额与时间。<br>
                ※2.每笔转帐请提交一次。<br>
                ※3.若您使用ATM存款，请填写ATM所属分行，会加快您的款项到帐时间。</p>

            <div style="clear:both"></div>
        </div>
    </div>
</div>


</body>
</html>