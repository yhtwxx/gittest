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

	body_browse.scroll(0,keepscroll);

	//設定右方重新整理位置
	setRefreshPos();

	parent.gamecount=gamount;
	//日期下拉霸

	if (sel_gtype=="FU"){
		if (""+body_browse.document.getElementById('g_date')!="undefined"){
			body_browse.selgdate("pd",g_date);
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
	
//	if (top.hot_game==""){
//		if(("|"+eval('parent.'+sel_gtype+'_lname_ary')).indexOf(("|"+ObjDataFT[gamerec].league+"|"),0)==-1&&eval('parent.'+sel_gtype+'_lname_ary')!='ALL') return "";
//		if((""+LeagueAry).indexOf(ObjDataFT[gamerec].league)== -1)LeagueAry.push(ObjDataFT[gamerec].league);
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
	onelayer=onelayer.replace("*TEAM_H*",ObjDataFT[gamerec].team_h.replace("[Mid]","<font color=\"#005aff\">[N]</font>").replace("[中]","<font color=\"#005aff\">[中]</font>"));
	onelayer=onelayer.replace("*TEAM_C*",ObjDataFT[gamerec].team_c);
	//全場
	//波膽
	onelayer=onelayer.replace("*RATIO_H1C0*",parseUrl(odd_f_type,"H1C0",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H2C0*",parseUrl(odd_f_type,"H2C0",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H2C1*",parseUrl(odd_f_type,"H2C1",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H3C0*",parseUrl(odd_f_type,"H3C0",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H3C1*",parseUrl(odd_f_type,"H3C1",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H3C2*",parseUrl(odd_f_type,"H3C2",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H4C0*",parseUrl(odd_f_type,"H4C0",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H4C1*",parseUrl(odd_f_type,"H4C1",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H4C2*",parseUrl(odd_f_type,"H4C2",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H4C3*",parseUrl(odd_f_type,"H4C3",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H0C0*",parseUrl(odd_f_type,"H0C0",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H1C1*",parseUrl(odd_f_type,"H1C1",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H2C2*",parseUrl(odd_f_type,"H2C2",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H3C3*",parseUrl(odd_f_type,"H3C3",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H4C4*",parseUrl(odd_f_type,"H4C4",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_OVH*",parseUrl(odd_f_type,"OVH",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H0C1*",parseUrl(odd_f_type,"H0C1",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H0C2*",parseUrl(odd_f_type,"H0C2",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H1C2*",parseUrl(odd_f_type,"H1C2",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H0C3*",parseUrl(odd_f_type,"H0C3",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H1C3*",parseUrl(odd_f_type,"H1C3",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H2C3*",parseUrl(odd_f_type,"H2C3",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H0C4*",parseUrl(odd_f_type,"H0C4",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H1C4*",parseUrl(odd_f_type,"H1C4",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H2C4*",parseUrl(odd_f_type,"H2C4",ObjDataFT[gamerec],gamerec,"PD"));
	onelayer=onelayer.replace("*RATIO_H3C4*",parseUrl(odd_f_type,"H3C4",ObjDataFT[gamerec],gamerec,"PD"));
	
	return onelayer;
}


//取得下注的url
function parseUrl(odd_f_type,rtype,GameData,gamerec,wtype){
	var urlArray=new Array();
	urlArray['PD']=new Array("football/FT_order/FT_order_pd.php");
	urlArray['HPD']=new Array("football/FT_order/FT_order_hpd.php");

	var param=getParam(odd_f_type,rtype,wtype,GameData);
//	var order=urlArray[wtype][0];
	var tmp_rtype="ior_"+rtype;
	var ioratio_str="GameData."+tmp_rtype;
	var team="";
	if (rtype=="OVH"){
		team="Any Other Score";
	}else{
		team=rtype.replace("H","").replace("C",":");
	}
	
	var ioratio=eval(ioratio_str);

	var ret="<a href='javascript://' onclick=\"parent.parent.mem_order.betOrder('FT','"+wtype+"','"+param+"');\" title='"+team+"'><font "+check_ioratio(gamerec,tmp_rtype,GameData)+">"+ioratio+"</font></a>";
	return ret;
}

//取得下注參數
function getParam(odd_f_type,rtype,wtype,GameData){
	var paramArray=new Array();
	paramArray['PD']=new Array("gid","odd_f_type","rtype","langx");
	paramArray['HPD']=new Array("gid","odd_f_type","rtype","langx");

	var param="";
	var gid=GameData.gid;

	for (var i=0;i<paramArray[wtype].length;i++){
		if (i>0)  param+="&";
		param+=paramArray[wtype][i]+"="+eval(paramArray[wtype][i]);
	}
	return param;
}
var isHot_game = false;//是否為世足賽