//隱藏我的最愛選擇聯賽
function dis_ShowLoveI(){
	if(top.swShowLoveI){
		body_browse.document.getElementById("sel_league").style.display="none";
	}else{		
		body_browse.document.getElementById("sel_league").style.display="";
	}
}


//小數點位數
function printf(vals,points){ 
	vals=""+vals;
	var cmd=new Array();
	cmd=vals.split(".");
	if (cmd.length>1){
		for (ii=0;ii<(points-cmd[1].length);ii++)vals=vals+"0";
	}else{
		vals=vals+".";
		for (ii=0;ii<points;ii++)vals=vals+"0";
	}
	return vals;
}

//数组解析
function parseArray(gameHead,gameData){
	var gameObj=new Object();
	for (var i=0;i<gameHead.length;i++){
		if (gameHead[i]!=""){	
			eval("gameObj."+gameHead[i]+"='"+gameData[i]+"'");
		}
	}
	return gameObj;
}

function setRefreshPos(){
		var refresh_right= body_browse.document.getElementById('refresh_right');
		refresh_right.style.left= body_browse.document.getElementById('myTable').clientWidth*1+20+'px';
		//refresh_right.style.top= 39;
}


//检查赔率变化(有变动的赔率增加黄色背景)
function check_ioratio(rec,rtype,GameData){
	if (flash_ior_set =='Y'){
		if (""+oldObjDataFT[rec]=="undefined" || oldObjDataFT[rec].gid != GameData.gid){
			var gameObj=new Object();
			gameObj.gid=GameData.gid;
			oldObjDataFT[rec]=gameObj;
		}
		var new_ioratio=eval("GameData."+rtype);
		var old_ioratio=eval("oldObjDataFT[rec]."+rtype);
		if (""+old_ioratio=="undefined"){
			eval("oldObjDataFT[rec]."+rtype+"=GameData."+rtype);
			old_ioratio=eval("oldObjDataFT[rec]."+rtype);
		}
		//alert("old_ioratio==>"+old_ioratio+",new_ioratio==>"+new_ioratio);
		if (""+new_ioratio=="undefined" || new_ioratio==""){
			eval("oldObjDataFT[rec]."+rtype+"=GameData."+rtype);
			return;
		}
		/*
		if (parseFloat(old_ioratio)>parseFloat(new_ioratio) ){
			eval("oldObjDataFT[rec]."+rtype+"=GameData."+rtype);
			return "  style='border: 1px solid #FF0000;' ";
		}
		if (parseFloat(old_ioratio)<parseFloat(new_ioratio) ){
			eval("oldObjDataFT[rec]."+rtype+"=GameData."+rtype);
			return "  style='border: 1px solid #00FF00;' ";
		}
		*/
		if (old_ioratio!=new_ioratio && old_ioratio !="" && new_ioratio!="") {
	    	eval("oldObjDataFT[rec]."+rtype+"=GameData."+rtype);
			return "  style='background-color : yellow' ";
		}
		return true;
	}

}

function parsemore(GameData,g_more){
	var str_more = "所有玩法"
	var ret="";
	if(g_more=='0'||GameData.more=='0'){
		ret="&nbsp;";
	}else{
	 	ret="<a href=javascript: onClick=parent.show_more('"+GameData.gid+"',event);><font class='total_color'>"+str_more+" ("+GameData.more+")</font></a>";
	}	
	return ret;	
}

function show_more(gid,evt){
	evt = evt ? evt : (window.event ? window.event : null);
	var mY = evt.pageY ? evt.pageY : evt.y;
	body_browse.document.getElementById('more_window').style.position='absolute';
	body_browse.document.getElementById('more_window').style.top=mY+30;
	body_browse.document.getElementById('more_window').style.left=body_browse.document.body.scrollLeft+10;
	var  url="body_var_r_more.php?gid="+gid+"&ltype="+ltype+"&langx="+top.langx;
	body_browse.showdata.location.href = url;
}


function parseMyLove(GameData){
	var tmpStr="";
	//====== 加入現場轉播功能 2009-04-09, VideoFun 放在 flash_ior_mem.js
	tmpStr = "<table width='99%'  border='0' cellpadding='0' cellspacing='0'><tr><td align='left'>"+str_even+"</td>";				
	tmpStr+= "<td style='text-align: left;padding:0; width:29px;'>";
	tmpStr+=MM_ShowLoveI(GameData.gnum_h,GameData.datetime,GameData.league,GameData.team_h,GameData.team_c);
/*	tmpStr+= "</td>";
	tmpStr+= "<td style='text-align: right;padding:0; width:15px; padding-bottom:1px;'>";
	if (GameData.eventid != "" && GameData.eventid != "null" && GameData.eventid != undefined) {	//判斷是否有轉播
		tmpStr+= VideoFun(GameData.eventid, GameData.hot, GameData.play, "FT");
	}*/
	tmpStr+= "</td>";
	tmpStr+= "</tr></table>";

	return  tmpStr;
}

function parseMyLoveV2(GameData){
	var tmpStr="";
	//====== 加入現場轉播功能 2009-04-09, VideoFun 放在 flash_ior_mem.js
	tmpStr = "<table border='0' cellpadding='0' cellspacing='0' class='fav_tab' ><tr>";
	if(GameData.isMaster=="Y"){
		tmpStr+= "<td class='hot_star'>";
		tmpStr+=MM_ShowLoveI(GameData.gidm,GameData.datetime,GameData.league,GameData.team_h,GameData.team_c);
		tmpStr+= "</td>";
	}
	tmpStr+= "<td class='hot_tv'>";
	//if (top.casino == "SI2"||top.casino == "QQSI2") {
		if (GameData.eventid != "" && GameData.eventid != "null" && GameData.eventid != undefined) {	//判斷是否有轉播
		tmpStr+= VideoFun(GameData.eventid, GameData.hot, GameData.play, "BK");
		}
	//}
	tmpStr+= "</td>";
	tmpStr+= "</tr></table>";

	return  tmpStr;
}



//將時間 轉回 24小時//04:00p
function  change_time(get_time){
	if (get_time.indexOf("font") > 0 ) return get_time;
	if (get_time.indexOf("p")>0 || get_time.indexOf("a")>0){
		gtime=get_time.split(":");
		if (gtime[1].indexOf("p")>0){
			
			if (gtime[0]!="12"){
				gtime[0]=gtime[0]*1+12;
			}	
		}
		gtime[1]=gtime[1].replace("a","").replace("p","");
	}else{
		return get_time;
	}
	return gtime[0]+":"+gtime[1];
}

//分頁
function show_page(){
	pg_str='';
	obj_pg = body_browse.document.getElementById('pg_txt');
	if (t_page==0){
		t_page=1;
	}
	var tmp_lid="";
	if (rtype=="re"){
		tmp_lid=eval("parent."+sel_gtype+"_lid_ary_RE");
	}else{
		tmp_lid=eval("parent."+sel_gtype+"_lid_ary");
	}
	//alert(tmp_lid+"--"+top.swShowLoveI+"--"+t_page)
	if(tmp_lid=='ALL'&&!top.swShowLoveI){
		var disabled="";
		if (t_page==1){
			disabled="disabled";
		}
		var pghtml=(pg*1+1)+" / " +t_page+" "+top.page+"&nbsp;&nbsp; <select  onchange='chg_pg(this.options[this.selectedIndex].value)' "+disabled+">";
		for(var i=0;i<t_page;i++){
			if (pg==i){
		 		pghtml+="<option value='"+i+"' selected>"+(i+1)+"</option>";
		 	}else{
		  		pghtml+="<option value='"+i+"' >"+(i+1)+"</option>";
		  	}
		}
		pghtml+="</select>";
		obj_pg.innerHTML = pghtml;
	}else{
		obj_pg.innerHTML = "";
	}
}

//选中的联赛数据
function get_Leagues(ObjDataFT){
	var DateFT = new Array();
	var str_team = top.FT_lid['FT_lname_ary'].split("|");
	for(var i=0;i<ObjDataFT.length;i++){
		for(var j=0;j<str_team.length;j++){
			if(ObjDataFT[i]['league']==str_team[j].trim()){
				DateFT.push(ObjDataFT[i]);
			}
		}
	}
	return DateFT;
}


function loadingOK(){
	try{
		body_browse.document.getElementById("refresh_btn").className="refresh_btn";
	}catch(E){}
	try{
		body_browse.document.getElementById("refresh_right").className="refresh_M_btn";
	}catch(E){}
	try{	
		body_browse.document.getElementById("refresh_down").className="refresh_M_btn";
	}catch(E){}
}

var gameCount="";
var recordHash=new Array();
function showHOT(countHOT){
	if( (""+countHOT=="") || (""+countHOT=="undefined") ){
		 body_browse.document.getElementById("euro_btn").style.display="none";
		 body_browse.document.getElementById("euro_up").style.display="none";	
	}else{	
		if(""+top.hot_game=="undefined"){
			top.hot_game="";
		}	
		var gtypeHOT =new Array("FT","BK","TN","VB","BM","TT","OP");
		var countgames=countHOT.split(",");
		recordHash=new Array();
		var head_str="";
		
		if(rtype == "re"){
			head_str="RB";
		}else{
			head_str=top.head_FU;
		}
		for( var i=0;i<countgames.length;i++){
			var detailgame=countgames[i].split("|");
			recordHash[detailgame[0]+"_"+detailgame[1]]=detailgame[2]*1;
		}
		if(recordHash[top.head_gtype+"_HOT_"+head_str]*1==0){
			body_browse.document.getElementById("euro_btn").style.display="none";
			body_browse.document.getElementById("euro_up").style.display="none";
			if(top.hot_game!=""){
				top.hot_game="";
				body_browse.reload_var();
			}
		}else{
			if(isHot_game){
				if(top.hot_game!=""){
					body_browse.document.getElementById("euro_btn").style.display="none";
					body_browse.document.getElementById("euro_up").style.display="";
				}else{
					body_browse.document.getElementById("euro_btn").style.display="";
					body_browse.document.getElementById("euro_up").style.display="none";
				}
			}
		}
		try{
			parent.mem_order.getCountHOT(countHOT);
		}catch(e){}	
	}			
}
//-------------------------------------------------------------------


//--------------------------判斷聯盟顯示或隱藏--------------------------
function showLeg(leg){
	for (var i=0;i<myLeg[leg].length;i++){
	if ( body_browse.document.getElementById("TR_"+myLeg[leg][i]).style.display!="none"){
			showLegIcon(leg,"LegClose",myLeg[leg][i],"none");
				
		}else{
			showLegIcon(leg,"LegOpen",myLeg[leg][i],"");
		}
	}
	if ((""+NoshowLeg[leg])=="undefined"){
		NoshowLeg[leg]=-1;
	}else{
		NoshowLeg[leg]=NoshowLeg[leg]*-1;
	}
}

function showLegIcon(leg,state,gnumH,display){
	var  ary=body_browse.document.getElementsByName(leg);
			
	for (var j=0;j<ary.length;j++){
		ary[j].innerHTML="<span id='"+state+"'></span>";
	}
	try{
		body_browse.document.getElementById("TR3_"+gnumH).style.display=display;
	}catch(E){}
	try{
		body_browse.document.getElementById("TR2_"+gnumH).style.display=display;
	}catch(E){}
	try{
		body_browse.document.getElementById("TR1_"+gnumH).style.display=display;
	}catch(E){}
	try{
		body_browse.document.getElementById("TR_"+gnumH).style.display=display;
	}catch(E){}
}
//----------------------------------------------------------------


//======================= 加入現場轉播功能 ==========================
// 開啟轉播
function OpenLive(eventid, gtype){
	if (top.liveid == undefined) {
		parent.self.location = "";
		return;
	}
	window.open("../live/live.php?langx="+top.langx+"&liveid="+top.liveid+"&eventid="+eventid+"&gtype="+gtype,"Live","width=780,height=585,top=0,left=0,status=no,toolbar=no,scrollbars=no,resizable=no,personalbar=no");
}

function MM_ShowLoveI(gid,getDateTime,getLid,team_h,team_c){
	var txtout="";
	if(!top.swShowLoveI){
		//alert(chkRepeat(gid));
		if(!chkRepeat(gid)){	
			//txtout = "<span id='sp_"+MM_imgId(getDateTime,gid)+"'><img id='"+MM_imgId(getDateTime,gid)+"' lowsrc=\"/images/member/icon_X2.gif\" vspace=\"0\" style=\"cursor:hand;display:none;\" title=\""+top.str_ShowMyFavorite+"\" onClick=\"addShowLoveI('"+gid+"','"+getDateTime+"','"+getLid+"','"+team_h+"','"+team_c+"'); \"></span>";
			txtout = "<span id='sp_"+MM_imgId(getDateTime,gid)+"'><div id='"+MM_imgId(getDateTime,gid)+"' class=\"fov_icon_out\" style=\"cursor:hand;display:none;\" title=\""+top.str_ShowMyFavorite+"\" onClick=\"addShowLoveI('"+gid+"','"+getDateTime+"','"+getLid+"','"+team_h+"','"+team_c+"'); \"></div></span>";
		}else{
			//txtout = "<span id='sp_"+MM_imgId(getDateTime,gid)+"'><img lowsrc=\"/images/member/love_small.gif\" style=\"cursor:hand\" title=\""+top.str_delShowLoveI+"\" onClick=\"chkDelshowLoveI('"+getDateTime+"','"+gid+"'); \"></span>";
			txtout = "<span id='sp_"+MM_imgId(getDateTime,gid)+"'><div class=\"fov_icon_on\" style=\"cursor:hand\" title=\""+top.str_delShowLoveI+"\" onClick=\"chkDelshowLoveI('"+getDateTime+"','"+gid+"'); \"></div></span>";
		}
	}else{
		//txtout = "<img lowsrc=\"/images/member/love_small.gif\" style=\"cursor:hand\" title=\""+top.str_delShowLoveI+"\" onClick=\"chkDelshowLoveI('"+getDateTime+"','"+gid+"'); \">";
		txtout = "<div class=\"fov_icon_on\" style=\"cursor:hand\" title=\""+top.str_delShowLoveI+"\" onClick=\"chkDelshowLoveI('"+getDateTime+"','"+gid+"'); \"></div>";
	}
	return txtout;
}

function chkRepeat(gid){
	var getGtype =getGtypeShowLoveI();
	var sw =false;
	for (var i=0 ; i < top.ShowLoveIarray[getGtype].length ; i++){
		if(top.ShowLoveIarray[getGtype][i][0]==gid)
			sw =true;
	}
	return sw;
}

function VideoFun(eventid, hot, play, gtype) {
	var tmpStr = "";
	if (play == "Y") {
		//tmpStr+= "<img src=\"/images/member/video_1.gif\" onClick=\"parent.OpenLive('"+eventid+"','"+gtype+"')\" style=\"cursor:hand\">";
		tmpStr= "<span ><div style=\"cursor:hand\" class=\"tv_icon_on\" onClick=\"parent.OpenLive('"+eventid+"','"+gtype+"')\"></div></span>";
	} else {
		//tmpStr+= "<img lowsrc=\"/images/member/video_2.gif\">";
		tmpStr= "<span ><div  class=\"tv_icon_out\"></div></span>";
	}
	return tmpStr;
}

function MM_IdentificationDisplay(time,gid){
	var getGtype = getGtypeShowLoveI();
	var txt_array = top.ShowLoveIOKarray[getGtype];
	if(top.swShowLoveI){
		var tmp = time.split("<br>")[0];
		if(txt_array.length==0)return true;
		if(txt_array.indexOf(tmp+gid +",",0)== -1)
			return true;
	}
}

function MM_imgId(time,gid){	
	var tmp = time.split("<br>")[0];
	return tmp+gid;
}

function getGtypeShowLoveI(){
	var Gtype;
	var getGtype =sel_gtype;
	var getRtype =rtype;
	Gtype =getGtype;
	if(getRtype=="re"){
		Gtype +="RE";
	}
	return Gtype;
}
//-------------------------------------------------------------------------



//------------------------新過關變色直接新增功能-------------------max 2010/10
top.orderArray=new Array();
top.ordergid=new Array();
function resort(ary){
	var tempary=new Array();
	for(var i=0;i<ary.length;i++){
		if (ary[i]!=0){
			tempary[tempary.length]=ary[i];
		}
	}
	return tempary;
}
 
 
//去除所有订单
function orderRemoveALL(){
	for(var i=0;i < top.ordergid.length;i++){
		orderRemoveGidBgcolor(top.ordergid[i]);		
	}
	top.orderArray=new Array();
	top.ordergid=new Array();
}

//重新將選過的單子秀出來
function orderShowSelALL(){
	for(var i=0;i < top.ordergid.length;i++){
		var obj=top.orderArray["G"+top.ordergid[i]];
		try{
			var classary=(body_browse.document.getElementById(obj.gid+"_"+obj.wtype).className).split("_");
			body_browse.document.getElementById(obj.gid+"_"+obj.wtype).className="pr_"+classary[1];
		}catch(E){}	
	}
}
 
function orderRemoveGid(removeGid){
	for(var i=0;i < top.ordergid.length;i++){
		var obj=top.orderArray["G"+top.ordergid[i]];
		if (obj.gid==removeGid || obj.hgid==removeGid){
			orderRemoveGidBgcolor(top.ordergid[i]);
			top.orderArray["G"+top.ordergid[i]]="undefined";
			top.ordergid[i]=0;	
		} 
	}
	top.ordergid=resort(top.ordergid);	
}

function orderRemoveGidBgcolor(gidm){
	var tmpobj=top.orderArray["G"+gidm];
	try{
		var classary=( body_browse.document.getElementById(tmpobj.gid+"_"+tmpobj.wtype).className).split("_");
		body_browse.document.getElementById(tmpobj.gid+"_"+tmpobj.wtype).className="b_"+classary[1];
	}catch(E){}
}
 
function orderParlay(gidm,gid,hgid,wtype,par_minlimit,par_maxlimit){
	if (""+top.orderArray["G"+gidm]=="undefined"){
		top.ordergid[top.ordergid.length]=gidm;
	}else{
		orderRemoveGidBgcolor(gidm);
		
		var tmp_obj=top.orderArray["G"+gidm];
		if (tmp_obj.wtype==wtype&&tmp_obj.gid==gid){
			orderRemoveGid(gid);
			if (top.ordergid.length > 0){
				orderParlayParam();
			}else{
				
					try{
						parent.mem_order.close_bet();	
					}catch(E){}
			}
			return;
		}	
	}	
	try{
		//alert(gid+"_"+wtype+","+body_browse.document.getElementById(gid+"_"+wtype).className);
		var classary=(body_browse.document.getElementById(gid+"_"+wtype).className).split("_");
		//alert(classary.length);
		body_browse.document.getElementById(gid+"_"+wtype).className="pr_"+classary[1];
	}catch(E){
		//alert("找不到標籤")	
	}
	//var gameparam="game1="+wtype+"&game_id1="+gid+"&Hgame_id1="+hgid;
	var orderobj=new Object();
	orderobj.wtype=wtype;
	orderobj.gid=gid;
	orderobj.hgid=hgid;
	orderobj.par_minlimit=par_minlimit;
	orderobj.par_maxlimit=par_maxlimit;
	//orderobj.gameparam=gameparam;
	top.orderArray["G"+gidm]=orderobj;
	//alert(ordergid.length);
	orderParlayParam();
	
	}

function orderParlayParam(){
	var param="";
	for(var i=0;i < top.ordergid.length;i++){
		var obj=top.orderArray["G"+top.ordergid[i]];
		if (i!=0) param+="&";
		gameparam="game"+(i+1)+"="+obj.wtype+"&game_id"+(i+1)+"="+obj.gid+"&Hgame_id"+(i+1)+"="+obj.hgid+"&minlimit"+(i+1)+"="+obj.par_minlimit+"&maxlimit"+(i+1)+"="+obj.par_maxlimit;
		param+=gameparam;
	}
	var gtype = top.head_gtype;
	parent.paramData=new Array();
	
	parent.mem_order.betOrder(gtype,'P3',"teamcount="+top.ordergid.length+"&uid="+top.uid+"&langx="+top.langx+"&"+param);
}





//---------------------------------------------------------------------------
