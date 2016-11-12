<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Robots" contect="none">
<link rel="stylesheet" href="${ctx}/css/sport/style.css" type="text/css" media="screen"/>
<script language="JavaScript" src="${ctx}/js/sport/browse.js"></script>
<title>乒乓球</title>
<script type="text/javascript">
var rtype = '${rtype }';
var gtype = 'TN';
var g_date = '${g_date}';

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
<body id="MVB" class="bodyset ${tatype }" onLoad="onLoad();">
<div id="LoadLayer">loading...............................................................................</div>
<div id="showtableData" style="display:none;">
  <xmp>
          <table id="game_table"  cellspacing="0" cellpadding="0" class="game">
            <tr>
              <th class="time_re">时间</th>
              <th class="team">赛事</th>
              <th class="h_1x2">独赢</th>
              <th class="h_r_tn">让盘</th>
              <th class="h_ou_tn">大小</th>
              <th class="h_oe" style="display:none">单/双</th>
              <c:if test="${rtype == 'r'}">
              <th class="h_ouhc" colspan="2">球员赛局: 大/小</th>
              </c:if>
              <c:if test="${rtype != 'r'}">
              <th class="h_ouhc" colspan="2">球员局数: 大/小</th>
              </c:if>
              </tr>
            *showDataTR*
          </table>
  </xmp>
</div>
<!--   表格资料     -->
<div id=DataTR style="display:none;" >
	<xmp>
	<c:choose>
   	<c:when test="${rtype == 're'}">
	<!--SHOW LEGUAGE START-->
  <tr *ST* >
    <td colspan="8" class="b_hline">
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
    <td rowspan="2" class="b_cen tn_w">*NODATA*
    <div class="delay_bg" *SHOWDELAY*><span class="delay_text">天气延赛</span></div>
    	<table class="rb_box_tn" *NOWSERVER*>
	    	<tr class="rb_time_tn"><td class="tn_td"></td><td class="rb_tn_f">盘</td><td class="rb_tn_f">局</td><td class="rb_tn_f">分</td></tr>
	    	<tr class="rb_tn_tr"><td *NOWH*></td><td>*GAMEH*</td><td>*SETH*</td><td class="tn_pcolor">*POINTH*</td></tr>
	    	<tr class="rb_tn_tr"><td *NOWC*></td><td>*GAMEC*</td><td>*SETC*</td><td class="tn_pcolor">*POINTC*</td></tr>
    	</table>
    </td>    
    <td rowspan="2" class="team_name">*TEAM_H* *MYLOVE*<!--星星符号--><!--div class="fov_icon_on"></div--><!--星星符号-灰色--><!--div class="fov_icon_out"></div--><br>
      <span class="tn_team_c">*TEAM_C*</span>*MORE*
      </td>
    
    <td class="b_rig td_h1"><span class="ratio">*RATIO_MH*</span></td>
    <td class="b_rig"><span class="con">*CON_RH*</span> <span class="ratio">*RATIO_RH*</span></td>
    <td class="b_rig"><span class="con">*CON_OUH*</span> <span class="ratio">*RATIO_OUH*</span></td>
    <td class="b_rig" style="display:none"><span class="ratio">*RATIO_EOO*</span></td>
    <td class="bg_light"><span class="con">*CON_OUHO*</span><span class="ratio">*RATIO_OUHO*</span></td>
    <td class="bg_light"><span class="con">*CON_OUHU*</span><span class="ratio">*RATIO_OUHU*</span></td>
  </tr>
  <tr id="TR1_*ID_STR*" *TR_EVENT* *CLASS*>
    <td class="b_rig td_h1"><span class="ratio">*RATIO_MC*</span></td>
    <td class="b_rig"><span class="con">*CON_RC*</span> <span class="ratio">*RATIO_RC*</span></td>
    <td class="b_rig"><span class="con">*CON_OUC*</span> <span class="ratio">*RATIO_OUC*</span></td>
    <td class="b_rig" style="display:none"><span class="ratio">*RATIO_EOE*</span></td>
    <td class="bg_dark"><span class="con">*CON_OUCO*</span><span class="ratio">*RATIO_OUCO*</span></td>
    <td class="bg_dark"><span class="con">*CON_OUCU*</span><span class="ratio">*RATIO_OUCU*</span></td>
  </tr>
	</c:when>
	<c:otherwise>
  <!--SHOW LEGUAGE START-->
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
  				</c:otherwise>
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
                            							<div id="showAll" title="所有赛事" onClick="showAllGame('VB');" style="display:none;" class="fav_on"></div>
                            							<div id="showMy" title="我的最爱" onClick="showMyLove('VB');" class="fav_out"></div>
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