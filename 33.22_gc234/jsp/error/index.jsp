<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>黄金世纪</title>

    <!--公用css-->
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">

    <!--本页css-->
    <link href="${ctx}/css/error.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="${ctx}/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${ctx}/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${ctx}/js/html5shiv.min.js"></script>
    <script src="${ctx}/js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div class="container">
    <div class="text-center">
        <h1><img src="${ctx}/img/error/error.png">系统正在升级维护，请稍后再试。</h1>
    </div>
</div>

<div class="container-fluid bg-warning">
    <div class="container">
        <div class="row">
            <div class="col-md-4 cn">
                <h2>系统维护</h2>
                <p>很抱歉给您带来不便，维护期间如有疑问，请联系我们。</p>
                <p>维护时间：18:00-20:00</p>
                <p>联系电话：152001150</p>
            </div>
            <div class="col-md-4 en">
                <h2>system maintenance</h2>
                <p>Sorry for the inconvenience, during maintenance in case of doubt, please contact us.</p>
                <p>Maintenance time : 18:00-20:00</p>
                <p>contact number : 152001150</p>
            </div>
            <div class="col-md-4 kh">
                <h2>ការថែទាំប្រព័ន្</h2>
                <p>សូមអភ័យទោសចំពោះការលំបាកនេះក្នុងអំឡុងពេលថែទាំនៅក្នុងករណីនៃការសង្ស័យសូមទាក់ទងមកយើង។</p>
                <p>ពេលវេលាថែទាំ : 18:00-20:00</p>
                <p>ទូរស័ព្ទទំនាក់ទំនង: 152001150</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>