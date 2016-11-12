<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="luzi">
	<!-- 路子 -->

	<div class="tabs">
		<ul id="bq-lz-tabs">
			<li tabs="1" class="tabs-btn active1"><a>大 小</a></li>
			<li tabs="2" class="tabs-btn"><a>单 双</a></li>
		</ul>
	</div>
	<div id="bq-lz-locate-box">
		<table class="order-table tabs-view active" tabs-view="1"
			style="display: table;">
			<tr>

				<td style="vertical-align: baseline"><span class="odds"
					id="1dx1"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx2"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx3"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx4"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx5"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx6"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx7"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx8"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx9"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx10"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx11"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx12"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx13"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx14"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx15"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx16"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx17"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx18"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx19"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx20"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx21"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx22"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx23"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx24"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx25"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx26"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx27"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx28"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx29"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1dx30"></span></td>

			</tr>
		</table>
		<table class="order-table tabs-view" tabs-view="2"
			style="display: none;">
			<tr>

				<td style="vertical-align: baseline"><span class="odds"
					id="1ds1"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds2"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds3"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds4"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds5"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds6"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds7"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds8"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds9"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds10"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds11"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds12"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds13"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds14"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds15"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds16"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds17"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds18"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds19"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds20"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds21"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds22"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds23"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds24"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds25"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds26"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds27"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds28"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds29"></span></td>
				<td style="vertical-align: baseline"><span class="odds"
					id="1ds30"></span></td>

			</tr>
		</table>

	</div>


</div>

<script src="${ctx}/js/lottery/jlk3/LuZi.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#bq-lz-tabs li").bind("click", function() {
			var index = $(this).index();
			var divs = $("#bq-lz-locate-box > table");
			$(this).parent().children("li").attr("class", "tabs-btn");//将所有选项置为未选中
			$(this).attr("class", "tabs-btn active1"); //设置当前选中项为选中样式
			divs.hide();//隐藏所有选中项内容
			divs.eq(index).show(); //显示选中项对应内容
		});

	});
</script>