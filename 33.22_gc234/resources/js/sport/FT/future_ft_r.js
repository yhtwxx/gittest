function ShowGameList(){
	reTimeNow = retime;
	
	if(""+top.hot_game=="undefined"){
		top.hot_game="";
	}	
	try{
	start_time=body_browse.get_timer();
	}catch(E){}	
	if(loading == 'Y') return;
	if (parent.gamecount!=gamount){
		oldObjDataFT=new Array();
	}
	if(top.odd_f_type==""||""+top.odd_f_type=="undefined") top.odd_f_type="H";
	
	
		
	keepscroll=body_browse.document.body.scrollTop;
	

	var conscroll= body_browse.document.getElementById('controlscroll');
	/*
	if (conscroll.style.display!=""){
		conscroll.style.display="";
		step=step*-1;
		//alert(conscroll.style.top);
		
		conscroll.style.top = keepscroll+step;
		//conscroll.style.width=800;
		//conscroll.style.Height=600;
		conscroll.focus();
}
*/
		//conscroll.blur();
		//conscroll.style.top=parseInt(conscroll.style.top)-1;
	dis_ShowLoveI();
	
	//秀盤面
	showtables(GameFT,GameHead,gamount,top.odd_f_type);
  //conscroll.style.top=top.keepscroll;
	//conscroll.focus();
	
	body_browse.scroll(0,keepscroll);
	
	//設定右方重新整理位置
	setRefreshPos();

	//顯示盤口
	body_browse.ChkOddfDiv();
	//跑馬燈
//	obj_msg = body_browse.document.getElementById('real_msg');
//	obj_msg.innerHTML = '<marquee scrolldelay=\"300\">'+msg+'</marquee>';
	
	//更新秒數
	//只有 讓分/走地 才有更新時間
	//hr_info = body_browse.document.getElementById('hr_info');
	//if(retime){
	//	hr_info.innerHTML = retime+str_renew;
	//}else{
	//	hr_info.innerHTML = str_renew;
	//}
	
	parent.gamecount=gamount;
	//日期下拉霸
	
	/*if (sel_gtype=="FU"){
		if (""+body_browse.document.getElementById('g_date')!="undefined"){
			body_browse.selgdate("r",g_date);
			body_browse.document.getElementById('g_date').value=g_date;
		}
	}*/
	
	if (top.hot_game!=""){
		body_browse.document.getElementById('sel_league').style.display='none';
		show_page();
 	}else{	
 			
		if(top.showtype=='hgft'||top.showtype=='hgfu'){
			obj_sel = body_browse.document.getElementById('sel_league');
			obj_sel.style.display='none';
			try{
				var obj_date='';
				obj_date=body_browse.document.getElementById("g_date").value;
				body_browse.selgdate("",obj_date);
			}catch(E){}
		}else{
			show_page();
	  }
	}

	conscroll.style.display="none";
	coun_Leagues();
	body_browse.showPicLove();
	loadingOK();
	showHOT(gameCount);
	try{
		body_browse.document.getElementById('show_run_time').innerHTML="time:"+((body_browse.get_timer()-start_time)/1000)+"s";
	}catch(E){}
	//keep_show_more(show_more_gid,ObjDataFT,gamount);
	//parent.display_loading(false);
}

var hotgdateArr =new Array();
function hot_gdate(gdate){
	if((""+hotgdateArr).indexOf(gdate)==-1){
		hotgdateArr.push(gdate);
	}
}

//选中的联赛数
function coun_Leagues(){
	var coun=0;
	var str_tmp ="|"+eval('parent.'+sel_gtype+'_lid_ary');
	if(str_tmp=='|ALL'){
		body_browse.document.getElementById("str_num").innerHTML =top.alldata;
	}else{	
		var larray=str_tmp.split('|');
		for(var i =0;i<larray.length;i++){
			if(larray[i]!=""){coun++}
		}
		body_browse.document.getElementById("str_num").innerHTML =coun;
	}
}

//选中的联赛数据
function get_Leagues(ObjDataFT){
	var DateFT = new Array();	
	var str_team = eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lname_ary']").split("|");
	for(var i=0;i<ObjDataFT.length;i++){
		for(var j=0;j<str_team.length;j++){
			if(ObjDataFT[i]['league']==str_team[j].trim()){
				DateFT.push(ObjDataFT[i]);
			}
		}
	}
	return DateFT;
}

//表格函數
function showtables(GameData,Game_Head,data_amount,odd_f_type){
	ObjDataFT=new Array();
	myLeg=new Array();
	for (var j=0;j < data_amount;j++){
		if (GameData[j]!=null){
			ObjDataFT[j]=parseArray(Game_Head,GameData[j]);
		}
	}
	
	if(eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lname_ary']")!="ALL"){
		ObjDataFT = get_Leagues(ObjDataFT);
	}
	
	var trdata;
	var showtableData;
	if(body_browse.document.all){
	     	showtableData=body_browse.document.getElementById('showtableData').innerText ;
	     	trdata=body_browse.document.getElementById('DataTR').innerText;
	     	notrdata=body_browse.document.getElementById('NoDataTR').innerText;
	} else{
     		showtableData=body_browse.document.getElementById('showtableData').textContent ;
     	 	trdata=body_browse.document.getElementById('DataTR').textContent;
			notrdata=body_browse.document.getElementById('NoDataTR').textContent;
	}
	var showtable=body_browse.document.getElementById('showtable');
	var showlayers="";
	keepleg="";
	legnum=0;
	LeagueAry =new Array();
	var chk_Love_I=new Array();
	
	if(ObjDataFT.length > 0){
	  	for ( i=0 ;i < ObjDataFT.length;i++){
	  		tmp_Str=getLayer(trdata,i,odd_f_type);
	  		showlayers+=tmp_Str;
	  		if (top.swShowLoveI&&tmp_Str!=""){
	  			chk_Love_I.push(ObjDataFT[i]);	
	  		}
	  	}
	  	if(showlayers=="")showlayers=notrdata;
	  	showtableData=showtableData.replace("*showDataTR*",showlayers);
	}else{
	    showtableData=showtableData.replace("*showDataTR*",notrdata);
	}

	if (top.head_FU=="FT"){ 	
	  	if (top.hot_game==""){
	  		if(top.swShowLoveI){
	  			body_browse.checkLoveCount(chk_Love_I);	
	  		}		
	  	}
	}
	showtable.innerHTML=showtableData;
}

//表格內容
function getLayer(onelayer,gamerec,odd_f_type){
	var open_hot = false;
	
	if (top.hot_game==""){
		if(MM_IdentificationDisplay(ObjDataFT[gamerec].datetime,ObjDataFT[gamerec].gnum_h)) return "";
	}
	//如果有選我的最愛,選擇聯盟不判斷
//	if (!top.swShowLoveI){
//		if (top.hot_game==""){
//			if(("|"+eval('parent.'+sel_gtype+'_lname_ary')).indexOf(("|"+ObjDataFT[gamerec].league+"|"),0)==-1&&eval('parent.'+sel_gtype+'_lname_ary')!='ALL') return "";
//			if((""+LeagueAry).indexOf(ObjDataFT[gamerec].league)== -1)LeagueAry.push(ObjDataFT[gamerec].league);
//		}
//	}
	
	var tmp_date = ObjDataFT[gamerec].datetime.split("<br>")[0];
	onelayer=onelayer.replace(/\*ID_STR\*/g,tmp_date+ObjDataFT[gamerec].gnum_h);
	onelayer=onelayer.replace(/\*TR_EVENT\*/g,"onMouseOver='mouseEnter_pointer(this.id);' onMouseOut='mouseOut_pointer(this.id);'");
	
	if (""+myLeg[ObjDataFT[gamerec].league]=="undefined"){
		myLeg[ObjDataFT[gamerec].league]=ObjDataFT[gamerec].league;
		myLeg[ObjDataFT[gamerec].league]=new Array();
		myLeg[ObjDataFT[gamerec].league][0]=tmp_date+ObjDataFT[gamerec].gnum_h;
	}else{
		myLeg[ObjDataFT[gamerec].league][myLeg[ObjDataFT[gamerec].league].length]=tmp_date+ObjDataFT[gamerec].gnum_h;
	}

	//--------------判斷聯盟名稱列顯示或隱藏----------------
	if (ObjDataFT[gamerec].league==keepleg){
			onelayer=onelayer.replace("*ST*"," style='display: none;'");
	}else{
			onelayer=onelayer.replace("*ST*"," style='display: ;'");
	}
	//------------------------------------------------------
	//--------------判斷聯盟底下的賽事顯示或隱藏----------------
	if (NoshowLeg[ObjDataFT[gamerec].league]==-1){
		onelayer=onelayer.replace(/\*CLASS\*/g,"style='display: none;'");
		onelayer=onelayer.replace("*LegMark*","<span id='LegClose'></span>"); //聯盟的小圖
	}else{
		onelayer=onelayer.replace(/\*CLASS\*/g,"style='display: ;'");
		onelayer=onelayer.replace("*LegMark*","<span id='LegOpen'></span>");  //聯盟的小圖
	}
	//---------------------------------------------------------------------
	
	var R_ior =Array();
	var OU_ior =Array();
	var HR_ior =Array();
	var HOU_ior =Array();
	var EO_ior =Array();
	
	R_ior  = get_other_ioratio(odd_f_type, ObjDataFT[gamerec].ior_RH   , ObjDataFT[gamerec].ior_RC   , show_ior);
	OU_ior = get_other_ioratio(odd_f_type, ObjDataFT[gamerec].ior_OUH  , ObjDataFT[gamerec].ior_OUC  , show_ior);
	HR_ior = get_other_ioratio(odd_f_type, ObjDataFT[gamerec].ior_HRH  , ObjDataFT[gamerec].ior_HRC  , show_ior);
	HOU_ior= get_other_ioratio(odd_f_type, ObjDataFT[gamerec].ior_HOUH , ObjDataFT[gamerec].ior_HOUC , show_ior);
	
	if((ObjDataFT[gamerec].ior_EOO != 0) && (ObjDataFT[gamerec].ior_EOE != 0)){
		EO_ior= get_other_ioratio("H", ObjDataFT[gamerec].ior_EOO*1-1 , ObjDataFT[gamerec].ior_EOE*1-1 , show_ior);
		ObjDataFT[gamerec].ior_EOO=EO_ior[0]*1+1;
		ObjDataFT[gamerec].ior_EOE=EO_ior[1]*1+1;
	}
	
	ObjDataFT[gamerec].ior_RH=R_ior[0];
	ObjDataFT[gamerec].ior_RC=R_ior[1];
	ObjDataFT[gamerec].ior_OUH=OU_ior[0];
	ObjDataFT[gamerec].ior_OUC=OU_ior[1];
	ObjDataFT[gamerec].ior_HRH=HR_ior[0];
	ObjDataFT[gamerec].ior_HRC=HR_ior[1];
	ObjDataFT[gamerec].ior_HOUH=HOU_ior[0];
	ObjDataFT[gamerec].ior_HOUC=HOU_ior[1];

	//滾球字眼
	ObjDataFT[gamerec].datetime=ObjDataFT[gamerec].datetime.replace("Running Ball",top.str_RB);
	keepleg=ObjDataFT[gamerec].league;
	onelayer=onelayer.replace(/\*LEG\*/gi,ObjDataFT[gamerec].league);

	var tmp_date=ObjDataFT[gamerec].datetime.split("<br>");
	if (sel_gtype=="FU"){
		tmp_date_str=tmp_date[0]+"<br>"+change_time(tmp_date[1]);
	}else{
		tmp_date_str=change_time(tmp_date[1]);
	}
	if (tmp_date.length==3){
		tmp_date_str+="<br>"+tmp_date[2];
	}
	
	onelayer=onelayer.replace("*DATETIME*",tmp_date_str);
	onelayer=onelayer.replace("*TEAM_H*",ObjDataFT[gamerec].team_h.replace("[Mid]","<font color=\"#005aff\">[N]</font>").replace("[中]","<font color=\"#005aff\">[中]</font>").replace("#FFFF99",""));
	onelayer=onelayer.replace("*TEAM_C*",ObjDataFT[gamerec].team_c.replace("#FFFF99",""));
	
	//全場
	//獨贏
	if ((ObjDataFT[gamerec].ior_MH*1 > 0) && (ObjDataFT[gamerec].ior_MC*1 > 0)){
		onelayer=onelayer.replace("*RATIO_MH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"M"));
		onelayer=onelayer.replace("*RATIO_MC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"M"));
		if ((ObjDataFT[gamerec].ior_MN*1) > 0){
			onelayer=onelayer.replace("*RATIO_MN*",parseUrl(odd_f_type,"N",ObjDataFT[gamerec],gamerec,"M"));
		}else{
			onelayer=onelayer.replace("*RATIO_MN*","&nbsp;");
		}
	}else{
		onelayer=onelayer.replace("*RATIO_MH*","&nbsp;");
		onelayer=onelayer.replace("*RATIO_MC*","&nbsp;");
		onelayer=onelayer.replace("*RATIO_MN*","&nbsp;");
	}
	//讓球
	if (ObjDataFT[gamerec].strong=="H"){
		onelayer=onelayer.replace("*CON_RH*",ObjDataFT[gamerec].ratio);	/*讓球球頭*/
		onelayer=onelayer.replace("*CON_RC*","");
	}else{
		onelayer=onelayer.replace("*CON_RH*","");
		onelayer=onelayer.replace("*CON_RC*",ObjDataFT[gamerec].ratio);
	}

	onelayer=onelayer.replace("*RATIO_RH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"R"));/*讓球賠率*/
	onelayer=onelayer.replace("*RATIO_RC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"R"));
	//大小
	if (top.langx=="en-us"){
		onelayer=onelayer.replace("*CON_OUH*",ObjDataFT[gamerec].ratio_o.replace("O","o") );	/*大小球頭*/
		onelayer=onelayer.replace("*CON_OUC*",ObjDataFT[gamerec].ratio_u.replace("U","u") );
	}else{
		onelayer=onelayer.replace("*CON_OUH*",ObjDataFT[gamerec].ratio_o.replace("O",top.strOver));	/*大小球頭*/
		onelayer=onelayer.replace("*CON_OUC*",ObjDataFT[gamerec].ratio_u.replace("U",top.strUnder));
	}
	onelayer=onelayer.replace("*RATIO_OUH*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"OU"));/*大小賠率*/
	onelayer=onelayer.replace("*RATIO_OUC*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"OU"));
	//單雙
	if (top.langx=="en-us"){
	onelayer=onelayer.replace("*RATIO_EOO*",ObjDataFT[gamerec].str_odd+parseUrl(odd_f_type,"O",ObjDataFT[gamerec],gamerec,"EO"));
  	onelayer=onelayer.replace("*RATIO_EOE*",ObjDataFT[gamerec].str_even+parseUrl(odd_f_type,"E",ObjDataFT[gamerec],gamerec,"EO"));
	}else{
	onelayer=onelayer.replace("*RATIO_EOO*",ObjDataFT[gamerec].str_odd+parseUrl(odd_f_type,"O",ObjDataFT[gamerec],gamerec,"EO"));
  	onelayer=onelayer.replace("*RATIO_EOE*",ObjDataFT[gamerec].str_even+parseUrl(odd_f_type,"E",ObjDataFT[gamerec],gamerec,"EO"));	
		}
	//上半場
	//獨贏
	if ((ObjDataFT[gamerec].ior_HMH*1 > 0) && (ObjDataFT[gamerec].ior_HMC*1 > 0)){
		onelayer=onelayer.replace("*RATIO_HMH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"HM"));
		onelayer=onelayer.replace("*RATIO_HMC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"HM"));
		if ((ObjDataFT[gamerec].ior_HMN*1) > 0){
			onelayer=onelayer.replace("*RATIO_HMN*",parseUrl(odd_f_type,"N",ObjDataFT[gamerec],gamerec,"HM"));
		}else{
			onelayer=onelayer.replace("*RATIO_HMN*","&nbsp;");
		}
	}else{
		onelayer=onelayer.replace("*RATIO_HMH*","&nbsp;");
		onelayer=onelayer.replace("*RATIO_HMC*","&nbsp;");
		onelayer=onelayer.replace("*RATIO_HMN*","&nbsp;");
	}
		
	//讓球
	if (ObjDataFT[gamerec].hstrong=="H"){
		onelayer=onelayer.replace("*CON_HRH*",ObjDataFT[gamerec].hratio);	/*讓球球頭*/
		onelayer=onelayer.replace("*CON_HRC*","");
	}else{
		onelayer=onelayer.replace("*CON_HRH*","");
		onelayer=onelayer.replace("*CON_HRC*",ObjDataFT[gamerec].hratio);
	}
	onelayer=onelayer.replace("*RATIO_HRH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"HR"));/*讓球賠率*/
	onelayer=onelayer.replace("*RATIO_HRC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"HR"));
	//大小
	if (top.langx=="en-us"){
		onelayer=onelayer.replace("*CON_HOUH*",ObjDataFT[gamerec].hratio_o.replace("O","o") );	/*大小球頭*/
		onelayer=onelayer.replace("*CON_HOUC*",ObjDataFT[gamerec].hratio_u.replace("U","u") );
	}else{
		onelayer=onelayer.replace("*CON_HOUH*",ObjDataFT[gamerec].hratio_o.replace("O",top.strOver));	/*大小球頭*/
		onelayer=onelayer.replace("*CON_HOUC*",ObjDataFT[gamerec].hratio_u.replace("U",top.strUnder));
	}
	onelayer=onelayer.replace("*RATIO_HOUH*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"HOU"));/*大小賠率*/
	onelayer=onelayer.replace("*RATIO_HOUC*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"HOU"));
	onelayer=onelayer.replace("*MORE*",parsemore(ObjDataFT[gamerec],game_more));
	//我的最愛
	onelayer=onelayer.replace("*MYLOVE*",parseMyLove(ObjDataFT[gamerec]));

	if (ObjDataFT[gamerec].eventid != "" && ObjDataFT[gamerec].eventid != "null" && ObjDataFT[gamerec].eventid != undefined) {	//判斷是否有轉播
		tmpStr= VideoFun(ObjDataFT[gamerec].eventid, ObjDataFT[gamerec].hot, ObjDataFT[gamerec].play, "FT");
		onelayer=onelayer.replace("*TV*",tmpStr);
	}
	onelayer=onelayer.replace("*TV*","");
	
	return onelayer;
}

//----------------------
//取得下注的url(投注地址、赔率)
function parseUrl(odd_f_type,betTeam,GameData,gamerec,wtype){
	
	var urlArray=new Array();
	urlArray['R']=new Array("football/FT_order/FT_order_r.php",eval("GameData.team_"+betTeam.toLowerCase()));
	urlArray['HR']=new Array("football/FT_order/FT_order_hr.php",eval("GameData.team_"+betTeam.toLowerCase()));
	urlArray['OU']=new Array("football/FT_order/FT_order_ou.php",(betTeam=="C" ? top.strOver : top.strUnder));
	urlArray['HOU']=new Array("football/FT_order/FT_order_hou.php",(betTeam=="C" ? top.strOver : top.strUnder));
	urlArray['M']=new Array("football/FT_order/FT_order_m.php",(betTeam=="N" ? top.str_irish_kiss : eval("GameData.team_"+betTeam.toLowerCase())));
	urlArray['HM']=new Array("football/FT_order/FT_order_hm.php",(betTeam=="N" ? top.str_irish_kiss : eval("GameData.team_"+betTeam.toLowerCase())));
	urlArray['EO']=new Array("football/FT_order/FT_order_t.php", (betTeam=="O"  ? top.str_o : top.str_e));

	var param=getParam(odd_f_type,betTeam,wtype,GameData);
//	var order=urlArray[wtype][0];
	var team=urlArray[wtype][1].replace("[Mid]","[N]").replace("<font style=background-color:#FFFF99>","").replace("</font>","");
	var tmp_rtype="ior_"+wtype+betTeam;
	var ioratio_str="GameData."+tmp_rtype;		//赔率
	var ioratio=eval(ioratio_str);
	if(eval(ioratio_str)!=""){
		ioratio=Mathfloor(ioratio);
		ioratio=printf(ioratio,2);
	}
	
	//20121023 max新增 輸水盤 負值顯示藍色
	if (odd_f_type=="M" || odd_f_type=="I"){
		if (ioratio<0) ioratio="<font color=#1f497d>"+ioratio+"</font>";
	}
	
	var ret="<a href='javascript://' onclick=\"parent.parent.mem_order.betOrder('FT','"+wtype+"','"+param+"');\" title='"+team+"'><font "+check_ioratio(gamerec,tmp_rtype,GameData)+">"+ioratio+"</font></a>";
	return ret;
}

function Mathfloor(z){
	var tmp_z;
	tmp_z=(Math.floor(z*100+0.01))/100;
 	return tmp_z;
}

function keep_show_more(gid,GameFT,gamount){
	if(gid!=''){
		show_more_gid = '';
		for (var j=0;j < gamount;j++){
			if(gid == GameFT[j].gid  && GameFT[j].more != 0){
				//body_browse.showdata.location.reload();
				show_more_gid = gid;
				return;
			}
		}
	}
	body_browse.document.getElementById('more_window').style.display='none';
}

//取得下注參數
function getParam(odd_f_type,betTeam,wtype,GameData){
	var paramArray=new Array();
	paramArray['R']=new Array("gid","odd_f_type","type","gnum","strong","langx");
	paramArray['HR']=new Array("gid","odd_f_type","type","gnum","strong","langx");
	paramArray['OU']=new Array("gid","odd_f_type","type","gnum","langx");
	paramArray['HOU']=new Array("gid","odd_f_type","type","gnum","langx");
	paramArray['M']=new Array("gid","odd_f_type","type","gnum","langx");
	paramArray['HM']=new Array("gid","odd_f_type","type","gnum","langx");
	paramArray['EO']=new Array("gid","odd_f_type","rtype","langx");

	var param="";
	var gid=((wtype=="R"||wtype=="OU"||wtype=="M"||wtype=="EO") ? GameData.gid : GameData.hgid);
	var gnum=eval("GameData.gnum_"+(betTeam=="N"? "c":betTeam.toLowerCase()));
	var strong=(wtype=="R" ? GameData.strong : GameData.hstrong);
	var rtype=(betTeam=="O" ? "ODD" : "EVEN");
	var type=betTeam;
	
	for (var i=0;i<paramArray[wtype].length;i++){
		if (i>0)  param+="&";
		param+=paramArray[wtype][i]+"="+eval(paramArray[wtype][i]);
	}
	return param;
}