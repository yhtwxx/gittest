function ShowGameList(){
	reTimeNow = retime;
	
	if(loading == 'Y') return;
	if (parent.gamecount!=gamount){
		oldObjDataFT=new Array();
	}
	if(top.odd_f_type==""||""+top.odd_f_type=="undefined") top.odd_f_type="H";
	keepscroll=body_browse.document.body.scrollTop;
	
	var conscroll= body_browse.document.getElementById('controlscroll');
	//conscroll.style.display='';
	//conscroll.style.top=keepscroll+1;
	//conscroll.focus();
	
	dis_ShowLoveI();
	GameHead =['gid','datetime','league','gnum_h','gnum_c','team_h','team_c','strong','ratio','ior_PRH','ior_PRC','ratio_o','ratio_u','ior_POUC','ior_POUH','ior_PEOO','ior_PEOE','ior_MH','ior_MC','ior_MN','hgid','hstrong','hratio','ior_HPRH','ior_HPRC','hratio_o','hratio_u','ior_HPOUH','ior_HPOUC','ior_HMH','ior_HMC','ior_HMN','more','gidm','par_minlimit','par_maxlimit'];
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
	
	if (sel_gtype=="FU"){
		if (""+body_browse.document.getElementById('g_date')!="undefined"){
			body_browse.selgdate("p3",g_date);
			body_browse.document.getElementById('g_date').value=g_date;
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
//	var conscroll= body_browse.document.getElementById('controlscroll');

	//var conscroll= document.getElementById('controlscroll');
//	conscroll.style.display='';
//	conscroll.top=keepscroll;
	//alert("kkkk");
	
	
	
	ObjDataFT=new Array();
	myLeg=new Array();
	for (var j=0;j < data_amount;j++){
		if (GameData[j]!=null){
			ObjDataFT[j]=parseArray(Game_Head,GameData[j]);
		}	
	}
	//alert("ObjDataFT===>"+ObjDataFT.length);
	var trdata;//=body_browse.document.getElementById('DataTR').innerHTML;
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
	//alert(trdata);
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
	//oldObjDataFT=ObjDataFT;
	
//	conscroll.style.display="none";
}


//表格內容
function getLayer(onelayer,gamerec,odd_f_type){
	var open_hot = false;
	if(MM_IdentificationDisplay(ObjDataFT[gamerec].datetime,ObjDataFT[gamerec].gnum_h)) return "";
	if(("|"+eval('parent.'+sel_gtype+'_lname_ary')).indexOf(("|"+ObjDataFT[gamerec].league+"|"),0)==-1&&eval('parent.'+sel_gtype+'_lname_ary')!='ALL') return "";
	if((""+LeagueAry).indexOf(ObjDataFT[gamerec].league)== -1)LeagueAry.push(ObjDataFT[gamerec].league);
	
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
	var HPR_ior =Array();
	var HPOU_ior =Array();
	var PEO_ior =Array();
	
	PR_ior  = get_other_ioratio("", ObjDataFT[gamerec].ior_PRH   , ObjDataFT[gamerec].ior_PRC   , show_ior);
	POU_ior = get_other_ioratio("", ObjDataFT[gamerec].ior_POUH  , ObjDataFT[gamerec].ior_POUC  , show_ior);
	HPR_ior = get_other_ioratio("", ObjDataFT[gamerec].ior_HPRH  , ObjDataFT[gamerec].ior_HPRC  , show_ior);
	HPOU_ior= get_other_ioratio("", ObjDataFT[gamerec].ior_HPOUH , ObjDataFT[gamerec].ior_HPOUC , show_ior);
	
	if((ObjDataFT[gamerec].ior_PEOO != 0) && (ObjDataFT[gamerec].ior_PEOE != 0)){
		PEO_ior= get_other_ioratio("H", ObjDataFT[gamerec].ior_PEOO*1-1 , ObjDataFT[gamerec].ior_PEOE*1-1 , show_ior);
		ObjDataFT[gamerec].ior_PEOO=PEO_ior[0]*1+1;
		ObjDataFT[gamerec].ior_PEOE=PEO_ior[1]*1+1;
	}
	
	ObjDataFT[gamerec].ior_PRH=PR_ior[0];
	ObjDataFT[gamerec].ior_PRC=PR_ior[1];
	ObjDataFT[gamerec].ior_POUH=POU_ior[0];
	ObjDataFT[gamerec].ior_POUC=POU_ior[1];
	ObjDataFT[gamerec].ior_HPRH=HPR_ior[0];
	ObjDataFT[gamerec].ior_HPRC=HPR_ior[1];
	ObjDataFT[gamerec].ior_HPOUH=HPOU_ior[0];
	ObjDataFT[gamerec].ior_HPOUC=HPOU_ior[1];
	


	//滾球字眼
	ObjDataFT[gamerec].datetime=ObjDataFT[gamerec].datetime.replace("Running Ball",top.str_RB);
	keepleg=ObjDataFT[gamerec].league;
	onelayer=onelayer.replace(/\*LEG\*/gi,ObjDataFT[gamerec].league);
	
	
//	onelayer=onelayer.replace(/\*LegID\*/g,"LEG_"+legnum);

	
	var tmp_date=ObjDataFT[gamerec].datetime.split("<br>");
	//if (sel_gtype=="FU"){
		tmp_date_str=tmp_date[0]+"<br>"+change_time(tmp_date[1]);
	//}else{
		//tmp_date_str=change_time(tmp_date[1]);
	//}
	if (tmp_date.length==3){
		tmp_date_str+="<br>"+tmp_date[2];
	}	
	onelayer=onelayer.replace("*DATETIME*",tmp_date_str);
	onelayer=onelayer.replace("*TEAM_H*",ObjDataFT[gamerec].team_h.replace("[Mid]","<font color=\"#005aff\">[N]</font>").replace("[中]","<font color=\"#005aff\">[中]</font>"));
	onelayer=onelayer.replace("*TEAM_C*",ObjDataFT[gamerec].team_c);
	//全場
	
		onelayer=onelayer.replace("*GID_MH*","MH_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_MC*","MC_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_MN*","MN_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_HMH*","HMH_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_HMC*","HMC_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_HMN*","HMN_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_RH*","PRH_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_RC*","PRC_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_HRH*","HPRH_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_HRC*","HPRC_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_OUH*","POUH_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_OUC*","POUC_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_HOUH*","HPOUH_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_HOUC*","HPOUC_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_EOO*","PEOO_"+ObjDataFT[gamerec].gid);
		onelayer=onelayer.replace("*GID_EOE*","PEOE_"+ObjDataFT[gamerec].gid);
	
	//獨贏
	if ((ObjDataFT[gamerec].ior_MH*1 > 0) && (ObjDataFT[gamerec].ior_MC*1 > 0)&&(ObjDataFT[gamerec].ior_MN*1 > 0)){
		onelayer=onelayer.replace("*RATIO_MH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"M"));
		onelayer=onelayer.replace("*RATIO_MC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"M"));
		onelayer=onelayer.replace("*RATIO_MN*",parseUrl(odd_f_type,"N",ObjDataFT[gamerec],gamerec,"M"));
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
	
	
	//onelayer=onelayer.replace("*TD_RH_CLASS*",check_ioratio(gamerec,"ior_RH",ObjDataFT[gamerec]));/*讓球sytle*/
	//onelayer=onelayer.replace("*TD_RH_CLASS*","class='b_rig'");/*讓球sytle*/
	

	onelayer=onelayer.replace("*RATIO_RH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"PR"));/*讓球賠率*/
	onelayer=onelayer.replace("*RATIO_RC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"PR"));
	//大小
	if (top.langx=="en-us"){
		onelayer=onelayer.replace("*CON_OUC*",ObjDataFT[gamerec].ratio_o.replace("O","o"));	/*大小球頭*/
		onelayer=onelayer.replace("*CON_OUH*",ObjDataFT[gamerec].ratio_u.replace("U","u"));
	}else{
		onelayer=onelayer.replace("*CON_OUC*",ObjDataFT[gamerec].ratio_o.replace("O",top.strOver));	/*大小球頭*/
		onelayer=onelayer.replace("*CON_OUH*",ObjDataFT[gamerec].ratio_u.replace("U",top.strUnder));
	}
	
	onelayer=onelayer.replace("*RATIO_OUC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"POU"));/*大小賠率*/
	onelayer=onelayer.replace("*RATIO_OUH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"POU"));
	//上半場
	//獨贏

	if ((ObjDataFT[gamerec].ior_HMH*1 > 0) && (ObjDataFT[gamerec].ior_HMC*1 > 0) && (ObjDataFT[gamerec].ior_HMN*1 > 0)){
			                                            //ior_HMH,ior_HMC,ior_HMN
			                                            //var tmp_rtype="ior_"+wtype+betTeam;
		onelayer=onelayer.replace("*RATIO_HMH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"HM"));
		onelayer=onelayer.replace("*RATIO_HMC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"HM"));
		onelayer=onelayer.replace("*RATIO_HMN*",parseUrl(odd_f_type,"N",ObjDataFT[gamerec],gamerec,"HM"));
		
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
	onelayer=onelayer.replace("*RATIO_HRH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"HPR"));/*讓球賠率*/
	onelayer=onelayer.replace("*RATIO_HRC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"HPR"));
	//大小
	if (top.langx=="en-us"){
		onelayer=onelayer.replace("*CON_HOUC*",ObjDataFT[gamerec].hratio_o.replace("O","o"));	/*大小球頭*/
		onelayer=onelayer.replace("*CON_HOUH*",ObjDataFT[gamerec].hratio_u.replace("U","u"));
	}else{
		onelayer=onelayer.replace("*CON_HOUC*",ObjDataFT[gamerec].hratio_o.replace("O",top.strOver));	/*大小球頭*/
		onelayer=onelayer.replace("*CON_HOUH*",ObjDataFT[gamerec].hratio_u.replace("U",top.strUnder));
	
	}	
	
	onelayer=onelayer.replace("*RATIO_HOUC*",parseUrl(odd_f_type,"C",ObjDataFT[gamerec],gamerec,"HPOU"));/*大小賠率*/
	onelayer=onelayer.replace("*RATIO_HOUH*",parseUrl(odd_f_type,"H",ObjDataFT[gamerec],gamerec,"HPOU"));
	var tmp_ior_po=eval("ObjDataFT[gamerec].ior_PEOO");
	var tmp_ior_pe=eval("ObjDataFT[gamerec].ior_PEOE");
	
	var rario_eoo="";
	var ratio_eoe="";
	if (tmp_ior_po*1 >0 && tmp_ior_pe*1 > 0){
		if (top.langx=="en-us"){
				var rario_eoo=top.str_o+" "+parseUrl(top.odd_f_type,"O",ObjDataFT[gamerec],gamerec,"PEO");
				var ratio_eoe=top.str_e+" "+parseUrl(top.odd_f_type,"E",ObjDataFT[gamerec],gamerec,"PEO");
			}else{
				var rario_eoo=top.strOdd+" "+parseUrl(top.odd_f_type,"O",ObjDataFT[gamerec],gamerec,"PEO");
				var ratio_eoe=top.strEven+" "+parseUrl(top.odd_f_type,"E",ObjDataFT[gamerec],gamerec,"PEO");
			}
	onelayer=onelayer.replace("*RATIO_EOO*",rario_eoo);
  	onelayer=onelayer.replace("*RATIO_EOE*",ratio_eoe);
	}else{
	onelayer=onelayer.replace("*RATIO_EOO*","&nbsp;");
  	onelayer=onelayer.replace("*RATIO_EOE*","&nbsp;");
	}
	
	onelayer=onelayer.replace("*MORE*",parseAllBets(ObjDataFT[gamerec],game_more));  //2014.03足球多玩法 by Leslie

	//onelayer=onelayer.replace("*MORE*",parsemore(ObjDataFT[gamerec],game_more));
	//gcount=0;
	//if(ObjDataFT[gamerec].more=="0"){
	//	onelayer=onelayer.replace("*MORE*","");
	//}else{
	//	onelayer=onelayer.replace("*MORE*",'<A href=\"javascript:\" onClick=\"show_more(\''+gamerec+'\',event);\">'+'+'+ObjDataFT[gamerec].more+'&nbsp;'+str_more+'</A>');		
	//}
	//我的最愛
	onelayer=onelayer.replace("*MYLOVE*",parseMyLove(ObjDataFT[gamerec]));
/*
	if (ObjDataFT[gamerec].play=="Y"){
			onelayer=onelayer.replace("*TV_ST*","style='display:'';'");
		
		}else{
				onelayer=onelayer.replace("*TV_ST*","style='display:none;'");
			}

*/
		if (ObjDataFT[gamerec].eventid != "" && ObjDataFT[gamerec].eventid != "null" && ObjDataFT[gamerec].eventid != undefined) {	//判斷是否有轉播
			tmpStr= VideoFun(ObjDataFT[gamerec].eventid, ObjDataFT[gamerec].hot, ObjDataFT[gamerec].play, "FT");
			//alert(tmpStr);
			onelayer=onelayer.replace("*TV*",tmpStr);
		}
		onelayer=onelayer.replace("*TV*","");
	
	//alert(onelayer);
	return onelayer;
}

function parseAllBets(GameData,g_more){
	var ret="";
	if(g_more=='0'||GameData.more=='0'){
		ret="&nbsp;";
	}else{
	 	ret="<A href=javascript: onClick=show_allbets('"+GameData.gid+"',event);><font class='total_color'>"+top.str_all_bets+" ("+GameData.more+")</font></A>";
	}			
	return ret;	
}


//取得下注的url
function parseUrl(odd_f_type,betTeam,GameData,gamerec,wtype){
//	alert(wtype);
	
	var urlArray=new Array();
	urlArray['M']=new Array((betTeam=="N" ? top.str_irish_kiss : eval("GameData.team_"+betTeam.toLowerCase())));
	urlArray['PR']=new Array(eval("GameData.team_"+betTeam.toLowerCase()));
	urlArray['POU']=new Array((betTeam=="C" ? top.strOver : top.strUnder));
	//urlArray['HR']=new Array(eval("GameData.team_"+betTeam.toLowerCase()));
	urlArray['HPR']=new Array(eval("GameData.team_"+betTeam.toLowerCase()));
	urlArray['HPOU']=new Array((betTeam=="C" ? top.strOver : top.strUnder));
	urlArray['HM']=new Array((betTeam=="N" ? top.str_irish_kiss : eval("GameData.team_"+betTeam.toLowerCase())));
	urlArray['PEO']=new Array((betTeam=="O" ? top.str_o : top.str_e));
	
	urlArray['T01'] = new Array("0~1");
	urlArray['T23'] = new Array("2~3");
	urlArray['T46'] = new Array("4~6");
	urlArray['OVER'] = new Array("7up");
	
//	var param=getParam(uid,odd_f_type,betTeam,wtype,GameData);
//	var order=urlArray[wtype][0];
	
	var team="";
	var title_str="";
	if (urlArray[wtype]!=null){
		team=urlArray[wtype][0];
		title_str="title='"+team+"'";
	}else{
		var HPD=new Array('HH1C0','HH2C0','HH2C1','HH3C0','HH3C1','HH3C2','HH4C0','HH4C1','HH4C2','HH4C3','HH0C0','HH1C1','HH2C2','HH3C3','HH4C4','HOVH','HH0C1','HH0C2','HH1C2','HH0C3','HH1C3','HH2C3','HH0C4','HH1C4','HH2C4','HH3C4');
		var PD=new Array('H1C0','H2C0','H2C1','H3C0','H3C1','H3C2','H4C0','H4C1','H4C2','H4C3','H0C0','H1C1','H2C2','H3C3','H4C4','OVH','H0C1','H0C2','H1C2','H0C3','H1C3','H2C3','H0C4','H1C4','H2C4','H3C4');
		if (indexof(HPD,wtype) > -1||indexof(PD,wtype) > -1){
			if (wtype=="OVH"||wtype=="HOVH"){
				title_str="title='Any Other Score'";
			}else{
				title_str="title='"+(wtype.replace("H","").replace("H","").replace("C",":"))+"'";
			}
		}
		var RM_F=new Array('FHH','FHN','FHC','FNH','FNN','FNC','FCH','FCN','FCC');
		
		if (indexof(RM_F,wtype) > -1){
			title_str="title='"+changeTitleStr(wtype,1)+"/"+changeTitleStr(wtype,2)+"'";	
		}
		
		
		
		
		
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
	
	//alert("1====>"+ioratio+":"+ioratio_str);
	//ioratio=printf(Decimal_point(ioratio,2),2);
	//alert("2====>"+ioratio);
 //	var ret="<a href='"+order+"?"+param+"' target='mem_order' title='"+team+"'><font "+check_ioratio(gamerec,tmp_rtype,GameData)+">"+ioratio+"</font></a>";
 	var ret="<a href='javascript:void(0)'  onclick='parent.orderParlay(\""+GameData.gidm+"\",\""+GameData.gid+"\",\""+GameData.hgid+"\",\""+(bet_rtype)+"\",\""+GameData.par_minlimit+"\",\""+GameData.par_maxlimit+"\")' "+title_str+"><font "+check_ioratio(gamerec,tmp_rtype,GameData)+">"+ioratio+"</font></a>";
	//alert(parent.name)
	//var ret="<a href='javascript://' onclick=\"parent.parent.mem_order.betOrder('FT','"+wtype+"','"+param+"');\" title='"+team+"'><font "+check_ioratio(gamerec,tmp_rtype,GameData)+">"+ioratio+"</font></a>";
	
	return ret;
	
}

function setMoreClass(rtypeGid,class_name){
	rtypeGid = rtypeGid.replace("0~1","T01").replace("2~3","T23").replace("4~6","T46");
	//console.log(rtypeGid+"|"+class_name);
	if(show_more_gid==undefined||show_more_gid=="")return;
	try{
		tar = showdata.document.getElementById(rtypeGid);
		showdata.setObjectClass(tar,class_name);
	}catch(E){}
}

function orderParlay(gidm,gid,hgid,wtype,par_minlimit,par_maxlimit){
	//alert(gid+"_"+wtype);
	
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
	//setBgYellow(gidm,gid,wtype,rtype)
	//setMoreClass(rtypeGid,class_name)  //bg_white,bg_yellow


	try{
		//alert(gid+"_"+wtype+","+body_browse.document.getElementById(gid+"_"+wtype).className);
		var classary=(body_browse.document.getElementById(wtype+"_"+gid).className).split("_");
		//alert(classary.length);
		body_browse.document.getElementById(wtype+"_"+gid).className="pr_"+classary[1];
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
	setMoreClass(orderobj.wtype+"_"+orderobj.gid,"bg_yellow");
	//alert(ordergid.length);
	orderParlayParam();
	
	}
//------------------------------------------------------------------------------------
function orderParlayParam(){
	var param="";
	for(var i=0;i < top.ordergid.length;i++){
		var obj=top.orderArray["G"+top.ordergid[i]];
		if (i!=0) param+="&";
		gameparam="game"+(i+1)+"="+obj.wtype+"&game_id"+(i+1)+"="+obj.gid+"&Hgame_id"+(i+1)+"="+obj.hgid+"&minlimit"+(i+1)+"="+obj.par_minlimit+"&maxlimit"+(i+1)+"="+obj.par_maxlimit;
		param+=gameparam;
	}
	parent.paramData=new Array();
	
	parent.mem_order.betOrder('FT','P3',"teamcount="+top.ordergid.length+"&uid="+top.uid+"&langx="+top.langx+"&"+param);
}

function orderRemoveALL(){
	//alert("orderRemoveALL===>"+top.ordergid.length);
	for(var i=0;i < top.ordergid.length;i++){
		orderRemoveGidBgcolor(top.ordergid[i]);		
	}
	top.orderArray=new Array();
	top.ordergid=new Array();
}

function orderRemoveGidBgcolor(gidm){
	var tmpobj=top.orderArray["G"+gidm];
	try{
		var classary=( body_browse.document.getElementById(tmpobj.wtype+"_"+tmpobj.gid).className).split("_");
		body_browse.document.getElementById(tmpobj.wtype+"_"+tmpobj.gid).className="b_"+classary[1];
	}catch(E){}
	try{
		setMoreClass(tmpobj.wtype+"_"+tmpobj.gid,"bg_white");
	}catch(E){}
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
	paramArray['PR']=new Array("gid","odd_f_type","type","gnum","strong","langx");

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