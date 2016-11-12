<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<div id="myHiddenDiv">
    <div class="popup">
        <div class="popup-header">
            <h2>开奖结果</h2>
            <a href="javascript:void(0)" onclick="$.closePopupLayer('myStaticPopup')" class="closeBtn"><spring:message code="public.close" /></a>
        </div>
        <div class="popup-body">
            <iframe id="todaySga" src="${ctx}/ssc/todaySga.do" marginwidth="0" marginheight="0" border="0" scrolling="yes" frameborder="0"
                    width="999" height="600"></iframe>
        </div>
        <a href="javascript:;" class="close" onclick="$.closePopupLayer('myStaticPopup')" title="关闭窗口"><spring:message code="public.close" /></a>
    </div>
</div>
<script type="text/javascript">
    function openStaticPopup(str) {
    	var url = "todaySga.do";
    	switch(str){
   			case "ssc":
    	    	url = "${ctx}/ssc/" + url;
    	  	break;
   			case "jxssc":
    	    	url = "${ctx}/jxssc/" + url;
    	  	break;
   			case "shssc":
    	    	url = "${ctx}/shssc/" + url;
    	  	break;
   			case "tjssc":
    	    	url = "${ctx}/tjssc/" + url;
    	  	break;
   			case "ynssc":
    	    	url = "${ctx}/ynssc/" + url;
    	  	break;
   			case "xjssc":
    	    	url = "${ctx}/xjssc/" + url;
    	  	break;
   			case "gdsf":
    	    	url = "${ctx}/gdsf/" + url;
    	  	break;
   			case "hnsf":
    	    	url = "${ctx}/hnsf/" + url;
    	  	break;
   			case "tjsf":
    	    	url = "${ctx}/tjsf/" + url;
    	  	break;
   			case "gxsf":
    	    	url = "${ctx}/gxsf/" + url;
    	  	break;
   			case "jssb":
    	    	url = "${ctx}/jssb/" + url;
    	  	break;
   			case "ahk3":
    	    	url = "${ctx}/ahk3/" + url;
    	  	break;
   			case "jlk3":
    	    	url = "${ctx}/jlk3/" + url;
    	  	break;
   			case "gxk3":
    	    	url = "${ctx}/gxk3/" + url;
    	  	break;
   			case "bjsc":
    	    	url = "${ctx}/bjsc/" + url;
    	  	break;
   			case "bjkl8":
    	    	url = "${ctx}/bjkl8/" + url;
    	  	break;
   			case "lhc":
    	    	url = "${ctx}/lhc/" + url;
    	  	break;
    	default:
    		url = "${ctx}/ssc/" + url;
    	}
    	$("#todaySga").attr("src", url);
        $.openPopupLayer({
            name: "myStaticPopup",
            width: 1000,
            target: "myHiddenDiv"
        });
    }
</script>