<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--新版彩票导航 timi--%>
<link rel="stylesheet" type="text/css" id="style" href="${ctx}/css/lottery/new_blue.css">
<!-- header start-->
<div style="display: block;" class="container header header-bg" id="header">
	<div id="topblock">
		<%--<div id="menutop">--%>
		<%--<h4>温馨提示：</h4>--%>
		<%--<div class="marquee">--%>
		<%--<marquee id="siteBulletin" scrollamount="2">尊敬的客户您好！IG彩票平台已新增时时彩种11选5，快乐8，幸运飞艇，福彩3D，欢迎各位玩家踊跃投注，祝各位赢利多多！谢谢您们长久对IG彩票平台的支持！</marquee>--%>
		<%--</div>--%>
		<%--<div class="main-nav" id="main-nav">--%>
		<%--<span class="on" style="display: none;"><a nav="gaming" href="####" onclick="mainNav(this);return false;" title="">投注现场</a></span>--%>
		<%--<span> <a nav="infopp" href="####" onclick="mainNav(this);return false;" title=""><span id="playerType2">会员</span>资料</a></span> |--%>
		<%--<!--<span> <a nav="chgPwd" href="####" onclick="mainNav(this);return false;" title="">修改密码</a></span> | -->--%>
		<%--<span> <a nav="betHis" href="####" onclick="mainNav(this);return false;" title="">下注明细</a></span> |--%>
		<%--<span> <a nav="report" href="####" onclick="mainNav(this);return false;" title="">今日已结</a></span> |--%>
		<%--<span> <a nav="reports" href="####" onclick="mainNav(this);return false;" title="">两周报表</a></span> |--%>
		<%--<span> <a nav="gameRes" href="####" onclick="mainNav(this);return false;" title="">历史开奖</a></span> |--%>
		<%--<span> <a nav="sites" href="####" onclick="mainNav(this);return false;" title="">游戏官网</a></span> |--%>
		<%--<span> <a nav="rules" href="####" onclick="mainNav(this);return false;" title="">规则</a></span>--%>
		<%--</div>--%>
		<%--</div>--%>
		<!--彩票类型-->
		<div class="big_box">
			<ul id="tabs">
				<li id="custemMenu" style="display: none;"><a href="javascript:void(0);" >自选</a></li>
				<li id="t5"><a href="javascript:void(0);">pk10</a></li>
				<li id="t1"><a href="javascript:void(0);" class="topred">时时彩</a></li>
				<li id="t2"><a href="javascript:void(0);">快乐十分</a></li>
				<li id="t3"><a href="javascript:void(0);">快乐8</a></li>
				<li id="t4"><a href="javascript:void(0);">快3</a></li>
				<li id="t6"><a href="javascript:void(0);">六合彩</a></li>
				<%--<li class="important" id="settingmenu">--%>
				<%--<em>自定义</em>--%>
				<%--<span>&nbsp;</span>--%>
				<%--</li>--%>
			</ul>
		</div>
		<!--彩票种类-->
		<div class="ssc-nav" id="select_sys">
			<!-- 时时彩 -->
			<ul id="lottery_t1" class="clear">
				<li index="1" class="ssc c" style="display: list-item;" id="lottery1"><a class="ssc-nav-info" href="${ctx}/lottery/gc/cqssc.do" target="CaiZhongIframe">
						<h3>重庆时时彩</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
				<li index="5" class="ssc t" style="display: list-item;" id="lotteryB"><a class="ssc-nav-info" href="${ctx}/lottery/gc/tjssc.do" target="CaiZhongIframe">
						<h3>天津时时彩</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
				<li index="5" class="ssc t" style="display: list-item;" id="lotteryC"><a class="ssc-nav-info" href="${ctx}/lottery/gc/xjssc.do" target="CaiZhongIframe">
						<h3>新疆时时彩</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
				<%-- <li index="5" class="ssc t" style="display: list-item;"
					id="lotteryD"><a class="ssc-nav-info"
					href="${ctx}/lottery/gc/jxssc.do" target="CaiZhongIframe">
						<h3>江西时时彩</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span
								id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li> --%>
				<li index="5" class="ssc t" style="display: list-item;" id="lotteryE"><a class="ssc-nav-info" href="${ctx}/lottery/gc/ynssc.do" target="CaiZhongIframe">
						<h3>云南时时彩</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
				<%-- <li index="5" class="ssc t" style="display: list-item;" id="lotteryF">
					<a class="ssc-nav-info" href="${ctx}/lottery/gc/shssc.do" target="CaiZhongIframe">
						<h3>上海时时彩</h3>
						<div></div>
						<p class="white" id="times"><span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span></p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div>
				</li> --%>
			</ul>
			<!-- 快10 -->
			<ul id="lottery_t2" class="clear" style="display: none;">
				<li index="0" class="k10" style="display: list-item;" id="lottery2"><a class="ssc-nav-info" href="${ctx}/lottery/gc/gdk10.do" target="CaiZhongIframe">
						<h3>广东快乐十分</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
				<%-- <li index="0" class="k10" style="display: list-item;" id="lottery8"><a class="ssc-nav-info" href="${ctx}/lottery/gc/gxk10.do" target="CaiZhongIframe">
						<h3>广西快乐十分</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li> --%>
				<li index="0" class="k10" style="display: list-item;" id="lottery9"><a class="ssc-nav-info" href="${ctx}/lottery/gc/hnk10.do" target="CaiZhongIframe">
						<h3>湖南快乐十分</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
				<li index="0" class="k10" style="display: list-item;" id="lottery7"><a class="ssc-nav-info" href="${ctx}/lottery/gc/tjk10.do" target="CaiZhongIframe">
						<h3>天津快乐十分</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
			</ul>
			<!-- 快8 -->
			<ul id="lottery_t3" class="clear" style="display: none;">
				<li index="26" class="k8" style="display: list-item;" id="lottery5"><a class="ssc-nav-info" href="${ctx}/lottery/gc/bjk8.do" target="CaiZhongIframe">
						<h3>北京快乐8</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
			</ul>
			<!-- 快3 -->
			<ul id="lottery_t4" class="clear" style="display: none;">
				<li index="3" class="k3" style="display: list-item;" id="lottery3"><a class="ssc-nav-info" href="${ctx}/lottery/gc/jsk3.do" target="CaiZhongIframe">
						<h3>江苏骰宝(快3)</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
				<li index="3" class="k3" style="display: list-item;" id="lotteryG"><a class="ssc-nav-info" href="${ctx}/lottery/gc/ahk3.do" target="CaiZhongIframe">
						<h3>安徽快3</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
				<li index="3" class="k3" style="display: list-item;" id="lotteryI"><a class="ssc-nav-info" href="${ctx}/lottery/gc/jlk3.do" target="CaiZhongIframe">
						<h3>吉林快3</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
				<li index="3" class="k3" style="display: list-item;" id="lotteryH"><a class="ssc-nav-info" href="${ctx}/lottery/gc/gxk3.do" target="CaiZhongIframe">
						<h3>广西快3</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
			</ul>
			<!-- PK10 -->
			<ul id="lottery_t5" class="clear" style="display: none;">
				<li index="2" class="pk10" style="display: list-item;" id="lottery4"><a class="ssc-nav-info" href="${ctx}/lottery/gc/bjsc.do" target="CaiZhongIframe">
						<h3>北京赛车(PK10)</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
			</ul>
			<!-- 六合彩 -->
			<ul id="lottery_t6" class="clear" style="display: none;">
				<li index="2" class="lhc" style="display: list-item;" id="lottery6"><a class="ssc-nav-info" href="${ctx}/lottery/gc/lhc.do" target="CaiZhongIframe">
						<h3>六合彩</h3>
						<div></div>
						<p class="white" id="times">
							<span id="hour">00</span>:<span id="minute">00</span>:<span id="second">00</span>
						</p>
						<p class="white" id="close" style="display: none;">封盘中</p>
					</a>
					<div class="mark"></div></li>
			</ul>
		</div>
	</div>
</div>
<!-- header end-->
<script src="${ctx}/js/lottery/tabcountdown.js" type="text/javascript"></script>
<script>
	//点击切换彩票类型和种类
	$(function() {
		$(document).on(
				'click',
				'#tabs li a',
				function() {
					$(this).parent("li").siblings("li").find("a").removeClass(
							"topred");
					$(this).addClass("topred");
					var flag = $(this).parent("li").attr("id");
					$("#select_sys").find("#lottery_" + flag).show().siblings(
							"ul").hide();
					var ui = $("#select_sys").find("#lottery_" + flag);
					var a = ui.find("a:first");
					a[0].click();
				})

	})

	$(function() {
		$("#select_sys li").each(function() {
			$(this).click(function() {
				$(this).siblings("li").addClass("").removeClass("c");
				$(this).addClass("c").removeClass("");
			})

		});

	})
</script>

<script type="text/javascript">
	function showTab(obj) {
		var submenu = $(".submenu");
		for (var i = 0; i < submenu.length; i++) {
			var vv = submenu.eq(i).css("display");
			if (vv == "block") {
				if ((i + 1) == obj) {
					return;
				}
			}
		}

		if (obj == 1) {
			window.location.href = "${ctx}/ssc/index.do?poolId=7";
		} else if (obj == 2) {
			window.location.href = "${ctx}/gdsf/zhupan.do";
		} else if (obj == 3) {
			window.location.href = "${ctx}/jssb/zhupan.do";
		} else if (obj == 4) {
			window.location.href = "${ctx}/bjsc/zhupan.do";
		} else if (obj == 5) {
			window.location.href = "${ctx}/bjkl8/xuanhao.do";
		} else if (obj == 6) {
			window.location.href = "${ctx}/lhc/tbh.do";
		}

	}
</script>