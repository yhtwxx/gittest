<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctx}/css/sport/mem_body_ft.css" type="text/css">
<link rel="stylesheet" href="${ctx}/css/sport/mem_body_his.css" type="text/css">

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
  	  <h1><em>帐户历史摘要</em></h1>
	</td>
  </tr>
  <tr>
    <td class="mem">
    <h2>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" id="fav_bar">
		<tr>
        	<td>按体育查看记录: 
            	<form action="" target="_self" style="display:inline;">
	      			<select name="type">
			           	<option value="FT" selected="selected">足球</option>
			           	<!-- <option value="BK" >篮球&美式足球</option>
			    	   	<option value="TN" >网球</option>
			    	   	<option value="BS" >棒球</option>
			    	   	<option value="VB" >排球</option>
					   	<option value="FS" >冠军</option>
			      	    <option value="OP">其他</option> -->
			      	</select>
			      	<select id="year" name="year">
                <option value="2015">2015</option>
                <option value="2016">2016</option>
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				<option value="2021">2021</option>
				<option value="2022">2022</option>
				<option value="2023">2023</option>
				<option value="2024">2024</option>
            </select>
            
            <select id="month" name="month">
                <option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
            </select>
          		<input type=submit value="查询">
     			</form>
           </td>
        </tr>
    </table>
    </h2>
    
    <table border="0" cellspacing="0" cellpadding="0" class="game">
    <thead>
      <tr> 
        <th class="his_time">日期</th>
        <th class="his_wag" >投注金额</th>
        <th class="his_wag">有效金额</th>
        <th class="his_wag">派彩金额</th>
        <!--th width="25%">Ч~</th-->
      </tr>
      </thead>
      <tbody id="content" class="table_b_tr">
            </tbody>
	  

      
    </table> 
	</td>
  </tr>
  <tr><td id="foot"><b>&nbsp;</b></td></tr>
</table>
<script type="text/template" id="contentTpl">
	<# var  betAmountSum=0,payAmountSum=0;
	for(var i=0; i<list.length; i++){ 
		betAmountSum+=list[i].betAmount/100;
		payAmountSum+=list[i].payAmount/100;
		if(i%2==0){
		var type= "${type}";
		if(type==null || type==""){
    		type = "FT";
    	}
		#>
<tr class="color_bg1" onMouseOver="overbars(this,his_over);" onMouseOut="outbars(this,his_list)" >
        <td class="his_list_none" id="d_date"><span ><a href="datewagers.do?date=<#=list[i].datestr #>&type=<#=type #>"><#=list[i].date_str #></a></span></td>
	    <td class="his_td"   ><span class="fin_gold"><#=list[i].betAmount/100#></span></td>
		<td class="his_td" ><#=list[i].betAmount/100#></td>
	    <td class="his_td" ><#=list[i].payAmount/100#></td>
		</tr>


<#}else{ #>
<tr class="color_bg2" onMouseOver="overbars(this,his_over);" onMouseOut="outbars(this,his_list)" >
        <td class="his_list_none" id="d_date"><span ><a href="datewagers.do?date=<#=list[i].datestr #>&type=<#=type #>"><#=list[i].date_str #></a></span></td>
	    <td class="his_td"   ><span class="fin_gold"><#=list[i].betAmount/100#></span></td>
		<td class="his_td" ><#=list[i].betAmount/100#></td>
	    <td class="his_td" ><#=list[i].payAmount/100#></td>
		</tr>
 	<#}}#>
<tr class="sum_bar right">
        <td class="center his_total">总计</td>
        <td class="his_total"><#=betAmountSum.toFixed(2) #></td>
        <td class="his_total"><#=betAmountSum.toFixed(2) #></td>
        <td class="his_total"><#=payAmountSum.toFixed(2) #></td>
        <!--td>474</td-->
      </tr>
</script>
<script src="${ctx}/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/laydate.js"></script>
<script src="${ctx}/js/lib/jquery.jmpopups-0.5.1.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function(){
    	var type= "${type}";
    	if(type==null || type==""){
    		$("#type").val("FT");
    	}else{
    		$("#type").val("${type}");
    	}
    	$("#year").val("${year}");
    	$("#month").val("${month}");
    	

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
<script type="text/javascript" src="${ctx }/js/page/tpl.js"></script>
<script type="text/javascript">
var url = "${ctx}/common/ftbrecordJson.do?timeStamp=" + new Date().getTime()+"&type=${type}&year=${year}&month=${month}";
$.ajax({'url':url,type:"get",data:{},dataType:'json',success:
    function(res){
			var view = $('#content'); 
			var html =  tpl('#contentTpl', res);
			
			view.html(html);
        }
    });

</script>
</body>
</html>