<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
		<c:when test="${code == 0}">
				<script language="javascript" type="text/javascript">
					window.location.href = "${ctx}/index.do";
				</script>
		</c:when>
		<c:when test="${code == 111}">
				<script language="javascript" type="text/javascript">
					alert('<spring:message code="public.msg.verificationCodeError" />');
					setTimeout(function() {
						window.location.href = "${ctx}/index.do";
					}, 1000);
				</script>
		</c:when>
		<c:when test="${code == 10002}">
			<script language="javascript" type="text/javascript">
				var count = "${loginFailCount}";
				if(count < 3){
					alert('<spring:message code="public.msg.loginPasswordErrorMessage1" arguments="${loginFailCount}" />');
				}else{
					alert('<spring:message code="public.msg.loginPasswordErrorMessage2" />');
				}
				history.go(-1);
			</script>
		</c:when>
		<c:otherwise>
				<script language="javascript" type="text/javascript">
					alert('<spring:message code="${code}"/>');
					history.go(-1);
				</script>
		</c:otherwise>

</c:choose>