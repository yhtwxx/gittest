function ShowGameList(){
	reTimeNow = retime;

	parent.header.chg_button_bg('FT','rb');	
	
	if(loading == 'Y') return;
	if (parent.gamecount!=gamount){
		oldObjDataFT=new Array();
	}
	if(top.odd_f_type==""||""+top.odd_f_type=="undefined") top.odd_f_type="H";
	keepscroll=body_browse.document.body.scrollTop;

	var conscroll= body_browse.document.getElementById('controlscroll');

	dis_ShowLoveI();
	
//	body_browse.auto_re_addShowLoveI(GameFT);//自動加入單式最愛
	
	//秀盤面
	showtables(GameFT,GameHead,gamount,top.odd_f_type);
	
	body_browse.scroll(0,keepscroll);
	
	//設定右方重新整理位置
	setRefreshPos();
	
	//顯示盤口
	body_browse.ChkOddfDiv();

	parent.gamecount=gamount;

	//日期下拉霸
	if (sel_gtype=="FU"){
		if (""+body_browse.document.getElementById('g_date')!="undefined"){
			body_browse.selgdate("re",g_date);
			body_browse.document.getElementById('g_date').value=g_date;
		}
	}
	if (top.hot_game!="" && typeof(top.hot_game)!='undefined'){
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
//	parent.mem_order.getCountHOT(gameCount);
	showHOT(gameCount);		
//	keep_show_more(show_more_gid,ObjDataFT,gamount);
//	parent.display_loading(false);
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
	var str_tmp ="|"+eval('parent.'+sel_gtype+'_lid_ary_RE');
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
	var str_team = eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lname_ary_RE']").split("|");
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
	
	if(eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lname_ary_RE']")!="ALL"){
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
	  if (top.hot_game==""){	
	  	if (top.swShowLoveI){
	  		body_browse.checkLoveCount(chk_Love_I);	
	  	}
	  }	
	  	if(showlayers=="")showlayers=notrdata;
  		showtableData=showtableData.replace("*showDataTR*",showlayers);
	}else{
	 	showtableData=showtableData.replace("*showDataTR*",notrdata);
	}
	showtable.innerHTML=showtableData;
}


//表格內容
function getLayer(onelayer,gamerec,odd_f_type){
	var open_hot = false;
	if (top.hot_game==""){
		if(MM_IdentificationDisplay(ObjDataFT[gamerec].datetime,ObjDataFT[gamerec].gnum_h)) return "";
	}
//	if (!top.swShowLoveI){
//		if (top.hot_game==""){
//			if(("|"+eval('parent.'+sel_gtype+'_lname_ary_RE')).indexOf(("|"+ObjDataFT[gamerec].league+"|"),0)==-1&&eval('parent.'+sel_gtype+'_lname_ary_RE')!='ALL') return "";
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
	//---------------------------------------------------------------------
	//--------------判斷聯盟底下的賽事顯示或隱藏----------------
	if (NoshowLeg[ObjDataFT[gamerec].league]==-1){
		onelayer=onelayer.replace(/\*CLASS\*/g,"style='display: none;'");
		onelayer=onelayer.replace("*LegMark*","<span id='LegClose'></span>"); //聯盟的小圖
	}else{
		onelayer=onelayer.replace(/\*CLASS\*/g,"style='display: ;'");
		onelayer=onelayer.replace("*LegMark*","<span id='LegOpen'></span>");  //聯盟的小圖
	}
	//---------------------------------------------------------------------

	//滾球字眼
	ObjDataFT[gamerec].datetime=ObjDataFT[gamerec].datetime.replace("Running Ball","");
	ObjDataFT[gamerec].timer=ObjDataFT[gamerec].timer.replace("<font style=background-color=red>","").replace("</font>","");
	keepleg=ObjDataFT[gamerec].league;
	onelayer=onelayer.replace(/\*LEG\*/gi,ObjDataFT[gamerec].league);

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

	var tmpset=ObjDataFT[gamerec].retimeset.split("^");
	tmpset[1]=tmpset[1].replace("<font style=background-color=red>","").replace("</font>","");
	var showretime="";
	if(tmpset[0]=="Start"){
			showretime="-";
	}else if(tmpset[0]=="MTIME"){
		showretime=tmpset[1];
	}else{
		var tmpHtime=tmpset[0];
		if(top.langx=="zh-tw"||top.langx=="zh-cn"){
			var showstr=tmpset[0].split("H");
			if(showstr[0]=="1")tmpHtime=top.retime1H;
			if(showstr[0]=="2")tmpHtime=top.retime2H;
		}
		showretime=tmpHtime+" <font class='rb_color'>"+tmpset[1]+"'</font>";
	}
	onelayer=onelayer.replace("*DATETIME*",showretime);
	//onelayer=onelayer.replace("*DATETIME*",change_time(ObjDataFT[gamerec].timer));
	
	if(ObjDataFT[gamerec].lastestscore_h != ''){
		onelayer=onelayer.replace("*SCORE*","<font class=\"rb_score_time\" >"+ObjDataFT[gamerec].score_h+"</font>&nbsp;-&nbsp;"+ObjDataFT[gamerec].score_c);
	}else if(ObjDataFT[gamerec].lastestscore_c != ''){
		onelayer=onelayer.replace("*SCORE*",ObjDataFT[gamerec].score_h+"&nbsp;-&nbsp;<font class=\"rb_score_time\" >"+ObjDataFT[gamerec].score_c+"</font>");
	}else{
		onelayer=onelayer.replace("*SCORE*",ObjDataFT[gamerec].score_h+"&nbsp;-&nbsp;"+ObjDataFT[gamerec].score_c);
	}
	
	if (ObjDataFT[gamerec].redcard_h*1 > 0){
		onelayer=onelayer.replace("*REDCARD_H*",ObjDataFT[gamerec].redcard_h);
		onelayer=onelayer.replace("*REDCARD_H_STYLE*","");
	}else{
		onelayer=onelayer.replace("*REDCARD_H_STYLE*","style='display:none;'");
	}
	if (ObjDataFT[gamerec].redcard_c*1 > 0){
		onelayer=onelayer.replace("*REDCARD_C*",ObjDataFT[gamerec].redcard_c);
		onelayer=onelayer.replace("*REDCARD_C_STYLE*","");
	}else{
		onelayer=onelayer.replace("*REDCARD_C_STYLE*","style='display:none;'");
	}
	onelayer=onelayer.replace("*TEAM_H*",ObjDataFT[gamerec].team_h.replace("[Mid]","<font color=\"#005aff\">[N]</font>").replace("[中]","<font color=\"#005aff\">[中]</font>"));
	onelayer=onelayer.replace("*TEAM_C*",ObjDataFT[gamerec].team_c);
	//全場
	//獨贏
	onelayer=onelayer.replace("*RATIO_MH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"M"));
	onelayer=onelayer.replace("*RATIO_MC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"M"));
	onelayer=onelayer.replace("*RATIO_MN*",parseUrl(odd_f_type,"N",ObjDataFT[gamerec],gamerec,"M"));
	//讓球
	if (ObjDataFT[gamerec].strong=="H"){
		onelayer=onelayer.replace("*CON_RH*",ObjDataFT[gamerec].ratio);	/*讓球球頭*/
		onelayer=onelayer.replace("*CON_RC*","");
	}else{
		onelayer=onelayer.replace("*CON_RH*","");
		onelayer=onelayer.replace("*CON_RC*",ObjDataFT[gamerec].ratio);
	}

	//onelayer=onelayer.replace("*TD_RH_CLASS*",check_ioratio(gamerec,"ior_RH",ObjDataFT[gamerec]));/*讓球sytle*/
	//onelayer=onelayer.replace("*TD_RH_CLASS*","class='b_rig'");/*讓球sytle*/

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
	onelayer=onelayer.replace("*RATIO_RODD*",ObjDataFT[gamerec].str_odd+parseUrl(odd_f_type,"O",ObjDataFT[gamerec],gamerec,"EO"));
  	onelayer=onelayer.replace("*RATIO_REVEN*",ObjDataFT[gamerec].str_even+parseUrl(odd_f_type,"E",ObjDataFT[gamerec],gamerec,"EO"));
	}else{
	onelayer=onelayer.replace("*RATIO_RODD*",ObjDataFT[gamerec].str_odd+parseUrl(odd_f_type,"O",ObjDataFT[gamerec],gamerec,"EO"));
  	onelayer=onelayer.replace("*RATIO_REVEN*",ObjDataFT[gamerec].str_even+parseUrl(odd_f_type,"E",ObjDataFT[gamerec],gamerec,"EO"));	
		}	
	//上半場
	//獨贏
	onelayer=onelayer.replace("*RATIO_HMH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"HM"));
	onelayer=onelayer.replace("*RATIO_HMC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"HM"));
	onelayer=onelayer.replace("*RATIO_HMN*",parseUrl(odd_f_type,"N",ObjDataFT[gamerec],gamerec,"HM"));
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
	//onelayer=onelayer.replace("*MORE*",parsemore(ObjDataFT[gamerec],game_more));
	onelayer=onelayer.replace("*MORE*",parseAllBets(ObjDataFT[gamerec],game_more));  //2014.03足球多玩法 by Leslie
	
	//我的最愛
	onelayer=onelayer.replace("*MYLOVE*",parseMyLove(ObjDataFT[gamerec]));

	if (ObjDataFT[gamerec].eventid != "" && ObjDataFT[gamerec].eventid != "null" && ObjDataFT[gamerec].eventid != undefined) {	//判斷是否有轉播
		tmpStr= VideoFun(ObjDataFT[gamerec].eventid, ObjDataFT[gamerec].hot, ObjDataFT[gamerec].play, "FT");
		onelayer=onelayer.replace("*TV*",tmpStr);
	}
	onelayer=onelayer.replace("*TV*","");

	return onelayer;
}


//取得下注的url
function parseUrl(odd_f_type,betTeam,GameData,gamerec,wtype){
	var urlArray=new Array();
	urlArray['R']=new Array("../FT_order/FT_order_re.php",eval("GameData.team_"+betTeam.toLowerCase()));
	urlArray['HR']=new Array("../FT_order/FT_order_hre.php",eval("GameData.team_"+betTeam.toLowerCase()));
	urlArray['OU']=new Array("../FT_order/FT_order_rou.php",(betTeam=="C" ? top.strOver : top.strUnder));
	urlArray['HOU']=new Array("../FT_order/FT_order_hrou.php",(betTeam=="C" ? top.strOver : top.strUnder));
	urlArray['M']=new Array("../FT_order/FT_order_rm.php",(betTeam=="N" ? top.str_irish_kiss : eval("GameData.team_"+betTeam.toLowerCase())));
	urlArray['HM']=new Array("../FT_order/FT_order_hrm.php",(betTeam=="N" ? top.str_irish_kiss : eval("GameData.team_"+betTeam.toLowerCase())));
	urlArray['EO']=new Array("../FT_order/FT_order_rt.php", (betTeam=="O"  ? top.str_o : top.str_e));
	var rewtype = new Array();
	rewtype['R'] = "RE";
	rewtype['HR'] = "HRE";
	rewtype['OU'] = "ROU";
	rewtype['HOU'] = "HROU";
	rewtype['M'] = "RM";
	rewtype['HM'] = "HRM";
	rewtype['EO'] = "REO";

	var param=getParam(odd_f_type,betTeam,wtype,GameData);
//	var order=urlArray[wtype][0];
	var team=urlArray[wtype][1].replace("[Mid]","[N]");
	var tmp_rtype="ior_"+wtype+betTeam;
	var ioratio_str="GameData."+tmp_rtype;

	var ioratio=eval(ioratio_str);
	
	if(eval(ioratio_str)!=""){
		ioratio=Mathfloor(ioratio);
		ioratio=printf(ioratio,2);
	}

	//20121023 max新增 輸水盤 負值顯示藍色
	if (odd_f_type=="M" || odd_f_type=="I"){
		if (ioratio<0) ioratio="<font color=#1f497d>"+ioratio+"</font>";
	}
	
	var ret="<a href='javascript://' onclick=\"parent.parent.mem_order.betOrder('FT','"+rewtype[wtype]+"','"+param+"');\" title='"+team+"'><font "+check_ioratio(gamerec,tmp_rtype,GameData)+">"+ioratio+"</font></a>";
	return ret;
}

function Mathfloor(z){
	var tmp_z;
	tmp_z=(Math.floor(z*100+0.01))/100;
 	return tmp_z;
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
	var rtype=(betTeam=="O" ? "RODD" : "REVEN");
	var type=betTeam;

	for (var i=0;i<paramArray[wtype].length;i++){
		if (i>0)  param+="&";
		param+=paramArray[wtype][i]+"="+eval(paramArray[wtype][i]);
	}
	return param;
}

//2014.03足球多玩法 by Leslie
function parseAllBets(GameData,g_more){
	var ret="";
	if(g_more=='0'||GameData.more=='0'){
		ret="&nbsp;";
	}else{
		var datetime = GameData.datetime.split("<br>");
	 	ret="<a href=javascript: onClick=show_allbets('"+GameData.gid+"',event,'"+datetime[0]+"');><font class='total_color'>"+top.str_all_bets+" ("+GameData.more+")</font></A>";
	}			
	return ret;	
}