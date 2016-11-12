//--------------------------------public function ----------------------------

function setRefreshPos(){
		var refresh_right= body_browse.document.getElementById('refresh_right');
		refresh_right.style.left= body_browse.document.getElementById('myTable').clientWidth*1+20;
		//refresh_right.style.top= 39;
	}
 
function parseArray(gameHead,gameData){
	var gameObj=new Object();
	for (var i=0;i<gameHead.length;i++){
		if (gameHead[i]!=""){	
			eval("gameObj."+gameHead[i]+"='"+gameData[i]+"'");
		}
	}
	return gameObj;
}
 
 
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

//--------------------------------------------------------------------------------
 

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
 

function dis_ShowLoveI(){
 
if(top.swShowLoveI){
  body_browse.document.getElementById("sel_league").style.display="none";
 }else{
  body_browse.document.getElementById("sel_league").style.display="";
 }
 
}
 
 
function changeTitleStr(s,at){
	if (s.charAt(at)=="H"){
		return "H";
	}else if(s.charAt(at)=="C"){
		return "A";
	}else if(s.charAt(at)=="N"){
		return "D";
	}
	return "";
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
	var gtypeHOT =new Array("FT","BK","TN","VB","OP");
	var countgames=countHOT.split(",");
	recordHash=new Array();
	var head_str="";
	rtype = "re";
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
		if(top.hot_game!=""){
			body_browse.document.getElementById("euro_btn").style.display="none";
			body_browse.document.getElementById("euro_up").style.display="";
		}else{
			body_browse.document.getElementById("euro_btn").style.display="";
			body_browse.document.getElementById("euro_up").style.display="none";
		}
		//body_browse.document.getElementById("euro_close").style.display="none";	
	}
	//alert(recordHash[top.head_gtype+"_HOT_RB"]);
	//alert(recordHash[top.head_gtype+"_HOT_FT"]);
	//alert(recordHash[top.head_gtype+"_HOT_FU"]);
	//parent.mem_order.showHOT(recordHash[top.head_gtype+"_HOT_FT"],recordHash[top.head_gtype+"_HOT_FU"]);
	//parent.mem_order.showHOT(recordHash["FT_HOT_FT"],recordHash["FT_HOT_FU"]);
	/*
	var today_hot=0;
	var early_hot=0;
	for( var i=0;i<gtypeHOT.length;i++){
		try{
		parent.mem_order.document.getElementById(gtypeHOT[i]+"_FT").innerHTML=eval("top.str_"+gtypeHOT[i]) + "("+recordHash[gtypeHOT[i]+"_HOT_FT"]+")";
		parent.mem_order.document.getElementById(gtypeHOT[i]+"_FU").innerHTML=eval("top.str_"+gtypeHOT[i]) + "("+recordHash[gtypeHOT[i]+"_HOT_FU"]+")";
		}catch(E){}
			
		today_hot +=recordHash[gtypeHOT[i]+"_HOT_FT"];
		early_hot +=recordHash[gtypeHOT[i]+"_HOT_FU"];
	}	
	
		parent.mem_order.showHOT(today_hot,early_hot);
	*/	
	try{
		parent.mem_order.getCountHOT(countHOT);
	}catch(e){}
		
 }		
 	
}


//=========================左侧页面加载 Start=================================
function bodyLoad(){
	close_bet();
	setMsg(msg);
	scroll();
	try{
		getCountHOT(countHOT);
		goRB();
		document.getElementById('euro_open').style.zIndex=-1;
	}catch(e){
		document.getElementById('euro_open').style.display='none';
	}	
}

window.onresize = scroll;

//显示公告
function setMsg(msg){
	document.getElementById('real_msg').innerHTML=msg;
}

function close_bet(){
	document.getElementById('pls_bet').style.display="none";
	document.getElementById('bet_order_frame').height =0;
	bet_order_frame.document.close();
	
	bet_order_frame.document.writeln("<html><link href=\"../css/sport/mem_order_sel.css\" rel=\"stylesheet\" type=\"text/css\">");
	bet_order_frame.document.writeln("<body class=\"bet_info\" style='margin:0;'>");
	
	bet_order_frame.document.writeln(document.getElementById('pls_bet').innerHTML);
	bet_order_frame.document.writeln("</body></html>");
	document.getElementById('bet_order_frame').height = bet_order_frame.document.body.scrollHeight;
	document.getElementById('info_div').style.display='';
	top.scripts=new Array();
	top.keepGold="";
	top.keepGold_PR="";
	try{
		parent.body.orderRemoveALL();
	}catch (E) {}
		
	top.open_bet="";					
}

var recordHash=new Array();
function getCountHOT(countHOT){
	var countgtype =new Array("FT","BK","TN","VB","BS","OP","BM","TT");
	var countgames=countHOT.split(",");
	for( var i=0;i<countgames.length;i++){
		var detailgame=countgames[i].split("|");
		recordHash[detailgame[0]+"_"+detailgame[1]]=detailgame[2]*1;
	}
	return showHOT();	
}

//左侧滚球列表数据显示
function showHOT(){
	if(top.open_bet =="Y" || mem_enable=="S" || top.open_Rec=="Y"){
		document.getElementById('euro_open').style.display="none";	
	}else{
	  var countgtype =new Array("FT","BK","TN","VB","BS","OP","BM","TT");
	  var today_RB=0;	//滚球总数
	  for( var i=0;i<countgtype.length;i++){
			today_RB +=recordHash[countgtype[i]+"_RB"];		
			var tmp_obj_RB=document.getElementById(countgtype[i]+"_RB");
					tmp_obj_RB.innerHTML=eval("top.str_order_"+countgtype[i]) + "("+recordHash[countgtype[i]+"_RB"]+")";					
					if(recordHash[countgtype[i]+"_RB"]*1==0){
						tmp_obj_RB.style.display="none";
					}else{
						tmp_obj_RB.style.display="";
					}			
		}  			
		if (today_RB > 0) {
			document.getElementById('euro_open').style.display="";
		}else{
			document.getElementById('euro_open').style.display="none";
		}			
 	} 	
}

//公告滚动
function scroll(){
	var refresh_right = document.getElementById('info_div');
	var msg_height=(refresh_right.style.height.replace("px","")*1);
	var recframe=document.getElementById('rec_frame');
	refresh_right.style.top=document.body.scrollHeight - msg_height-15;
}

//滚球列表显示
function goRB(){
	document.getElementById('RB_btn').className="rb_over";						
	document.getElementById('RB_oly').style.display="";
}
 
//==========================左侧页面加载 Start================================



function showOrder(){
	
	try{
		bet_order_frame.resetTimer();
	}catch(e){}
	document.getElementById('rec_frame').height=0;
	rec_frame.document.close();
//	document.getElementById('order_button').className="ord_on";
	document.getElementById('record_button').className="record_btn";
	var betDiv=document.getElementById('bet_div');
	var rec5Div=document.getElementById('rec5_div');
	betDiv.style.display="";
	rec5Div.style.display="none";
	document.getElementById('pls_bet').style.display="none";
	document.getElementById('info_div').style.display='';
	//document.getElementById('switch_web').style.display="";
	//scroll();
	
	top.open_Rec="";
	try{
		//var gamecountHot=parent.body.getCountHOT();
		getCountHOT(countHOT);
	}catch(e){
		document.getElementById('euro_open').style.display='none';
	}		
}

function showRec(){
 
	try{
		bet_order_frame.clearAllTimer();
	}catch(e){}
	try{		
		close_bet();
	}catch(e){}
	//	bet_order_frame.document.close();
	
	document.getElementById('order_button').className="ord_btn";
	document.getElementById('record_button').className="record_on";
	//document.getElementById('info_div').style.display='none';
	
	var betDiv=document.getElementById('bet_div');
	var rec5Div=document.getElementById('rec5_div');
	
	betDiv.style.display="none";
	rec5Div.style.display="";
	rec5_div.focus();
	//alert(top.uid);
	rec_frame.location.replace("./today/show10rec.do?uid="+top.uid+"&langx="+top.langx);
	document.getElementById('pls_bet').style.display="none";
	
	try{	
		if(tenrec_id ==""){
			top.open_Rec="";
		}else{
			top.open_Rec="Y";
		}	
	}catch(e){}	
		
	try{
		getCountHOT(countHOT);
	}catch(e){
		document.getElementById('euro_open').style.display='none';
	}			
}

function onloadSet(w,h,frameName){
	document.getElementById(frameName).width  =216;
	document.getElementById(frameName).height =h;
	document.getElementById('pls_bet').style.display="none";
	if (frameName=="rec_frame"){
		try{	
			if(tenrec_id!=""){
				top.open_Rec="Y";
				document.getElementById('info_div').style.display='none';
				document.getElementById('euro_open').style.display='none';
			}else{
				top.open_Rec="";
			}	
		}catch(e){}	
			
		try{
			getCountHOT(countHOT);
		}catch(e){
			document.getElementById('euro_open').style.display='none';
		}		
	}
}

//投注
function betOrder(gtype,wtype,param){
	if (wtype=="P3"||wtype=="PR"){
	}else{
		top.keepGold="";
		top.keepGold_PR="";
	}
	top.ioradio="";
	var url=parseUrl(gtype,wtype,param);
	document.getElementById('order_button').className="ord_on";
	document.getElementById('record_button').className="record_btn";
	document.getElementById('pls_bet').style.display="none";
	document.getElementById('rec_frame').height=0;
	rec_frame.document.close();
	document.getElementById('rec5_div').style.display="none";
	document.getElementById('bet_div').style.display="";
	bet_order_frame.location.replace(url);
	document.getElementById('info_div').style.display='none';
	document.getElementById('euro_open').style.display="none";
 
	top.open_bet="Y";	
	top.open_Rec="";
}
function parseUrl(gtype,wtype,param){
	var urlArray=new Array();
	urlArray['R']=new Array("../bet.do?urlType=r");
	urlArray['HR']=new Array("../bet.do?urlType=hr");
	urlArray['OU']=new Array("../bet.do?urlType=ou");
	urlArray['HOU']=new Array("../bet.do?urlType=hou");
	urlArray['M']=new Array("../bet.do?urlType=m");
	urlArray['HM']=new Array("../bet.do?urlType=hm");
	urlArray['EO']=new Array("../bet.do?urlType=t");
	urlArray['PD']=new Array("../bet.do?urlType=pd");
	urlArray['HPD']=new Array("../bet.do?urlType=hpd");
	urlArray['F']=new Array("../bet.do?urlType=f");
	urlArray['T']=new Array("../bet.do?urlType=t");
	urlArray['SP']=new Array("../bet.do?urlType=sp");
	urlArray['P']=new Array("../bet.do?urlType=p");
	urlArray['P3']=new Array(ctx+"/football/bet.do?urlType=p3");
	urlArray['PR']=new Array("../bet.do?urlType=pr");
	urlArray['RE']=new Array("../bet.do?urlType=re");
	urlArray['HRE']=new Array("../bet.do?urlType=hre");
	urlArray['ROU']=new Array("../bet.do?urlType=rou");
	urlArray['HROU']=new Array("../bet.do?urlType=hrou");
	urlArray['RM']=new Array("../bet.do?urlType=rm");
	urlArray['HRM']=new Array("../bet.do?urlType=hrm");
	urlArray['NFS']=new Array("../bet.do?urlType=nfs");
	urlArray['REO']=new Array("../bet.do?urlType=rt");
	
	urlArray['RPD']=new Array("../bet.do?urlType=rpd");
	urlArray['RT']=new Array("../bet.do?urlType=rt");
	urlArray['RF']=new Array("../bet.do?urlType=rf");
	
	//篮球
	urlArray['ROUH']=new Array("../bet.do?urlType=rouhc");
	urlArray['ROUC']=new Array("../bet.do?urlType=rouhc");
	urlArray['OUH']=new Array("../bet.do?urlType=ouhc");
	urlArray['OUC']=new Array("../bet.do?urlType=ouhc");
	
	var url=urlArray[wtype]+"&"+param+"&gtype="+gtype;
	return url;
}



function Show10List(){
	var objs=document.getElementById('reloaddo');
    if (parent.refresh_var=='Y'||(""+parent.refresh_var=="undefined")){
    	objs.src = "./today/show10rec.do?uid="+top.uid;
    }else{
    	objs.src="../../../tpl/member/"+top.langx+"/show10rec_norefresh.html?uid="+top.uid;
    }
}
 
function show_record(){
	if (parent.show=='N'||(""+parent.show=="undefined")){
		parent.show='';
	}else{
		parent.show='N';
	}
	self.location = "./select.do?uid="+top.uid+"&langx="+top.langx+"$mtype="+top.mtype+"&show="+parent.show;
}

function reload_var(){
	parent.refresh_var='Y';
	self.location.reload();
}

function Hot_click(a,b,c){
    parent.location=a+"&league_id=3";
}

function OpenLive(){
	if (top.liveid == undefined) {
		parent.self.location = "";
		return;
	}
	window.open("./live/live.do?langx="+top.langx+"&uid="+top.uid+"&liveid="+top.liveid,"Live","width=780,height=580,top=0,left=0,status=no,toolbar=no,scrollbars=yes,resizable=no,personalbar=no");
}
 
var ObjDataLive=new Array();
function reload_live_game(Game_Head,gamedata){
	for (var j=0;j < gamedata.length;j++){
		if (gamedata[j]!=null){
			ObjDataLive[j]=parseArray(Game_Head,gamedata[j]);
		}	
	}
	var showtableData;
	var trdata;
	if(document.all){
		showtableData=document.getElementById('livetableData').innerText;
	 	trdata=document.getElementById('DataTR').innerText;
	} else{
		showtableData=document.getElementById('livetableData').textContent;
	 	trdata=document.getElementById('DataTR').textContent;
	}
	var showlayers="";
	if(ObjDataLive.length > 0){
		for ( i=0 ;i < ObjDataLive.length;i++){
			showlayers+=getLayer(trdata,i);
		}
	}else{
		var tmp_layer=trdata;
		tmp_layer=tmp_layer.replace("*TIME*","");
		tmp_layer=tmp_layer.replace("*TEAMS*","<?=$wuzhi?>");
		showlayers = tmp_layer;
	}
	var showtable=document.getElementById('showLive_table');
	showtableData=showtableData.replace("*showDataTR*",showlayers);
	showtable.innerHTML=showtableData;
}

//
function getLayer(onelayer,gamerec){
	onelayer=onelayer.replace("*TIME*",ObjDataLive[gamerec].time+":");
	onelayer=onelayer.replace("*TEAMS*",ObjDataLive[gamerec].teamH+" VS "+ObjDataLive[gamerec].teamC);
	return onelayer; 
	
}
 
 
//window.onscroll = scroll;
 


function showMoreMsg(){
	//parent.body.location='./scroll_history.do?uid='+top.uid+'&langx='+top.langx;
	window.open('./scroll_history.do?uid='+top.uid+'&langx='+top.langx,"History","width=617,height=500,top=0,left=0,status=no,toolbar=no,scrollbars=yes,resizable=no,personalbar=no");
}

var xmlHttp;
function createXHR(){
 if (window.XMLHttpRequest) {
  xmlHttp = new XMLHttpRequest();
 }else if (window.ActiveXObject) {
  xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
 }
 
 if (!xmlHttp) {
  alert('<?=$xmlhttpis?>');
  return false;
 }
}

function sendRequest(url){

 createXHR();
 xmlHttp.open('GET',url,true);
 xmlHttp.onreadystatechange=catchResult;
 xmlHttp.send(null);
}
 
 
 
function catchResult(){
 if (xmlHttp.readyState==4){
  s=xmlHttp.responseText;
  if (xmlHttp.status == 200) {
  document.getElementById('showURL').innerHTML=s;
  
  var obj = document.getElementById('newdomain');
  obj.submit();
  }else{
       alert('<?=$cuowu?>'+xmlHttp.status+'\('+xmlHttp.statusText+'\)');
      }
 }
}


 
function showRB(gtypeFT){
	if(recordHash[gtypeFT+"_RB"]*1==0){
		//alert(top.no_oly);
		return;		
	}	
	top.hot_game="";
	top.head_FU=gtypeFT;	
	parent.header.location.href="header.do?showtype="+top.showtype+"&langx="+top.langx+"&mtype="+top.mtype;	
	parent.body.location.href=gtypeFT+"_browse/index.do?rtype=re&langx="+top.langx+"&mtype="+top.mtype+"&showtype="+top.showtype+"&hot_game="+top.hot_game;
	parent.header.chg_button_bg(gtypeFT,"rb");	
 
}
 
function showHotFT(gtypeFT){	
	if(recordHash[gtypeFT+"_HOT_FT"]*1==0){
		//alert(top.no_oly);
		return;
	}
	top.hot_game="HOT_";
	parent.header.location.href="header.do?showtype=&langx="+top.langx+"&mtype="+top.mtype;
	//parent.body.location.href="http://"+document.domain+"/app/member/"+top.head_gtype+"_browse/index.do?rtype=r&uid="+top.uid+"&langx="+top.langx+"&mtype="+top.mtype+"&showtype="+top.showtype+"&hot_game="+top.hot_game;
	parent.body.location.href=gtypeFT+"_browse/index.do?rtype=r&langx="+top.langx+"&mtype="+top.mtype+"&showtype="+top.showtype+"&hot_game="+top.hot_game;
	parent.header.chg_button_bg(gtypeFT,"today");
 
 
}
 
function showHotFU(gtypeFU){
	if(recordHash[gtypeFU+"_HOT_FU"]*1==0){
		//alert(top.no_oly);
		return;		
	}
	top.hot_game="HOT_";
	parent.header.location.href="header.do?showtype=future&langx="+top.langx+"&mtype="+top.mtype;
	//parent.body.location.href="http://"+document.domain+"/app/member/"+top.head_gtype+"_future/index.do?rtype=r&uid="+top.uid+"&langx="+top.langx+"&mtype="+top.mtype+"&showtype=future&hot_game="+top.hot_game;
	parent.body.location.href=gtypeFU+"_future/index.do?rtype=r&langx="+top.langx+"&mtype="+top.mtype+"&showtype=future&hot_game="+top.hot_game;
	
	parent.header.chg_button_bg(gtypeFU,"early");
 
}
 
function Eurover(act){
	if(act.className=="hot_btn"){
		act.className='hot_up';
	}else if(act.className=="early_btn"){
		act.className='early_up';
	}else if(act.className=="rb_btn"){
		act.className='rb_up';
	}
}
 
function Eurout(act){
	if(act.className=="hot_up"){
		act.className='hot_btn';
	}else if(act.className=="early_up"){
		act.className='early_btn';
	}else if(act.className=="rb_up"){
		act.className='rb_btn';
	}
}
 

 

 
function goHOT_FT(){
	document.getElementById('RB_btn').className="rb_btn";
	document.getElementById('today_btn').className="hot_over";
	document.getElementById('early_btn').className="early_btn";					
	document.getElementById('RB_oly').style.display="none";
	document.getElementById('today_oly').style.display="";
	document.getElementById('early_oly').style.display="none";
}
 
function goHOT_FU(){
	document.getElementById('RB_btn').className="rb_btn";
	document.getElementById('today_btn').className="hot_btn";
	document.getElementById('early_btn').className="early_over";						
	document.getElementById('RB_oly').style.display="none";
	document.getElementById('today_oly').style.display="none";
	document.getElementById('early_oly').style.display="";
}