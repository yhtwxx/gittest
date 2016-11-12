<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="${ctx }/js/sport/init_lid.js"></script>
<title>welcome</title>

</head>
<frameset rows="118,*" cols="*" frameborder="NO" border="0" framespacing="0"> 
  <frame name="header" scrolling="NO" noresize src="header.do?showtype=${showtype }&langx=${langx }&mtype=${mtype}" >
  <frameset cols="240,*" frameborder="NO" border="0" framespacing="0"> 
 	 <frame name="mem_order" noresize src="select.do?langx=${langx }">
     <frame name="body" src="FT_browse/index.do?langx=zh-cn&mtype=3&league_id=&showtype=browse"> 
  </frameset>
</frameset>

<noframes>
<body bgcolor="#FFFFFF">

</body>
</noframes>

</html>