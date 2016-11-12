<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>GD</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!-- ���ù���ͷ���ļ�����������css�͹���js�� -->
        <jsp:include page="../common/common.jsp" />
        </head>
        <body>
        
        <script type="text/javascript">
        $(document).ready(function () {
        $.ajax({'url':"${ctx}/ga/gaforward.do?timeStamp=" + new Date().getTime(),type:"get",dataType:'json',success:
                    function(b){
                        if(b.code == 0){
                        	window.location = b.url;
                        }else{
                            Showbo.Msg.alert(b.msg);
                            setTimeout(
                                function(){
                                    window.close();
                                },1000
                            )


                        }
                    }
            });
        });

        </script>
        </body>
        </html>