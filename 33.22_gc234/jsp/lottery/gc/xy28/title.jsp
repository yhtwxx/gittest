<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="caihead">
    <h2>幸运28</h2>
    <a href="javascript:;" class="sg"  onclick="parent.openStaticPopup('lhc')" >开奖结果</a>
    <a href="javascript:;" class="sg"  onclick="parent.openStaticGzPopup(6)" style="background-color:#999"   >规则说明</a>
    <span id="prevSGSpan" href="javascript:;" class="prevSGSpan">
		第<span id="prevQihao"></span>期赛果：<span id="lastSg">加载中...</span>
	</span>
    <div id="cai-info">
        第  <span id="cai-num">*</span> 期
        &nbsp;&nbsp;&nbsp;&nbsp;
        <span id="ui-countdown" style="font: 20px/1.5 'Open Sans Condensed',sans-serif;">
        	<span id="day_show">0天</span><span id="hour_show">00</span>:<span id="minute_show">00</span>:<span id="second_show">00</span>
        </span>
        <span id="overMsg" style="display: none;">该期投注时间已经截至！</span>
    </div>
</div>

<!--玩法-->
<div class="caiplay">
	<ul id="caiplaynav" class="nav nav-pills" role="tablist">
		<li role="presentation"><a data-type="lhc" data-flag="lm" href="javascript:void(0);" >两面</a></li>
		<li role="presentation" class="active"><a data-type="lhc" data-flag="tbh" href="javascript:void(0);" >特别号</a></li>
		<li role="presentation" class="dropdown">
			<a id="drop4" data-type="lhc" data-flag="home" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				正码<span class="caret"></span>
			</a>
			<ul id="menu1" class="dropdown-menu" aria-labelledby="drop4">
				<li><a data-type="lhc" data-flag="zm" href="javascript:void(0);" >正码</a></li>
				<li><a data-type="lhc" data-flag="zmt" href="javascript:void(0);" >正码特</a></li>
				<li><a data-type="lhc" data-flag="NO" href="javascript:void(0);" >正码1-6</a></li>
				<li role="separator" class="divider"></li>
				<li><a data-type="lhc" data-flag="NAP" href="javascript:void(0);" >正码过关</a></li>
			</ul>
		</li>
		<li role="presentation" class="dropdown">
			<a id="drop4" data-type="lhc" data-flag="home" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				连码<span class="caret"></span>
			</a>
			<ul id="menu1" class="dropdown-menu" aria-labelledby="drop4">
				<li><a data-type="lhc" data-flag="CH" href="javascript:void(0);" >连码</a></li>
				<li><a data-type="lhc" data-flag="LX" href="javascript:void(0);" >连肖</a></li>
				<li><a data-type="lhc" data-flag="LX" href="javascript:void(0);" >连尾</a></li>
				<li role="separator" class="divider"></li>
				<li><a data-type="lhc" data-flag="NI" href="javascript:void(0);" >自选不中</a></li>
			</ul>
		</li>
		<li role="presentation" class="dropdown">
			<a id="drop4" data-type="lhc" data-flag="home" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				生肖<span class="caret"></span>
			</a>
			<ul id="menu1" class="dropdown-menu" aria-labelledby="drop4">
				<li><a data-type="lhc" data-flag="sxsb" href="javascript:void(0);" >生肖</a></li>
				<!-- <li><a data-type="lhc" data-flag="C7" href="javascript:void(0);" >正肖</a></li> -->
				<li><a data-type="lhc" data-flag="SPB" href="javascript:void(0);" >一肖/尾数</a></li>
				<li><a data-type="lhc" data-flag="NX" href="javascript:void(0);" >合肖</a></li>
				<!-- <li><a data-type="lhc" data-flag="SPB" href="javascript:void(0);" >总肖</a></li> -->
			</ul>
		</li>
		<!-- <li role="presentation" class="dropdown">
			<a id="drop4" data-type="lhc" data-flag="home" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				色波<span class="caret"></span>
			</a>
			<ul id="menu1" class="dropdown-menu" aria-labelledby="drop4">
				<li><a data-type="lhc" data-flag="SPA" href="javascript:void(0);" >色波</a></li>
				<li><a data-type="lhc" data-flag="HB" href="javascript:void(0);" >半波</a></li>
				<li><a data-type="lhc" data-flag="HB" href="javascript:void(0);" >半半波</a></li>
				<li><a data-type="lhc" data-flag="C7" href="javascript:void(0);" >七色波</a></li>
			</ul>
		</li>
		<li role="presentation" class="dropdown">
			<a id="drop4" data-type="lhc" data-flag="home" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				头尾数<span class="caret"></span>
			</a>
			<ul id="menu1" class="dropdown-menu" aria-labelledby="drop4">
				<li><a data-type="lhc" data-flag="SPA" href="javascript:void(0);" >头尾数</a></li>
				<li><a data-type="lhc" data-flag="SPB" href="javascript:void(0);" >正特尾数</a></li>
			</ul>
		</li>
		<li role="presentation" class="dropdown">
			<a id="drop4" data-type="lhc" data-flag="home" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				新玩法<span class="caret" ></span>
			</a>
			<ul id="menu1" class="dropdown-menu" aria-labelledby="drop4">
				<li><a data-type="lhc" data-flag="S7FE" href="javascript:void(0);" >七码五行</a></li>
				<li><a data-type="lhc" data-flag="IN1" href="javascript:void(0);" >中一</a></li>
			</ul>
		</li> -->
	</ul> <!-- /pills -->
</div>


<script type="text/javascript">
$(function(){
	getLastSg();
	setInterval(getLastSg, 10000);  
});
//获取最后一期赛果
var lastSg;
var d = new Date();
var date = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();
function getLastSg() {  
	$.ajax({
        url: "/lhc/getLastSg.do?timeStamp=" + new Date().getTime() + "+&resultDate=" + date, type: "get", dataType: "json",
        success: function (b) {
        	if(b != null && b != undefined && b != ''){
        		if(b.lhcResultList != null && b.lhcResultList != undefined && b.lhcResultList != ''){
        			lastSg = b.lhcResultList[0];
        			//console.debug(lastSg);
                	if(lastSg.ballResultList.length <= 0){
                		$("#prevQihao").html(lastSg.qihao);
                		$("#lastSg").html("未派彩");
                	}else{
                		var resultBall = "";
                		for (var i = 0; i < lastSg.ballResultList.length; i++) {
                			var color = lastSg.ballResultList[i].ballColor;
                			var colorF = "";
                			switch (color) {
                			case 'H':
                				colorF = 'R';
                				break;
                			case 'B':
                				colorF = 'B';
                				break;
                			case 'G':
                				colorF = 'G';
                				break;
                			default:
                				break;
                			}
                			if(i == lastSg.ballResultList.length-1){
                				resultBall += "+";
                			}
							resultBall += '<span class="num ball' + colorF + '">' + lastSg.ballResultList[i].ballNum + '</span>';
						}
                		$("#prevQihao").html(lastSg.qihao);
                		$("#lastSg").html(resultBall);
                	}
        		}else{
        			$("#prevSGSpan").hide();
        		}
        	}else{
        		$("#prevSGSpan").hide();
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