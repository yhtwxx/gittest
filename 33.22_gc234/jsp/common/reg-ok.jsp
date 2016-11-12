<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="myHiddenredirectView" class="myHiddenDiv" style="display: none">
        <div class="popup regok">
            <div class="popup-body">
                <h1 align="center"><span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span><spring:message code="register.success" /></h1>
            </div>
        </div>
    </div>

<script type="text/javascript">
    $(document).ready(function() {
    	if("${redirectNo}"=="1"){
    		window.parent.location="${ctx}/index.do?redirectNo=0";
		}

    	if("${redirectNo}"=="0"){
    		openredirectViewPopup();
    		setTimeout(function(){
    			$.closePopupLayer('openredirectViewPopup');
            },1000);
		}

    });

    function openredirectViewPopup() {
        $.openPopupLayer({
            name: "openredirectViewPopup",
            width: 200,
            height:200,
            target: "myHiddenredirectView"
        });
    }
    </script>