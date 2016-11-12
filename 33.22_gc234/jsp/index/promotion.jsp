<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>优惠活动</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
    <!--本页css-->
    <link rel="stylesheet" href="${ctx}/css/promotion.css"/>
    <!--本页js-->
    <script src="${ctx}/js/promotion.js"></script>

</head>

<body>

<!--头部-->
<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript" src="${ctx }/js/page/tpl.js"></script>
<script type="text/template" id="promotionTpl">
	<# for(var i=0; i<list.length; i++){ 
		var pic = list[i].picPath+"/"+list[i].picName;
		var pic_min = list[i].picPath+"/"+list[i].remark;
	#>
		<li>
			<div class="link">
				<div class="image-wrapper">
					<img src='<#=pic#>'>
				</div>
			</div>
			<div class="slide-index">
					<img src='<#=pic_min#>'>
			</div>
		</li>
	<#}#>
</script>
<div class="container-fluid padding-0">
    <div class="banner"></div>
</div>
<div class="container padding-0">
    <ul id="promotion" class="promotion">
    </ul>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var pictype = "2";
	$.ajax({'url':"picChange.do?picType="+pictype,
		type:"get",
		dataType:'json',
		success:
		function(b){
	        if(b.code==0){
	           	var list = b.list;
	           	if(list.length>0){
	               	var html =  tpl('#promotionTpl', b);
	           		$("#promotion").html(html);
	           	}
	        }
		}
	});
});
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>