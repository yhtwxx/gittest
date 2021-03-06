<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Robots" contect="none">
<%-- <link rel="stylesheet" href="${ctx}/css/sport/mem_body_olympics_cn.css" type="text/css" media="screen"> --%>
<link rel="stylesheet" href="${ctx}/css/sport/style.css" type="text/css" media="screen"/>
<script language="JavaScript" src="${ctx}/js/sport/browse.js"></script>
<title>今日篮球 / 美式足球 / 橄榄球</title>
<script type="text/javascript">
var rtype = '${rtype }';
var gtype = 'BK';
var g_date = '${g_date}';
//var ss = parent.rtype;
//var uid='';
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
				<c:if test="${rtype == 'r'||rtype == 're'||rtype == 'p3'||rtype == 'ft_r'}"></c:if>
					<th class="time">时间</th>
		          	<th class="team">赛事</th>
				  	<th class="h_1x2">独赢</th>
				  	<th class="h_r">让球</th>
		          	<th class="h_ou">大小</th>
					<th class="h_ouhc" colspan="2">球队得分：大  / 小</th>
				*showDataTR*  
				</tr>
			</table>	
			<c:if test="${rtype=='p' || rtype=='pr'}">
      			<DIV id="game_table"> </DIV>
      		</c:if>	
		</xmp>
	</div>
	<!--   篮球 表格资料     -->
	<div id=DataTR style="display:none;">
	
		<xmp>
			<c:choose>
   			<c:when test="${rtype == 'r'||rtype == 'ft_r'}">
   				<tr *ST* >
    				<td colspan="8" class="b_hline">
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
    				<td rowspan="2" class="b_cen">*DATETIME*</td>
    				<td rowspan="2" class="team_name">*TEAM_H*<span>*MYLOVE*<!--星星符号--></span><br>
      					<span class="bk_team_c">*TEAM_C* </span>
      					<span class="more_txt bk_more">*MORE*</span>
      				</td>
    				<td class="b_cen bc_h">*RATIO_MH*</td>
    				<td class="b_rig"><span class="con">*CON_RH*</span> <span class="ratio">*RATIO_RH*</span></td>
    				<td class="b_rig"><span class="con">*CON_OUH*</span> <span class="ratio">*RATIO_OUH*</span></td>
    				<!--td class="b_cen">*RATIO_EOO*</td-->
    				<td class="bg_light_bk"><span class="con">*CON_OUHO*</span><span class="ratio">*RATIO_OUHO*</span></td>
    				<td class="bg_light_bk"><span class="con">*CON_OUHU*</span><span class="ratio">*RATIO_OUHU*</span></td>
  				</tr>
  				<tr id="TR1_*ID_STR*" *TR_EVENT* *CLASS*>
  					<td class="b_cen bc_h">*RATIO_MC*</td>
   					<td class="b_rig"><span class="con">*CON_RC*</span> <span class="ratio">*RATIO_RC*</span></td>
    				<td class="b_rig"><span class="con">*CON_OUC*</span> <span class="ratio">*RATIO_OUC*</span></td>
    				<!--td class="b_cen">*RATIO_EOE*</td-->
    				<td class="bg_dark_bk"><span class="con">*CON_OUCO*</span><span class="ratio">*RATIO_OUCO*</span></td>
    				<td class="bg_dark_bk"><span class="con">*CON_OUCU*</span><span class="ratio">*RATIO_OUCU*</span></td>
  				</tr>
   			</c:when>
  
   			<c:when test="${rtype == 'p3'}">
   			<tr *ST* >
    			<td colspan="8" class="b_hline">
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
      					<td class="IN">
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
    			<td rowspan="2" class="b_cen">*DATETIME*</td>
    			<td rowspan="2" class="team_name">*TEAM_H*<span>*MYLOVE*<!--星星符号--><!--div class="fov_icon_on"></div--><!--星星符号-灰色--><!--div class="fov_icon_out"></div--></span><br>
      				<span class="bk_team_c">*TEAM_C* </span><span class="more_txt bk_more">*MORE*</span></td>
    			<td class="b_cen bc_h" id="*GID_MH*">*RATIO_MH*</td>
    			<td class="b_rig" id="*GID_RH*"><span class="con">*CON_RH*</span> <span class="ratio">*RATIO_RH*</span></td>
    			<td class="bg_rig_bk" id="*GID_OUH*"><span class="con">*CON_OUH*</span> <span class="ratio">*RATIO_OUH*</span></td>
    			<!--td class="b_cen">*RATIO_EOO*</td-->
    			<td class="bg_rig_bk" id="*GID_OUHO*"><span class="con">*CON_OUHO*</span><span class="ratio">*RATIO_OUHO*</span></td>
    			<td class="bg_rig_bk" id="*GID_OUHU*"><span class="con">*CON_OUHU*</span><span class="ratio">*RATIO_OUHU*</span></td>
  			</tr>
  			<tr id="TR1_*ID_STR*" *TR_EVENT* *CLASS*>
  				<td class="b_cen bc_h" id="*GID_MC*">*RATIO_MC*</td>	
    			<td class="b_rig" id="*GID_RC*"><span class="con">*CON_RC*</span> <span class="ratio">*RATIO_RC*</span></td>
    			<td class="bg_rig_bk" id="*GID_OUC*"><span class="con">*CON_OUC*</span> <span class="ratio">*RATIO_OUC*</span></td>
    			<!--td class="b_cen">*RATIO_EOE*</td-->
    			<td class="bg_dark_bk" id="*GID_OUCO*"><span class="con">*CON_OUCO*</span><span class="ratio">*RATIO_OUCO*</span></td>
    			<td class="bg_dark_bk" id="*GID_OUCU*"><span class="con">*CON_OUCU*</span><span class="ratio">*RATIO_OUCU*</span></td>
  			</tr>
   			</c:when>
   			<c:when test="${rtype == 're'}">
   			<tr *ST* >
    			<td colspan="8" class="b_hline">
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
    			<td rowspan="2" class="b_cen bk_w">
    				<table border="0" cellpadding="0" cellspacing="0" class="rb_box_bk">
    					<tr>
    						<td class="rb_time_bk">*SE*&nbsp;<span class="rb_time_color">*RB_TIME*</span></td>
    					</tr>
    					<tr><td class="rb_score_bk">*SCORE*</td></tr>
    				</table>
    			</td>
    			<td rowspan="2" class="team_name">*TEAM_H*<span>*MYLOVE*<!--星星符号--><!--div class="fov_icon_on"></div--><!--星星符号-灰色--><!--div class="fov_icon_out"></div--></span><br>
      				<span class="bk_team_c">*TEAM_C*</span><span class="more_txt bk_more">*MORE*</span>
  				</td>
    			<td class="b_cen td_h1">*RATIO_MH*</td>
    			<td class="b_rig"><span class="con">*CON_RH*</span> <span class="ratio">*RATIO_RH*</span></td>
    			<td class="b_rig"><span class="con">*CON_OUH*</span> <span class="ratio">*RATIO_OUH*</span></td>
    			<!--td class="b_cen">*RATIO_EOO*</td-->
    			<td class="bg_light_bk"><span class="con">*CON_OUHO*</span><span class="ratio">*RATIO_OUHO*</span></td>
    			<td class="bg_light_bk"><span class="con">*CON_OUHU*</span><span class="ratio">*RATIO_OUHU*</span></td>
  			</tr>
  			<tr id="TR1_*ID_STR*" *TR_EVENT* *CLASS*>
  				<td class="b_cen td_h1">*RATIO_MC*</td>
    			<td class="b_rig"><span class="con">*CON_RC*</span> <span class="ratio">*RATIO_RC*</span></td>
    			<td class="b_rig"><span class="con">*CON_OUC*</span> <span class="ratio">*RATIO_OUC*</span></td>
    			<!--td class="b_cen">*RATIO_EOE*</td-->
    			<td class="bg_dark_bk"><span class="con">*CON_OUCO*</span><span class="ratio">*RATIO_OUCO*</span></td>
    			<td class="bg_dark_bk"><span class="con">*CON_OUCU*</span><span class="ratio">*RATIO_OUCU*</span></td>
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
			<div id="p3Title" class="day_title" <c:if test="${g_date=='T'}">style='display:none;'</c:if>>
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
						<td class="top"><h1><em>${caption }</em>
										
							<c:if test="${rtype == 'p3'}">
								<span class="maxbet">单注最高可赢金额： 人民币 1,000,000.00</span>
							</c:if>
						</h1></td>
						
						
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
                    								<c:if test="${rtype == 'r' || rtype == 're'}">
					                        		<td id="fav_btn">
                            							<div id="fav_num" title="清空" onClick="chkDelAllShowLoveI();"><span id="live_num"></span></div>
                            							<div id="showNull" title="无资料" class="fav_null" style="display:none;"></div>
                            							<div id="showAll" title="所有赛事" onClick="showAllGame('FT');" style="display:none;" class="fav_on"></div>
                            							<div id="showMy" title="我的最爱" onClick="showMyLove('FT');" class="fav_out"></div>
                        							</td>
                    								</c:if>
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