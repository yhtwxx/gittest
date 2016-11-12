<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>手机客户端</title>
<link rel="stylesheet" type="text/css" href="web/er/css/down_mobile.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="web/er/css/easyResponsiveTabs.css" rel="stylesheet" >
<script type="text/javascript" src="web/er/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="web/er/js/easyResponsiveTabs.js"></script>
<script type="text/javascript" src="web/er/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
        $(function(){
            //$(".registerform").Validform();  //就这一行代码！;
            $.Tipmsg.r=" ";//更改默认提示信息;
            $(".reg-form").Validform({
                tiptype:3
            });
            $(".login-form").Validform({
                tiptype:3
            });
        })

    </script>

</head>
<body>
<div class="half">
<div class="step_tittle">如何下载</div>
<P>步骤一<br>
请先参考安装指南，然后扫描下方的二维码，下载安装 GC APP 程式！
</P><P>步骤二<br>
开启 GC APP 程式，再次扫描下方的二维码来快速启动账号，登录畅玩！</P>
<div class="step_img">
<div class="mobile_img"><img src="web/er/images/mobile.png"></div>
<div class="gc-qr-code"><img id="qrcode" src="web/er/images/gc-qr-code.png"><p>扫描二维码,下载GC APP！</p></div>
<div class="clear"></div>
</div>
</div>
<div class="half"><div class="install_tittle">安装指南</div>
<div class="install"><div id="partner">
        <ul class="resp-tabs-list hor_1">
          <li>苹果系统</li><li>安卓系统</li>        
        </ul>
        <div class="resp-tabs-container hor_1">
          <div>
          <iframe src="ios_show.do" frameBorder="0" width="100%" height="500" scrolling="auto" ></iframe>
          </div>
		  <div>
          <iframe src="ad_show.do" frameBorder="0" width="100%" height="500" scrolling="auto" ></iframe>
          </div>
        </div>
      </div></div>
</div>
<div class="clear"></div>
<script type="text/javascript">
    $(document).ready(function() {
        //Horizontal Tab
        $('#partner').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
    
    function Qrcodeimg(){
    	var timestamp = (new Date()).valueOf();
    	$("#qrcode").attr("src", "${ctx}/loginqrCode.do?timestamp="+timestamp);
    }
    
    Qrcodeimg();
    
    $(document).ready(function() {
		id = setInterval("Qrcodeimg()",60000 * 9);
	});
</script>
<script language="javascript" type="text/javascript">
function changecaptcha(obj){     
    var imgSrc = $(obj);     
    var src = imgSrc.attr("src");
    var ImgUrl = src.split("?");
    var timestamp = (new Date()).valueOf();
    var url = ImgUrl[0] + "?timestamp=" + timestamp;  
    imgSrc.attr("src", url);     
}   
</script>

</body>
</html>
