<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/css/sport/mem_order_sel.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/sport/mem_order_olympics.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="${ctx}/js/sport/top.js"></script>
<script language="JavaScript" src="${ctx}/js/sport/zh-cn.js"></script>
<script language="JavaScript" src="${ctx}/js/sport/select.js"></script>
<script>
top.langx = 'zh-cn'
top.liveid = ''
top.casino = 'SI2';
top.mtype = '3';
var ctx = "${ctx}";		
gamedate = '2015-05-11';
var GameData = new Array();
var GameHead = new Array('gtype','time','league','teamH','teamC','gidm');
var msg='温馨提示, 足球过关项目现已更新至选择互串7天以内的赛事, 欢迎各会员踊跃投注!.';
var chgURL_domain='';
var mtype='3';
var mem_enable='Y';
var countHOT= '';
var checkRoute='Y';
var imgurl='http://img.hg0088.com';
</script>
<title>投注页面</title>

</head>
<body id="OSEL" class="bodyset" onLoad="bodyLoad();" style="background:#493721;">
<div id="main" class="main">
  	<div id="menu" style="height:32px; background-color: transparent;">
  	    <div class="ord_btn" id="order_button" onClick="showOrder();" style="height:20px;">交易单</div>
    	<!-- <div class="ord_on" id="order_button" onClick="showOrder();">交易单</div> -->
    	<div class="record_btn" id="record_button" onClick="showRec();" style="display:none;">最新十笔交易</div>
  	</div>
  
  	<!-- 投注页面 Start -->
  	<div id="order_div" name="order_div" style=" overflow:hidden;">
    	<div id="pls_bet" name="pls_bet" style="background-color:#E3CFAA;left:0;top:0; display:none;">
     		<img src="${ctx}/img/sport/order_none.jpg" width="216" height="22">
	    	<div style="width:216; height:63px; text-align:center; padding-top:16px;">       
	    		<font style="font:0.75em Arial, Helvetica, sans-serif; font-weight:bold;">点击赔率便可将<br>选项加到交易单里。</font>
	    	</div>
  		</div>
	    <div id="bet_div" name="bet_div">
	    	<iframe id="bet_order_frame" name="bet_order_frame" scrolling="NO" frameborder="NO" border="0" height="0"></iframe>
	    </div>
	    <div id="rec5_div" name="rec5_div">
	      <iframe id="rec_frame" name="rec_frame" scrolling='NO' frameborder="NO" border="0" height="0"></iframe>
	    </div>
  	</div>
	<!-- 投注页面 end -->
	
	<!-- 奥运   Start -->
	<div id="euro_menu_all" class="left_btn" style="display:none;">
		<div class="rb_left_tw_out" id="HOT_rb_btn" onMouseOver="Eurover(this);" onMouseOut="Eurout(this);" onClick="goEuro_HOT('FT_rb');"><br /><span id="HOT_rb" class=" text_s"></span></div>
		<div class="hot_left_tw_out" id="HOT_today_btn" onMouseOver="Eurover(this);" onMouseOut="Eurout(this);" onClick="goEuro_HOT('FT_today');"><br /><span id="HOT_today" class="text_s"></span></div>
		<div class="early_left_tw_out" id="HOT_early_btn" onMouseOver="Eurover(this);" onMouseOut="Eurout(this);" onClick="goEuro_HOT('FT_early');"><br /><span id="HOT_early" class="text_s"></span></div>
	</div>
    <!-- 已开赛 -->
    <div id="euro_open" style="display:none;">
        <div id="euro_menu">
			<div class="rb_btn" id="RB_btn"  onmouseover="Eurover(this);" onMouseOut="Eurout(this);" onClick="goRB();"></div>
        </div>
         
         <!--div id="oly_main"--> 
         <div id="oly_main111">
            <!--滚球 -->
            <div id="RB_oly">
                <div id="FT_RB" onClick="showRB('FT');" class="oly_tr"></div>
                <div id="BK_RB" onClick="showRB('BK');" class="oly_tr"></div>
                <div id="TN_RB" onClick="showRB('TN');" class="oly_tr"></div>
                <div id="VB_RB" onClick="showRB('VB');" class="oly_tr"></div>
                <div id="BM_RB" onClick="showRB('BM');" class="oly_tr"></div>
                <div id="TT_RB" onClick="showRB('TT');" class="oly_tr"></div>
                <div id="BS_RB" onClick="showRB('BS');" class="oly_tr"></div>	
                <div id="OP_RB" onClick="showRB('OP');" class="oly_tr"></div>
            </div>        	
         </div>
    </div>          
	<!-- 奥运   End -->

	<div id="switch_web" style="display:none;" onClick="sendRequest('chgurl.php?langx='+top.langx+'&mtype='+mtype+'&chgURL_domain='+chgURL_domain+'&ts='+new Date().getTime());return false;"><!--连结旧站--></div>


  <!--div id="showLive_table"></div>
  <!--div id="livetableData" style="display:none;">
    <xmp>
      <div id="live_box">
      	<h2>现场直播<span class="more"><a href="javascript://" onClick="OpenLive();">查看所有直播</a></span></h2>
        <div class="live_main">
   	     <ul class="live_list">
         	*showDataTR*
   		 </ul>
        </div>
      </div>
     
    </xmp>
  </div-->
  
  <!-- LIVE表格资料-->
  <div id=DataTR style="display:none;" >
    <xmp>
      <li><span class="time">*TIME*</span><span class="team">*TEAMS*</span></li>
    </xmp>
  </div>
  <!--公告 Start--> 
    <div id="info_div" name="info_div">
		<div class="msg_box">
		<h2>公告<span class="more"><!-- <a href="#" onClick="showMoreMsg();">更多</a> --></span> </h2>
			<div class="msg_main">
				<marquee height="70" scrollAmount="1" direction="up" onMouseOver="this.stop();" onMouseOut="this.start();">
				<span id="real_msg"></span>
				</marquee>
			</div>
		</div>
	</div>
     
      <!--广告 start-->
      <!--<div class="left_banner">
      <span onClick="window.open('http://433.com');" class="banner_tw"></span>
      </div>-->
      
      <!--div class="new_banner">
      <span class="banner_title">即将更新</span>
      <div class="banner_con">
      <span class="banner_pic_cn"></span>
      <span>温馨提示: <span class="text_color">12月16日</span>桌面和手机版会员端登入页面将会更改至全新的页面,此预览图让你事先获知新的页面更新.</span>
      </div>
      </div-->
      <div class="left_banner">
      	<span onClick="window.open('http://www.live228.com');" class="live228_cn"></span>
      </div>

      <!--广告 end-->
  
</div>
<div id='showURL'></div>
</body>
</html>