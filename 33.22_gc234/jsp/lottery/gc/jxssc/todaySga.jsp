<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">

    <link rel="stylesheet" href="../css/common.css?1203" />
    <link rel="stylesheet" href="../css/lottery/ssc.css"/>
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/lib/tpl.js" type="text/javascript"></script>
    <div id="final" class="round-table">

    <table>
    <tbody id="todaySg">

    </tbody>

    </table>
    </div>

	<script type="text/template" id="todaySgTpl">

    <tr class="title_tr">
    <td>期数</td>
    <td>时间</td>
    <td>彩球号码</td>
    </tr>
    <# for(var i=resultList.length-1; i>=0; i--) { 
		var result = resultList[i].result;
		var saiguohtml = "";
		if(result != "" && result != null){
			var saiguo = result.split(",");
        	for(var j=0 ; j < saiguo.length; j++){
        		var num = parseInt(saiguo[j]);
        		saiguohtml += "<span class='sscnumber sscnum"+num+"'></span>";
        	}
		}
	#>
    <tr style="text-align:center;background-color:white;height:35px;">
    <td width="100" class="rTitle"><#=resultList[i].qihao#></td>
    <td width="160" class="rTitle">
    <#=resultList[i].resultTimeStr #> </td>
    <td><#=saiguohtml#></td>
    </tr>
    <#}#>

    </script>
    
<script>
    var d = new Date();
    var date = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();
    //循环输出
    $.ajax({
        url: "${ctx}/jxssc/todaySg.do?timeStamp=" + new Date().getTime() + "+&resultDate=" + date, type: "get", dataType: "json",
        success: function (b) {
            if (0 == b.code) {
                var html = tpl('#todaySgTpl', b);
                $("#todaySg").html(html);
            }
        }
    })
</script>
