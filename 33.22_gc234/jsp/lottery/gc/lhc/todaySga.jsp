<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <link rel="stylesheet" href="../css/common.css?1203" />
    <link rel="stylesheet" href="../css/lottery/ssc.css"/>
    <style>
    	#todaySg td{
    	    position: relative;
    	}
    	#todaySg span.ball{
        	border: 1px solid rgb(187, 187, 187);
		    border-image-source: initial;
		    border-image-slice: initial;
		    border-image-width: initial;
		    border-image-outset: initial;
		    border-image-repeat: initial;
		    background: url('${ctx}/img/tab_bg.png') 50% 100% repeat-x rgb(255, 255, 255);
		    font-weight: bold;
	        font-size: 10px;
		    padding: 2px;
		    margin: 1px;
		    border-radius: 12px;
		    text-shadow: none;
        }
	    #todaySg span.b01, 
	    #todaySg span.b02, 
	    #todaySg span.b07, 
	    #todaySg span.b08, 
	    #todaySg span.b12, 
	    #todaySg span.b13, 
	    #todaySg span.b18, 
	    #todaySg span.b19, 
	    #todaySg span.b23, 
	    #todaySg span.b24, 
	    #todaySg span.b29, 
	    #todaySg span.b30, 
	    #todaySg span.b34, 
	    #todaySg span.b35, 
	    #todaySg span.b40, 
	    #todaySg span.b45, 
	    #todaySg span.b46 {
	    	color: red;
		}
		#todaySg span.b03, 
		#todaySg span.b04, 
		#todaySg span.b09, 
		#todaySg span.b10, 
		#todaySg span.b14, 
		#todaySg span.b15, 
		#todaySg span.b20, 
		#todaySg span.b25, 
		#todaySg span.b26, 
		#todaySg span.b31, 
		#todaySg span.b36, 
		#todaySg span.b37, 
		#todaySg span.b41, 
		#todaySg span.b42, 
		#todaySg span.b47, 
		#todaySg span.b48 {
		    color: blue;
		}
		#todaySg span.b05, 
		#todaySg span.b06, 
		#todaySg span.b11, 
		#todaySg span.b16, 
		#todaySg span.b17, 
		#todaySg span.b21, 
		#todaySg span.b22, 
		#todaySg span.b27, 
		#todaySg span.b28, 
		#todaySg span.b32, 
		#todaySg span.b33, 
		#todaySg span.b38, 
		#todaySg span.b39, 
		#todaySg span.b43, 
		#todaySg span.b44, 
		#todaySg span.b49 {
		    color: green;
		}
		#todaySg td.BigSmall_B{
			color: blue;
		}
		#todaySg td.BigSmall_S{
			color: green;
		}
		#todaySg td.BigSmall_E{
			color: yellow;
		}
		#todaySg td.Color_B{
			color: blue;
		}
		#todaySg td.Color_G{
			color: green;
		}
		#todaySg td.Color_H{
			color: red;
		}
		#todaySg td.SingleDouble_S{
			color: purple;
		}
		#todaySg td.SingleDouble_D{
			color: red;
		}
		#todaySg td.SingleDouble_H{
			color: yellow;
		}
		#todaySg .arrow-left:hover,
		#todaySg .arrow-right:hover{
			
		} 
		#todaySg .arrow-left {
		    width: 0;   
		    height: 0;   
		    border-bottom: 8px solid transparent;  /* 下边框的高 */  
		    border-top: 8px solid transparent; /* 上方边框的高 */  
		    border-right: 8px solid green; /* 右边框的长度|宽度，以及背景色 */  
		    font-size: 0;  
		    line-height: 0;  
	        position: absolute;
	        left:0px;
	        cursor: pointer;
		}  
		#todaySg .arrow-right {  
		    width: 0;   
		    height: 0;   
		    border-bottom: 8px solid transparent;  /* 下边框的高 */  
		    border-top: 8px solid transparent; /* 上方边框的高 */  
		    border-left: 8px solid green; /* 左边框的长度|宽度，以及背景色 */  
		    font-size: 0;  
		    line-height: 0;  
	        margin-left: 10px;
	        position: absolute;
	        right:0px;
	        cursor: pointer;
		} 
    </style>
    <script src="${ctx}/js/jquery-1.10.2.min.js"></script>
    <script src="${ctx}/js/lib/tpl.js" type="text/javascript"></script>
    <div id="final" class="round-table">

    <table>
    <tbody id="todaySg">

    </tbody>

    </table>
    </div>

    <script type="text/template" id="todaySgTpl">

    <tr>
        <td rowspan="3">期数</td>
        <td rowspan="3">时间</td>
        <td colspan="17">彩球号码</td>
    </tr>
    <tr>
        <td rowspan="2">正码一</td>
        <td rowspan="2">正码二</td>
        <td rowspan="2">正码三</td>
        <td rowspan="2">正码四</td>
        <td rowspan="2">正码五</td>
        <td rowspan="2">正码六</td>
        <td rowspan="2">特别号</td>
        <td colspan="3" rowspan="2">总和</td>
        <td rowspan="2">七色波</td>
        <td colspan="6">
			<span class="arrow-left" onclick="prevType(this)"></span>
			<span dataType="0" class="itemType">正码一</span>
			<span dataType="1" class="itemType" style="display:none;">正码二</span>
			<span dataType="2" class="itemType" style="display:none;">正码三</span>
			<span dataType="3" class="itemType" style="display:none;">正码四</span>
			<span dataType="4" class="itemType" style="display:none;">正码五</span>
			<span dataType="5" class="itemType" style="display:none;">正码六</span>
			<span dataType="6" class="itemType" style="display:none;">特别号</span>
			<span class="arrow-right" onclick="nextType(this)"></span>
		</td>
    </tr>
    <tr>
        <td>单双</td>
        <td>大小</td>
        <td colspan="2">和数</td>
        <td>尾数</td>
		<td>属相</td>
    </tr>
	<# var b = lhcResultList;
	for(var i=b.length-1; i>=0; i--) { #>
    <tr>
        <td><#=b[i].qihao #></td>
        <td><#=b[i].time #></td>
		<#
		if(b[i].ballResultList != null && b[i].ballResultList != undefined && b[i].ballResultList != ""){
		for(var j = 0; j < b[i].ballResultList.length; j++) { #>
        <td class="choose">
			<span class="ball b<#=b[i].ballResultList[j].ballNum #>"><#=b[i].ballResultList[j].ballNum #></span>
		</td>
		<#}#>
        <td>
			<#=b[i].totleNum #>
		</td>
        <td class="SingleDouble_<#=b[i].totleSingleDouble#>">
			<#=getSingleDouble(b[i].totleSingleDouble) #>
		</td>
        <td class="BigSmall_<#=b[i].totleBigSmall#>">
			<#=getBigSmall(b[i].totleBigSmall) #>
		</td>
        <td class="Color_<#=b[i].totleColor#>">
			<#=getColor(b[i].totleColor) #>
		</td>
		<#}else{ #>
		<td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
		<td></td>
        <td></td>
        <td></td>
        <td></td>
		<#}#>
		
		<# 
		if(b[i].ballResultList != null && b[i].ballResultList != undefined && b[i].ballResultList != ""){
		for(var j = 0; j < b[i].ballResultList.length; j++) { 
			if(j == 0){#>
       			<td class="td_<#=j#> SingleDouble_<#=b[i].totleSingleDouble#>">
					<#=getSingleDouble(b[i].ballResultList[j].ballSingleDouble) #>
				</td>
				<td class="td_<#=j#> BigSmall_<#=b[i].totleBigSmall#>">
					<#=getBigSmall(b[i].ballResultList[j].ballBigSmall) #>
				</td>
				<td class="td_<#=j#> SingleDouble_<#=b[i].totleSingleDouble#>">
					<#=getSingleDouble(b[i].ballResultList[j].ballTSingleDouble) #>
				</td>
				<td class="td_<#=j#> BigSmall_<#=b[i].totleBigSmall#>">
					<#=getBigSmall(b[i].ballResultList[j].ballTBigSmall) #>
				</td>
				<td class="td_<#=j#> BigSmall_<#=b[i].totleBigSmall#>">
					<#=getBigSmall(b[i].ballResultList[j].ballLastBigSmall) #>
				</td>
				<td class="td_<#=j#>">
					<#=b[i].ballResultList[j].animal #>
				</td>
			<#}else{#>
       			<td class="td_<#=j#> SingleDouble_<#=b[i].totleSingleDouble#>" style="display:none;">
					<#=getSingleDouble(b[i].ballResultList[j].ballSingleDouble) #>
				</td>
				<td class="td_<#=j#> BigSmall_<#=b[i].totleBigSmall#>" style="display:none;">
					<#=getBigSmall(b[i].ballResultList[j].ballBigSmall) #>
				</td>
				<td class="td_<#=j#> SingleDouble_<#=b[i].totleSingleDouble#>" style="display:none;">
					<#=getSingleDouble(b[i].ballResultList[j].ballTSingleDouble) #>
				</td>
				<td class="td_<#=j#> BigSmall_<#=b[i].totleBigSmall#>" style="display:none;">
					<#=getBigSmall(b[i].ballResultList[j].ballTBigSmall) #>
				</td>
				<td class="td_<#=j#> BigSmall_<#=b[i].totleBigSmall#>"  style="display:none;">
					<#=getBigSmall(b[i].ballResultList[j].ballLastBigSmall) #>
				</td>
				<td class="td_<#=j#>" style="display:none;">
					<#=b[i].ballResultList[j].animal #>
				</td>
			<#}#>
		<#}#>
		<#}else{#>
			
        
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
		<td></td>
		<#}#>
		<#}#>	

    </tr>


    </script>
<script>
    var d = new Date();
    var year = d.getFullYear();
    var month = d.getMonth()+1;
    var day = d.getDate();
    if(month<10){
    	month = "0"+month;
    }
    if(day<10){
    	day = "0"+day;
    }
    var date = year + "/" +month+ "/" + day;
    //循环输出
    $.ajax({url: "getHistory.do?timeStamp=" + new Date().getTime()+"&date="+date,type: "get",dataType: "json",success: function(b) {
    	//console.debug(b);
    	var html = tpl('#todaySgTpl', b);
    	$("#todaySg").html(html);
    }})
    
    //大小 'B'=大，'S'=小，'E'=和
    function getBigSmall(str){
    	switch (str) {
		case "B":
			return "大";
			break;
		case "S":
			return "小";
			break;
		case "E":
			return "和";
			break;
		default:
			break;
		}
    }
  	//'S'=单，'D'=双，'E'=和
    function getSingleDouble(str){
    	switch (str) {
		case "S":
			return "单";
			break;
		case "D":
			return "双";
			break;
		case "E":
			return "和";
			break;
		default:
			break;
		}
    }
  	
  	// 'H'=红，'G'=绿，'B'=蓝，'E'=和
    function getColor(str){
    	switch (str) {
		case "H":
			return "红";
			break;
		case "G":
			return "绿";
			break;
		case "B":
			return "蓝";
			break;
		case "E":
			return "和";
			break;
		default:
			break;
		}
    }
  	
  	function prevType(obj){
  		var item = $(obj).siblings("span.itemType:visible");
  		var type = item.attr("dataType");
  		var prev = 0;
		if(type == 0) {
			prev = 6;
		}else{
			prev = type - 1;
		}
		$(obj).siblings("span[datatype="+type+"]").hide();
		$("#todaySg td.td_"+type).hide();
		$(obj).siblings("span[datatype="+prev+"]").show();
		$("#todaySg td.td_"+prev).show();
  	}
  	
  	function nextType(obj){
  		var item = $(obj).siblings("span.itemType:visible");
  		var type = item.attr("dataType");
  		var prev = 0;
		if(type == 6) {
			prev = 0;
		}else{
			prev = parseInt(type,10) + 1;
		}
		$(obj).siblings("span[datatype="+type+"]").hide();
		$("#todaySg td.td_"+type).hide();
		$(obj).siblings("span[datatype="+prev+"]").show();
		$("#todaySg td.td_"+prev).show();
  	}


</script>
