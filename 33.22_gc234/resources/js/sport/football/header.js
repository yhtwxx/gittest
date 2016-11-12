var today_count=0;
var early_count=0;
//var changebtn="rb";
if (""+top.cgTypebtn=="undefined"){
	top.cgTypebtn="re_class";
}

if (""+top.head_gtype=="undefined"){
	top.head_gtype="FT";
}
if (""+top.head_FU=="undefined"){
	top.head_FU="FT";
}
if (""+top.head_btn=="undefined"){
	top.head_btn="today";
}



function onloaded() {
	if (top.casino != "SI2") {
		try{
			document.getElementById("live").style.display = "none";
			document.getElementById("QA_row").style.display = "none";
		}catch(E){}
	}
	var obj= document.getElementById(top.cgTypebtn+"");
    obj.className="type_on";
	try{
		if ((navigator.appVersion).indexOf("MSIE 6")==-1){
			document.getElementById("download").style.visibility="visible";
		}
	}catch(E){}
	try{
		document.getElementById("today_btn").className="today";
	}catch(E){}
	try{
		document.getElementById("early_btn").className="early";
	}catch(E){}		
	try{
		document.getElementById("rb_btn").className="rb";
	}catch(E){}		
				
	try{
		if(top.head_btn == "rb"){
			document.getElementById('nav').style.display='none';
			document.getElementById('type').style.display='none';
			document.getElementById('nav_early').style.display='none';
			document.getElementById('type_early').style.display='none';
			document.getElementById('nav_re').style.display="";
			document.getElementById('type_re').style.display="";
		}else if(top.head_btn=="early"){
			document.getElementById('nav').style.display='none';
			document.getElementById('type').style.display='none';
			document.getElementById('nav_re').style.display='none';
			document.getElementById('type_re').style.display='none';
			document.getElementById('nav_early').style.display="";
			document.getElementById('type_early').style.display="";
		}
		document.getElementById(top.head_btn+"_btn").className=top.head_btn+"_on";
		document.getElementById(top.RB_id).className="rb_menu_on";

	}catch(E){}	

	//更新信用額度   max---
	reloadCrditFunction();
  //showTable();
  //GameType();

}
//=========================头部球类导航 Start================================
//头部加亮选中导航
function chg_button_bg(gtype,btn){
	top.head_gtype=gtype;
	if (btn=="early"||btn=="today"){
		chg_type_class("re_class"); 
	}
	if (btn=="rb"){			
		chg_type_class("rb_class"); 	
		document.getElementById('nav').style.display='none';
		document.getElementById('type').style.display='none';
		document.getElementById('nav_early').style.display='none';
		document.getElementById('type_early').style.display='none';
		document.getElementById('nav_re').style.display="";
		document.getElementById('type_re').style.display="";
	}
	if (btn!="rb"){
		if(btn=="early"){
			top.head_FU="FU";
			document.getElementById('nav').style.display='none';
			document.getElementById('type').style.display='none';
			document.getElementById('nav_re').style.display='none';
			document.getElementById('type_re').style.display='none';
			document.getElementById('nav_early').style.display="";
			document.getElementById('type_early').style.display="";
		}else{
			top.head_FU="FT";
			document.getElementById('nav_re').style.display='none';
			document.getElementById('type_re').style.display='none';
			document.getElementById('nav_early').style.display='none';
			document.getElementById('type_early').style.display='none';
			document.getElementById('nav').style.display="";
			document.getElementById('type').style.display="";
		}
	}
	try{
		document.getElementById(top.head_btn+"_btn").className=top.head_btn;
	}catch(E){}
	top.head_btn=btn;

  /*
  if (today_count*1 > 0){
      document.getElementById("todayshow").style.display=''; 
      document.getElementById("todayType").style.display='none';
      document.getElementById("today_btn").className="today";
  }else{
      document.getElementById("todayshow").style.display='none';
      document.getElementById("todayType").style.display='';
      document.getElementById("today_btn").className="today_null";
  }
  
  if (early_count*1 > 0){
      document.getElementById("earlyshow").style.display='';
      document.getElementById("earlyType").style.display='none';
      document.getElementById("early_btn").className="early";
  }else{
      document.getElementById("earlyshow").style.display='none';
      document.getElementById("earlyType").style.display='';
      document.getElementById("early_btn").className="early_null";
  }   
  */
	
	try{
		document.getElementById("rb_btn").className="rb";
	}catch(E){}
	//document.getElementById("today_btn").className="today";
	//document.getElementById("early_btn").className="early";
	try{
		document.getElementById(btn+"_btn").className=btn+"_on";
	}catch(E){}
	//alert(document.getElementById(btn+"_btn").className)	
}


function chg_type_class(game_type){
	//已選取：黃字 class="type_on"
	//選取後離開：白字 class="type_out"
	if(game_type != top.cgTypebtn ){
		var obj= document.getElementById(game_type+"");
	    obj.className="type_on";
	    var obj_laster= document.getElementById(top.cgTypebtn+"");
	    obj_laster.className="type_out";
	    top.cgTypebtn=game_type;
	}
}


//头部滚球、今日一级导航URL
function chg_head(a,b,c){
	top.hot_game="";
	if(top.swShowLoveI)b=3;
	if(top.showtype=='hgft')b=3;
	var hot_str="";	
	//加入hot_game參數值
	hot_str="&hot_game="+top.hot_game;
	parent.body.location=a+"&league_id="+b+hot_str;
	reloadRB('FT');
}

//早盘一级导航URL
function chg_index_head(a,b,c,d,future){
	top.hot_game="";
	top.swShowLoveI=false;
	top.cgTypebtn="re_class";
	var hot_str="";	
	hot_str="&hot_game="+top.hot_game;
	parent.body.location.href=b+"&league_id="+c+hot_str;
	self.location.href=a;
}

//今日、早盘头部二级导航URL
function chg_index(a,b,c,d,future){
	top.hot_game="";
	top.swShowLoveI=false;
	top.cgTypebtn="re_class";
	var hot_str="";
	hot_str="&hot_game="+top.hot_game;
	parent.body.location.href=b+"&league_id="+c+hot_str;
	self.location.href=a;
}

//滚球头部二级导航URL
function Go_RB_page(RBgtype){
	top.hot_game="";
	top.RB_id="RB_"+RBgtype;
	var url=RBgtype+"_browse/index.do?rtype=re&langx="+top.langx+"&mtype=3&showtype="+top.showtype+"&hot_game="+top.hot_game;
	parent.header.location.href="header.do?showtype=&langx="+top.langx+"&mtype=3&gtype="+RBgtype;
	parent.body.location.href=url;
	chg_button_bg(RBgtype,"rb");
	
}

//头部三级导航URL
function chg_type(a,b,c){
	top.hot_game="";
	if(top.swShowLoveI)b=3;
	if(top.showtype=='hgft')b=3;
	var hot_str="";
	
	//加入hot_game參數值
	hot_str="&hot_game="+top.hot_game;
	parent.body.location=a+"&league_id="+b+hot_str;
}


//=========================头部球类导航 end================================


/* 流程 SetRB ---> reloadRB --->  showLayer */
/* 滾球提示--程式一開始值呼叫reloadRb,setInterval函式 多久會呼叫reloadRB函數預設 1分鐘 */
function SetRB(gttype){
	reloadRB(gttype);
	setInterval("reloadRB('"+gttype+"')",60*1000);
}

/*滾球提示--將值帶進去去開啟getrecRB.php程式,去抓取伺服器是否有滾球賽程*/
var record_RB = 0;
function reloadRB(gtype){
	reloadPHP.location.href="getrecRB.do?gtype="+gtype;
//	chkMemOnline();
}

function chkMemOnline(){
	memOnline.location.href="../mem_online.php?uid="+top.uid;
}

/*滾球提示--將getrecRB.php的結果帶進去,去判斷是否record_RB是否大於0,如果有會顯示滾球圖示*/
function showLayer(record_RB){
	document.getElementById('RB_games').innerHTML=record_RB;
	document.getElementById('FT_games').innerHTML=0;
	document.getElementById('BK_games').innerHTML=0;
	document.getElementById('TN_games').innerHTML=0;
	document.getElementById('BS_games').innerHTML=0;
	document.getElementById('VB_games').innerHTML=0;
	document.getElementById('OP_games').innerHTML=0;
	reloadCrditFunction();
}


//-------------------------------------------------------------------------
//時鍾每秒顯示
var nowTimer=0;
var stimer=0;
function autoZero(val){
	if (val<10){
		return "0"+val;
	}
	return val;
}

var monthAry=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");	
function showTimer(){
	//alert(nowTimer);
	nowTimer+=1000;
	var now=new Date(nowTimer);
	//document.getElementById('head_date').innerHTML=now.toString();
	try{
		document.getElementById('head_year').innerHTML=now.getFullYear();
		if (top.langx=="en-us"){
			tmp_month=monthAry[now.getMonth()];
		}else{
			tmp_month=now.getMonth()+1;
		}
		document.getElementById('head_month').innerHTML=tmp_month;
		document.getElementById('head_day').innerHTML=now.getDate();
		document.getElementById('head_hour').innerHTML=autoZero(now.getHours());
		document.getElementById('head_min').innerHTML=autoZero(now.getMinutes());
		//document.getElementById('head_sec').innerHTML=autoZero(now.getSeconds());
		document.getElementById('head_date').style.display='';
	}catch(E){}
}

//计时开始
function setTimeStart(now){
	clearInterval(stimer);
	var today=now.split(" ");
	var today_date=today[0].split("-");
	var today_time=today[1].split(":");
	//alert(new Date(today_date[0],today_date[1]-1,today_date[2],today_time[0],today_time[1],today_time[2],0));
	nowTimer=(new Date(today_date[0],today_date[1]-1,today_date[2],today_time[0],today_time[1],today_time[2],0)).getTime();
	showTimer();
	stimer=setInterval("showTimer()",1000);
}

//赛事数量和时间
function GameCount(games){
	var countgtype =new Array("FT","BK","TN","VB","BS","BM","TT","OP");
	var countgames=games.split(",");
	var recordHash=new Array();
	recordHash["DATE"]=countgames[0];
	setTimeStart(recordHash["DATE"]) 
	recordHash["RB"]=0;
	for( var i=1;i<countgames.length;i++){
		var detailgame=countgames[i].split("|");
		recordHash[detailgame[0]+"_"+detailgame[1]]=detailgame[2]*1;
	}
	try{
		//top.head_FU=="FU" 2015.12.30
		if (top.head_btn=="early"){	
			document.getElementById('FT_games_r').innerHTML=recordHash["FT_"+top.head_FU];
			document.getElementById('BK_games_r').innerHTML=recordHash["BK_"+top.head_FU];
			document.getElementById('TN_games_r').innerHTML=recordHash["TN_"+top.head_FU];
			document.getElementById('BS_games_r').innerHTML=recordHash["BS_"+top.head_FU];
			document.getElementById('VB_games_r').innerHTML=recordHash["VB_"+top.head_FU];
			document.getElementById('BM_games_r').innerHTML=recordHash["BM_"+top.head_FU];
			document.getElementById('TT_games_r').innerHTML=recordHash["TT_"+top.head_FU];
			document.getElementById('OP_games_r').innerHTML=recordHash["OP_"+top.head_FU];
		}else{
			var RB_idstr="";
			var RB_countstr="";
			for( var i=0;i<countgtype.length;i++){	
				RB_idstr="RB_"+countgtype[i];
				RB_countstr="RB_"+countgtype[i]+"_games";
//				if(recordHash[countgtype[i]+"_RB"] == 0){
//					document.getElementById(RB_idstr).style.display="none";
//				}
//				else{	
//				 document.getElementById(RB_countstr).innerHTML=recordHash[countgtype[i]+"_RB"];
//				}	
				if(document.getElementById(RB_countstr)!=undefined)
				  document.getElementById(RB_countstr).innerHTML=recordHash[countgtype[i]+"_RB"];
			}							
//			document.getElementById('subRB_games').innerHTML=recordHash[top.head_gtype+"_RB"]; 
			document.getElementById('FT_games').innerHTML=recordHash["FT_"+top.head_FU]
			document.getElementById('BK_games').innerHTML=recordHash["BK_"+top.head_FU]
			document.getElementById('TN_games').innerHTML=recordHash["TN_"+top.head_FU]
			document.getElementById('BS_games').innerHTML=recordHash["BS_"+top.head_FU]
			document.getElementById('VB_games').innerHTML=recordHash["VB_"+top.head_FU]
			document.getElementById('BM_games').innerHTML=recordHash["BM_"+top.head_FU]
			document.getElementById('TT_games').innerHTML=recordHash["TT_"+top.head_FU]
			document.getElementById('OP_games').innerHTML=recordHash["OP_"+top.head_FU]
		}
	}catch(E){}
	today_count=recordHash[top.head_gtype+"_FT"];
	early_count=recordHash[top.head_gtype+"_FU"];
	var today_RB=0;
	for( var i=0;i<countgtype.length;i++){
		today_RB +=recordHash[countgtype[i]+"_RB"];
	}			
/*	if (top.head_FU=="FT"){
		if (today_RB*1 > 0){
			document.getElementById("rb_btn").style.visibility = "visible";
		}else{
			document.getElementById("rb_btn").style.visibility = "hidden";
		}
	}*/
	/*
	if (today_count*1 > 0){
	 		document.getElementById("todayshow").style.display=''; 
      document.getElementById("todayType").style.display='none';
      document.getElementById("today_btn").className="today";
  }else{
      document.getElementById("todayshow").style.display='none';
      document.getElementById("todayType").style.display='';
      document.getElementById("today_btn").className="today_null";
  }
  
  if (early_count*1 > 0){
      document.getElementById("earlyshow").style.display='';
      document.getElementById("earlyType").style.display='none';
      document.getElementById("early_btn").className="early";  
  }else{
      document.getElementById("earlyshow").style.display='none';
      document.getElementById("earlyType").style.display='';
      document.getElementById("early_btn").className="early_null";
  } */
	if (top.head_btn=="early"){	
		document.getElementById("early_btn").className="early_on";
	}else if(top.head_btn=="rb"){
		document.getElementById("rb_btn").className="rb_on";
	}else{
		document.getElementById("today_btn").className="today_on";
	}
}

//更新信用額度max
function reloadCrditFunction(){
	//reloadPHP1.location.href='reloadCredit.do?&langx='+top.langx;
}

function reloadCredit(cash){
	var tmp=cash.split(" ");
	top.mcurrency=tmp[0];
	//document.getElementById("credit").innerHTML=cash;
}

function mouseEnter_pointer(tmp){
	try{
		var tmp1 = tmp.split("_")[1];
		var txtnum = top.ShowLoveIarray[tmp1].length;
		if(txtnum !=0)
			document.getElementById(tmp).style.display ="block";
	}catch(E){}
}

function mouseOut_pointer(tmp){
	try{
		document.getElementById(tmp).style.display ="none";
	}catch(E){}
}

try{
	showGtype = top.gtypeShowLoveI;
	var xx=showGtype.length;
}catch(E){
	initDate();
	showGtype = top.gtypeShowLoveI;
}

function initDate(){
	top.gtypeShowLoveI =new Array("FTRE","FT","FU","BKRE","BK","BU","BSRE","BS","BSFU","TNRE","TN","TU","VBRE","VB","VU","BMRE","BM","BMFU","TTRE","TT","TTFU","OPRE","OP","OM");
	top.ShowLoveIarray = new Array();
	top.ShowLoveIOKarray = new Array();
	for (var i=0 ; i < top.gtypeShowLoveI.length ; i++){
		top.ShowLoveIarray[top.gtypeShowLoveI[i]]= new Array();
		top.ShowLoveIOKarray[top.gtypeShowLoveI[i]]= new Array();
	}
}


//新增足球帮助 timi 20151024

function OnMouseOverEvent() {
	document.getElementById("informaction").style.display = "block";
}
function OnMouseOutEvent() {
	document.getElementById("informaction").style.display = "none";
}


function winOpen(url,width,height,left,top,name)
{
	var temp = "menubar=no,toolbar=no,directories=no,scrollbars=yes,resizable=no";
	if (width) {
		temp += ',width=' + width;
	} else {
		width = 1024;
	}
	if (height) {
		temp += ',height=' + height;
	} else {
		height = 600;
	}
	if (left) {
		temp += ',left=' + left;
	} else {
		temp += ',left='
			+ Math.round((window.screen.width - parseInt(width)) / 2);
	}
	if (top) {
		temp += ',top=' + top;
	} else {
		temp += ',top='
			+ Math.round((window.screen.height - parseInt(height)) / 2);
	}
	if(typeof(name)=="undefined"){
		name="";
	}
	if(name=="game")
	{
		//alert(temp);
		var obj=window.open (url,name,temp);
		obj.moveTo(0,0);
		obj.resizeTo(window.screen.availWidth,window.screen.availHeight);
		//window.setTimeout("obj.document.location=url",3000);
	}
	else{
		window.open (url,name,temp);
	}
}
