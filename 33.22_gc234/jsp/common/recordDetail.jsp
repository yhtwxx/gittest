<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>投注记录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="../css/common.css?1203">
    <link href="../css/record.css" rel="stylesheet">
    <style>
    	#haoma span.ball{
        	border: 1px solid rgb(187, 187, 187);
		    border-image-source: initial;
		    border-image-slice: initial;
		    border-image-width: initial;
		    border-image-outset: initial;
		    border-image-repeat: initial;
		    background: url('${ctx}/img/lottery/tab_bg.png') 50% 100% repeat-x rgb(255, 255, 255);
		    font-weight: bold;
	        font-size: 14px;
		    padding: 2px;
		    margin: 1px;
		    border-radius: 12px;
        }
	    #haoma span.b01, 
	    #haoma span.b02, 
	    #haoma span.b07, 
	    #haoma span.b08, 
	    #haoma span.b12, 
	    #haoma span.b13, 
	    #haoma span.b18, 
	    #haoma span.b19, 
	    #haoma span.b23, 
	    #haoma span.b24, 
	    #haoma span.b29, 
	    #haoma span.b30, 
	    #haoma span.b34, 
	    #haoma span.b35, 
	    #haoma span.b40, 
	    #haoma span.b45, 
	    #haoma span.b46 {
	    	color: red;
		}
		#haoma span.b03, 
		#haoma span.b04, 
		#haoma span.b09, 
		#haoma span.b10, 
		#haoma span.b14, 
		#haoma span.b15, 
		#haoma span.b20, 
		#haoma span.b25, 
		#haoma span.b26, 
		#haoma span.b31, 
		#haoma span.b36, 
		#haoma span.b37, 
		#haoma span.b41, 
		#haoma span.b42, 
		#haoma span.b47, 
		#haoma span.b48 {
		    color: blue;
		}
		#haoma span.b05, 
		#haoma span.b06, 
		#haoma span.b11, 
		#haoma span.b16, 
		#haoma span.b17, 
		#haoma span.b21, 
		#haoma span.b22, 
		#haoma span.b27, 
		#haoma span.b28, 
		#haoma span.b32, 
		#haoma span.b33, 
		#haoma span.b38, 
		#haoma span.b39, 
		#haoma span.b43, 
		#haoma span.b44, 
		#haoma span.b49 {
		    color: green;
		}
		/*PC蛋蛋部分开始*/
		.ball_0,.ball_1,.ball_2,.ball_3,.ball_4,.ball_5,.ball_6,.ball_7,.ball_8,.ball_9,.ball_10,.ball_11,.ball_12,.ball_13,.ball_14,.ball_15,.ball_16,.ball_17,.ball_18,.ball_19,.ball_20,.ball_21,.ball_22,.ball_23,.ball_24,.ball_25,.ball_26,.ball_27,.ball_tR,.ball_tG,.ball_tB,.ball_t1,.ball_t2,.ball_t3,.ball_t4 {
			display: inline-block;
			text-align: center;
			width: 23px;
			height: 23px;
			line-height: 22px;
			border-radius: 23px;
			color:#fff;
		}
		.ball_0,.ball_13,.ball_14,.ball_27 {
			background-color:#aaaaaa;
		}
		.ball_1,.ball_4,.ball_7,.ball_10,.ball_16,.ball_19,.ball_22,.ball_25,.ball_tG {
			background-color:#1ca01c;
		}
		.ball_2,.ball_5,.ball_8,.ball_11,.ball_17,.ball_20,.ball_23,.ball_26,.ball_tB {
			background-color:#2a74dd;
		}
		.ball_3,.ball_6,.ball_9,.ball_12,.ball_15,.ball_18,.ball_21,.ball_24,.ball_tR {
			background-color:#e41b1b;
		}
		.ball_t1{
			background-color:#853f8a;
		}
		.ball_t2{
			background-color:#ff9314;
		}
		.ball_t3{
			background-color:#1fa4c7;
		}
		.ball_t4{
			background-color:#9966cc;
		}
		/*球中是汉字，宽度自动*/
		.ball_txt{
			width: auto;
			padding: 0 6px;
		}
    </style>
</head>
<body style="padding:0px;">
<!-- Contenedor -->
<div class="pagemain">
    <div class="display biao-cont">
    <table width="100%" class="table_b">
            <tr>
                <td  class="table_b_th">下注时间</td>
                <td class="table_b_tr" id="xiazhudate"></td>
                <td  class="table_b_th">彩种</td>
                <td class="table_b_tr" id="caizhong"></td>
                <td  class="table_b_th">期号</td>
                <td class="table_b_tr" id="qihao"></td>
            </tr>
            <tr>
                <td  class="table_b_th">下注总额(元)</td>
                <td class="table_b_tr"  id="xiazhumoney"></td>
                <td  class="table_b_th">中奖金额(元)</td>
                <td class="table_b_tr"  id="zhongjiangmoney"></td>
                <td  class="table_b_th">开奖号码</td>
                <td class="table_b_tr"  id="haoma"></td>
            </tr>
        </table>
        <table width="100%" class="table_b">
            <thead>
            <tr class="table_b_th">
                <td>投注内容</td>
                <td>注数</td>
                <td>下注金额(元)</td>
                <td>中奖金额(元)</td>
            </tr>
            </thead>
            <tbody id="content" class="table_b_tr">
            </tbody>
        </table>

    </div>
</div>

<script src="../js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
    $(function(){
    	var json = ${json};
    	var history = json.history;
    	$("#xiazhudate").html(history[0].betTimeStr);
    	$("#caizhong").html(history[0].gameTypeStr);
    	$("#qihao").html(history[0].gameNo);
    	$("#xiazhumoney").html(formatMoney(history[0].betAmount/100));
    	$("#zhongjiangmoney").html(formatMoney(history[0].payAmount/100));
    	
    	var lhc = ["正码一","正码二","正码三","正码四","正码五","正码六"]; 
    	var gdkl = ["第一球","第二球","第三球","第四球","第五球","第六球","第七球","第八球"]; 
    	var bjsc = ["冠军","亚军","季军","第四名","第五名","第六名","第七名","第八名","第九名","第十名"]; 
    	var jssb = ["","${ctx}/img/lottery/dice_01.png","${ctx}/img/lottery/dice_02.png","${ctx}/img/lottery/dice_03.png","${ctx}/img/lottery/dice_04.png","${ctx}/img/lottery/dice_05.png","${ctx}/img/lottery/dice_06.png"];
    	var poolCodeStr = "J09,J10,J12,J13";
    	
    	if(history[0].gameType=='3'){
    		if(history[0].result!=null && history[0].result!=''){
    			var betContain = history[0].result;
    			var betArr = betContain.split(",");
    			var html="";
    			for(var k=0;k<betArr.length;k++){
    				html+="<img src="+jssb[betArr[k]]+" />";
    			}
        		$("#haoma").html(html);
    		}else{
    			$("#haoma").html("");
    		}
    		
    	}else if(history[0].gameType=='5'){
			if(history[0].result!=null && history[0].result!=''){
				var betContain = history[0].result;
				
				$("#haoma").html(betContain.substring(0,30)+"<br/>"+betContain.substring(30,betContain.length));
    		}else{
    			$("#haoma").html("");
    		}
    		
    	}else if(history[0].gameType=='6'){
    		var html = "";
			var resultStr = history[0].result;
			if(resultStr != null && resultStr != undefined && resultStr != ''){
				var resultStr1 = resultStr.split(',');
				for(var j=0; j<resultStr1.length; j++){
					html += "<span class='ball b"+resultStr1[j]+"'>"+resultStr1[j]+"</span>";
				}
			}else{
				html = history[0].result;
			}
			$("#haoma").html(html);
    	}else if(history[0].gameType=='P'){
			var html = "";
			var resultStr = history[0].result;
			if(resultStr != null && resultStr != undefined && resultStr != ''){
				var resultStr1 = resultStr.split(',');
				var sum = 0;
				for(var j=0; j<resultStr1.length; j++){
					var num = parseInt(resultStr1[j]);
					sum+=num;
					if(j != resultStr1.length-1){
						html += "<span class='ball_"+num+"'>"+num+"</span>+";
					}else{
						html +=  "<span class='ball_"+num+"'>"+num+"</span>=<span class='ball_"+sum+"'>"+sum+"</span>";
					}
				}
			}else{
				html = history[0].result;
			}
			$("#haoma").html(html);
		}else{
    		$("#haoma").html(history[0].result);
    	}
    	
    	var detail = history[0].details;
    	//console.debug(detail);
    	var html="";
    	for(var i=0;i<detail.length;i++){
    		html+="<tr>";
    		if(detail[i].poolCode.indexOf("B")>-1){
    			if(detail[i].position==null || detail[i].position==""){
    				html+="<td>"+detail[i].poolName+" "+detail[i].betContain+"</td>";
    			}else{
    				html+="<td>"+detail[i].poolName+" "+bjsc[detail[i].position]+" "+detail[i].betContain+"</td>";
    			}
    		}else if(detail[i].poolCode.indexOf("J")>-1){
    			if(poolCodeStr.indexOf(detail[i].poolCode)>-1){
    				var betContain = detail[i].betContain;
    				var betArr = betContain.split(",");
    				html+="<td>"+detail[i].poolName+"  ";
    				for(var k=0;k<betArr.length;k++){
    					html+="<img src="+jssb[betArr[k]]+" />";
    				}
    				html+="</td>";
    			}else{
    				html+="<td>"+detail[i].poolName+"  "+detail[i].betContain+"</td>";
    			}
    			
    		}else if(detail[i].poolCode.indexOf("G")>-1){//广东快乐十分
    			
    			if(detail[i].position==null || detail[i].position==""){
    				html+="<td>"+detail[i].poolName+" "+detail[i].betContain+"</td>";
    			}else{
    				html+="<td>"+detail[i].poolName+" "+gdkl[detail[i].position]+" "+detail[i].betContain+"</td>";
    			}
    		}else if(detail[i].poolCode.indexOf("L")>-1){//六合彩
    			if(detail[i].position==null || detail[i].position==""){
    				if(detail[i].poolCode.indexOf("L08")>-1 || detail[i].poolCode.indexOf("L09")>-1){
    					html+="<td>"+detail[i].poolName+" ("+detail[i].betContain+")</td>";
    				}else if(detail[i].poolCode.indexOf("L10")>-1 || detail[i].poolCode.indexOf("L11")>-1){
    					html+="<td>"+detail[i].poolName+"</td>";
    				}else{
    					html+="<td>"+detail[i].poolName+" "+detail[i].betContain+"</td>";
    				}
    			}else{
    				if(detail[i].poolCode.indexOf("L17")>-1 || detail[i].poolCode.indexOf("L18")>-1 || detail[i].poolCode.indexOf("L19")>-1 
    						|| detail[i].poolCode.indexOf("L20")>-1 || detail[i].poolCode.indexOf("L21")>-1 || detail[i].poolCode.indexOf("L22")>-1){
    					html+="<td>"+detail[i].poolName+" "+detail[i].betContain+"</td>"
    				}else{
    					html+="<td>"+detail[i].poolName+" "+lhc[detail[i].position]+" "+detail[i].betContain+"</td>";
    				}
    			}
    		}else{
    			html+="<td>"+detail[i].poolName+" "+detail[i].betContain+"</td>";
    		}
            html+="<td>"+detail[i].noteNum+"</td>"+
            "<td>"+formatMoney(detail[i].betAmount/100)+"</td>"+
            "<td>"+formatMoney(detail[i].payAmount/100)+"</td>"+
            "</tr>";  
    	}
    	
    	$("#content").html(html);
    });
    
    function formatMoney(num) {
    	num = num.toFixed(2);
    	var parts = num.toString().split(".");
    	parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	return parts.join(".");
    };
</script>

</body>
</html>