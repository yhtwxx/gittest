<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Robots" contect="none">
<link rel="stylesheet" href="${ctx}/css/sport/mem_body_olympics_cn.css" type="text/css" media="screen">
<script language="JavaScript" src="${ctx}/js/sport/browse.js"></script>
<title>棒球</title>
<script type="text/javascript">
var rtype = '${rtype }';
var odd_f_str = 'H,M,I,E';
var Format=new Array();
Format[0]=new Array( 'H','香港盘','Y');
Format[1]=new Array( 'M','马来盘','Y');
Format[2]=new Array( 'I','印尼盘','Y');
Format[3]=new Array( 'E','欧洲盘','Y');
</script>
</head>
<body id="MBS" class="bodyset ${tatype }" onLoad="onLoad();">
	<div id="LoadLayer" style="display: none;">loading...............................................................................</div>
	<div id="showtableData" style="display:none;">
		<xmp>
			<table id=game_table border="0" cellspacing="0" cellpadding="0" class="game">
				<tr>
				<c:choose>
				<c:when test="">
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
	
	<table border="0" cellpadding="0" cellspacing="0" id="myTable">
		<tr>
			<td>
				<table border="0" cellpadding="0" cellspacing="0" id="box">
					<tbody>
					<tr>
						<td class="top"><h1><em>${caption }</em></h1></td>
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
					                        		<td id="fav_btn">
                            							<div id="fav_num" title="清空" onClick="chkDelAllShowLoveI();"><span id="live_num"></span></div>
                            							<div id="showNull" title="无资料" class="fav_null" style="display:none;"></div>
                            							<div id="showAll" title="所有赛事" onClick="showAllGame('FT');" style="display:none;" class="fav_on"></div>
                            							<div id="showMy" title="我的最爱" onClick="showMyLove('FT');" class="fav_out"></div>
                        							</td>
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
</body>
</html>