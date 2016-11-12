<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="caihead">
    <h2>江苏骰宝</h2>
    <a href="javascript:;" class="sg"  onclick="parent.openStaticPopup('jssb')" >开奖结果</a>
    <a href="javascript:;" class="sg"  onclick="parent.openStaticGzPopup(3)" style="background-color:#999">规则说明</a>
    <span id="prevSGSpan" href="javascript:;" class="prevSGSpan">
		第<span id="prevQihao"></span>期赛果：<span id="lastSg">加载中...</span>
	</span>
    <div id="cai-info">
        第  <span id="cai-num">*</span> 期
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span id="ui-countdown" style="font: 20px/1.5 'Open Sans Condensed',sans-serif;">
        	<span id="hour_show">00</span>:<span id="minute_show">00</span>:<span id="second_show">00</span>
      	</span>
      	<span id="overMsg" style="display: none;">该期投注时间已经截至！</span>
    </div>
</div>

<!--玩法-->
<div class="caiplay">
	<ul id="caiplaynav" class="nav nav-pills" role="tablist">
		<li role="presentation" class="active"><a data-type="jsk3" data-flag="zhupan" href="javascript:void(0);" >主盘势</a></li>
		<li role="presentation"><a data-type="jsk3" data-flag="qita" href="javascript:void(0);" >其他</a></li>
	</ul> <!-- /pills -->
</div>
