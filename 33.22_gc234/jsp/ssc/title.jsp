<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="caihead">
	<h2>重庆时时彩</h2>
	<a href="javascript:;" class="sg" onclick="parent.openStaticPopup('ssc')">开奖结果</a>
	<a href="javascript:;" class="sg" onclick="parent.openStaticGzPopup(1)" style="background-color: #999">规则说明</a>
	<span id="prevSGSpan" href="javascript:;" class="sg" style="background-color: #0033FF; ">
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
	<ul class="nav nav-pills" role="tablist">
		<li role="presentation" class="active"><a href="${ctx}/ssc/index.do?poolId=7" target="caiplay">两面</a></li>
		<li role="presentation"><a href="${ctx}/ssc/index.do?poolId=8" target="caiplay">和数</a></li>
		<li role="presentation"><a href="${ctx}/ssc/index.do?poolId=C" target="caiplay">和尾数</a></li>
		<li role="presentation"><a href="${ctx}/ssc/index.do?poolId=4" target="caiplay">一字</a></li>
		<li role="presentation"><a href="${ctx}/ssc/index.do?poolId=5" target="caiplay">二字</a></li>
		<li role="presentation"><a href="${ctx}/ssc/index.do?poolId=6" target="caiplay">三字</a></li>
		<li role="presentation"><a href="${ctx}/ssc/index.do?poolId=1" target="caiplay">一字定位</a></li>
		<li role="presentation"><a href="${ctx}/ssc/index.do?poolId=2" target="caiplay">二字定位</a></li>
		<li role="presentation"><a href="${ctx}/ssc/index.do?poolId=3" target="caiplay">三字定位</a></li>
		<li role="presentation"><a href="${ctx}/ssc/index.do?poolId=A" target="caiplay">组选三</a></li>
		<li role="presentation"><a href="${ctx}/ssc/index.do?poolId=B" target="caiplay">组选六</a></li>
		<li role="presentation"><a href="${ctx}/ssc/index.do?poolId=9" target="caiplay">跨度</a></li>
	</ul> <!-- /pills -->
</div>


<script type="text/javascript">
$(function(){
	getLastSg();
	setInterval(getLastSg, 10000);
});
//获取最后一期赛果
var d = new Date();
var date = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();
function getLastSg() {
	$.ajax({
        url: "getLastSg.do?timeStamp=" + new Date().getTime() + "+&resultDate=" + date, type: "get", dataType: "json",
        success: function (b) {
        	//console.debug(b);
        	if(b == null || b == undefined || b == ''){
        		$("#prevSGSpan").hide();
        	}else if(b.result == null || b.result == undefined || b.result == ''){
        		$("#prevQihao").html(b.qihao);
        		$("#lastSg").html("未派彩");
        	}else{
        		$("#prevQihao").html(b.qihao);
        		$("#lastSg").html(b.qihao);
        		$("#lastSg").html(b.result);
        	}
        }
    })
}

//点击选中玩法
$(function(){
    $(".caiplay li").each(function(){
        $(this).click(function(){
            $("li").addClass("").removeClass("active");
            $(this).addClass("active").removeClass("");
        })

    });

})
</script>