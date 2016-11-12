<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctx}/css/sport/mem_body_ft.css" type="text/css">
<link rel="stylesheet" href="${ctx}/css/sport/mem_body_his.css" type="text/css">
<link rel="stylesheet" href="../css/common.css?1203">
<script>
function onLoad(){
	var select_object = document.getElementById("gtype");
	select_object.value = 'ALL';
	//var gdate_object = document.getElementById("gdate");
	//gdate_object.value = '2015-05-03';
	//var gdate1_object = document.getElementById("gdate1");
	//gdate1_object.value = '2015-05-04';
	
}
function changeGtpye(){
	sel_gtype.submit();
}

function changeUrl(a){
 self.location=a;
//alert(a);
}
function overbars(obj,color){
  //alert(obj.cells["d_date"].className);
  var className=obj.cells["d_date"].className;
  if (className=="his_list_none") return;  
	obj.cells["d_date"].className=color;

}
function outbars(obj,color){
var className=obj.cells["d_date"].className;
  if (className=="his_list_none") return;
	obj.cells["d_date"].className=color;
	//alert("out--"+obj.cells["d_date"].className);
}


</script>
</head>

<body id="Mall" class="bodyset HIS" onLoad="onLoad()">
<table border="0" cellpadding="0" cellspacing="0" id="box">
  <tr>
    <td class="top">
  	  <h1><em>交易状况</em></h1>
	</td>
  </tr>
  <tr>
    <td class="mem">

    
    <table border="0" cellspacing="0" cellpadding="0" class="game">
    <thead>
      <tr> 
        <th class="his_time">交易时间</th>
        <th class="his_wag" >赛事</th>
        
        <th class="his_wag">下注金额(元)</th>
        <th class="his_wag">可赢金额(元)</th>
        <th class="his_wag">派彩金额(元)</th>
        <th class="his_wag">状态</th>
      </tr>
      </thead>
      <tbody id="content" class="table_b_tr">
            </tbody>
	  

      
    </table> 
	</td>
  </tr>
  <tr><td id="foot"><b>&nbsp;</b></td></tr>
</table>

<script src="${ctx}/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
    $(function(){
    	var type= "${type}";
    	if(type==null || type==""){
    		$("#type").val("FT");
    	}else{
    		$("#type").val("${type}");
    	}
    	

        $('.search form input[name=betId]')
                .focus(function(){
                    if(this.value=='输入单号') this.value='';
                })
                .blur(function(){
                    if(this.value=='') this.value='输入单号';
                })
                .keypress(function(e){
                    if(e.keyCode==13) $(this).closest('form').submit();
                });

        $('.chazhao').click(function(){
            $(this).closest('form').submit();
        });

      /*  $('.bottompage a[href]').live('click', function(){
            $('.biao-cont').load($(this).attr('href'));
            return false;
        });*/

    });
    function recordSearch(err, data){
        if(err){
            alert(err);
        }else{
            $('.biao-cont').html(data);
        }
    }
    function recodeRefresh(){
        $('.biao-cont').load(
                $('.bottompage .pagecurrent').attr('href')
        );
    }

    function deleteBet(err, code){
        if(err){
            alert(err);
        }else{
            recodeRefresh();
        }
    }

</script>
<script type="text/javascript" src="${ctx }/js/page/layer.min.js"></script>
<script type="text/javascript">
var url = "${ctx}/football/todayDetail.do?timeStamp=" + new Date().getTime()+"&dateStr=${date}&type=${type}";
$.ajax({'url':url,type:"get",data:{},dataType:'json',success:
    function(res){
	var json = res;
	var detail = json.list;
	
	var html="";
	var betMoneySum=0,payMoneySum=0;
	for(var i=0;i<detail.length;i++){
		var core="";
		if(detail[i].h_core!=null && (detail[i].h_core+"")!=""){
			core = "<font color='red'>("+detail[i].h_core+":"+detail[i].c_core+")</font>"
		}
		betMoneySum+=detail[i].betMoney/100;
		payMoneySum+=detail[i].payMoney/100;
		var oddtype = "";
		if(detail[i].odd_type=="H"){
			oddtype = "香港盘";
		}else if(detail[i].odd_type=="M"){
			oddtype = "马来盘";
		}else if(detail[i].odd_type=="I"){
			oddtype = "印尼盘";
		}else if(detail[i].odd_type=="E"){
			oddtype = "欧洲盘";
		}
		if(i%2==0){
			html+="<tr class=\"color_bg1\">";
    		html+="<td class=\"his_list_none\">"+detail[i].betDate_str+"</br>"+oddtype+"</td>";
    		if(detail[i].betItem=="p3"){
    			html+="<td align=\"left\"  class=\"his_td\"><font color=\"red\">"+detail[i].betItemName+"</font><br/>"+detail[i].betContain+"</td>";
    		}else{
    		html+="<td align=\"left\"  class=\"his_td\">"+detail[i].betContain+"@<font color=\"blue\">"+detail[i].payRate+"</font><br/>"+detail[i].betItemName+"<br/>"+detail[i].h_teamName+" vs "+detail[i].c_teamName+core+"<br/>"+detail[i].league+"</td>";
    		}
    		html+="<td class=\"his_td\">"+detail[i].betMoney/100+"</td>";
    		html+="<td class=\"his_td\">"+detail[i].winMoney/100+"</td>";
    		html+="<td class=\"his_td\">"+detail[i].payMoney/100+"</td>";
    		html+="<td class=\"his_td\">"+detail[i].status+"</td>";
    		html+="</tr>";
		}else{
			html+="<tr class=\"color_bg2\">";
    		html+="<td class=\"his_list_none\">"+detail[i].betDate_str+"</br>"+oddtype+"</td>";
			if(detail[i].betItem=="p3"){
				html+="<td align=\"left\"  class=\"his_td\"><font color=\"red\">"+detail[i].betItemName+"</font><br/>"+detail[i].betContain+"</td>";
    		}else{
    		html+="<td align=\"left\"  class=\"his_td\">"+detail[i].betContain+"@<font color=\"blue\">"+detail[i].payRate+"</font><br/>"+detail[i].betItemName+"<br/>"+detail[i].h_teamName+" vs "+detail[i].c_teamName+core+"<br/>"+detail[i].league+"</td>";
    		}
    		html+="<td class=\"his_td\">"+detail[i].betMoney/100+"</td>";
    		html+="<td class=\"his_td\">"+detail[i].winMoney/100+"</td>";
    		html+="<td class=\"his_td\">"+detail[i].payMoney/100+"</td>";
    		html+="<td class=\"his_td\">"+detail[i].status+"</td>";
    		html+="</tr>";
		}
		  
	}
	html+="<tr class=\"sum_bar right\">";
	html+="<td class=\"center his_total\">总计</td>";
	html+="<td class=\"his_total\"></td>";
	html+="<td class=\"his_total\">"+betMoneySum.toFixed(2)+"</td>";
	html+="<td class=\"his_total\"></td>";
	
	html+="<td class=\"his_total\">"+payMoneySum.toFixed(2)+"</td>";
	html+="<td class=\"his_total\"></td>";
	html+="</tr>"; 
	$("#content").html(html);
        }
    });

</script>
</body>
</html>