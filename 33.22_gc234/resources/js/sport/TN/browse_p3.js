function ShowGameList(){
	reTimeNow = retime;
	
	if(loading == 'Y') return;
	if (parent.gamecount!=gamount){
		oldObjDataFT=new Array();
	}
	if(top.odd_f_type==""||""+top.odd_f_type=="undefined") top.odd_f_type="H";
	keepscroll=body_browse.document.body.scrollTop;
	
	var conscroll= body_browse.document.getElementById('controlscroll');
	dis_ShowLoveI();
	
	//秀盤面
	showtables(GameFT,GameHead,gamount,top.odd_f_type);
    //重新將選過的單子秀出來
	orderShowSelALL();
	
	body_browse.scroll(0,keepscroll);
	
	//設定右方重新整理位置
	setRefreshPos();

	//顯示盤口
	//body_browse.ChkOddfDiv();

	
	parent.gamecount=gamount;
	//日期下拉霸
	
	if (sel_gtype=="BU"){
		if (""+body_browse.document.getElementById('g_date')!="undefined"){
			body_browse.selgdate("p3",g_date);
			//body_browse.document.getElementById('g_date').value=g_date;
		}
	}
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
	
	conscroll.style.display="none";

	coun_Leagues();
	body_browse.showPicLove();
	loadingOK();
	parent.mem_order.getCountHOT(gameCount);
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

 function orderShowSelALL(){
	for(var i=0;i < top.ordergid.length;i++){
		var obj=top.orderArray["G"+top.ordergid[i]];
		try{
			var classary=(body_browse.document.getElementById(obj.gid+"_"+obj.wtype).className).split("_");
			body_browse.document.getElementById(obj.gid+"_"+obj.wtype).className="pr_"+classary[1];
		}catch(E){}	
	}
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
	if(ObjDataFT.length > 0){
	  	for ( i=0 ;i < ObjDataFT.length;i++){
	  			showlayers+=getLayer(trdata,i,odd_f_type);
	  			
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
	if(MM_IdentificationDisplay(ObjDataFT[gamerec].datetime,ObjDataFT[gamerec].gnum_h)) return "";
//	if(("|"+eval('parent.'+sel_gtype+'_lname_ary')).indexOf(("|"+ObjDataFT[gamerec].league+"|"),0)==-1&&eval('parent.'+sel_gtype+'_lname_ary')!='ALL') return "";
//	if((""+LeagueAry).indexOf(ObjDataFT[gamerec].league)== -1)LeagueAry.push(ObjDataFT[gamerec].league);
	var tmp_date = ObjDataFT[gamerec].datetime.split("<br>")[0];
	
	onelayer=onelayer.replace(/\*ID_STR\*/g,tmp_date+ObjDataFT[gamerec].gnum_h);
	onelayer=onelayer.replace(/\*TR_EVENT\*/g,"onMouseOver='mouseEnter_pointer(this.id);' onMouseOut='mouseOut_pointer(this.id);'");
	//alert(ObjDataFT[gamerec].league+"==="+keepleg+"["+(ObjDataFT[gamerec].league==keepleg)+"]")
	
	if (""+myLeg[ObjDataFT[gamerec].league]=="undefined"){
			myLeg[ObjDataFT[gamerec].league]=ObjDataFT[gamerec].league;
			myLeg[ObjDataFT[gamerec].league]=new Array();
			myLeg[ObjDataFT[gamerec].league][0]=tmp_date+ObjDataFT[gamerec].gnum_h;
	}else{
			myLeg[ObjDataFT[gamerec].league][myLeg[ObjDataFT[gamerec].league].length]=tmp_date+ObjDataFT[gamerec].gnum_h;
	}
	onelayer=onelayer.replace("*PORDER*",ObjDataFT[gamerec].par_minlimit);
	if (ObjDataFT[gamerec].league==keepleg){
			//alert(ObjDataFT[gamerec].league+"==="+keepleg+"["+(ObjDataFT[gamerec].league==keepleg)+"]")
			onelayer=onelayer.replace("*ST*"," style='display: none;'");
			//--------------判斷聯盟顯示或隱藏----------------
			if (NoshowLeg[ObjDataFT[gamerec].league]==-1){
				//return "";
				onelayer=onelayer.replace(/\*CLASS\*/g,"style='display: none;'"); 
				//聯盟的小圖
				onelayer=onelayer.replace("*LegMark*","<span id='LegClose'></span>");
			}else{
				onelayer=onelayer.replace("*LegMark*","<span id='LegOpen'></span>");
				}
			//---------------------------------------------------------------------
		}else{	
				onelayer=onelayer.replace("*ST*","style='display:;'");
			
			//--------------判斷聯盟顯示或隱藏----------------
		if (NoshowLeg[ObjDataFT[gamerec].league]==-1){
				onelayer=onelayer.replace(/\*CLASS\*/g,"style='display: none;'"); 
				onelayer=onelayer.replace("*LegMark*","<span id='LegClose'></span>");
			}else{
				//聯盟的小圖
				onelayer=onelayer.replace("*LegMark*","<span id='LegOpen'></span>");
				}
			//---------------------------------------------------------------------
		
	}

	var PR_ior =Array();
	var POU_ior =Array();
	
	PR_ior  = get_other_ioratio("", ObjDataFT[gamerec].ior_PRH   , ObjDataFT[gamerec].ior_PRC   , show_ior);
	POU_ior = get_other_ioratio("", ObjDataFT[gamerec].ior_POUH  , ObjDataFT[gamerec].ior_POUC  , show_ior);
	
	if((ObjDataFT[gamerec].ior_PO != 0) && (ObjDataFT[gamerec].ior_PE != 0)){
		PEO_ior= get_other_ioratio("H", ObjDataFT[gamerec].ior_PO*1-1 , ObjDataFT[gamerec].ior_PE*1-1 , show_ior);
		ObjDataFT[gamerec].ior_PO=PEO_ior[0]*1+1;
		ObjDataFT[gamerec].ior_PE=PEO_ior[1]*1+1;
	}
	
	ObjDataFT[gamerec].ior_PRH=PR_ior[0];
	ObjDataFT[gamerec].ior_PRC=PR_ior[1];
	ObjDataFT[gamerec].ior_POUH=POU_ior[0];
	ObjDataFT[gamerec].ior_POUC=POU_ior[1];

	//滾球字眼
	if(ObjDataFT[gamerec].isMaster =="Y"){
		ObjDataFT[gamerec].datetime = ObjDataFT[gamerec].datetime.replace("Running Ball",top.str_RB);
	}else{
		ObjDataFT[gamerec].datetime = ObjDataFT[gamerec].datetime.replace("Running Ball","");
	}
	keepleg=ObjDataFT[gamerec].league;
	onelayer=onelayer.replace(/\*LEG\*/gi,ObjDataFT[gamerec].league);
	
	var tmp_date = ObjDataFT[gamerec].datetime.split("<br>");
	//if(sel_gtype == "TU"){
		tmp_date_str = tmp_date[0]+"<br>"+change_time(tmp_date[1]);
	//}else{
	//	tmp_date_str = change_time(tmp_date[1]);
	//}
	if(tmp_date.length == 3){
		tmp_date_str+="<br>"+tmp_date[2];
	}
	if(ObjDataFT[gamerec].isMaster=="Y"){
		onelayer = onelayer.replace("*DATETIME*",tmp_date_str);
	}else{
		onelayer = onelayer.replace("*DATETIME*","&nbsp;");
	}
	
	onelayer=onelayer.replace("*DATETIME*",tmp_date_str);
	onelayer=onelayer.replace("*TEAM_H*",ObjDataFT[gamerec].team_h.replace("[Mid]","<font color=\"#005aff\">[N]</font>").replace("[中]","<font color=\"#005aff\">[中]</font>"));
	onelayer=onelayer.replace("*TEAM_C*",ObjDataFT[gamerec].team_c);
	//全場
	
	onelayer=onelayer.replace("*GID_RH*","PRH_"+ObjDataFT[gamerec].gid);
	onelayer=onelayer.replace("*GID_RC*","PRC_"+ObjDataFT[gamerec].gid);

	onelayer=onelayer.replace("*GID_OUC*","POUH_"+ObjDataFT[gamerec].gid);
	onelayer=onelayer.replace("*GID_OUH*","POUC_"+ObjDataFT[gamerec].gid);
	//獨贏
	onelayer=onelayer.replace("*GID_MH*","MH_"+ObjDataFT[gamerec].gid);
	onelayer=onelayer.replace("*GID_MC*","MC_"+ObjDataFT[gamerec].gid);
	if ((ObjDataFT[gamerec].ior_MH*1 > 0) && (ObjDataFT[gamerec].ior_MC*1 > 0)){
		onelayer=onelayer.replace("*RATIO_MH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"M"));
		onelayer=onelayer.replace("*RATIO_MC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"M"));
	}else{
		onelayer=onelayer.replace("*RATIO_MH*","&nbsp;");
		onelayer=onelayer.replace("*RATIO_MC*","&nbsp;");
	}
	//讓球
	if (ObjDataFT[gamerec].strong=="H"){
		onelayer=onelayer.replace("*CON_RH*",ObjDataFT[gamerec].ratio);	/*讓球球頭*/
		onelayer=onelayer.replace("*CON_RC*","");
	}else{
		onelayer=onelayer.replace("*CON_RH*","");
		onelayer=onelayer.replace("*CON_RC*",ObjDataFT[gamerec].ratio);
	}
	
	
	onelayer=onelayer.replace("*RATIO_RH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"PR"));/*讓球賠率*/
	onelayer=onelayer.replace("*RATIO_RC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"PR"));
	//大小
	if (top.langx=="en-us"){
		onelayer=onelayer.replace("*CON_OUH*",ObjDataFT[gamerec].ratio_o.replace("O","o"));	/*大小球頭*/
		onelayer=onelayer.replace("*CON_OUC*",ObjDataFT[gamerec].ratio_u.replace("U","u"));
	}else{
		onelayer=onelayer.replace("*CON_OUH*",ObjDataFT[gamerec].ratio_o.replace("O",top.strOver));	/*大小球頭*/
		onelayer=onelayer.replace("*CON_OUC*",ObjDataFT[gamerec].ratio_u.replace("U",top.strUnder));
	}
	
	onelayer=onelayer.replace("*RATIO_OUH*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"POU"));/*大小賠率*/
	onelayer=onelayer.replace("*RATIO_OUC*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"POU"));
	
	//單雙
	var tmp_ior_po=eval("ObjDataFT[gamerec].ior_PO");
	var tmp_ior_pe=eval("ObjDataFT[gamerec].ior_PE");
	
	var rario_eoo="";
	var ratio_eoe="";
	onelayer=onelayer.replace("*GID_EOO*","PO_"+ObjDataFT[gamerec].gid);
	onelayer=onelayer.replace("*GID_EOE*","PE_"+ObjDataFT[gamerec].gid);
	if (tmp_ior_po*1 >0 && tmp_ior_pe*1 > 0){
		if (top.langx=="en-us"){
			var rario_eoo="<b>"+top.str_o+"</b>"+" "+parseUrl(top.odd_f_type,"O",ObjDataFT[gamerec],gamerec,"P");
			var ratio_eoe="<b>"+top.str_e+"</b>"+" "+parseUrl(top.odd_f_type,"E",ObjDataFT[gamerec],gamerec,"P");
		}else{
			var rario_eoo=top.strOdd+" "+parseUrl(top.odd_f_type,"O",ObjDataFT[gamerec],gamerec,"P");
			var ratio_eoe=top.strEven+" "+parseUrl(top.odd_f_type,"E",ObjDataFT[gamerec],gamerec,"P");
		}
		onelayer=onelayer.replace("*RATIO_EOO*",rario_eoo);
		onelayer=onelayer.replace("*RATIO_EOE*",ratio_eoe);
	}else{
		onelayer=onelayer.replace("*RATIO_EOO*","&nbsp;");
	  	onelayer=onelayer.replace("*RATIO_EOE*","&nbsp;");
	}
	//全場總局數
	onelayer=onelayer.replace("*GID_OUHO*","POUHO_"+ObjDataFT[gamerec].gid);
	onelayer=onelayer.replace("*GID_OUHU*","POUHU_"+ObjDataFT[gamerec].gid);
	onelayer=onelayer.replace("*GID_OUCO*","POUCO_"+ObjDataFT[gamerec].gid);
	onelayer=onelayer.replace("*GID_OUCU*","POUCU_"+ObjDataFT[gamerec].gid);
	if(top.langx == "en-us"){
		onelayer = onelayer.replace("*CON_OUHO*",ObjDataFT[gamerec].ratio_pouho.replace("O","<font class=\"text_green\">o</font>"));/*大小球頭*/
		onelayer = onelayer.replace("*CON_OUHU*",ObjDataFT[gamerec].ratio_pouhu.replace("U","<font class=\"text_brown\">u</font>"));
		onelayer = onelayer.replace("*CON_OUCO*",ObjDataFT[gamerec].ratio_pouco.replace("O","<font class=\"text_green\">o</font>"));/*大小球頭*/
		onelayer = onelayer.replace("*CON_OUCU*",ObjDataFT[gamerec].ratio_poucu.replace("U","<font class=\"text_brown\">u</font>"));
	}else{
		onelayer = onelayer.replace("*CON_OUHO*",ObjDataFT[gamerec].ratio_pouho.replace("O","<font class=\"text_green\">"+top.strOver+"</font>"));/*大小球頭*/
		onelayer = onelayer.replace("*CON_OUHU*",ObjDataFT[gamerec].ratio_pouhu.replace("U","<font class=\"text_brown\">"+top.strUnder+"</font>"));
		onelayer = onelayer.replace("*CON_OUCO*",ObjDataFT[gamerec].ratio_pouco.replace("O","<font class=\"text_green\">"+top.strOver+"</font>"));/*大小球頭*/
		onelayer = onelayer.replace("*CON_OUCU*",ObjDataFT[gamerec].ratio_poucu.replace("U","<font class=\"text_brown\">"+top.strUnder+"</font>"));
	}
	onelayer = onelayer.replace("*RATIO_OUHO*",parseUrl(odd_f_type,"O",ObjDataFT[gamerec],gamerec,"POUH"));/*大小賠率*/
	onelayer = onelayer.replace("*RATIO_OUHU*",parseUrl(odd_f_type,"U",ObjDataFT[gamerec],gamerec,"POUH"));
	onelayer = onelayer.replace("*RATIO_OUCO*",parseUrl(odd_f_type,"O",ObjDataFT[gamerec],gamerec,"POUC"));
	onelayer = onelayer.replace("*RATIO_OUCU*",parseUrl(odd_f_type,"U",ObjDataFT[gamerec],gamerec,"POUC"));
	
	onelayer=onelayer.replace("*MORE*",""); //2015.12隐藏多玩法
	//onelayer=onelayer.replace("*MORE*",parseAllBets(ObjDataFT[gamerec],game_more));  

	//我的最愛
	onelayer=onelayer.replace("*MYLOVE*","");
	onelayer=onelayer.replace("*TV*",'');
	return onelayer;
}


//取得下注的url
function parseUrl(odd_f_type,betTeam,GameData,gamerec,wtype){
	var urlArray=new Array();
	urlArray['PR']=new Array(eval("GameData.team_"+betTeam.toLowerCase()));
	urlArray['POU']=new Array((betTeam=="C" ? top.strOver : top.strUnder));
	var team="";
	var title_str="";
	if (urlArray[wtype]!=null){
		team=urlArray[wtype][0];
		title_str="title='"+team+"'";
	}
	var tmp_rtype="ior_"+wtype+betTeam;
	var ioratio_str="GameData."+tmp_rtype;
	var bet_rtype=wtype+betTeam;
	if (wtype.indexOf("T") > -1){
		bet_rtype=wtype.substr(1,1)+"~"+wtype.substr(2,1);
	}
	var ioratio=eval(ioratio_str);
	if(eval(ioratio_str)!=""){
		ioratio=Mathfloor(ioratio);
		ioratio=printf(ioratio,2);
	}	
 	var ret="<a href='javascript:void(0)'  onclick='parent.orderParlay(\""+GameData.gidm+"\",\""+GameData.gid+"\",\""+GameData.hgid+"\",\""+(bet_rtype)+"\",\""+GameData.par_minlimit+"\",\""+GameData.par_maxlimit+"\")' "+title_str+"><font "+check_ioratio(gamerec,tmp_rtype,GameData)+">"+ioratio+"</font></a>";
	return ret;
}
function Mathfloor(z){
	 var tmp_z;
	 tmp_z=(Math.floor(z*100+0.01))/100;
 	return tmp_z;
}