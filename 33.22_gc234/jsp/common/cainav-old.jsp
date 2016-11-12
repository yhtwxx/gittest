<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="cainav">
    <ul id="accordion" class="accordion" style="min-height: 829px;">
    <li>
    <div class="link" onclick="showTab(1)"><i class="fa fa-paint-brush"></i>重庆时时彩<i class="fa fa-chevron-down"></i></div>
    <ul class="submenu"  <c:if test="${cqssc == '1'}">style="display: block;" </c:if>>
    <li><a <c:if test="${poolId=='7'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=7">两面</a></li>
    <li><a <c:if test="${poolId=='8'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=8">和数</a></li>
    <li><a <c:if test="${poolId=='C'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=C">和尾数</a></li>
    <li><a <c:if test="${poolId=='4'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=4">一字</a></li>
    <li><a <c:if test="${poolId=='5'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=5">二字</a></li>
    <li><a <c:if test="${poolId=='6'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=6">三字</a></li>
    <li><a <c:if test="${poolId=='1'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=1">一字定位</a></li>
    <li><a <c:if test="${poolId=='2'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=2">二字定位</a></li>
    <li><a <c:if test="${poolId=='3'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=3">三字定位</a></li>
    <li><a <c:if test="${poolId=='A'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=A">组选三</a></li>
    <li><a <c:if test="${poolId=='B'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=B">组选六</a></li>
    <li><a <c:if test="${poolId=='9'}">class="on"</c:if> href="${ctx}/ssc/index.do?poolId=9">跨度</a></li>
    </ul>
    </li>
    <li>
    <div class="link" onclick="showTab(2)"><i class="fa fa-code"></i>广东快乐十分<i class="fa fa-chevron-down"></i></div>
    <ul class="submenu"  <c:if test="${gdsf == '1'}">style="display: block;" </c:if>>
    <li><a <c:if test="${zhupan=='1'}">class="on"</c:if> href="${ctx}/gdsf/zhupan.do">主盘势</a></li>
    <li><a <c:if test="${danma=='1'}">class="on"</c:if> href="${ctx}/gdsf/danma.do">单码双面</a></li>
    <li><a <c:if test="${siji=='1'}">class="on"</c:if> href="${ctx}/gdsf/siji.do">四季五行</a></li>
    <li><a <c:if test="${fangwei=='1'}">class="on"</c:if> href="${ctx}/gdsf/fangwei.do">方位/中发白</a></li>
    <li><a <c:if test="${zonghe=='1'}">class="on"</c:if> href="${ctx}/gdsf/zonghe.do">总和/龙虎</a></li>
    <li><a <c:if test="${yizhong=='1'}">class="on"</c:if> href="${ctx}/gdsf/yizhong.do">一中一</a></li>
    </ul>
    </li>
    <li>
    <div class="link" onclick="showTab(3)"><i class="fa fa-mobile"></i>江苏骰宝<i class="fa fa-chevron-down"></i></div>
    <ul class="submenu" <c:if test="${jssb == '1'}">style="display: block;" </c:if>>
    <li><a <c:if test="${zhupan=='1'}">class="on"</c:if> href="${ctx}/jssb/zhupan.do">主盘势</a></li>
    <li><a <c:if test="${qita=='1'}">class="on"</c:if> href="${ctx}/jssb/qita.do">其他</a></li>
    </ul>
    </li>
    <li><div class="link" onclick="showTab(4)"><i class="fa fa-globe"></i>北京赛车<i class="fa fa-chevron-down"></i></div>
    <ul class="submenu" <c:if test="${bjsc == '1'}">style="display: block;" </c:if>>
    <li><a <c:if test="${zhupan=='1'}">class="on"</c:if> href="${ctx}/bjsc/zhupan.do">主盘势</a></li>
    <li><a <c:if test="${dingwei=='1'}">class="on"</c:if> href="${ctx}/bjsc/dingwei.do">定位</a></li>
    <li><a <c:if test="${guanya=='1'}">class="on"</c:if> href="${ctx}/bjsc/guanya.do">冠亚军和</a></li>
    <li><a <c:if test="${xuanhao=='1'}">class="on"</c:if> href="${ctx}/bjsc/xuanhao.do">选号</a></li>
    </ul>
    </li>
    <li><div class="link" onclick="showTab(5)"><i class="fa fa-globe"></i>北京快乐8<i class="fa fa-chevron-down"></i></div>
    <ul class="submenu" <c:if test="${bjkl8 == '1'}">style="display: block;" </c:if>>
    <li><a <c:if test="${xuanhao=='1'}">class="on"</c:if> href="${ctx}/bjkl8/xuanhao.do">选号</a></li>
    <li><a <c:if test="${qita=='1'}">class="on"</c:if> href="${ctx}/bjkl8/qita.do">其他</a></li>
    </ul>
    </li>
    <li><div class="link" onclick="showTab(6)"><i class="fa fa-globe"></i>香港六合彩<i class="fa fa-chevron-down"></i></div>
    <ul class="submenu" <c:if test="${lhc == '1'}">style="display: block;" </c:if>>
    <li><a <c:if test="${liangmian=='1'}">class="on"</c:if> href="${ctx}/lhc/lm.do">两面</a></li>
    <li><a <c:if test="${tebiehao=='1'}">class="on"</c:if> href="${ctx}/lhc/tbh.do">特别号</a></li>
    <li><a <c:if test="${zhengma=='1'}">class="on"</c:if> href="${ctx}/lhc/zm.do">正码</a></li>
    <li><a <c:if test="${zhengmate=='1'}">class="on"</c:if> href="${ctx}/lhc/zmt.do">正码特</a></li>
    <li><a <c:if test="${shengse=='1'}">class="on"</c:if> href="${ctx}/lhc/sxsb.do">生肖色波</a></li>
    </ul>
    </li>
    </ul>
    </div>
    <script type="text/javascript">
		
	    function showTab(obj){
	    	var submenu = $(".submenu");
	    	for(var i=0;i<submenu.length;i++){
	    		var vv = submenu.eq(i).css("display");
	    		if(vv=="block"){
	    			if((i+1)==obj){
	    				return;
	    			}
	    		}
	    	}
	    	
	    	if(obj==1){
	    		window.location.href="${ctx}/ssc/index.do?poolId=7";
	    	}else if(obj==2){
	    		window.location.href="${ctx}/gdsf/zhupan.do";
	    	}else if(obj==3){
	    		window.location.href="${ctx}/jssb/zhupan.do";
	    	}else if(obj==4){
	    		window.location.href="${ctx}/bjsc/zhupan.do";
	    	}else if(obj==5){
	    		window.location.href="${ctx}/bjkl8/xuanhao.do";
	    	}else if(obj==6){
	    		window.location.href="${ctx}/lhc/tbh.do";
	    	}
	    
	    	
	    }

    </script>