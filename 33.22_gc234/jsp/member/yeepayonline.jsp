<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>在线入款</title>
<link href="../css/member/deposit.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../js/layer.min.js"></script>
<link type="text/css" rel="stylesheet" href="../js/skin/layer.css" id="skinlayercss">
<link rel="stylesheet" href="../css/showBo.css" />
<script type="text/javascript">
	var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
	function next() {
		 /* var card_pwd = $("#card_pwd").val();
		 var card_no = $("#card_no").val();
		 var code = "";
		 $.ajax({
		        url : "${ctx}/member/cardVerify.do?card_pwd="+card_pwd+"&card_no="+card_no,
		        data : {},
		        timeout : 2000, //超时时间设置，单位毫秒
		        type : "post",
		        async: false,
		        dataType : "json",
		        success : function(b) {
		           code =b.code;
		        }
		    });
		 if (code != "0") {
			 layer.msg("卡号、密码验证失败,请确认后再提交");
	         return;
         } */
		document.orderForm.submit();
		return;
	}
</script>
</head>
<body huaban_collector_injected="true">
	<div class="card_main">
		<div class="card_width">
			<form action="${ctx}/member/yeepaysubmit.do" name="orderForm" id="orderForm" method="post">
				<input type="hidden" name="sessionId" value="${sessionId }" />
				<table width="100%" class="bgcolor">
					<tbody>
						<tr>
							<td align="left">请选择支付的点卡类型：</td>
						</tr>
						<tr>
							<td>
								<div class="bz_bank">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td>
													<input type="radio" name="bankCode" id="radio1" value="SZX">
												</td>
												<td>
													<label for="radio1">
														<img src="${ctx}/img/member/yeepay/yeepay_1.jpg" width="200" height="99" title="移动充值卡">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio2" value="SNDACARD">
												</td>
												<td>
													<label for="radio2">
														<img src="${ctx}/img/member/yeepay/yeepay_2.jpg" width="200" height="99" title="盛大卡">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio3" value="JUNNET">
												</td>
												<td>
													<label for="radio3">
														<img src="${ctx}/img/member/yeepay/yeepay_3.jpg" width="200" height="99" title="骏网一卡通">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio4" value="ZHENGTU">
												</td>
												<td>
													<label for="radio4">
														<img src="${ctx}/img/member/yeepay/yeepay_4.jpg" width="200" height="99" title="征途卡">
													</label>
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="bankCode" id="radio5" value="UNICOM">
												</td>
												<td>
													<label for="radio5">
														<img src="${ctx}/img/member/yeepay/yeepay_5.jpg" width="200" height="99" title="联通卡">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio6" value="SOHU">
												</td>
												<td>
													<label for="radio6">
														<img src="${ctx}/img/member/yeepay/yeepay_6.jpg" width="200" height="99" title="搜狐一卡通">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio7" value="TELECOM">
												</td>
												<td>
													<label for="radio7">
														<img src="${ctx}/img/member/yeepay/yeepay_7.jpg" width="200" height="99" title="电信卡">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio8" value="TIANXIA">
												</td>
												<td>
													<label for="radio8">
														<img src="${ctx}/img/member/yeepay/yeepay_8.jpg" width="200" height="99" title="天下通一卡通">
													</label>
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="bankCode" id="radio9" value="ZONGYOU">
												</td>
												<td>
													<label for="radio9">
														<img src="${ctx}/img/member/yeepay/yeepay_9.jpg" width="200" height="99" title="纵游一卡通">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio10" value="TIANHONG">
												</td>
												<td>
													<label for="radio10">
														<img src="${ctx}/img/member/yeepay/yeepay_10.jpg" width="200" height="99" title="天宏一卡通">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio11" value="QQCARD">
												</td>
												<td>
													<label for="radio11">
														<img src="${ctx}/img/member/yeepay/yeepay_11.jpg" width="200" height="99" title="Q币卡">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio12" value="JIUYOU">
												</td>
												<td>
													<label for="radio12">
														<img src="${ctx}/img/member/yeepay/yeepay_12.jpg" width="200" height="99" title="久游一卡通">
													</label>
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="bankCode" id="radio13" value="NETEASE">
												</td>
												<td>
													<label for="radio13">
														<img src="${ctx}/img/member/yeepay/yeepay_13.jpg" width="200" height="99" title="网易一卡通">
													</label>
												</td>
												<td>
													<input type="radio" name="bankCode" id="radio14" value="WANMEI">
												</td>
												<td>
													<label for="radio14">
														<img src="${ctx}/img/member/yeepay/yeepay_14.jpg" width="200" height="99" title="完美一卡通">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio15" value="THIRTYTWOCARD">
												</td>
												<td>
													<label for="radio15">
														<img src="${ctx}/img/member/yeepay/yeepay_15.jpg" width="200" height="99" title="32一卡通">
													</label>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="bz_bank" id="msgRear" style="display: none;">
				<table width="100%" class="bgcolor">
					<tbody>
						<tr>
							<td align="left">请输入要支付的卡号和密码</td>
						</tr>
						<tr>
							<td>
								<div class="bz_bank">	
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td align="right">卡面额:</td>
												<td colspan="6"><input name="card_value" id="card_value" type="text" class="input_money" style="width: 200px"></td>
											</tr>
											<tr>
												<td align="right">卡序列号:</td>
												<td colspan="6"><input name="card_no" id="card_no" type="text" class="input_money" style="width: 200px"></td>
											</tr>
											<tr>
												<td align="right">卡密码:</td>
												<td colspan="6"><input name="card_pwd" id="card_pwd" type="text" class="input_money" style="width: 200px"></td>
											</tr>
											<tr>
												<td align="right"><a class="nui-btn nui-btn-theme-default" href="onlinepay.do">返回</a></td>
												<td colspan="6"><a href="javascript:void" onclick="next();" class="nui-btn nui-btn-theme-main">提交</a></td>
											</tr>
										</tbody>
									</table>
								</div>
						</tr>
						<tr>
							<td>
								<div class="bz_bank">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
											<td align="left">
										<div id="content">
											<div id="yeepay_SZX" style="display: none;">
												<p>【支持卡种】</p>
												<p>※全国卡：卡号17位、密码18位的阿拉伯数字</p>
												<p>地方卡：</p>
												<p>※浙江：卡号10位 密码8位</p>
												<p>※福建：卡号16位 密码17位</p>
												<p>【支持面额】</p>
												<p>※全国卡： 10、20、30、50、100、300、500元</p>
												<p>地方卡：</p>
												<p>※浙江地方卡： 10、20、30、50、100、200、300、500元、1000元</p>
												<p>※福建地方卡： 50、100元</p>
												<p>【重要提示】</p>
												<p>※请务必使用与此面额相同的移动充值卡，否则会导致支付不成功，或支付金额丢失。（使用面额100元的移动充值卡但选择50元，高于50元部分不返还；使用50元卡但选择100元，支付失败，50元不返还。）不支持彩铃充值卡和短信充值卡，选择任何面额彩铃充值卡，将不予退还任何金额。</p>
											</div>
											<div id="yeepay_SNDACARD" style="display: none;">
												<p>【支持卡种】</p>
												<p>※卡号15位或16位的数字字母，密码8位或9位的阿拉伯数字。</p>
												<p>【支持面额】</p>
												<p>※实卡面值：5元、10元、15元、25元、30元、35元、45元、50元、100元、350元、1000元</p>
												<p>※虚卡面值：（任意面值，不含卡密，直充）</p>
												<p>【温馨提示】</p>
												<p>※请使用卡号以CSC5、CS、S、CA、CSB、YA、YB、YC、YD、80133开头的"盛大互动娱乐卡"进行支付。</p>
											</div>
											<div id="yeepay_JUNNET" style="display: none;">
												<p>【支持卡种】</p>
												<p>※卡号、密码都是16位的阿拉伯数字</p>
												<p>【支持面额】</p>
												<p>※任意面额</p>
												<p>※对应点数：1元=100J点</p>
												<p>【温馨提示】</p>
												<p>※不能使用特定游戏专属充值卡支付。 特定游戏包括大唐风云、传说、蜗牛、猫扑一卡通、九鼎、雅典娜、山河等游戏。</p>
												<p>※在此使用过的骏网一卡通，卡内剩余J点只能在富汇易达合作商家进行支付使用。</p>
											</div>
											<div id="yeepay_ZHENGTU" style="display: none;">
												<p>【支持卡种】</p>
												<p>※全国官方征途游戏充值卡，卡号16位阿拉伯数字，密码8位阿拉伯数字。
												<p>【支持面额】</p>
												<p>※5元、10元、15元、18元、20元、25元、30元、50元、60元、68元、100元、120元、180元、208元、250元、300元、468元、500元</p>
												<p>※对应点数：1元=100点</p>
												<p>【温馨提示】</p>
												<p>※请务必使用与您所选择的面额相同的征途卡进行支付,否则引起的交易失败或交易金额丢失，我方不予承担！</p>
												<p>※如：您选择50元面额但使用100元卡支付，则系统认为实际支付金额为50元，高于50元部分不予退还。</p>
											</div>
											<div id="yeepay_UNICOM" style="display: none;">
												<p>【支持卡种】</p>
												<p>※联通全国卡，卡号15位阿拉伯数字，密码19位阿拉伯数字。</p>
												<p>【支持面额】</p>
												<p>※20元、30元、50元、100元、300元、500元</p>
												<p>【重要提示】</p>
												<p>※请务必使用与您选择的面额相同的联通充值卡进行支付，否则引起的交易失败交易金额不予退还。</p>
												<p>※如：选择50元面额但使用100元卡支付，则系统认为实际支付金额为50元， 高于50元部分不予退还；选择50元面额但使用30元卡支付则系统认为支付失败， 30元不予退还。</p>
											</div>
											<div id="yeepay_SOHU" style="display: none;">
												<p>【支持卡种】</p>
												<p>※卡号20位、密码12位的阿拉伯数字</p>
												<p>【支持面额】</p>
												<p>※5元、10元、15元、30元、40元、100元</p>
												<p>※对应点数：1元=20点</p>
												<p>【重要提示】</p>
												<p>※请务必使用与您所选择的面额相同的搜狐一卡通进行支付,否则引起的交易失败或交易金额丢失，我方不予承担！</p>
												<p>※如：您选择10元面额但使用30元卡支付，则系统认为实际支付金额为10元，高于10元部分不予退还。</p>
												<p>※不支持搜狐矩阵卡。</p>
											</div>
											<div id="yeepay_TELECOM" style="display: none;">
												<p>【支持卡种】</p>
												<p>※中国电信充值付费卡卡号19位，密码18位的阿拉伯数字（即：可拨打11888充值话费的卡）。</p>
												<p>※目前只支持电信全国卡和广东卡，充值卡序列号第四位为"1"的卡为全国卡，为"2"的则为地方卡。</p>
												<p>【支持面额】</p>
												<p>※10元、20元、30元、50元、100元、200元、300元、500元。</p>
												<p>【重要提示】</p>
												<p>※请务必使用与您所选择的面额相同的电信卡进行支付,否则引起的交易失败或交易金额丢失，我方不予承担！</p>
												<p>※暂不支持电信流量卡支付。</p>
											</div>
											<div id="yeepay_TIANXIA" style="display: none;">
												<p>【支持卡种】 </p>
												<p>※全国各地能买到天下通一卡通的地区，包括士多店、报刊亭、软件店、网吧、书店等。 </p>
												<p>※支持的卡种：卡号15位，密码8位阿拉伯数字，所有实卡的自发行日起，两年内有效。 </p>
												<p>※支持的面额：5元、6元、10元、15元、30元、50元、100、500、1000元。 </p>
												<p>※天下通有小量虚拟卡，虚拟卡只能充值指定游戏，兽血沸腾、龙腾世界、梦三国、梦幻龙族和炼狱</p> 
												<p>【温馨提示】 </p>
												<p>※在此使用过的一卡通，卡内剩余点只能在易宝支付合作商家进行支付使用。 </p>
												<p>※目前不支持天下通一卡通专属充值卡支付。 特定游戏包括百游、冰川、龙武等游戏。</p>
											</div>
											<div id="yeepay_ZONGYOU" style="display: none;">
												<p>【支持卡种】</p>
												<p>※卡号与密码均为15位阿拉伯数字。全国各地能买到纵游一卡通的地区，包括士多店、报刊亭、软件店、网吧、书店等。</p>
												<p>【支持面额】</p>
												<p>※面额：支持任意面额。（如：5元、10元、15元、20元、25元、 30元、50元、100元、500元 、98元、198元、318元、328元、648元、1998元、2998元、3998元 、1000元、2000元、3000元、5000元、10000元等）</p>
												<p>【温馨提示】</p>
												<p>※纵游一卡通支持分次消费直至卡内余额为0</p>
												<p>※纵游一卡通可以充值多款游戏，在纵游一卡通官方网站中搜索到的产品，都是可以用纵游一卡通来充值的。</p>
											</div>
											<div id="yeepay_TIANHONG" style="display: none;">
												<p>【支持卡种】</p>
												<p>※卡号为12位，前2位是大写或小写英文字母，后10位是数字；密码15位是纯数字。</p>
												<p>※卡号为10位，前2位是大写或小写英文字母，后8位是数字；密码10位是纯数字。</p>
												<p>※暂不支持卡号以V开头的天宏专充卡。</p>
												<p>【支持面额】</p>
												<p>※面额：支持任意面额。（如：5元、10元、15元、20元、25元、 30元、50元、100元、500元 、98元、198元、318元、328元、648元、1998元、2998元、3998元 、1000元、2000元、3000元、5000元、10000元等）</p>
												<p>【温馨提示】</p>
												<p>※天宏一卡通所有实卡的自发行日起，两年内有效。可多次充值，直至卡内余额为零。</p>
											</div>
											<div id="yeepay_QQCARD" style="display: none;">
												<p>【支持卡种】</p>
												<p>※全国各地Q币卡，卡号：9位的阿拉伯数字、密码：12位的阿拉伯数字。</p>
												<p>【支持面额】</p>
												<p>※5元、10元、15元、20元、30元、50元、60元、100元、200元</p>
												<p>※对应点数：1元=1Q币=10Q点</p>
												<p>【重要提示】</p>
												<p>※请务必使用与您所选面额相同的Q币卡进行支付，否则您将承担因此而引起的交易失败或者交易金额丢失所造成的损失。</p>
												<p>※注意：只支持Q币卡卡密支付，不支持QQ账户内Q币或Q点支付</p>
											</div>
											<div id="yeepay_JIUYOU" style="display: none;">
												<p>【支持卡种】</p>
												<p>※卡号13位、密码10位的阿拉伯数字</p>
												<p>【支持面额】</p>
												<p>※5元、10元、30元、50元、100元</p>
												<p>※对应点数：1元=100点</p>
												<p>【重要提示】</p>
												<p>※请务必使用与您所选择的面额相同的久游一卡通进行支付,否则引起的交易失败或交易金额丢失，我方不予承担！</p>
												<p>※如：您选择10元面额但使用30元卡支付，则系统认为实际支付金额为10元，高于10元部分不予退还。</p>
												<p>※不支持久游神兵卡、矩阵卡</p>
											</div>
											<div id="yeepay_NETEASE" style="display: none;">
												<p>【支持卡种】</p>
												<p>※全国官方网易游戏充值卡，卡号13位、密码9位的阿拉伯数字</p>
												<p>【支持面额】</p>
												<p>※面值：10元、15元、20元、30元、50元、100元</p>
												<p>对应点数：1元=10点</p>
												<p>【重要提示】</p>
												<p>※请务必使用与您所选择的面额相同的网易一卡通进行支付,否则引起的交易失败或交易金额丢失，我方不予承担！</p>
												<p>※如：您选择10元面额但使用30元卡支付，则系统认为实际支付金额为10元，高于10元部分不予退还。</p>
											</div>
											<div id="yeepay_WANMEI" style="display: none;">
												<p>【支持卡种】</p>
												<p>※全国官方完美游戏充值卡，卡号10位、密码15位的阿拉伯数字</p>
												<p>【支持面额】</p>
												<p>※15元、30元、50元、100元</p>
												<p>※对应点数：1元=150点</p>
												<p>【重要提示】</p>
												<p>※请务必使用与您所选择的面额相同的完美一卡通进行支付,否则引起的交易失败或交易金额丢失，我方不予承担！</p>
												<p>※如：您选择10元面额但使用30元卡支付，则系统认为实际支付金额为10元，高于10元部分不予退还。</p>
											</div>
											<div id="yeepay_THIRTYTWOCARD" style="display: none;">
												<p>【支持卡种】 </p>
												<p>※全国各地32一卡通，卡号：15位的阿拉伯数字、密码：10位的阿拉伯数字。 </p>
												<p>【支持面额】 </p>
												<p>※面额：支持任意面额。（如：5元、10元、15元、20元、25元、 30元、50元、100元、500元 、98元、198元、318元、328元、648元、1998元、2998元、3998元 、1000元、2000元、3000元、5000元、10000元等） </p>
												<p>【重要提示】 </p>
												<p>※请务必使用与您所选面额相同的32一卡通进行支付，否则您将承担因此而引起的交易失败或者交易金额丢失所造成的损失。 </p>
												<p>如：选择50元面额但使用100元卡支付，则系统认为实际支付金额为50元， 高于50元部分不予退还；选择50元面额但使用30元卡支付则系统认为支付失败， 30元不予退还</p>
											</div>
											</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				
			</form>
			<div style="clear: both"></div>
		</div>
	</div>
<script type="text/javascript">
	$(function () {
            $("input:radio[name=bankCode]").change(function () {
            	var bankCode = $("input[type='radio']:checked").val();
            	$(".bz_bank").show();
            	$("#content div").hide();
            	$("#yeepay_"+bankCode).show();
            	$("html,body").animate({scrollTop:$("#msgRear").offset().top},1000)
            });
    })
</script>
</body>
</html>