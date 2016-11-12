<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>赛果</title>
</head>
<body id="MRSU">﻿
<meta name="Robots" contect="none">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link rel="stylesheet" href="${ctx}/css/sport/mem_body_ft.css" type="text/css">
<link rel="stylesheet" href="${ctx}/css/sport/mem_body_result.css" type="text/css">
<script language="javascript" src="${ctx}/js/sport/result.js"></script>
<!-- <script language="javascript" src="${ctx}/js/sport/zh-cn.js"></script> -->
<script src="${ctx}/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/laydate.js"></script>
<script type="text/javascript" src="${ctx }/js/page/tpl.js"></script>
<table border="0" cellpadding="0" cellspacing="0" id="box">
    <tbody><tr>
        <td class="top"><h1><em>足球 : 赛果 </em></h1></td>
    </tr>
    <tr>
        <td class="mem">
            <h2>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" id="fav_bar">
                    <tbody><tr>
                        <!-- <td id="page_no">
                            <select name="selgtype" id="selgtype" onchange="chg_gtype(selgtype.value,'game_type=FT&amp;uid=r6khe583cm13706722l3625470&amp;langx=zh-cn&amp;list_date=2015-10-19')">
                              <option value="FT" selected="">足球 : 赛果</option>
                              <option value="FS">足球冠军 : 赛果</option>
                              <option value="SFS">足球特殊冠军 : 赛果</option>
                            </select>
                        </td> -->
                        <td id="tool_td">

                            <table border="0" cellspacing="0" cellpadding="0" class="tool_box">
                                <tbody><tr>
                                    <td class="searh">
                                        <form id="form1" name="game_result" action="" method="POST">
                                            <input type="HIDDEN" name="game_type" value="FT">
                                            <input type="HIDDEN" name="langx" value="zh-cn">
								<span class="rig" style="font-size: 12px;"><!-- <a href="/app/member/result/result.php?game_type=FT&amp;list_date=2015-10-18&amp;uid=r6khe583cm13706722l3625470&amp;langx=zh-cn">前一天</a>  / <a href="/app/member/result/result.php?game_type=FT&amp;today=2015-10-20&amp;uid=r6khe583cm13706722l3625470&amp;langx=zh-cn">下一天</a> -->
								&nbsp;&nbsp;选择日期 : <input id="today" name="today" class="laydate-icon">
								<input type="submit" value="查询" name="submit"></span>
                                        </form>
                                    </td>

                                    <td class="rsu_refresh"><!--秒数更新--><div onclick="javascript:refreshReload()"><font id="refreshTime"></font></div></td>
                                    <!--td class="leg_btn"><div onClick="javascript:chg_league();" id="sel_league">选择联赛</div></td-->
                                    <td class="OrderType"></td>
                                </tr>
                                </tbody></table>

                        </td>
                    </tr>
                    </tbody></table>
            </h2>
            <table border="0" cellspacing="0" cellpadding="0" class="game">
                <tbody><tr>
                    <th class="time">时间</th>

                    <th class="rsu">赛果</th>

                </tr>

                </tbody></table>



            <table border="0" cellspacing="0" cellpadding="0" class="game" id="content">
                
            </table>
            <!--右方刷新钮--><!--<div id="refresh_right" style="position:absolute;top=100;right=-160"  class="refresh_M_btn" onClick="javascript:refreshReload()"><img src="${ctx}/img/sport/mem_refresh_M_btn.gif"><span>刷新</span></div> -->
        </td>
    </tr>
    <tr>
        <td id="foot"><b>&nbsp;</b></td>
    </tr>
    </tbody>
</table>

<!--<div id="copyright">
    版权所有 皇冠 建议您以 IE 5.0 800 X 600 以上高彩模式浏览本站&nbsp;&nbsp;<a id=download title="下载" href="http://www.microsoft.com/taiwan/products/ie/" target="_blank">立刻下载IE</a>
</div>-->
<!--div id="copyright">
    版权所有 建议您以 IE 5.0 800 X 600 以上高彩模式浏览本站&nbsp;&nbsp;<a id=download title="下载" href="http://www.microsoft.com/taiwan/products/ie/" target="_blank">立刻下载IE</a>
</div-->
<script type="text/template" id="contentTpl">
	<tbody>
	<#
	var flag = "";
	for(var i=0; i<list.length; i++){
		strs=list[i].resultid.split("_");
		if(flag == strs[0]){
			
		}else{
			flag = strs[0];
	#>	
		<tr>
        	<td colspan="6" class="b_hline"> 
				<span id="S_<#=list[i].resultid #>" onclick="showLEG('<#=flag #>');" class="showleg"><span id="LegOpen"></span></span>
				<span class="leg_bar" onclick="showLEG('<#=flag #>');"><#=list[i].leagName #></span>
			</td>
		</tr>
	<#}#>
        <tr class="b_cen" id="TR_<#=list[i].resultid #>" style="display: ">
        	<td rowspan="3" class="time"><#=list[i].matchtime #></td>
            <td class="team"></td>
            <td colspan="2" class="team_out_ft">
            	<table border="0" cellpadding="0" cellspacing="0" class="team_main">
            		<tbody>
						<tr class="b_cen">
                    		<td width="12">&nbsp;</td>
                        	<td class="team_c_ft"><a href="javascript:"><#=list[i].hteamname #> &nbsp;&nbsp;</a></td>
                        	<td class="vs">vs</td>
                        	<td class="team_h_ft"><#=list[i].cteamname #> &nbsp;&nbsp;</td>
                        	<td width="12">&nbsp;</td>
						</tr>
                	</tbody>
				</table>
        	</td>
    	</tr>
        <tr id="TR_1_<#=list[i].resultid #>" style="display: " class="hr">
        	<td class="hr_title ">半场</td>
            <td class="hr_main_ft "><span style="overflow:hidden;"><#=list[i].hhresult #></span></td>
            <td class="hr_main_ft "><span style="overflow:hidden;"><#=list[i].hcresult #></span></td>
        </tr>
        <tr id="TR_2_<#=list[i].resultid #>" style="display: " class="full">
        	<td class="full_title ">全场</td>
            <td class="full_main_ft "><span style="overflow:hidden;"><#=list[i].hresult #></span></td>
            <td class="full_main_ft "><span style="overflow:hidden;"><#=list[i].cresult #></span></td>
        </tr>
 	<#}#>
	</tbody>
</script>

<script type="text/javascript">
var ctx = "${ctx}";
//时间控件
$("#today").val(laydate.now());
var start = {
	elem: '#today', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
	event: 'focus', //响应事件。如果没有传入event，则按照默认的click
	format: 'YYYY-MM-DD',
 	istoday: true,
	max: laydate.now()//最大日期
};
laydate(start);

var myleg = new Array();
$(document).ready(function(){
	getResult(ctx + "/football/FT_browse/resultJson.do");
	$("#form1").submit(function(e){
		e.preventDefault();
	    var today = $("#today").val();
	    getResult(ctx + "/football/FT_browse/resultJson.do?today=" + today);
	});
});

function getResult(url){
	myleg = [];
	$.getJSON(url,  function(res){
		//console.debug(res);
		if(res.code == 0){
			if(res.list.length > 0){
				for(i = 0; i < res.list.length; i++){
					myleg[i] = res.list[i].resultid;
				}
				var view = $('#content'); 
				var html =  tpl('#contentTpl', res);
		       	view.html(html);
			} 
		}
		
	});
}
</script>

</body>
</html>