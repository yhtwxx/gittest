<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>公司入款第二步</title>
    <link href="../css/member/deposit.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../js/layer.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../js/skin/layer.css" id="skinlayercss">
    <link rel="stylesheet" href="../css/showBo.css"/>
    <script type="text/javascript">
    //获取数据
    var json = ${json};
    var payType = ${payType};
    console.debug(json);
   	console.debug(payType);
    </script>
</head>
<body huaban_collector_injected="true">
<!--<div class="member_top">-->
<!--<div class="member_logo"><img src="#" width="140" height="42"></div>-->
<!--</div>-->
<div class="card_main">
    <div class="card_width">
        <div class="card_title">
            <p class="color_red">公司银行帐号随时更换! 请每次存款都至 [公司入款] 进行操作。 入款至已过期帐号，公司无法查收，恕不负责!</p>
            <p>欢迎使用公司入款平台!请依照以下步骤进行存款。如需说明请点击 公司入款流程解说。</p>
        </div>
        <div class="bz1_tu">
            <ul>
                <li class="bz1_tu1">1.选择您的银行</li>
                <li class="bz2_tu2">2.选择您要转入的银行</li>
                <li class="bz_tu3">3.填写您的转账资料</li>
                <li class="bz_tu4">4.步骤完成</li>
            </ul>
        </div>
        <div class="bz_bank">
            <p class="color_red">※提醒：
                建议使用同行转账，速度更快！</p>
            <form action="deposit3.do" id="form1" name="form1" method="get" style="height:370px; overflow:auto;">
                <table width="100%" border="0" cellspacing="1" cellpadding="0" class="bgcolor">
                    <input type="hidden" name="mb" value="${mb }">
                    <input type="hidden" name="wbankName" value="${wbankName }">
                    <input type="hidden" name="payType" value="${payType }">
                    <tbody id="recordbank">

                    </tbody>
                </table>
            </form>
            <div style="text-align: center"><a class="nui-btn nui-btn-theme-default" href="deposit.do">上一步</a> <a class="nui-btn nui-btn-theme-main" href="javascript:void" onclick="next();">下一步</a></div>
            <div style="clear:both"></div>
            <p>※提醒：
                以上银行帐号限本次存款用，帐号不定期更换!每次存款前请依照本页所显示的银行帐号入款。如入款至已过期帐号，线上娱乐城无法查收，恕不负责!</p>
        </div>
    </div>
</div>
<script type="text/template" id="contentTpl">
    <tr>
        <# for(var i=0; i<list.length; i++) { #>
        <td style="vertical-align: middle; padding-left: 20px; width: 30px;">
			<input type="radio" name="recordId" value="<#=list[i].recordId#>" id="radio<#=(i+1)#>">
		</td>
        <td>
            <div><strong>开户行网点：</strong><span id="address<#=i+1#>"> <#=list[i].bankAdress#> </span></div>
			<div><strong>收款人：</strong><span id="username<#=i+1#>"> <#=list[i].bankAcount#> </span></div>
			<div><strong>银行：</strong><span id="bankname<#=i+1#>"> <#=list[i].bankName#> </span></div>
			<div><strong>账号：</strong><span id="bankcode<#=i+1#>"> <#=list[i].bankCode#> </span></div>
        </td>
        	<# if((i+1)%3==0){ #>
    		</tr><tr>
        	<#}#>
        <#}#>
    </tr>
</script>

<script type="text/template" id="ewContentTpl">
    <tr>
        <# for(var i=0; i<list.length; i++) { #>
        <td style="vertical-align: middle; padding-left: 20px; width: 30px;">
			<input type="radio" name="recordId" value="<#=list[i].recordId#>" id="radio<#=(i+1)#>">
		</td>
        <td>
			<div><strong>收款人：</strong><span id="username<#=i+1#>"> <#=list[i].bankAcount#> </span></div>
			<div><strong>银行：</strong><span id="bankname<#=i+1#>"> <#=list[i].bankName#> </span></div>
			<div><strong>账号：</strong><span id="bankcode<#=i+1#>"> <#=list[i].bankCode#> </span></div>
        </td>
		<td>
			<img width="100px" height="100px" src="<#=list[i].bankAdress#>" />
		</td>
        	<# if((i+1)%3==0){ #>
    		</tr><tr>
        	<#}#>
        <#}#>
    </tr>
</script>

<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../js/layer.min.js"></script>
<script type="text/javascript" src="../js/lib/tpl.js"></script>
<script type="text/javascript">
    $(function(){
        var code = json.code;
        if(code == 0){
        	if(json.list != null && json.list.length > 0){
        		if(payType == 4){//类型为微信扫码
        			var html =  tpl('#ewContentTpl', json);
                    $("#recordbank").html(html);
        		}else{//其他类型
        			var html =  tpl('#contentTpl', json);
                    $("#recordbank").html(html);
        		}
        	}else{
        		layer.msg("目前不支持该银行转账，请选择其他银行！", 1, 0);
                window.setInterval(function() {
                    window.location.href="${ctx}/member/deposit.do";
                }, 1000);
        	}
        }else{
            layer.msg(langpackage[code], 1, 0);
            window.setInterval(function() {
                window.location.href="${ctx}/member/deposit.do";
            }, 1000);
        }
    })

    function next()
    {
        var check = $("input[name='recordId']:checked").val();
        if (typeof (check) == "undefined") {
            layer.msg("选择您要转入的银行", 1, 0);
            return;
        }
        
        window.location.href = $("#form1").attr("action") + "?" + $("#form1").serialize();
    }
</script>

</body>
</html>