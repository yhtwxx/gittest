<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/css/sport/mem_body_ft.css" type="text/css">
<script language="JavaScript" src="${ctx}/js/sport/var_lid${htype }.js"></script>
<title>联赛列表</title>
<script>
var myGtypeSet='VB';
var sel_gtype,mother;
</script>
</head>

<body id="LEG" onLoad="onLoad();" onSelectStart="self.event.returnValue=false" oncontextmenu="self.event.returnValue=false">
<form name='lid_form'>
<table border="0" cellpadding="0" cellspacing="0" id="box">
  <tr>
    <td class="leg_top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="30%"><h1><input type=checkbox value=all id=sall onClick="selall();"><label class="all_sel">全选</label></h1></td>
            <td class="btn_td">
            <input type="submit" name="button" id="button" value="取消" class="enter_btn" onClick="back();">&nbsp;
            <input type="submit" name="button" id="button" value="提交" class="enter_btn" onClick="chk_league();">
            </td>
            <td class="close_td"><span class="close_box" onClick="back();">关闭</span></td>
          </tr>
        </table>
  	  
	</td>
  </tr>
  <tr>
    <td>
    <div class="leg_mem">
      <table border="0" cellspacing="1" cellpadding="0" class="leg_game">
      	
		<c:forEach var="led" items="${league } " varStatus="status">
			<c:if test="${status.index%3==0 || status.index==0}">
			<tr>		
			</c:if>
	       		<td class="league"><div><input type=checkbox value="${led}" id="LID${status.count }" onClick="chk_all(this.checked);">
	       		<%-- <font title="${led}">${led }</font></div></td> --%>
	       		<font title="${led}">${fn:replace(fn:replace(led,'[',''),']','')}</font></div></td>
				<c:if test="${status.index == count-1 }">
					<c:choose>
					<c:when test="${status.index%3==0 }">
						<td class="league">&nbsp;</td>
						<td class="league">&nbsp;</td>
						</tr>
					</c:when>
					<c:when test="${status.index%3==1 }">
						<td class="league">&nbsp;</td>
						</tr>
					</c:when>
					<c:when test="${status.index%3==2 }">
						</tr>
					</c:when>
					</c:choose>
				</c:if>
			<c:if test="${status.index%3==2}">
			</tr>
			</c:if>
		</c:forEach> 
      </table> 
      </div>
	</td>
  </tr>
</table>
<div class="btn_box">
    <input type="submit" name="button" id="button" value="取消" class="enter_btn" onClick="back();">&nbsp;
    <input type="submit" name="button" id="button" value="提交" class="enter_btn" onClick="chk_league();">
</div>


</form>