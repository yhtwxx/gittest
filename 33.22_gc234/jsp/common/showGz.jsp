<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <div id="myHiddenGzDiv">
    <div class="popup">
    <div class="popup-header">
    <h2>规则说明</h2>
    <a href="javascript:void(0)" onclick="$.closePopupLayer('myStaticGzPopup')" class="closeBtn">关闭</a>
    </div>
    <div class="popup-body">

    <iframe id="showGzIfram" src="${ctx}/common/gz.do" marginwidth="0" marginheight="0" border="0" scrolling="yes" frameborder="0"
    width="999" height="600"></iframe>

    </div>
    <a href="javascript:;" class="close" onclick="$.closePopupLayer('myStaticGzPopup')" title="关闭窗口" >关闭窗口</a>
    </div>
    </div>

    <script type="text/javascript">
    function openStaticGzPopup(type) {
    	$("#showGzIfram").attr("src","${ctx}/common/gz.do?type=" + type);
    	$.openPopupLayer({
    		name: "myStaticGzPopup",
    		width: 1000,
    		target: "myHiddenGzDiv"
    	});
    }
    </script>