<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>bbin</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!-- 引用公用头部文件（包含公用css和公用js） -->
        <jsp:include page="../common/common.jsp" />
        </head>

        <body>
	    <form action="" method="post" id="from1">

        </form>
        <script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="${ctx}/css/showBo.css"/>
        <script src="../js/lib/showBo.js" type="text/javascript"></script>
        <script type="text/javascript">
		
        $(document).ready(function () {
        	$.ajax({'url':"getData.do?timeStamp=" + new Date().getTime()+"&page_site=Ltlottery",type:"get",dataType:'json',success:
                    function(b){
                        if(b.code==0){
							$("#from1").attr("action",b.msg);
                        	
                        	$("#from1").submit();
                        }else{

                            Showbo.Msg.alert(langpackage[b.code]);

                            setTimeout(
                                    function(){
                                   	 window.parent.close();
                                    },2000
                                );


                        }
                    }
            });
        });

        </script>
        </body>
        </html>