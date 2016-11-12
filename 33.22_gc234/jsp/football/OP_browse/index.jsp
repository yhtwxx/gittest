<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script language="JavaScript" src="${ctx}/js/sport/zh-cn.js"></script> -->
<script language="JavaScript" src="${ctx}/js/sport/index.js"></script>

<title>下注分割页面</title>
<script type="text/javascript">
var sel_gtype='OP';
var langx = "zh-cn";
var rtype = '${rtype }';
top.today_gmt = '2015-05-06';
top.showtype = '';

var show_ior = '100';
var username='';
var maxcredit='';
var code='';
var pg=0;
var sel_league='';		//選擇顯示聯盟
var loading = 'Y';		//是否正在讀取瀏覽頁面
var loading_var = 'Y';	//是否正在讀取變數值頁面
var ShowType = '';		//目前顯示頁面
var ltype = 3;			//目前顯示line
var retime_flag = 'Y';	//自動更新旗標
var retime = 0;			//自動更新時間

var str_even = '和局';
var str_renew = '秒自動更新';
var str_submit = '確認';
var str_reset = '重設';

var num_page = 20;		//設定20筆賽程一頁
var now_page = 1;		//目前顯示頁面
var pages = 1;			//總頁數
var msg = '';			//即時資訊
var gamount = 0;		//目前顯示一般賽程數
var GameFT = new Array(512); 	//最多設定顯示512筆開放賽程
var iorpoints=2;
var GameHead=new Array();

var ObjDataFT=new Array();
var oldObjDataFT=new Array();
//var GameHead=new Array("gid","datetime","league","gnum_h","gnum_c","team_h","team_c","strong","ratio","ior_RH","ior_RC","ratio_o","ratio_u","ior_OUH","ior_OUC","ior_MH","ior_MC","ior_MN","str_odd","str_even","ior_EOO","ior_EOE","hgid","hstrong","hratio","ior_HRH","ior_HRC","hratio_o","hratio_u","ior_HOUH","ior_HOUC","ior_HMH","ior_HMC","ior_HMN","more","eventid","hot","play");
var keepleg="";
var legnum=0;
var NoshowLeg=new Array();
var myLeg=new Array();
var LeagueAry=new Array();
var keepscroll=0;
var step=1;

var keepGameData=new Array();
var gidData=new Array();
parent.gamecount=0;

function mouseEnter_pointer(tmp){
	try{
	document.getElementById(tmp.split("_")[1]).style.display ="block";
	}catch(E){}
}
 
function mouseOut_pointer(tmp){
	try{
	document.getElementById(tmp.split("_")[1]).style.display ="none";
	}catch(E){}
}

function body_var_onLoad(){
	console.log(511);
	if(retime > 0) retime_flag='Y';
	else retime_flag='N';
	loading_var = 'N';
	if(loading == 'N' && ShowType != ''){
		console.log(512);
		ShowGameList();
	}	
}
</script>
</head>

<frameset rows="0,*" frameborder="NO" border="0" framespacing="0">
  	<frame name="body_var" scrolling="NO" noresize src="../body_var.do?rtype=${rtype }&langx=${langx }&mtype=${mtype }&g_date=${g_data }&page_no=0&league_id=${league_id }&hot_game=${hot_game }">	
  	<frame name="body_browse" src="body_browse.do?rtype=${rtype }&langx=${langx }&mtype=${mtype }&showtype=${showtype }">
</frameset>
<noframes>
<body bgcolor="#000000">

</body>
</noframes>
</html>