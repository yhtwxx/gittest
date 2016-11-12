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
		if (typeof (check) == "undefined") {
			layer.msg("选择您的银行", 1, 0);
			return;
		}
		document.orderForm.submit();
		return;
	}
</script>

</head>
<body huaban_collector_injected="true">
	<div class="card_main">
		<div class="card_width">
			<form action="${url }member/bfpaybank.do" name="orderForm" id="orderForm" method="post">
				<input type="hidden" name="sessionId" value="${sessionId }" />
				<table width="100%" class="bgcolor">
					<tbody>
						<tr>
							<td width="13%" align="right">会员账号：</td>
							<td width="87%" colspan="4">${accountno }</td>
						</tr>
						<tr>
							<td align="right">存款金额：</td>
							<td colspan="4"><input name="money" id="money" type="text" class="input_money">(最低存款额度：100+)</td>
						</tr>
						<tr>
							<td align="right">支付银行：</td>
							<td>
								<div class="bz_bank">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td>
													<input type="radio" name="bankCode" id="radio1" value="3001">
												</td>
												<td>
													<label for="radio1">
														<img src="${ctx }/img/member/bank/bank_5.jpg" width="154"
														height="33" title="招商银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio2" value="3002">
												</td>
												<td>
													<label for="radio2">
														<img src="${ctx }/img/member/bank/bank_6.jpg" width="154"
														height="33" title="中国工商银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio3" value="3003">
												</td>
												<td>
													<label for="radio3">
														<img src="${ctx }/img/member/bank/bank_4.jpg" width="154"
														height="33" title="中国建设银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio4" value="3004">
												</td>
												<td>
													<label for="radio4">
														<img src="${ctx }/img/member/bank/bank_11.jpg" width="154"
														height="33" title="上海浦东发展银行">
													</label>
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="bankCode" id="radio5" value="3005">
												</td>
												<td>
													<label for="radio5">
														<img src="${ctx }/img/member/bank/bank_2.jpg" width="154"
														height="33" title="中国农业银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio6" value="3009">
												</td>
												<td>
													<label for="radio6">
														<img src="${ctx }/img/member/bank/bank_9.jpg" width="154"
														height="33" title="兴业银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio7" value="3020">
												</td>
												<td>
													<label for="radio7">
														<img src="${ctx }/img/member/bank/bank_7.jpg" width="154"
														height="33" title="中国交通银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio8" value="3022">
												</td>
												<td>
													<label for="radio8">
														<img src="${ctx }/img/member/bank/bank_23.jpg" width="154"
														height="33" title="中国光大银行">
													</label>
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="bankCode" id="radio9" value="3026">
												</td>
												<td>
													<label for="radio9">
														<img src="${ctx }/img/member/bank/bank_1.jpg" width="154"
														height="33" title="中国银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio10" value="3032">
												</td>
												<td>
													<label for="radio10">
														<img src="${ctx }/img/member/bank/bank_17.jpg" width="154"
														height="33" title="北京银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio11" value="3035">
												</td>
												<td>
													<label for="radio11">
														<img src="${ctx }/img/member/bank/bank_18.jpg" width="154"
														height="33" title="平安银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio12" value="3036">
												</td>
												<td>
													<label for="radio12">
														<img src="${ctx }/img/member/bank/bank_31.jpg" width="154"
														height="33" title="广发银行">
													</label>
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="bankCode" id="radio13" value="3037">
												</td>
												<td>
													<label for="radio13">
														<img src="${ctx }/img/member/bank/bank_21.jpg" width="154"
														height="33" title="上海农商银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio14" value="3038">
												</td>
												<td>
													<label for="radio14">
														<img src="${ctx }/img/member/bank/bank_8.jpg" width="154"
														height="33" title="中国邮政储蓄银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio15" value="3039">
												</td>
												<td>
													<label for="radio15">
														<img src="${ctx }/img/member/bank/bank_24.jpg" width="154"
														height="33" title="中信银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio16" value="3050">
												</td>
												<td>
													<label for="radio16">
														<img src="${ctx }/img/member/bank/bank_10.jpg" width="154"
														height="33" title="华夏银行">
													</label>
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" name="bankCode" id="radio17" value="3059">
												</td>
												<td>
													<label for="radio17">
														<img src="${ctx }/img/member/bank/bank_30.jpg" width="154"
														height="33" title="上海银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio18" value="3060">
												</td>
												<td>
													<label for="radio18">
														<img src="${ctx }/img/member/bank/bank_44.jpg" width="154"
														height="33" title="北京农商银行">
													</label>
												</td>
												
												<td>
													<input type="radio" name="bankCode" id="radio19" value="3080001">
												</td>
												<td>
													<label for="radio19">
														<img src="${ctx }/img/member/bank/bank_51.jpg" width="154"
														height="33" title="银联无卡支付">
													</label>
												</td>
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
									<a href="javascript:void" onclick="next();"
										class="nui-btn nui-btn-theme-main">下一步</a>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div style="clear: both"></div>
		</div>
	</div>
</body>
</html>