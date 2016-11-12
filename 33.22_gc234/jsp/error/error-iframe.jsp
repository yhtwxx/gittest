<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>该游戏正在维护</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common.jsp" />
</head>
<body>

    <!--游戏单独维护 开始-->
    <style>
    .cn {
    border-right: 1px solid #ccc;
    height: 170px;
    margin: 20px 0;
    color: #333;
    }
    .en {
    border-right: none;
    margin: 20px 0;
    color: #333;
    }
    h2, h3 {
    font-size: 24px;
    margin-top: 20px;
    margin-bottom: 10px;
    }
    h3 {
    font-size: 20px;
    color: #333;
    }
    .error {
    margin-bottom:20px;
    }
    .error p {
    font-size: 12px;
    }
    </style>
    <div class="error">
        <div class="container tips">
            <div class="text-center">
                <img src="${ctx}/img/error/error.png" style="width:80px; margin-top:20px;">
                <h2>该游戏正在维护，请稍后再试。</h2>
            </div>
        </div>
        <div class="container bg-warning">
            <div class="row">
                <div class="col-xs-6 cn">
                    <h2>系统维护</h2>
                    <p>很抱歉给您带来不便，维护期间如有疑问，请联系我们。</p>
                    <p>维护时间：<spen class="beginDate"></spen> - <spen class="endDate"></spen></p>
                </div>
                <div class="col-xs-6 en">
                    <h2>system maintenance</h2>
                    <p>Sorry for the inconvenience, during maintenance in case of doubt, please contact us.</p>
                    <p>Maintenance time : <spen class="beginDate"></spen> - <spen class="endDate"></spen></p>
                </div>
            </div>
        </div>
    </div>

	<script type="text/javascript">
		var systemSataus = ${systemSataus};
		if(systemSataus != ''){
			$(".beginDate").html(systemSataus.beginDateStr);
			$(".endDate").html(systemSataus.endDateStr);
		}
	</script>
</body>
</html>