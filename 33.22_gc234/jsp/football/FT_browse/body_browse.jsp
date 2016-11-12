<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>今日足球</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Robots" contect="none">
<link rel="stylesheet" href="${ctx}/css/sport/mem_body_olympics_cn.css" type="text/css" media="screen">
<script language="JavaScript" src="${ctx}/js/sport/browse.js"></script>
<style type="text/css">
.day_title { font-family:Arial, Helvetica, sans-serif; font-size:13px;}
.day_date { position:relative; top:-5px;}
.day_date span { margin:0 15px; cursor:pointer;}
.day_black { position:absolute; top:28px; left:1px; background:url(${ctx}/img/sport/day_black.png) no-repeat 0 0; width:237px; height:48px; z-index:999; display:block; color:#fff; font-family:"Arial"; font-size:14px; padding-top:17px; padding-top:15px\9; padding-left:15px;}
.day_text_red { color:#A73842;}
.pr_cen {	background-color: #EEDF68; text-align:center;white-space:nowrap;}/*table style*/
.pr_rig {background-color:#EEDF68; text-align:right;white-space:nowrap;/*瑙ｆ焙璩犵巼鏂疯*/}
.pr_lef {background-color:#EEDF68; text-align:left;white-space:nowrap;}
.pr_1st {background-color:#EEDF68;text-align: center; /*width:14%;*/white-space:nowrap;}
.pr_1stR {background-color:#EEDF68;text-align: right;/* width:14%;*/white-space:nowrap;}







/* For fireFox */
@-moz-document url-prefix() {
  .maxbet { margin-top:-15px;
  }
}
</style>
<script type="text/javascript">
var rtype = '${rtype }';
var ss = parent.rtype;

var odd_f_str = 'H,M,I,E';
var Format=new Array();
Format[0]=new Array( 'H','香港盘','Y');
Format[1]=new Array( 'M','马来盘','Y');
Format[2]=new Array( 'I','印尼盘','Y');
Format[3]=new Array( 'E','欧洲盘','Y');
var DateAry = parent.DateAry;
top.showtoday = "今日";
top.showfuture = "未来";
top.date = "所有日期";
</script>

</head>
<body id="MFT" class="bodyset ${tatype }" onLoad="onLoad();">
	<div id="LoadLayer" style="display: none;">loading...............................................................................</div>
	<div id="showtableData" style="display:none;">
		<xmp>
   			<table id=game_table border="0" cellspacing="0" cellpadding="0" class="game">
   				<tr>
   				<c:choose>
   				<c:when test="${rtype == 'r' || rtype == 'ft_r'}">
           			<th nowrap  class="time">时间</th>
		          	<th nowrap class="team">赛事</th>
				  	<th nowrap class="h_1x2">独赢</th>
				  	<th nowrap class="h_r">全场-让球</th>
		          	<th nowrap class="h_ou">全场-大小</th>
		          	<th>单双</th>
				  	<th nowrap class="h_1x2">独赢</th>
		          	<th nowrap class="h_r">半场-让球</th>
		          	<th nowrap class="h_ou">半场-大小</th>  		
		 		</c:when>
		 		<c:when test="${rtype == 'ft_pd' || rtype == 'pd' || rtype == 'hpd'}">
		 			<th class="time">时间</th>
          			<th class="team">赛事</th>
          			<th>1:0</th>
          			<th>2:0</th>
          			<th>2:1</th>
          			<th>3:0</th>
          			<th>3:1</th>
          			<th>3:2</th>
          			<th>4:0</th>
          			<th>4:1</th>
          			<th>4:2</th>
          			<th>4:3</th>
          			<th>0:0</th>
          			<th>1:1</th>
          			<th>2:2</th>
          			<th>3:3</th>
          			<th>4:4</th>
          			<th>其它</th>
		 		</c:when>
		 		<c:when test="${rtype == 't' || rtype == 'ft_t'}">
		 			<th class="time">时间</th>
              		<th class="team">赛事</th>
              		<th class="h_oe">0 - 1</th>
              		<th class="h_oe">2 - 3</th>
              		<th class="h_oe">4 - 6</th>
              		<th class="h_oe">7或以上</th>
		 		</c:when>
		 		<c:when test="${rtype == 'f' || rtype == 'ft_f'}">
		 			<th class="time">时间</th>
             		<th class="team">赛事</th>
              		<th class="h_f">主队/主队</th>
              		<th class="h_f">主队/和局</th>
              		<th class="h_f">主队/客队</th>
              		<th class="h_f">和局/主队</th>
              		<th class="h_f">和局/和局</th>
              		<th class="h_f">和局/客队</th>
              		<th class="h_f">客队/主队</th>
              		<th class="h_f">客队/和局</th>
    		        <th class="h_f">客队/客队</th>
		 		</c:when>
		 		<c:when test="${rtype == 'p3'}">
					<th class="time">时间</th>
              		<th class="team">赛事</th>
              		<th class="h_1x2">独赢</th>
              		<th nowrap class="h_r">全场-让球</th>
              		<th nowrap class="h_ou">全场-大小</th>
              		<th class="h_oe">单/双</th>              
              		<th class="h_1x2">独赢</th>
              		<th nowrap class="h_r">半场-让球</th>
              		<th nowrap class="h_ou">半场-大小</th>
		 		</c:when>		 		
		 		<c:when test="${rtype == 're'}">
		 			<th class="time_re" nowrap>时间</th>
          			<th class="team" nowrap>赛事</th>
          			<th class="h_1x2" nowrap>独赢</th>
          			<th class="h_r" nowrap>全场 - 让球</th>
          			<th class="h_ou" nowrap>全场 - 大小</th>
		  			<th class="h_oe">单双</th>
          			<th class="h_1x2" nowrap>独赢</th>
          			<th class="h_r" nowrap>半场 - 让球</th>
          			<th class="h_ou" nowrap>半场 - 大小</th>
		 		</c:when>
		 		<c:when test="${rtype == 'rpd' || rtype == 'hrpd'}">
		 		    <th class="time">时间</th>
               		<th class="team">赛事</th>
	               	<th class="h_pd_ft">1:0</th>
	               	<th class="h_pd_ft">2:0</th>
	               	<th class="h_pd_ft">2:1</th>
	               	<th class="h_pd_ft">3:0</th>
	               	<th class="h_pd_ft">3:1</th>
	               	<th class="h_pd_ft">3:2</th>
	               	<th class="h_pd_ft">4:0</th>
	               	<th class="h_pd_ft">4:1</th>
	               	<th class="h_pd_ft">4:2</th>
	               	<th class="h_pd_ft">4:3</th>
	               	<th class="h_pd_ft">0:0</th>
	               	<th class="h_pd_ft">1:1</th>
	               	<th class="h_pd_ft">2:2</th>
	               	<th class="h_pd_ft">3:3</th>
	               	<th class="h_pd_ft">4:4</th>
	               	<th class="h_pd_ft">其它</th>
		 		</c:when>
		 		<c:when test="${rtype == 'rt'}">
		 		    <th class="time">时间</th>
              		<th class="team">赛事</th>
              		<th class="h_oe">0 - 1</th>
              		<th class="h_oe">2 - 3</th>
              		<th class="h_oe">4 - 6</th>
              		<th class="h_oe">7或以上</th>
		 		</c:when>
		 		<c:when test="${rtype == 'rf'}">
		 		    <th class="time">时间</th>
              		<th class="team">赛事</th>
	              	<th class="h_f">主队 / 主队</th>
	              	<th class="h_f">主队 / 和局</th>
	              	<th class="h_f">主队 / 客队</th>
	              	<th class="h_f">和局 / 主队</th>
	              	<th class="h_f">和局 / 和局</th>
	              	<th class="h_f">和局 / 客队</th>
	              	<th class="h_f">客队 / 主队</th>
	              	<th class="h_f">客队 / 和局</th>
	              	<th class="h_f">客队 / 客队</th>
		 		</c:when>
				</c:choose>
				*showDataTR*  
				</tr>
      		</table>
      		<c:if test="${rtype=='p' || rtype=='pr'}">
      		<DIV id="game_table"> </DIV>
      		</c:if>
	    </xmp>
	</div>
	<!--   表格资料     -->
	<div id=DataTR style="display:none;">
		<xmp>
			<c:choose>
   			<c:when test="${rtype == 'r' || rtype == 'ft_r'}">
  			<tr *ST* >
    			<td colspan="9" class="b_hline">
    				<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="legicon" onClick="parent.showLeg('*LEG*');">
	     				 		<span id="*LEG*" name="*LEG*" class="showleg">*LegMark*</span>
	        				</td>
	        				<td onClick="parent.showLeg('*LEG*')" class="leg_bar">*LEG*</td>
	        			</tr>
        			</table>
      			</td>
		  	</tr>
		  	<!--SHOW LEGUAGE END-->
		  	<tr id="TR_*ID_STR*" *TR_EVENT* *CLASS*>
		    	<td rowspan="3" class="b_cen"><table><tr><td class="b_cen">*DATETIME*</td></tr></table></td>
		    	<td rowspan="2" class="team_name none">*TEAM_H*<br>*TEAM_C*</td>
		    	<td class="b_cen">*RATIO_MH*</td>
		    	<td class="b_rig"><span class="con">*CON_RH*</span> <span class="ratio">*RATIO_RH*</span></td>
		    	<td class="b_rig"><span class="con">*CON_OUH*</span> <span class="ratio">*RATIO_OUH*</span></td>
		    	<td class="b_rig">*RATIO_EOO*</td>
		    	<td class="b_1st">*RATIO_HMH*</td>
		    	<td class="b_1stR"><span class="con">*CON_HRH*</span> <span class="ratio">*RATIO_HRH*</span></td>
		    	<td class="b_1stR"><span class="con">*CON_HOUH*</span> <span class="ratio">*RATIO_HOUH*</span></td>
		  	</tr>
		  	<tr id="TR1_*ID_STR*" *TR_EVENT* *CLASS*>
		    	<td class="b_cen">*RATIO_MC*</td>
		    	<td class="b_rig"><span class="con">*CON_RC*</span> <span class="ratio">*RATIO_RC*</span></td>
		    	<td class="b_rig"><span class="con">*CON_OUC*</span> <span class="ratio">*RATIO_OUC*</span></td>
		    	<td class="b_rig">*RATIO_EOE*</td>
		    	<td class="b_1st">*RATIO_HMC*</td>
		    	<td class="b_1stR"><span class="con">*CON_HRC*</span> <span class="ratio">*RATIO_HRC*</span></td>
		    	<td class="b_1stR"><span class="con">*CON_HOUC*</span> <span class="ratio">*RATIO_HOUC*</span></td>
		  	</tr>
		  	<tr id="TR2_*ID_STR*" *TR_EVENT* *CLASS*>
    			<td class="drawn_td" style="background-color:#FFFFFF;">*MYLOVE*<!--欠--><!--div class="fov_icon_on"></div--><!--欠-色--><!--div class="fov_icon_out"></div--></td>
    			<td class="b_cen">*RATIO_MN*</td>
    			<td colspan="3" valign="top" class="b_cen"><span class="more_txt">*MORE*</span></td>
    			<td class="b_1st">*RATIO_HMN*</td>
    			<td colspan="3" valign="top" class="b_1st">&nbsp;</td>
  			</tr>
  			</c:when>
  			<c:when test="${rtype == 'ft_pd' || rtype == 'pd' || rtype == 'hpd'}">
  			<tr *ST* >
			    <td colspan="18" class="b_hline">
			    	<table border="0" cellpadding="0" cellspacing="0"><tr>
			    		<td class="legicon" onClick="parent.showLeg('*LEG*')">
				      		<span id="*LEG*" name="*LEG*" class="showleg">
				      		*LegMark*
				       		<!--展---><!--span id="LegOpen"></span-->
				      	 	<!--蘸---><!--div id="LegClose"></div-->
				      		</span>
			        	</td>
			        	<td onClick="parent.showLeg('*LEG*')" class="leg_bar">*LEG*</td></tr>
			        </table>
			   	</td>
			</tr>
			<!--SHOW LEGUAGE END-->
			<tr id="TR_*ID_STR*" *TR_EVENT* *CLASS*>
			  	<td rowspan="2" class="b_cen">*DATETIME*</td>
			    <td rowspan="2" class="team_name">*TEAM_H*<br>*TEAM_C*</td>
			    <td class="b_cen">*RATIO_H1C0*</td>
			    <td class="b_cen">*RATIO_H2C0*</td>
			    <td class="b_cen">*RATIO_H2C1*</td>
			    <td class="b_cen">*RATIO_H3C0*</td>
			    <td class="b_cen">*RATIO_H3C1*</td>
			    <td class="b_cen">*RATIO_H3C2*</td>
			    <td class="b_cen">*RATIO_H4C0*</td>
			    <td class="b_cen">*RATIO_H4C1*</td>
			    <td class="b_cen">*RATIO_H4C2*</td>
			    <td class="b_cen">*RATIO_H4C3*</td>
			    <td rowspan="2" class="b_cen">*RATIO_H0C0*</td>
			    <td rowspan="2" class="b_cen">*RATIO_H1C1*</td>
			    <td rowspan="2" class="b_cen">*RATIO_H2C2*</td>
			    <td rowspan="2" class="b_cen">*RATIO_H3C3*</td>
			    <td rowspan="2" class="b_cen">*RATIO_H4C4*</td>
			    <td rowspan="2" class="b_cen">*RATIO_OVH*</td>
			</tr>
			<tr id="TR1_*ID_STR*" *TR_EVENT* *CLASS*>
			    <td class="b_cen">*RATIO_H0C1*</td>
			    <td class="b_cen">*RATIO_H0C2*</td>
			    <td class="b_cen">*RATIO_H1C2*</td>
			    <td class="b_cen">*RATIO_H0C3*</td>
			    <td class="b_cen">*RATIO_H1C3*</td>
			    <td class="b_cen">*RATIO_H2C3*</td>
			    <td class="b_cen">*RATIO_H0C4*</td>
			    <td class="b_cen">*RATIO_H1C4*</td>
			    <td class="b_cen">*RATIO_H2C4*</td>
			    <td class="b_cen">*RATIO_H3C4*</td>
			</tr>
  			</c:when>
  			<c:when test="${rtype == 't' || rtype == 'ft_t'}">
  			<tr *ST* >
			    <td colspan="6" class="b_hline">
			    	<table border="0" cellpadding="0" cellspacing="0"><tr>
				    	<td class="legicon" onClick="parent.showLeg('*LEG*')">
				      		<span id="*LEG*" name="*LEG*" class="showleg">*LegMark*</span>
				        </td>
			        	<td onClick="parent.showLeg('*LEG*')" class="leg_bar">*LEG*</td></tr>
			        </table>
			    </td>
			</tr>
			<!--SHOW LEGUAGE END-->
			<tr id="TR_*ID_STR*" *TR_EVENT* *CLASS*>
			    <td class="b_cen">*DATETIME*</td>
			    <td class="team_name">*TEAM_H*<br>
			      *TEAM_C*</td>
			    <td class="b_cen">*RATIO_T01*</td>
			    <td class="b_cen">*RATIO_T23*</td>
			    <td class="b_cen">*RATIO_T46*</td>
			    <td class="b_cen">*RATIO_OVER*</td>
			</tr>
  			</c:when>
  			<c:when test="${rtype == 'f' || rtype == 'ft_f'}">
  			<tr *ST* >
			    <td colspan="11" class="b_hline">
			    	<table border="0" cellpadding="0" cellspacing="0"><tr>
			    		<td class="legicon" onClick="parent.showLeg('*LEG*')">
			      			<span id="*LEG*" name="*LEG*" class="showleg">*LegMark*</span>
			       	 	</td>
			       	 	<td onClick="parent.showLeg('*LEG*')" class="leg_bar">*LEG*</td></tr>
			       	 </table>
			     </td>
			</tr>
			<!--SHOW LEGUAGE END-->
			<tr id="TR_*ID_STR*" *TR_EVENT* *CLASS*>
			    <td class="b_cen">*DATETIME*</td>
			    <td class="team_name">*TEAM_H*<br>*TEAM_C*</td>
			    <td class="b_cen">*RATIO_FHH*</td>
			    <td class="b_cen">*RATIO_FHN*</td>
			    <td class="b_cen">*RATIO_FHC*</td>
			    <td class="b_cen">*RATIO_FNH*</td>
			    <td class="b_cen">*RATIO_FNN*</td>
			    <td class="b_cen">*RATIO_FNC*</td>
			    <td class="b_cen">*RATIO_FCH*</td>
			    <td class="b_cen">*RATIO_FCN*</td>
			    <td class="b_cen">*RATIO_FCC*</td>
			</tr>
  			</c:when>
  			<c:when test="${rtype == 'p3'}">
  			<tr *ST* >
    <td colspan="9" class="b_hline">
    	<table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td class="legicon" onClick="showLeg('*LEG*')">
      <span id="*LEG*" name="*LEG*" class="showleg">
      	*LegMark*
       <!--展开联盟-符号--><!--span id="LegOpen"></span-->
       <!--收合联盟-符号--><!--div id="LegClose"></div-->
      </span>
        </td><td class="leg_bar" onClick="showLeg('*LEG*')">*LEG* </td><td class="IN">
<table class="show_p3" border="0" cellpadding="0" cellspacing="0" title="指出从该联赛投注过关&#13;最少所需选择的赛事数&#13;量。">
  <tr>
    <td class="p3_num1">*PORDER*</td>
    <td class="em"></td>
    <td class="p3_num2">1</td>
</tr>
</table>
</td>
        </tr>
        </table>
      </td>
  </tr>
  <!--SHOW LEGUAGE END-->
  <tr id="TR_*ID_STR*" *TR_EVENT* *CLASS*>
    <td rowspan="3" class="b_cen">*DATETIME*</td>
    <td rowspan="2" class="team_name none">*TEAM_H*<br>
      *TEAM_C*</td>
    <td class="b_cen" id="*GID_MH*">*RATIO_MH*</td>
    <td class="b_rig"  id="*GID_RH*"><span class="con">*CON_RH*</span> <span class="ratio">*RATIO_RH*</span></td>
    <td class="b_rig"  id="*GID_OUC*"><span class="con">*CON_OUC*</span> <span class="ratio">*RATIO_OUC*</span></td>
    
    <td class="b_cen" id="*GID_EOO*">*RATIO_EOO*</td>
			
    <td class="b_1st"  id="*GID_HMH*">*RATIO_HMH*</td>
    <td class="b_1stR"  id="*GID_HRH*"><span class="con">*CON_HRH*</span> <span class="ratio">*RATIO_HRH*</span></td>
    <td class="b_1stR"  id="*GID_HOUC*"><span class="con">*CON_HOUC*</span> <span class="ratio">*RATIO_HOUC*</span></td>
  </tr>
  <tr id="TR1_*ID_STR*" *TR_EVENT* *CLASS*>
    <td class="b_cen"  id="*GID_MC*">*RATIO_MC*</td>
    <td class="b_rig"  id="*GID_RC*"><span class="con">*CON_RC*</span> <span class="ratio">*RATIO_RC*</span></td>
    <td class="b_rig"  id="*GID_OUH*"><span class="con">*CON_OUH*</span> <span class="ratio">*RATIO_OUH*</span></td>
    
    <td class="b_cen" id="*GID_EOE*">*RATIO_EOE*</td>
    
    <td class="b_1st"  id="*GID_HMC*">*RATIO_HMC*</td>
    <td class="b_1stR"  id="*GID_HRC*"><span class="con">*CON_HRC*</span> <span class="ratio">*RATIO_HRC*</span></td>
    <td class="b_1stR"  id="*GID_HOUH*"><span class="con">*CON_HOUH*</span> <span class="ratio">*RATIO_HOUH*</span></td>
  </tr>
  <tr id="TR2_*ID_STR*" *TR_EVENT* *CLASS*>
    <td class="drawn_td">*MYLOVE*<!--星星符号--><!--div class="fov_icon_on"></div--><!--星星符号-灰色--><!--div class="fov_icon_out"></div--></td>
    <td class="b_cen"  id="*GID_MN*">*RATIO_MN*</td>
    <td colspan="3" valign="top" class="b_cen"><span class="more_txt">*MORE*</span></td>
    <td class="b_1st"  id="*GID_HMN*">*RATIO_HMN*</td>
    <td colspan="2" valign="top" class="b_1st">&nbsp;</td>
  </tr>
  			</c:when>
  			<c:when test="${rtype == 're'}">
  			<tr *ST* >
		    	<td colspan="9" class="b_hline">
		    	<table border="0" cellpadding="0" cellspacing="0">
		    		<tr>
		    			<td class="legicon" onClick="parent.showLeg('*LEG*')">
				      		<span id="*LEG*" name="*LEG*" class="showleg">
				      			*LegMark*
				       		<!--展开联盟-符号--><!--span id="LegOpen"></span-->
				       		<!--收合联盟-符号--><!--div id="LegClose"></div-->
				      		</span>
		        		</td>
		        		<td onClick="parent.showLeg('*LEG*')" class="leg_bar">*LEG*</td>
		        	</tr>
		        </table>
		      </td>
		  	</tr>
		  	<!--SHOW LEGUAGE END-->
		  	<tr id="TR_*ID_STR*" *TR_EVENT* *CLASS*>
		    	<td rowspan="3" class="b_cen"><table class="rb_box"><tr><td class="rb_time">*DATETIME*</td></tr><tr><td class="rb_score">*SCORE*</td></tr></table></td>
		    	<td rowspan="2" class="team_name none" id="TR_*ID_STR*_1" *TR_EVENT*>		    
		            <table border="0" cellspacing="0" cellpadding="0" class="re_team_box">
		            	<tr>
		                	<td class="re_team">*TEAM_H*</td>
		                	<td *REDCARD_H_STYLE*><span class="red_card">*REDCARD_H*</span></td>
		              	</tr>
		            </table>
		            
		           	<table border="0" cellspacing="0" cellpadding="0" class="re_team_box">
		              	<tr>
		                	<td class="re_team">*TEAM_C*</td>
		                	<td *REDCARD_C_STYLE*><span class="red_card">*REDCARD_C*</span></td>
		              	</tr>
		            </table>
		 
		      <!--<div class="re_team_box"><span class="re_team">*TEAM_H*</span> <span class="red_card" *REDCARD_H_STYLE*>*REDCARD_H*</span></div>
		      <div class="re_team_box"><span class="re_team">*TEAM_C*</span> <span class="red_card" *REDCARD_C_STYLE*>*REDCARD_C*</span></div> -->
		      
		     	</td>
		    	<td class="b_cen">*RATIO_MH*</td>
		    	<td class="b_rig"><span class="con">*CON_RH*</span> <span class="ratio">*RATIO_RH*</span></td>
		    	<td class="b_rig"><span class="con">*CON_OUH*</span> <span class="ratio">*RATIO_OUH*</span></td>
		    	<td class="b_cen">*RATIO_RODD*</td>
		    	<td class="b_1st">*RATIO_HMH*</td>
		    	<td class="b_1stR"><span class="con">*CON_HRH*</span> <span class="ratio">*RATIO_HRH*</span></td>
		    	<td class="b_1stR"><span class="con">*CON_HOUH*</span> <span class="ratio">*RATIO_HOUH*</span></td>
		  	</tr>
		  	<tr id="TR1_*ID_STR*" *TR_EVENT* *CLASS*>
		    	<td class="b_cen">*RATIO_MC*</td>
		    	<td class="b_rig"><span class="con">*CON_RC*</span> <span class="ratio">*RATIO_RC*</span></td>
		    	<td class="b_rig"><span class="con">*CON_OUC*</span> <span class="ratio">*RATIO_OUC*</span></td>
		    	<td class="b_cen">*RATIO_REVEN*</td>
		    	<td class="b_1st">*RATIO_HMC*</td>
		    	<td class="b_1stR"><span class="con">*CON_HRC*</span> <span class="ratio">*RATIO_HRC*</span></td>
		    	<td class="b_1stR"><span class="con">*CON_HOUC*</span> <span class="ratio">*RATIO_HOUC*</span></td>
		  	</tr>
		  	<tr id="TR2_*ID_STR*" *TR_EVENT* *CLASS*>
		    	<td class="drawn_td">*MYLOVE*<!--星星符号--><!--div class="fov_icon_on"></div--><!--星星符号-灰色--><!--div class="fov_icon_out"></div--></td>
		    	<td class="b_cen">*RATIO_MN*</td>
		    	<td colspan="3" valign="top" class="b_cen"><span class="more_txt">*MORE*</span></td>
		    	<td class="b_1st" >*RATIO_HMN*</td>
		    	<td colspan="3" valign="top" class="b_1st">&nbsp;</td>
		  	</tr>
  			</c:when>
  			<c:when test="${rtype == 'rpd' || rtype == 'hrpd'}">
  			<tr *ST* >
    			<td colspan="18" class="b_hline">
    				<table border="0" cellpadding="0" cellspacing="0">
    					<tr><td class="legicon" onClick="showLeg('*LEG*')">
      						<span id="*LEG*" name="*LEG*" class="showleg">
      						*LegMark*
       						<!--展开联盟-符号--><!--span id="LegOpen"></span-->
       						<!--收合联盟-符号--><!--div id="LegClose"></div-->
      						</span>
        					</td>
        					<td onClick="showLeg('*LEG*')" class="leg_bar">*LEG*</td>
        				</tr>
        			</table>
      			</td>
  			</tr>
  			<!--SHOW LEGUAGE END-->
			<tr id="TR_*ID_STR*" *TR_EVENT* *CLASS*>
			    <td rowspan="2" class="b_cen">*DATETIME*</td>
			    <td rowspan="2" class="team_name">*TEAM_H*<br>
			      *TEAM_C*</td>
			    <td class="b_cen td_h1">*RATIO_H1C0*</td>
			    <td class="b_cen">*RATIO_H2C0*</td>
			    <td class="b_cen">*RATIO_H2C1*</td>
			    <td class="b_cen">*RATIO_H3C0*</td>
			    <td class="b_cen">*RATIO_H3C1*</td>
			    <td class="b_cen">*RATIO_H3C2*</td>
			    <td class="b_cen">*RATIO_H4C0*</td>
			    <td class="b_cen">*RATIO_H4C1*</td>
			    <td class="b_cen">*RATIO_H4C2*</td>
			    <td class="b_cen">*RATIO_H4C3*</td>
			    <td rowspan="2" class="b_cen">*RATIO_H0C0*</td>
			    <td rowspan="2" class="b_cen">*RATIO_H1C1*</td>
			    <td rowspan="2" class="b_cen">*RATIO_H2C2*</td>
			    <td rowspan="2" class="b_cen">*RATIO_H3C3*</td>
			    <td rowspan="2" class="b_cen">*RATIO_H4C4*</td>
			    <td rowspan="2" class="b_cen">*RATIO_OVH*</td>
			 </tr>
			 <tr id="TR1_*ID_STR*" *TR_EVENT* *CLASS*>
			    <td class="b_cen">*RATIO_H0C1*</td>
			    <td class="b_cen">*RATIO_H0C2*</td>
			    <td class="b_cen">*RATIO_H1C2*</td>
			    <td class="b_cen">*RATIO_H0C3*</td>
			    <td class="b_cen">*RATIO_H1C3*</td>
			    <td class="b_cen">*RATIO_H2C3*</td>
			    <td class="b_cen">*RATIO_H0C4*</td>
			    <td class="b_cen">*RATIO_H1C4*</td>
			    <td class="b_cen">*RATIO_H2C4*</td>
			    <td class="b_cen">*RATIO_H3C4*</td>
			</tr>
  			</c:when>
  			<c:when test="${rtype == 'rt'}">
  			<tr *ST* >
    			<td colspan="6" class="b_hline">
    				<table border="0" cellpadding="0" cellspacing="0">
    					<tr>
    						<td class="legicon" onClick="showLeg('*LEG*')">
      							<span id="*LEG*" name="*LEG*" class="showleg">
      							*LegMark*
       							<!--展开联盟-符号--><!--span id="LegOpen"></span-->
       							<!--收合联盟-符号--><!--div id="LegClose"></div-->
      							</span>
        					</td>
        					<td onClick="showLeg('*LEG*')" class="leg_bar">*LEG*</td>
        				</tr>
        			</table>
      			</td>
  			</tr>
  			<!--SHOW LEGUAGE END-->
  			<tr id="TR_*ID_STR*" *TR_EVENT* *CLASS*>
    			<td class="b_cen">*DATETIME*</td>
    			<td class="team_name">*TEAM_H*<br>
			      *TEAM_C*</td>
			    <td class="b_cen">*RATIO_T01*</td>
			    <td class="b_cen">*RATIO_T23*</td>
			    <td class="b_cen">*RATIO_T46*</td>
			    <td class="b_cen">*RATIO_OVER*</td>
  			</tr>
  			</c:when>
  			<c:when test="${rtype == 'rf'}">
  			  <tr *ST* >
    <td colspan="11" class="b_hline">
    	<table border="0" cellpadding="0" cellspacing="0"><tr><td class="legicon" onClick="showLeg('*LEG*')">
      <span id="*LEG*" name="*LEG*" class="showleg">
      	*LegMark*
       <!--展开联盟-符号--><!--span id="LegOpen"></span-->
       <!--收合联盟-符号--><!--div id="LegClose"></div-->
      </span>
        </td><td onClick="showLeg('*LEG*')" class="leg_bar">*LEG*</td></tr></table>
      </td>
  </tr>
  <!--SHOW LEGUAGE END-->
  <tr id="TR_*ID_STR*" *TR_EVENT* *CLASS*>
    <td class="b_cen">*DATETIME*</td>
    <td class="team_name">*TEAM_H*<br>
      *TEAM_C*</td>
    <td class="b_cen">*RATIO_FHH*</td>
    <td class="b_cen">*RATIO_FHN*</td>
    <td class="b_cen">*RATIO_FHC*</td>
    <td class="b_cen">*RATIO_FNH*</td>
    <td class="b_cen">*RATIO_FNN*</td>
    <td class="b_cen">*RATIO_FNC*</td>
    <td class="b_cen">*RATIO_FCH*</td>
    <td class="b_cen">*RATIO_FCN*</td>
    <td class="b_cen">*RATIO_FCC*</td>
  </tr>
  			</c:when>
			</c:choose>
		</xmp>
	</div>
	<!--右方刷新钮-->
	<div id="refresh_right" style="position: absolute; top: 39px; left: 735px;" class="refresh_M_btn" onclick="this.className='refresh_M_on';javascript:refreshReload()"><span>刷新</span></div>
	<div id=NoDataTR style="display:none;">
		<xmp>
			<tr>
	   			<td colspan="20" class="no_game">您选择的项目暂时没有赛事。请修改您的选项或迟些再返回。</td>
	   		</tr>
	 	</xmp>
	</div>
	<c:choose>				
		<c:when test="${rtype == 'ft_r'||rtype == 'ft_pd'||rtype == 'ft_f'||rtype == 'ft_t'}">
			<div id="p3Title" class="day_title">
				<span id="showDateSel" class="day_date"></span>
			</div>
			<div id="dateSel" style="display:none;">
				<span class="*DATE_CLASS*" onClick="new_chg_gdate(this,'*DATE_SHOWTYPE*','*DATE_VALUE*');">*DATE_SEL*</span>
			</div>
		</c:when>
		<c:when test="${rtype == 'p3'}">
			<div id="p3Title" class="day_title">
				<span onMouseOver="overInfo();" onMouseOut="outInf();"><img src="${ctx}/img/sport/day_i.png"></span>
				<span id="showDateSel" class="day_date"></span>
			    <span id="info" class="day_black" style="display:none;">过关选项的日期间距不可超过7天</span>
			</div>
			<div id="dateSel" style="display:none;">
				<span class="*DATE_CLASS*" onClick="new_chg_gdate(this,'*DATE_SHOWTYPE*','*DATE_VALUE*');">*DATE_SEL*</span>
			</div>
		</c:when>
	</c:choose>
	<table border="0" cellpadding="0" cellspacing="0" id="myTable">
		<tr>
			<td>
				<table border="0" cellpadding="0" cellspacing="0" id="box">
					<tbody>
					<tr>
						<td class="top">
						<h1>
						<em>${caption }</em>
						<c:if test="${rtype == 'rpd' || rtype == 'hrpd' || rtype == 'pd' || rtype == 'hpd'}">
						<select id="selwtype" onChange="chg_wtype(selwtype.value);">
						<c:choose>				
							<c:when test="${rtype == 'rpd'}">
								<option value="rpd">全场</option>
								<option value="hrpd">上半场</option>
							</c:when>
							<c:when test="${rtype == 'hrpd'}">
								<option value="rpd">全场</option>
								<option value="hrpd" selected>上半场</option>
							</c:when>
							<c:when test="${rtype == 'pd'}">
								<option value="pd">全场</option>
								<option value="hpd">上半场</option>
							</c:when>
							<c:when test="${rtype == 'hpd'}">
								<option value="pd">全场</option>
								<option value="hpd" selected>上半场</option>
							</c:when>
						</c:choose>
						</select>
						</c:if>
						<c:choose>				
							<c:when test="${rtype == 'p3'}">
								<span class="maxbet">单注最高可赢金额： 人民币 1,000,000.00</span>
							</c:when>
						</c:choose>
						</h1>
						
						</td>
					</tr>
					<tr>
						<td class="mem">
							<h2>
								<table width="100%" border="0" cellpadding="0" cellspacing="0" id="fav_bar">
             	 					<tr>
                						<td id="page_no">
											<div id="euro_btn" class="euro_btn" style="display:none"><!----></div>
											<div id="euro_up" class="euro_up"  style="display:none"><!----></div>
											<span id="pg_txt"></span>
										</td>
                						<td id="tool_td">              
                  							<table border="0" cellspacing="0" cellpadding="0" class="tool_box">
                    							<tr>
                    								<%--<c:if test="${rtype == 'r' || rtype == 're'}">--%>
					                        		<%--<td id="fav_btn">--%>
                            							<%--<div id="fav_num" title="清空" onClick="chkDelAllShowLoveI();"><span id="live_num"></span></div>--%>
                            							<%--<div id="showNull" title="无资料" class="fav_null" style="display:none;"></div>--%>
                            							<%--<div id="showAll" title="所有赛事" onClick="showAllGame('FT');" style="display:none;" class="fav_on"></div>--%>
                            							<%--<div id="showMy" title="我的最爱" onClick="showMyLove('FT');" class="fav_out"></div>--%>
                        							<%--</td>--%>
                    								<%--</c:if>--%>
                      								<td class="refresh_btn" id="refresh_btn" style="width:74px;">
                      									<div onClick="javascript:refreshReload()" style=" height:26px; width:64px; text-align: center; padding:6px 3px 0 0;color:#F9C100; background:url(${ctx}/img/sport/mem_refresh_btn.gif) no-repeat;">
					  										<font id="refreshTime" style=" margin-left:25px; width:36px;"></font> 					  
  														</div>
  													</td>
                        							<td class="leg_btn">
  														<div onClick="javascript:chg_league();" id="sel_league">选择联赛 (<span id="str_num"></span>)</div>
 													</td>
                        							<td class="OrderType" id="Ordertype"></td>
                    							 </tr>
                  							</table>             
                						</td>
              						</tr>
            					</table>
							</h2>
							<div id=showtable></div>							
						</td>
					</tr>
					<tr></tr>	
					</tbody>				
				</table>				
				<center>
					<div id="refresh_down" class="refresh_M_btn" onClick="this.className='refresh_M_on';javascript:refreshReload()"><span>刷新</span></div>
				</center>				
			</td>
		</tr>
	</table>
	
	<div id="show_run_time" ></div>
	<div class="more" id="more_window" name="more_window" style="position:absolute; display:none; ">
  		<iframe id=showdata name=showdata scrolling='no' frameborder="NO" border="0" framespacing="0" noresize topmargin="0" leftmargin="0" marginwidth=0 marginheight=0 ></iframe>
	</div>
	<div id="legView" style="display:none;" class="legView" >
    	<div class="leg_head" onMousedown="initializedragie('legView')"></div>    
		<div><iframe id="legFrame" frameborder="no" border="0" allowtransparency="true"></iframe></div>
    	<div class="leg_foot"></div>
	</div>
	
	<div id=showtable_more style="position:absolute; display:none; "></div>

	<div id="controlscroll"  style="position:absolute;"><table border="0" cellspacing="0" cellpadding="0" class="loadBox"><tr><td><!--loading--></td></tr></table></div>

	<!-- ------------------------------ 盘口选择 ------------------------------ -->
	<div  id=odd_f_window style="display: none;position:absolute">
	<table id="odd_group" width="100" border="0" cellspacing="1" cellpadding="1">
			<tr>
				<td class="b_hline" >盘口</td>
			</tr>
			<tr >
				<td class="b_cen" width="100">
					<span id="show_odd_f" ></span></td>
			</tr>
		</table>
	</div>
	<!-- ------------------------------ 盘口选择 ------------------------------ -->
</body>
</html>


