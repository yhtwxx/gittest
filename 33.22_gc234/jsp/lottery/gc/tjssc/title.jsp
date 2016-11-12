<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="caihead">
	<h2>天津时时彩</h2>
	<a href="javascript:;" class="sg" onclick="parent.openStaticPopup('tjssc')">开奖结果</a>
	<a href="javascript:;" class="sg" onclick="parent.openStaticGzPopup(1)" style="background-color: #999">规则说明</a>
	<span id="prevSGSpan" href="javascript:;" class="prevSGSpan">
		第<span id="prevQihao"></span>期赛果：<span id="lastSg">加载中...</span>
	</span>
	<div id="cai-info">
		第 <span id="cai-num">*</span> 期
			&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="ui-countdown" style="font: 20px/1.5 'Open Sans Condensed', sans-serif;">
				<span id="hour_show">00</span>:<span id="minute_show">00</span>:<span id="second_show">00</span>
			</span>
			<span id="overMsg" style="display: none;">该期投注时间已经截至！</span>
	</div>
</div>

<!--玩法-->
<div class="caiplay">
	<ul id="caiplaynav" class="nav nav-pills" role="tablist">
		<li role="presentation"><a data-type="tjssc" data-flag="twoside" href="javascript:void(0);" >两面</a></li>
		<li role="presentation"><a data-type="tjssc" data-flag="sum" href="javascript:void(0);" >和数</a></li>
		<li role="presentation"><a data-type="tjssc" data-flag="sumtail" href="javascript:void(0);" >和尾数</a></li>
		<li role="presentation"><a data-type="tjssc" data-flag="oneword" href="javascript:void(0);" >一字</a></li>
		<li role="presentation"><a data-type="tjssc" data-flag="twoword" href="javascript:void(0);" >二字</a></li>
		<li role="presentation"><a data-type="tjssc" data-flag="threeword" href="javascript:void(0);" >三字</a></li>
		<li role="presentation" class="active"><a data-type="tjssc" data-flag="onewordlocate" href="javascript:void(0);" >一字定位</a></li>
		<li role="presentation"><a data-type="tjssc" data-flag="twowordlocate" href="javascript:void(0);" >二字定位</a></li>
		<li role="presentation"><a data-type="tjssc" data-flag="threewordlocate" href="javascript:void(0);" >三字定位</a></li>
		<li role="presentation"><a data-type="tjssc" data-flag="groupselect3" href="javascript:void(0);" >组选三</a></li>
		<li role="presentation"><a data-type="tjssc" data-flag="groupselect6" href="javascript:void(0);" >组选六</a></li>
		<li role="presentation"><a data-type="tjssc" data-flag="span" href="javascript:void(0);" >跨度</a></li>
	</ul> <!-- /pills -->
</div>
