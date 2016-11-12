var frame_broke = 'Y';
var show_ior = '100';
var username='';
var maxcredit='';
var code='';
var pg=0;
var uid='9o9kh219m13706722l3953679';
var loading = 'Y';
var loading_var = 'Y';
var show_more_gid = '';
var GameHead=new Array();
//_.GameHead = ['gid','datetime','league','gnum_h','gnum_c','team_h','team_c','strong','ratio','ior_RH','ior_RC','ratio_o','ratio_u','ior_OUH','ior_OUC','ior_MH','ior_MC','ior_MN','str_odd','str_even','ior_EOO','ior_EOE','ratio_ouho','ratio_ouhu','ior_OUHO','ior_OUHU','ratio_ouco','ratio_oucu','ior_OUCO','ior_OUCU','more','eventid','hot','center_tv','play','gidm','isMaster'];

//判斷賠率是否變動
//包td
var motherStr;
try{
	if(frame_broke) motherStr = "";
	
}catch(e){
	try{ console.log("error motherStr set from flash_ior_mem"); }catch(e){};
	motherStr = "parent.";
}	

function checkRatio(rec,index){
 //alert(flash_ior_set);
	//return true;
	if (flash_ior_set =='Y'){

		if (""+keepGameData[rec]=="undefined"||keepGameData[rec]==""){
			keepGameData[rec]=new Array();
			keepGameData[rec][index]=GameFT[rec][index];
		}
		//判斷gid是否相同
		if (gidData[rec]!=GameFT[rec][0]||""+GameFT[rec][0]=="undefined"){
			keepGameData[rec]=new Array();
			gidData[rec]=new Array();
			keepGameData[rec][index]=GameFT[rec][index];
			gidData[rec][0]=GameFT[rec][0];
		}

		if (""+keepGameData[rec][index]=="undefined" ||keepGameData[rec][index]==""){
			keepGameData[rec][index]=GameFT[rec][index];
		}
		//alert("aaa==>"+keepGameData[rec][index]+"bbb==>"+GameFT[rec][index]);
		if (keepGameData[rec][index]!=GameFT[rec][index]&& keepGameData[rec][index] !=""&&GameFT[rec][index]!=""){
	    	//keepGameData[rec][index]=GameFT[rec][index];
	    	keepGameData[rec][index] = "";
	    	//keepGameData[rec]="";
			return " bgcolor=yellow ";
		}
		return true;
	}
}
//包font
function checkRatio_font(rec,index){
//alert(flash_ior_set);
	//return true;
	//alert(GameFT.length+"----"+keepGameData.length)

	if (flash_ior_set =='Y'){
		if (""+keepGameData[rec]=="undefined"||keepGameData[rec]==""){
			keepGameData[rec]=new Array();
			keepGameData[rec][index]=GameFT[rec][index];
		}
		//判斷gid是否相同
		if (gidData[rec]!=GameFT[rec][0]||""+GameFT[rec][0]=="undefined"){
			keepGameData[rec]=new Array();
			gidData[rec]=new Array();
			keepGameData[rec][index]=GameFT[rec][index];
			gidData[rec][0]=GameFT[rec][0];
		}
		if (""+keepGameData[rec][index]=="undefined"||keepGameData[rec][index] ==""){
			keepGameData[rec][index]=GameFT[rec][index];
		}

		//alert("ccc==>"+keepGameData[rec][index]+"ddd==>"+GameFT[rec][index]);
		if (keepGameData[rec][index]!=GameFT[rec][index] && keepGameData[rec][index] !=""&&GameFT[rec][index]!="") {
	    	//keepGameData[rec][index]=GameFT[rec][index];
	    	keepGameData[rec][index] = "";
	    	//keepGameData[rec]="";
			return '  style=\"background-color : yellow\" ';
		}
		return true;
	}
}
function gethighlight(){
	return " style=\"color:red\" style=\"font-weight:bolder\" ";
}
//滑鼠移動帶出索引
//function showMsg(msg, type) {
//	var showHelpMsg = body_browse.document.getElementById("showHelpMsg");
////	var showHelpMsg = parent.body_browse.document.getElementById('showHelpMsg');
//	var helpMsg = body_browse.document.getElementById('helpMsg').innerHTML;
//	var tmpHTML = "";
//	if(type == 1) {
//		tmpHTML = helpMsg;
//		tmpHTML = tmpHTML.replace("*SHOWMSG*", msg);
//		showHelpMsg.innerHTML = tmpHTML;
//		showHelpMsg.style.display = "block";
//		showHelpMsg.style.top = body_browse.document.body.scrollTop+body_browse.event.clientY-10;
//		showHelpMsg.style.left = body_browse.document.body.scrollLeft+body_browse.event.clientX+10;
//	} else showHelpMsg.style.display = "none";
//}

//====== 加入現場轉播功能 2009-04-09
// 開啟轉播
function OpenLive(eventid, gtype){
	if (top.liveid == undefined) {
		parent.self.location = "";
		return;
	}
	var eventlive="Y";
	//關閉主視窗 連子視窗一起關閉
	 var newWinObj2=new Array();
	 for(var i=0;i<top.newWinObj.length;i++){
	  if(!top.newWinObj[i].closed) newWinObj2[newWinObj2.length]=top.newWinObj[i];
	 }
	 top.newWinObj=newWinObj2;

	 var DWinObj= window.open("../live/live.php?langx="+top.langx+"&uid="+top.uid+"&liveid="+top.liveid+"&autoOddCheck="+top.autoOddCheck+"&eventid="+eventid+"&eventlive="+eventlive+"&gtype="+gtype,"Live","width=780,height=585,top=0,left=0,status=no,toolbar=no,scrollbars=no,resizable=no,personalbar=no");
	 top.newWinObj[top.newWinObj.length]=DWinObj;
	 DWinObj.focus();
}

function VideoFun(eventid, hot, play, gtype) {
	var tmpStr = "";
	//play="Y";
	if (play == "Y") {
		//tmpStr+= "<img lowsrc=\"/images/member/video_1.gif\" onClick=\"parent.OpenLive('"+eventid+"','"+gtype+"')\" style=\"cursor:hand\">";
		tmpStr= "<span ><div style=\"cursor:hand\" class=\"tv_icon_on\" onClick=\""+motherStr+"OpenLive('"+eventid+"','"+gtype+"')\"></div></span>";
	} else {
		//tmpStr+= "<img lowsrc=\"/images/member/video_2.gif\">";
		tmpStr= "<span ><div  class=\"tv_icon_out\"></div></span>";
	}
	return tmpStr;
}

function MM_ShowLoveI(gid,getDateTime,getLid,team_h,team_c){
	var txtout="";
	//if(!top.swShowLoveI){
		//alert(chkRepeat(gid));
		if(!chkRepeat(gid,getDateTime)){	
			//txtout = "<span id='sp_"+MM_imgId(getDateTime,gid)+"'><img id='"+MM_imgId(getDateTime,gid)+"' lowsrc=\"/images/member/icon_X2.gif\" vspace=\"0\" style=\"cursor:hand;display:none;\" title=\""+top.str_ShowMyFavorite+"\" onClick=\"addShowLoveI('"+gid+"','"+getDateTime+"','"+getLid+"','"+team_h+"','"+team_c+"'); \"></span>";
			txtout = "<span id='sp_"+MM_imgId(getDateTime,gid)+"'><div id='"+MM_imgId(getDateTime,gid)+"' class=\"fov_icon_out\" style=\"cursor:hand;display:none;\" title=\""+top.str_ShowMyFavorite+"\" onClick=\"addShowLoveI('"+gid+"','"+getDateTime+"','"+getLid+"','"+team_h+"','"+team_c+"'); \"></div></span>";
		}else{
			//txtout = "<span id='sp_"+MM_imgId(getDateTime,gid)+"'><img lowsrc=\"/images/member/love_small.gif\" style=\"cursor:hand\" title=\""+top.str_delShowLoveI+"\" onClick=\"chkDelshowLoveI('"+getDateTime+"','"+gid+"'); \"></span>";
			txtout = "<span id='sp_"+MM_imgId(getDateTime,gid)+"'><div class=\"fov_icon_on\" style=\"cursor:hand\" title=\""+top.str_delShowLoveI+"\" onClick=\"chkDelshowLoveI('"+getDateTime+"','"+gid+"'); \"></div></span>";
		}
	//}else{
		//txtout = "<img lowsrc=\"/images/member/love_small.gif\" style=\"cursor:hand\" title=\""+top.str_delShowLoveI+"\" onClick=\"chkDelshowLoveI('"+getDateTime+"','"+gid+"'); \">";
		//txtout = "<div class=\"fov_icon_on\" style=\"cursor:hand\" title=\""+top.str_delShowLoveI+"\" onClick=\"chkDelshowLoveI('"+getDateTime+"','"+gid+"'); \"></div>";
	//}
	return txtout;
}


function chkRepeat(gid,getDateTime){
	var getGtype =getGtypeShowLoveI();
	var sw =false;
	for (var i=0 ; i < top.ShowLoveIarray[getGtype].length ; i++){
		if(top.ShowLoveIarray[getGtype][i][0]==gid && top.ShowLoveIarray[getGtype][i][1] == getDateTime)
			sw =true;
	}
	return sw;
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
function getGtypeShowLoveI(){
	var Gtype;
	var getGtype =sel_gtype;
	var getRtype =rtype;
	Gtype =getGtype;
	if(getRtype=="re"){
		Gtype +="RE";
	}
	/*
	if(getGtype =="FU"||getGtype=="FT"){
		Gtype ="FT";
	}else if(getGtype =="OM"||getGtype=="OP"){
		Gtype ="OP";
	}else if(getGtype =="BU"||getGtype=="BK"){
		Gtype ="BK";
	}else if(getGtype =="BSFU"||getGtype=="BS"){
		Gtype ="BS";
	}else if(getGtype =="VU"||getGtype=="VB"){
		Gtype ="VB";
	}else if(getGtype =="TU"||getGtype=="TN"){
		Gtype ="TN";
	}else {
		Gtype ="FT";
	}
	*/
	
	//alert("in==>"+parent.sel_gtype+",out==>"+Gtype);
	return Gtype;
}
function MM_imgId(time,gid){	
	var tmp = time.split("<br>")[0];
	//alert("tmp===>"+tmp+"==="+"gid===>"+gid+"===");
	return tmp+gid;
}


/**
 * 選擇多盤口時 轉換成該選擇賠率
 * @param odd_type 	選擇盤口
 * @param iorH		主賠率
 * @param iorC		客賠率
 * @param show		顯示位數
 * @return		回傳陣列 0-->H  ,1-->C
 */
function  get_other_ioratio(odd_type, iorH, iorC , showior){
	var out=new Array();
	if(iorH!="" ||iorC!=""){
		out =chg_ior(odd_type,iorH,iorC,showior);
	}else{
		out[0]=iorH;
		out[1]=iorC;
	}
	return out;
}
/**
 * 轉換賠率
 * @param odd_f
 * @param H_ratio
 * @param C_ratio
 * @param showior
 * @return
 */
function chg_ior(odd_f,iorH,iorC,showior){
	//console.log("1. "+odd_f+"<>"+iorH+"<>"+iorC+"<>"+showior);
	iorH = Math.floor((iorH*1000)+0.001) / 1000;
	iorC = Math.floor((iorC*1000)+0.001) / 1000;
	
	var ior=new Array();
	if(iorH < 11) iorH *=1000;
	if(iorC < 11) iorC *=1000;
	iorH=parseFloat(iorH);
	iorC=parseFloat(iorC);
	switch(odd_f){
	case "H":	//香港變盤(輸水盤)
		ior = get_HK_ior(iorH,iorC);
		break;
	case "M":	//馬來盤
		ior = get_MA_ior(iorH,iorC);
		break;
	case "I" :	//印尼盤
		ior = get_IND_ior(iorH,iorC);
		break;
	case "E":	//歐洲盤
		ior = get_EU_ior(iorH,iorC);
		break;
	default:	//香港盤
		ior[0]=iorH ;
		ior[1]=iorC ;
	}
	ior[0]/=1000;
	ior[1]/=1000;
	
	ior[0]=printf(Decimal_point(ior[0],showior),iorpoints);
	ior[1]=printf(Decimal_point(ior[1],showior),iorpoints);
	//alert("odd_f="+odd_f+",iorH="+iorH+",iorC="+iorC+",ouH="+ior[0]+",ouC="+ior[1]);
	return ior;
}

/**
 * 換算成輸水盤賠率
 * @param H_ratio
 * @param C_ratio
 * @return
 */
function get_HK_ior( H_ratio, C_ratio){
	var out_ior=new Array();
	var line,lowRatio,nowRatio,highRatio;
	var nowType="";
	if (H_ratio <= 1000 && C_ratio <= 1000){
		out_ior[0]=H_ratio;
		out_ior[1]=C_ratio;
		return out_ior;
	}
	line=2000 - ( H_ratio + C_ratio );
	
	if (H_ratio > C_ratio){ 
		lowRatio=C_ratio;
		nowType = "C";
	}else{
		lowRatio = H_ratio;
		nowType = "H";
	}
	if (((2000 - line) - lowRatio) > 1000){
		//對盤馬來盤
		nowRatio = (lowRatio + line) * (-1);
	}else{
		//對盤香港盤
		nowRatio=(2000 - line) - lowRatio;	
	}
	
	if (nowRatio < 0){
		highRatio = Math.floor(Math.abs(1000 / nowRatio) * 1000) ;
	}else{
		highRatio = (2000 - line - nowRatio) ;
	}
	if (nowType == "H"){
		out_ior[0]=lowRatio;
		out_ior[1]=highRatio;
	}else{
		out_ior[0]=highRatio;
		out_ior[1]=lowRatio;
	}
	return out_ior;
}
/**
 * 換算成馬來盤賠率
 * @param H_ratio
 * @param C_ratio
 * @return
 */
function get_MA_ior( H_ratio, C_ratio){
	var out_ior=new Array();
	var line,lowRatio,highRatio;
	var nowType="";
	if ((H_ratio <= 1000 && C_ratio <= 1000)){
		out_ior[0]=H_ratio;
		out_ior[1]=C_ratio;
		return out_ior;
	}
	line=2000 - ( H_ratio + C_ratio );
	if (H_ratio > C_ratio){ 
		lowRatio = C_ratio;
		nowType = "C";
	}else{
		lowRatio = H_ratio;
		nowType = "H";
	}
	highRatio = (lowRatio + line) * (-1);
	if (nowType == "H"){
		out_ior[0]=lowRatio;
		out_ior[1]=highRatio;
	}else{
		out_ior[0]=highRatio;
		out_ior[1]=lowRatio;
	}
	return out_ior;
}
/**
 * 換算成印尼盤賠率
 * @param H_ratio
 * @param C_ratio
 * @return
 */
function get_IND_ior( H_ratio, C_ratio){
	var out_ior=new Array();
	out_ior = get_HK_ior(H_ratio,C_ratio);
	H_ratio=out_ior[0];
	C_ratio=out_ior[1];
	H_ratio /= 1000;
	C_ratio /= 1000;
	if(H_ratio < 1){
		H_ratio=(-1) / H_ratio;
	}
	if(C_ratio < 1){
		C_ratio=(-1) / C_ratio;
	}
	out_ior[0]=H_ratio*1000;
	out_ior[1]=C_ratio*1000;
	return out_ior;
}
/**
 * 換算成歐洲盤賠率
 * @param H_ratio
 * @param C_ratio
 * @return
 */
function get_EU_ior(H_ratio, C_ratio){
	var out_ior=new Array();
	out_ior = get_HK_ior(H_ratio,C_ratio);
	H_ratio=out_ior[0];
	C_ratio=out_ior[1];       
	out_ior[0]=H_ratio+1000;
	out_ior[1]=C_ratio+1000;
	return out_ior;
}
/*
去正負號做小數第幾位捨去
進來的值是小數值
*/
function Decimal_point(tmpior,show){
	var sign="";
	sign =((tmpior < 0)?"Y":"N");
	tmpior = (Math.floor(Math.abs(tmpior) * show + 1 / show )) / show;
	return (tmpior * ((sign =="Y")? -1:1)) ;
}


/*
 公用 FUNC
*/
function printf(vals,points){ //小數點位數
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
var ObjDataFT=new Array();
var oldObjDataFT=new Array();
var keepleg="";
var legnum=0;
var NoshowLeg=new Array();
var myLeg=new Array();
var LeagueAry=new Array();

//that body_browse be self 
//body_browse = this;
 
function ShowGameList(){
	if(""+top.hot_game=="undefined"){
		top.hot_game="";
	}		
	if(loading == 'Y') return;
	if (parent.gamecount!=gamount){
		oldObjDataFT=new Array();
	}
	if(top.odd_f_type==""||""+top.odd_f_type=="undefined") top.odd_f_type="H";
	keepscroll=body_browse.document.body.scrollTop;

	var conscroll= body_browse.document.getElementById('controlscroll');
	conscroll.style.display="";
	conscroll.style.top=keepscroll+1;
	//conscroll.focus();

	dis_ShowLoveI();

	//秀盤面
	showtables(GameFT,GameHead,gamount,top.odd_f_type);

	body_browse.scroll(0,keepscroll);

	//設定右方重新整理位置
	setRefreshPos();

	//顯示盤口
	body_browse.ChkOddfDiv();

	parent.gamecount=gamount;
	
	//日期下拉霸
	/*if (sel_gtype=="BU"){
		if (""+body_browse.document.getElementById('g_date')!="undefined"){
			body_browse.selgdate(rtype,g_date);
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
	keep_show_more(show_more_gid,ObjDataFT,gamount);
	parent.display_loading(false);
}
function coun_Leagues(){
	var coun=0;
	var str_tmp ="|"+eval('parent.'+sel_gtype+'_lname_ary');
	if(str_tmp=='|ALL'){
		body_browse.document.getElementById("str_num").innerHTML =top.alldata;
	}else{
		var larray=str_tmp.split('|');
		for(var i =0;i<larray.length;i++){
			if(larray[i]!=""){coun++}
		}
		coun =LeagueAry.length;
		body_browse.document.getElementById("str_num").innerHTML =coun;
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
	  		if (top.swShowLoveI&&tmp_Str!=""&&ObjDataFT[i].isMaster=="Y"){
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
	if(MM_IdentificationDisplay(ObjDataFT[gamerec].datetime,ObjDataFT[gamerec].gidm)) return "";
 }	
	if (!top.swShowLoveI){
	 if (top.hot_game==""){
		if(("|"+eval('parent.'+sel_gtype+'_lname_ary')).indexOf(("|"+ObjDataFT[gamerec].league+"|"),0)==-1&&eval('parent.'+sel_gtype+'_lname_ary')!='ALL') return "";
		if((""+LeagueAry).indexOf(ObjDataFT[gamerec].league)== -1)LeagueAry.push(ObjDataFT[gamerec].league);
	 }
	}
	var tmp_date = ObjDataFT[gamerec].datetime.split("<br>")[0];
	onelayer=onelayer.replace(/\*ID_STR\*/g,tmp_date+ObjDataFT[gamerec].gidm+"-"+ObjDataFT[gamerec].gnum_h);
	onelayer=onelayer.replace(/\*TR_EVENT\*/g	,"onMouseOver='mouseEnter_pointer(\"TR_"+tmp_date+ObjDataFT[gamerec].gidm+"\");' onMouseOut='mouseOut_pointer(\"TR_"+tmp_date+ObjDataFT[gamerec].gidm+"\");'");
	if (""+myLeg[ObjDataFT[gamerec].league]=="undefined"){
		myLeg[ObjDataFT[gamerec].league]=ObjDataFT[gamerec].league;
		myLeg[ObjDataFT[gamerec].league]=new Array();
		myLeg[ObjDataFT[gamerec].league][0]=tmp_date+ObjDataFT[gamerec].gidm+"-"+ObjDataFT[gamerec].gnum_h;
	}else{
		myLeg[ObjDataFT[gamerec].league][myLeg[ObjDataFT[gamerec].league].length]=tmp_date+ObjDataFT[gamerec].gidm+"-"+ObjDataFT[gamerec].gnum_h;
	}
	//--------------判斷聯盟名稱列顯示或隱藏----------------
	if (ObjDataFT[gamerec].league==keepleg){
			onelayer=onelayer.replace("*ST*"," style='display: none;'");
	}else{
			onelayer=onelayer.replace("*ST*"," style='display: ;'");
	}
	//---------------------------------------------------------------------
	//--------------判斷聯盟底下的賽事顯示或隱藏----------------
	if (NoshowLeg!=undefined && NoshowLeg[ObjDataFT[gamerec].league]==-1){
		onelayer=onelayer.replace(/\*CLASS\*/g,"style='display: none;'");
		onelayer=onelayer.replace("*LegMark*","<span id='LegClose'></span>"); //聯盟的小圖
	}else{
		onelayer=onelayer.replace(/\*CLASS\*/g,"style='display: ;'");
		onelayer=onelayer.replace("*LegMark*","<span id='LegOpen'></span>");  //聯盟的小圖
	}
	//---------------------------------------------------------------------
	//盤口賠率 start
	var R_ior =Array();
	var OU_ior =Array();
	//var EO_ior =Array();
	var OUH_ior = Array();
	var OUC_ior = Array();
	
	R_ior  = get_other_ioratio(odd_f_type, ObjDataFT[gamerec].ior_RH   , ObjDataFT[gamerec].ior_RC   , show_ior);
	OU_ior = get_other_ioratio(odd_f_type, ObjDataFT[gamerec].ior_OUH  , ObjDataFT[gamerec].ior_OUC  , show_ior);
	OUH_ior = get_other_ioratio(odd_f_type,ObjDataFT[gamerec].ior_OUHO,ObjDataFT[gamerec].ior_OUHU,show_ior);
	OUC_ior = get_other_ioratio(odd_f_type,ObjDataFT[gamerec].ior_OUCO,ObjDataFT[gamerec].ior_OUCU,show_ior);
	/*
	if((ObjDataFT[gamerec].ior_EOO != 0) && (ObjDataFT[gamerec].ior_EOE != 0)){
		EO_ior= get_other_ioratio("H", ObjDataFT[gamerec].ior_EOO*1-1 , ObjDataFT[gamerec].ior_EOE*1-1 , show_ior);
		ObjDataFT[gamerec].ior_EOO=EO_ior[0]*1+1;
		ObjDataFT[gamerec].ior_EOE=EO_ior[1]*1+1;
	}	
	*/
	ObjDataFT[gamerec].ior_RH=R_ior[0];
	ObjDataFT[gamerec].ior_RC=R_ior[1];
	ObjDataFT[gamerec].ior_OUH=OU_ior[0];
	ObjDataFT[gamerec].ior_OUC=OU_ior[1];
	ObjDataFT[gamerec].ior_OUHO=OUH_ior[0];
	ObjDataFT[gamerec].ior_OUHU=OUH_ior[1];
	ObjDataFT[gamerec].ior_OUCO=OUC_ior[0];
	ObjDataFT[gamerec].ior_OUCU=OUC_ior[1];
	//盤口賠率 end


	//滾球字眼
	ObjDataFT[gamerec].datetime=ObjDataFT[gamerec].datetime.replace("Running Ball",top.str_RB);
	keepleg=ObjDataFT[gamerec].league;
	onelayer=onelayer.replace(/\*LEG\*/gi,ObjDataFT[gamerec].league);

	var tmp_date=ObjDataFT[gamerec].datetime.split("<br>");
	if (sel_gtype=="BU"){
		tmp_date_str=tmp_date[0]+"<br>"+change_time(tmp_date[1]);
	}else{
		tmp_date_str=change_time(tmp_date[1]);
	}
	if (tmp_date.length==3){
		tmp_date_str+="<br>"+tmp_date[2];
	}	
	if(ObjDataFT[gamerec].isMaster=="Y"){
		onelayer=onelayer.replace("*DATETIME*",tmp_date_str);
	}else{
		onelayer=onelayer.replace("*DATETIME*","");
	}
	onelayer=onelayer.replace("*TEAM_H*",ObjDataFT[gamerec].team_h.replace("[Mid]","<font color=\"#005aff\">[N]</font>").replace("[中]","<font color=\"#005aff\">[中]</font>").replace("#FFFF99",""));
	onelayer=onelayer.replace("*TEAM_C*",ObjDataFT[gamerec].team_c.replace("#FFFF99",""));
	//全場
	
	//獨贏
	if ((ObjDataFT[gamerec].ior_MH*1 > 0) && (ObjDataFT[gamerec].ior_MC*1 > 0)){
		onelayer=onelayer.replace("*RATIO_MH*",parseUrl(uid,odd_f_type,"H",ObjDataFT[gamerec],gamerec,"M"));
		onelayer=onelayer.replace("*RATIO_MC*",parseUrl(uid,odd_f_type,"C",ObjDataFT[gamerec],gamerec,"M"));
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

	onelayer=onelayer.replace("*RATIO_RH*",parseUrl(uid,odd_f_type,"H",ObjDataFT[gamerec],gamerec,"R"));/*讓球賠率*/
	onelayer=onelayer.replace("*RATIO_RC*",parseUrl(uid,odd_f_type,"C",ObjDataFT[gamerec],gamerec,"R"));
	//大小
	if (top.langx=="en-us"){
		onelayer=onelayer.replace("*CON_OUH*",ObjDataFT[gamerec].ratio_o.replace("O","o"));	/*大小球頭*/
		onelayer=onelayer.replace("*CON_OUC*",ObjDataFT[gamerec].ratio_u.replace("U","u"));
	}else{
		onelayer=onelayer.replace("*CON_OUH*",ObjDataFT[gamerec].ratio_o.replace("O",top.strOver));	/*大小球頭*/
		onelayer=onelayer.replace("*CON_OUC*",ObjDataFT[gamerec].ratio_u.replace("U",top.strUnder));
	}
	onelayer=onelayer.replace("*RATIO_OUH*",parseUrl(uid,odd_f_type,"C",ObjDataFT[gamerec],gamerec,"OU"));/*大小賠率*/
	onelayer=onelayer.replace("*RATIO_OUC*",parseUrl(uid,odd_f_type,"H",ObjDataFT[gamerec],gamerec,"OU"));
	//單雙
		//onelayer=onelayer.replace("*RATIO_EOO*",ObjDataFT[gamerec].str_odd+parseUrl(uid,odd_f_type,"O",ObjDataFT[gamerec],gamerec,"EO"));
  	//onelayer=onelayer.replace("*RATIO_EOE*",ObjDataFT[gamerec].str_even+parseUrl(uid,odd_f_type,"E",ObjDataFT[gamerec],gamerec,"EO"));
  /*
	if (top.langx=="en-us"){
		onelayer=onelayer.replace("*RATIO_EOO*","<span class=\"con_oe\">"+ObjDataFT[gamerec].str_odd+"&nbsp</span>"+parseUrl(uid,odd_f_type,"O",ObjDataFT[gamerec],gamerec,"EO"));
    onelayer=onelayer.replace("*RATIO_EOE*","<span class=\"con_oe\">"+ObjDataFT[gamerec].str_even+"&nbsp</span>"+parseUrl(uid,odd_f_type,"E",ObjDataFT[gamerec],gamerec,"EO"));
	}else{
		onelayer=onelayer.replace("*RATIO_EOO*","<span class=\"con_oe\">"+ObjDataFT[gamerec].str_odd+"&nbsp</span>"+parseUrl(uid,odd_f_type,"O",ObjDataFT[gamerec],gamerec,"EO"));
    onelayer=onelayer.replace("*RATIO_EOE*","<span class=\"con_oe\">"+ObjDataFT[gamerec].str_even+"&nbsp</span>"+parseUrl(uid,odd_f_type,"E",ObjDataFT[gamerec],gamerec,"EO"));	
	}
	*/
	//全場總局數
	if(top.langx == "en-us"){
		onelayer = onelayer.replace("*CON_OUHO*",ObjDataFT[gamerec].ratio_ouho.replace("O","<font class=\"text_green\">o</font>"));/*大小球頭*/
		onelayer = onelayer.replace("*CON_OUHU*",ObjDataFT[gamerec].ratio_ouhu.replace("U","<font class=\"text_brown\">u</font>"));
		onelayer = onelayer.replace("*CON_OUCO*",ObjDataFT[gamerec].ratio_ouco.replace("O","<font class=\"text_green\">o</font>"));/*大小球頭*/
		onelayer = onelayer.replace("*CON_OUCU*",ObjDataFT[gamerec].ratio_oucu.replace("U","<font class=\"text_brown\">u</font>"));
	}else{
		onelayer = onelayer.replace("*CON_OUHO*",ObjDataFT[gamerec].ratio_ouho.replace("O","<font class=\"text_green\">"+top.strOver+"</font>"));/*大小球頭*/
		onelayer = onelayer.replace("*CON_OUHU*",ObjDataFT[gamerec].ratio_ouhu.replace("U","<font class=\"text_brown\">"+top.strUnder+"</font>"));
		onelayer = onelayer.replace("*CON_OUCO*",ObjDataFT[gamerec].ratio_ouco.replace("O","<font class=\"text_green\">"+top.strOver+"</font>"));/*大小球頭*/
		onelayer = onelayer.replace("*CON_OUCU*",ObjDataFT[gamerec].ratio_oucu.replace("U","<font class=\"text_brown\">"+top.strUnder+"</font>"));
	}
	onelayer = onelayer.replace("*RATIO_OUHO*",parseUrl(uid,odd_f_type,"O",ObjDataFT[gamerec],gamerec,"OUH"));/*大小賠率*/
	onelayer = onelayer.replace("*RATIO_OUHU*",parseUrl(uid,odd_f_type,"U",ObjDataFT[gamerec],gamerec,"OUH"));
	onelayer = onelayer.replace("*RATIO_OUCO*",parseUrl(uid,odd_f_type,"O",ObjDataFT[gamerec],gamerec,"OUC"));
	onelayer = onelayer.replace("*RATIO_OUCU*",parseUrl(uid,odd_f_type,"U",ObjDataFT[gamerec],gamerec,"OUC"));
	
	//onelayer=onelayer.replace("*MORE*",parseAllBets(ObjDataFT[gamerec],game_more));  
	 onelayer=onelayer.replace("*MORE*",""); //2015.12隐藏多玩法

	//我的最愛
	onelayer=onelayer.replace("*MYLOVE*",parseMyLoveV2(ObjDataFT[gamerec]));
	if (ObjDataFT[gamerec].eventid != "" && ObjDataFT[gamerec].eventid != "null" && ObjDataFT[gamerec].eventid != undefined) {	//判斷是否有轉播
		tmpStr= VideoFun(ObjDataFT[gamerec].eventid, ObjDataFT[gamerec].hot, ObjDataFT[gamerec].play, "BK");
		onelayer=onelayer.replace("*TV*",tmpStr);
	}
	onelayer=onelayer.replace("*TV*","");

	return onelayer;
	
	

	
	
}

//取得下注的url
function parseUrl(uid,odd_f_type,betTeam,GameData,gamerec,wtype){
	var ballType = "BK";
	if(sel_gtype=='VB'||sel_gtype=='VU') ballType='VB';
	else if(sel_gtype=='TT') ballType='TT';
	else if(sel_gtype=='TN'||sel_gtype=='TU') ballType='TT';
	else if(sel_gtype=='BM') ballType='BM';
	
	var urlArray=new Array();
	urlArray['R']=new Array("../BK_order/BK_order_r.php".replace('BK',ballType),eval("GameData.team_"+betTeam.toLowerCase()));
	urlArray['OU']=new Array("../BK_order/BK_order_ou.php",(betTeam=="C" ? top.strOver : top.strUnder));
	urlArray['EO']=new Array("../BK_order/BK_order_t.php", (betTeam=="O"  ? top.str_o : top.str_e));
	urlArray['M']=new Array("../BK_order/BK_order_m.php",(betTeam=="N" ? top.str_irish_kiss : eval("GameData.team_"+betTeam.toLowerCase())));
	urlArray['OUH'] = new Array("../BK_order/BK_order_ouhc.php",(betTeam=="O"?top.strOver:top.strUnder));
	urlArray['OUC'] = new Array("../BK_order/BK_order_ouhc.php",(betTeam=="O"?top.strOver:top.strUnder));
	
	var param=getParam(uid,odd_f_type,betTeam,wtype,GameData);
	var order=urlArray[wtype][0];
	var team=urlArray[wtype][1].replace("<font color=gray>","").replace("</font>","").replace("[Mid]","[N]");;
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
	
	var ret="<a href='javascript://' onclick=\"parent.parent.mem_order.betOrder('BK','"+wtype+"','"+param+"');\" title='"+team+"'><font "+check_ioratio(gamerec,tmp_rtype,GameData)+">"+ioratio+"</font></a>";

	return ret;
}
function Mathfloor(z){
 	var tmp_z;
	tmp_z=(Math.floor(z*100+0.01))/100;
 	return tmp_z;
}
//--------------------------public function --------------------------------

//取得下注參數
function getParam(uid,odd_f_type,betTeam,wtype,GameData){
	var paramArray=new Array();
	paramArray['R']=new Array("gid","uid","odd_f_type","type","gnum","strong","langx");
	paramArray['OU']=new Array("gid","uid","odd_f_type","type","gnum","langx");
	paramArray['EO']=new Array("gid","uid","odd_f_type","rtype","langx");
	paramArray['M']=new Array("gid","uid","odd_f_type","type","gnum","langx");
	paramArray["OUH"] = new Array("gid","uid","odd_f_type","wtype","type","langx");
	paramArray["OUC"] = new Array("gid","uid","odd_f_type","wtype","type","langx");



	var param="";
	var gid=((wtype=="R"||wtype=="OU"||wtype=="M"||wtype=="EO"||wtype=="OUH"||wtype=="OUC") ? GameData.gid : GameData.hgid);
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

function parsemore(GameData,g_more){
	var ret="";
	if(g_more=='0'||GameData.more=='0'){
		ret="&nbsp;";
	}else{
	 	ret="<A href=javascript: onClick=show_more('"+GameData.gid+"',event);>"+"<font class='total_color'>+"+GameData.more+"&nbsp;</font>"+str_more+"</A>";
	}
	return ret;
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

function show_more(gid,evt){
	evt = evt ? evt : (window.event ? window.event : null);
	var mY = evt.pageY ? evt.pageY : evt.y;
	body_browse.document.getElementById('more_window').style.position='absolute';
	body_browse.document.getElementById('more_window').style.top=mY+30;
	body_browse.document.getElementById('more_window').style.left=body_browse.document.body.scrollLeft+7;
	var  url="body_var_r_more.php?gid="+gid+"&uid="+uid+"&ltype="+ltype;
	body_browse.showdata.location.href = url;
}
function show_allbets(gid,evt){
	evt = evt ? evt : (window.event ? window.event : null);
	var mY = evt.pageY ? evt.pageY : evt.y;
	
	top.browse_ScrollY = getScroll(body_browse);//body_browse.scrollY;
	body_browse.document.getElementById('box').style.display="none";	
	body_browse.document.getElementById('refresh_right').style.display="none";
	body_browse.document.getElementById('refresh_down').style.display="none";
	try{
		body_browse.document.getElementById('p3Title').style.display="none";
	}catch(E){}
	if(g_date == ""){
		body_browse.document.getElementById('MFT').className="more_bar";
	}
	else {
	  body_browse.document.getElementById('MBU').className="more_bar";
	}
	
	
	body_browse.document.getElementById('more_window').style.position='absolute';
	body_browse.document.getElementById('more_window').style.top="0px";
	body_browse.document.getElementById('more_window').style.left="0px";
	show_more_gid = gid;
	retime_flag = "N"; 
	if(typeof(top.more_fave_wtype) == "undefined" ) top.more_fave_wtype = new (top.Array)();
	//if(typeof(top.more_fave_wtype[show_more_gid]) == "undefined" ) top.more_fave_wtype[show_more_gid] = new (top.Array)();
	var  url="body_var_r_allbets.php?gid="+gid+"&uid="+uid+"&ltype="+ltype+"&langx="+top.langx+"&gtype=BK";

	body_browse.showdata.location.href = url;
}
function getScroll(frameObj){
		return body_browse.scrollY || body_browse.document.body.scrollTop ; 
}


function chk_half(str){
	if(str.indexOf("<font color=gray>") > -1) return true;
	return false;
}
function parseMore(GameData,g_more){
	var ret="";
	if(g_more=='0'||GameData.more=='0'){
		ret="&nbsp;";
	}else{
	 	ret="<A href=javascript: onClick=show_more('"+GameData.gid+"',event);>"+"<font class='total_color'>+"+GameData.more+"&nbsp;</font>"+str_more+"</A>";
	}			
	return ret;	
}
function show_more(gid,evt){
	evt = evt ? evt : (window.event ? window.event : null);
	var mY = evt.pageY ? evt.pageY : evt.y;
	body_browse.document.getElementById('more_window').style.position='absolute';
	body_browse.document.getElementById('more_window').style.top=mY+30;
	body_browse.document.getElementById('more_window').style.left=body_browse.document.body.scrollLeft+10;
	show_more_gid = gid;
	var  url="body_var_r_more.php?gid="+gid+"&uid="+uid+"&ltype="+ltype+"&langx="+top.langx;
	body_browse.showdata.location.href = url;
}var isHot_game = true;//是否為世足賽

//that body_browse be self 


//try{
//	if(frame_broke) body_browse = this;
//	else 			body_browse = body_browse;
//}catch(e){
//	//try{ console.log("error body_browse set from FT_mem_Function"); }catch(e){};
//}


//--------------------------------public function ----------------------------

function setRefreshPos(){
		var refresh_right= body_browse.document.getElementById('refresh_right');
		refresh_right.style.left= body_browse.document.getElementById('myTable').clientWidth*1+20;
		//refresh_right.style.top= 39;
	}


function check_ioratio(rec,rtype,GameData){
//alert(flash_ior_set);
	//return true;
	//alert(GameFT.length+"----"+keepGameData.length)

	if (flash_ior_set =='Y'){
		//alert(oldObjDataFT[rec]);
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
//--------------判斷聯盟顯示或隱藏----------------
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
//----------------------

//分頁
function show_page(){
	//alert(rtype)
	pg_str='';
	obj_pg = body_browse.document.getElementById('pg_txt');
//	alert(t_page);
	if (t_page==0){
		t_page=1;
		//obj_pg.innerHTML = "";
		//return;
	}
	var tmp_lid="";
	if (rtype=="re"||rtype.match("^re")){
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

//隱藏我的最愛選擇聯賽
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
	//alert("loadingOK")
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
	//alert(head_str);
	
	for( var i=0;i<countgames.length;i++){
		var detailgame=countgames[i].split("|");
		recordHash[detailgame[0]+"_"+detailgame[1]]=detailgame[2]*1;
	}
	//alert(top.head_gtype+"--"+head_str+"--"+recordHash[top.head_gtype+"_HOT_"+head_str]);
	if(recordHash[top.head_gtype+"_HOT_"+head_str]*1==0){
		body_browse.document.getElementById("euro_btn").style.display="none";
		body_browse.document.getElementById("euro_up").style.display="none";
		//body_browse.document.getElementById("euro_close").style.display="";
		if(top.hot_game!=""){
			top.hot_game="";
			body_browse.reload_var();
		}
	}else{
		//alert(isHot_game+"--"+top.hot_game);
		if(isHot_game){
			if(top.hot_game!=""){
				body_browse.document.getElementById("euro_btn").style.display="none";
				body_browse.document.getElementById("euro_up").style.display="";
			}else{
				body_browse.document.getElementById("euro_btn").style.display="";
				body_browse.document.getElementById("euro_up").style.display="none";
			}
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

//function getCountHOT(){
//	return recordHash[top.head_gtype+"_HOT_FT"];
//}
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

function showCleanData(gtype,rtype,show){
	document.getElementById("LoadLayer").style.display="none";
	body_browse.location.href="../showCleanData.php?uid="+uid+"&ltype="+ltype+"&gtype="+gtype+"&rtype="+rtype+"&show="+show+"&langx="+langx;
}
/* Obj.e520 | Copyright 2014 ,Cvssp Inc. from this DBA Depts. | Gather you rosebuds while you may. | string
  bill TW_time:2014-11-11 17:06:39 file(112-300,301,302,303,304,224,212,321)
   

 conf_lvar_00 (160) 
top["str_input_pwd"]="请输入密码。";
top["str_input_repwd"]="请输入确认密码。";
top["str_err_pwd"]="密码确认错误, 请重新输入。";
top["str_pwd_limit"]="您输入的密码不符合要求：<br>1. 您的新密码必须由 6-12个字母和数字 (A-Z 或 0-9)组成. <br>2. 您的新密码不能和现用密码相同。";
top["str_pwd_limit2"]="您输入的密码不符合要求：<br>1. 您的新密码必须由 6-12个字母和数字 (A-Z 或 0-9)组成. <br>2. 您的新密码不能和现用密码相同。";
top["str_pwd_NoChg"]="您的新密码必须和现用密码不一样。";
top["str_pwd_NowErr"]="您输入的密码不正确，请重试。";
top["str_pwd_OldErr"]="请输入现用密码。";
top["str_input_longin_id"]="请输入登录帐号。";
top["str_longin_limit1"]="您输入的登录帐号不符合要求：<br>1. 您的登入帐号必须由2个英文大小写字母(A-Z或a-z)和数字(0-9)组合, 输入限制6-12字元.<br>2. 您的登入帐号不准许有空格.";
top["str_longin_limit2"]="您的登录帐号需使用字母加上数字!!";
top["str_o"]="单";
top["str_e"]="双";
top["str_checknum"]="验证码错误,请重新输入";
top["str_irish_kiss"]="和";
top["dPrivate"]="私域";
top["dPublic"]="公有";
top["grep"]="群组";
top["grepIP"]="群组IP";
top["IP_list"]="IP列表";
top["Group"]="组别";
top["choice"]="请选择";
top["account"]="请输入登录帐号。";
top["password"]="请输入密码。";
top["S_EM"]="特早";
top["alldata"]="全部";
top["date"]="所有日期";
top["webset"]="资讯网";
top["str_renew"]="更新";
top["outright"]="冠军";
top["financial"]="金融";
top["str_FT"]="足球";
top["str_BK"]="篮球";
top["str_TN"]="网球";
top["str_VB"]="排球";
top["str_BM"]="羽毛球";
top["str_TT"]="兵乓球";
top["str_BS"]="棒球";
top["str_OP"]="其他";
top["str_score"]="比分";
top["str_order_FT"]="足球";
top["str_order_BK"]="篮球 / 美式足球";
top["str_order_TN"]="网球";
top["str_order_VB"]="排球";
top["str_order_BM"]="羽毛球";
top["str_order_TT"]="兵乓球";
top["str_order_BS"]="棒球";
top["str_order_OP"]="其他";
top["str_fs_FT"]="足球 : ";
top["str_fs_BK"]="篮球 / 美式足球 : ";
top["str_fs_TN"]="网球 : ";
top["str_fs_VB"]="排球 : "; No.50 
top["str_fs_BM"]="羽毛球 : ";
top["str_fs_TT"]="兵乓球 : ";
top["str_fs_BS"]="棒球 : ";
top["str_fs_OP"]="其他体育 : ";
top["str_game_list"]="所有球类";
top["str_date_list"]="所有日期";
top["str_second"]="秒";
top["str_demo"]="样本播放";
top["str_alone"]="独立";
top["str_back"]="返回";
top["str_RB"]="滚球";
top["str_msAll"]="(全场)";
top["str_ShowMyFavorite"]="我的最爱";
top["str_ShowAllGame"]="全部赛事";
top["str_delShowLoveI"]="移出";
top["str_SortType"]="按时间排序";
top["str_SortTypeC"]="按联盟排序";
top["str_SortTypeT"]="按时间排序";
top["strOver"]="大";
top["strUnder"]="小";
top["strOdd"]="单";
top["strEven"]="双";
top["message001"]="请输入下注金额。";
top["message002"]="只能输入数字!!";
top["message003"]="最低投注额是 ";
top["message004"]="本场有下注金額最高是 ";
top["message005"]=" 元限制!!";
top["message006"]="最高投注额设在";
top["message007"]="总下注金额已超过单场限额。";
top["message008"]="本场累积下注共: ";
top["message009"]="。\n\n总下注金额已超过单场限额。";
top["message010"]="下注金额不可大于信用额度。";
top["message011"]="可赢金额：";
top["message012"]="<br>确定进行下注吗?";
top["message013"]="确定进行下注吗?<br>";
top["message014"]="未输入下注金额!!!";
top["message015"]="下注金额只能输入数字。";
top["message016"]="\n\n确定进行下注吗?";
top["message017"]="串1";
top["message018"]="队联碰";
top["message019"]="您必须选择至少";
top["message020"]="个队伍,否则不能下注!!";
top["message021"]="不接受";
top["message022"]="串过关投注。";
top["message023"]="请输入欲下注金额!!";
top["message024"]="已超过某场次之过关注单限额!!";
top["message025"]="下注金额不可大于信用额度。";
top["message026"]="请选择下注队伍!!";
top["message027"]="单式投注请至单式下注页面下注!!";
top["message028"]="仅接受"; No.100 
top["message029"]="串投注!!";
top["message030"]="确定要进行交易吗？";
top["message031"]="请输入要搜寻的文字";
top["message032"]="找不到相符项目";
top["message033"]="你的浏览器不支援";
top["page"]="页";
top["refreshTime"]="刷新";
top["showmonth"]="月";
top["showday"]="日";
top["showtoday"]="今日";
top["showfuture"]="未来";
top["Half1st"]="上半滚球";
top["Half2nd"]="下半滚球";
top["mem_logut"]="您的帐号已登出";
top["retime1H"]="上半场";
top["retime2H"]="下半场";
top["str_otb_close"]="赛事已关闭。";
top["no_oly"]="您选择的项目暂时没有赛事。请查看冠军玩法。";
top["conf_R"]="让球,大小,单双";
top["conf_RE"]="滚球让球,滚球大小,滚球单双";
top["conf_RE_BK"]="滚球让球,滚球大小,滚球单双";
top["conf_M"]="独赢,滚球独赢";
top["conf_M_BK"]="独赢,滚球独赢";
top["conf_DT"]="其他";
top["conf_RDT"]="滚球其他";
top["conf_FS"]="冠军";
top["str_more"]="更多玩法";
top["str_all_bets"]="所有玩法";
top["str_TV_RB"]="视频转播可使用";
top["str_TV_FT"]="视频转播将在滚球时提供";
top["addtoMyMarket"]="加到\"我的盘口\"";
top["str_BK_OT"]="加时";
top["str_midfield"]="中";
top["str_BK_Market_Main"]="览看主要盘口";
top["str_BK_Market_All"]="览看所有盘口 ";
top["str_BK_Period_View"]="览看赛节投注";
top["str_BK_Period_Hide"]="隐藏赛节投注 ";
top["str_TN_Market_Main"]="览看主要盘口";
top["str_TN_Market_All"]="览看所有盘口";
top["str_TN_Period_View"]="览看赛盘投注";
top["str_TN_Period_Hide"]="隐藏赛盘投注";
top["str_BM_Market_Main"]="览看主要盘口";
top["str_BM_Market_All"]="览看所有盘口";
top["str_BM_Period_View"]="览看赛局投注";
top["str_BM_Period_Hide"]="隐藏赛局投注";
top["str_TT_Market_Main"]="览看主要盘口";
top["str_TT_Market_All"]="览看所有盘口";
top["str_TT_Period_View"]="览看赛局投注";
top["str_TT_Period_Hide"]="隐藏赛局投注";
top["str_VB_Market_Main"]="览看主要盘口";
top["str_VB_Market_All"]="览看所有盘口";
top["str_VB_Period_View"]="览看赛局投注";
top["str_VB_Period_Hide"]="隐藏赛局投注";
top["TN_set_1"]="第一盘";
top["TN_set_2"]="第二盘";
top["TN_set_3"]="第三盘";
top["TN_set_4"]="第四盘";
top["TN_set_5"]="第五盘";
top["BM_set_1"]="第一局";
top["BM_set_2"]="第二局"; No.150 
top["BM_set_3"]="第三局";
top["BM_set_4"]="第四局";
top["BM_set_5"]="第五局";
top["VB_set_1"]="第一局";
top["VB_set_2"]="第二局"; No.150 
top["VB_set_3"]="第三局";
top["VB_set_4"]="第四局";
top["VB_set_5"]="第五局";
top["VB_set_6"]="第六局";
top["VB_set_7"]="第七局";
top["TT_set_1"]="第一局";
top["TT_set_2"]="第二局"; No.150 
top["TT_set_3"]="第三局";
top["TT_set_4"]="第四局";
top["TT_set_5"]="第五局";
top["TT_set_6"]="第六局";
top["TT_set_7"]="第七局";
top["str_VB_Game"]="总局数 : ";
top["str_VB_allPoint"]="球员总分 : ";
top["str_VB_point"]="分数 : ";
top["str_VB_more_r0"]="让局";
top["str_VB_more_r"]="让分";
top["str_VB_more_re0"]="让局";
top["str_VB_more_re"]="让分"; No.160 
top["point"]=".";//點

 conf_lvar_01  (3) 
top.str_HCN=["主","客","无"];

 conf_lvar_02  (24) 
top.strRtypeSP={"PGF":"最先进球","OSF":"最先越位","STF":"最先替补","CNF":"最先角球","CDF":"第一张罚牌","RCF":"最先任意球","YCF":"最先界外球","GAF":"最先球门球","PGL":"最后进球","OSL":"最后越位","STL":"最后替补","CNL":"最后角球","CDL":"最后一张罚牌","RCL":"最后任意球","YCL":"最后界外球","GAL":"最后球门球","PG":"最先/最后进球球队","OS":"最先/最后越位球队","ST":"最先/最后替补球员球队","CN":"最先/最后角球","CD":"第一张/最后一张罚牌","RC":"最先/最后任意球","YC":"最先界外球/最后界外球","GA":"最先/最后球门球"};

 conf_lvar_03  (3) 
top.statu={"HT":"半场","1H":"上半场","2H":"下半场"};

 conf_lvar_04  (7) 
top.str_BK_MS=["","上半场","下半场","第一节","第二节","第三节","第四节"];

 conf_session  (41) 
top._session={"FTi0":"全场","FTi1":"上半","BKi0":"全场","BKi1":"上半","BKi2":"下半","BKi3":"第1节","BKi4":"第2节","BKi5":"第3节","BKi6":"第4节","BSi0":"全场","FSi0":"全场","OPi0":"全场","TNi0":"全场","TNi1":"第一盘","TNi2":"第二盘","TNi3":"第三盘","TNi4":"第四盘","TNi5":"第五盘","TNi6":"让局","TNi7":"主队局数","TNi8":"客队局数","VBi0":"全场","VBi1":"局数","VBi2":"分数","VBi3":"第一局","VBi4":"第二局","VBi5":"第三局","VBi6":"第四局","VBi7":"第五局","VBi8":"第六局","VBi9":"第七局","BMi0":"全场","BMi1":"分数","BMi2":"第一局","BMi3":"第二局","BMi4":"第三局","BMi5":"第四局","BMi6":"第五局","BMi7":"第六局","BMi8":"第七局","TTi0":"全场"};

 conf_gtype  (9) 
top._gtype={"FT":"足球","BK":"篮球","BS":"棒球","FS":"冠军","OP":"其他","TN":"网球","VB":"排球","BM":"羽毛球","TT":"乒乓球"};

 conf_lvar_21  (19) 
top.str_result={"No":"无","Y":"是","N":"否","FG_S":"射门","FG_H":"头球","FG_N":"无进球","FG_P":"点球","FG_F":"任意球","FG_O":"乌龙球","T3G_1":"26分钟以下","T3G_2":"27分钟+","T3G_N":"无进球","T1G_N":"无进球","T1G_1":"0 - 14:59","T1G_2":"15 - 29:59","T1G_3":"30 – 半场","T1G_4":"45 – 59:59","T1G_5":"60 – 74:59","T1G_6":"75 – 全场"};  
//在body_browse載入
*/

var ReloadTimeID;
//var sel_gtype=parent.sel_gtype;
var Market="";
var Period="";

//網頁載入
function onLoad(){
	top.swShowLoveI=false;
	//if((""+eval("parent."+sel_gtype+"_lname_ary"))=="undefined") eval("parent."+sel_gtype+"_lname_ary='ALL'");
	//if((""+eval("parent."+sel_gtype+"_lid_ary"))=="undefined") eval("parent."+sel_gtype+"_lid_ary='ALL'");
	if(ShowType==""||rtype=="r") ShowType = 'OU';
	//if(rtype=="hr") ShowType = 'OU';
	if(rtype=="re") ShowType = 'RE';
	//if(rtype=="pd") ShowType = 'PD';
	//if(rtype=="hpd") ShowType = 'HPD';
	//if(rtype=="t") ShowType = 'EO';
	//if(rtype=="f") ShowType = 'F';
	if(parent.leg_flag=="Y"){
		parent.leg_flag="N";
		pg=0;
		//reload_var("");
	}
	
	loading = 'N';
	
	if(rtype == "p3"){
		try{
			//showDateSel();
			//showDateSel_Future();
		}catch(E){}
	}
	
	if(loading_var == 'N'){
		ShowGameList();
		obj_layer = document.getElementById('LoadLayer');
		obj_layer.style.display = 'none';
	}
	if (retime_flag == 'Y'){
		//ReloadTimeID = setInterval("reload_var()",retime*1000);
		count_down();
	}else{
		var rt=document.getElementById('refreshTime');
		rt.innerHTML=top.refreshTime;	
	}
	document.getElementById("odd_f_window").style.display = "none";
	if(sel_gtype=="BU"){
		
		if (rtype.split("_")[0] == "r" || rtype == "p3"){
			try{
				showDateSel_Future();
			}catch(E){}
		}else if(rtype != "p3"){
			if(top.showtype!='hgft'){
				selgdate(rtype,g_date);
			}
		}
		//futureShowGtypeTable();
	}
	if (""+top.BK_RE_session=="undefined"){
		top.BK_RE_session="all";	
	}
	/* //sel_rtype
	if (rtype=="r"||rtype=="all"||rtype=="rq4"||rtype=="re"){
		var selRtype=document.getElementById("sel_rtype");
		for (i = 0; i < selRtype.length; i++) {
			if (rtype=="re"){
				if(selRtype.options[i].value==top.BK_RE_session){
					selRtype.selectedIndex=i;
				}
			}else{
				if(selRtype.options[i].value==rtype){
					selRtype.selectedIndex=i;
				}
			}
		}
	}
	*/
	gameSort();
	// if (rtype!="p3"){
		setMarketPeriod(rtype);
		MarketPeriod();
	// }
	
	document.getElementById("body_var").onload=iframe_onError;
	
	reload_var("");
	try{ console.log(sel_gtype+" load end"); }catch(e){};
}

function iframe_onError(){
	var iframe = document.getElementById("body_var");
	
	try{
		check = iframe.contentWindow.document.body.onload;
	}catch(e){
		check = null;
	}
	
	if(check == null){
		iframe.times = iframe.times || 0;
		showerror(iframe);
	}else{
		iframe.times = 0;
	}
}

function showerror(e){
	e.times+=1;
	if(e.times > 10)	return;
	setTimeout('onLoad()',5000);
}


body_var_onLoad=function(){
	_=window;
	
	if(_.parent.mem_order.location == 'about:blank'){
		_.parent.mem_order.location = '<?php echo BROWSER_IP."/app/member/select.php?uid=$uid&langx=$langx";?>';
	}
	if(_.retime > 0){
		_.retime_flag='Y';
		_.count_down();
	}else{
		_.retime_flag='N';
	}
	_.loading_var = 'N';
	if(_.clean_data_sw=="Y"){
		_.showCleanData("BK",_.rtype,"FT");
	}else{
		if(_.loading == 'N' && _.ShowType != ''){
			_.ShowGameList();
			//parent.body_browse.document.all.LoadLayer.style.display = 'none';
		}
	}
}


window.onscroll = scroll;

function scroll()
{
	var refresh_right= document.getElementById('refresh_right');
	refresh_right.style.top=document.body.scrollTop+39;
	//refresh_right.style.top=document.body.scrollTop+21+34+25+10;
	//refresh_right.style.top=document.body.scrollTop+(document.body.clientHeight-118)/2;
	                      // 捲軸位置              +( frame高度                -header高度)/2
	
 //alert("scroll event detected! "+document.body.scrollTop);
// 
	//conscroll.style.display="block";
//conscroll.style.top=document.body.scrollTop;
 // note: you can use window.innerWidth and window.innerHeight to access the width and height of the viewing area
}

function showDateSel(){
	var showDateSel = body_browse.document.getElementById("showDateSel");
	var dateSel = body_browse.document.getElementById("dateSel").innerHTML;
	var tmpShow = "";
	
	//過關日期要取幾個
	var dateList = 8;
	for(var i=0; i<dateList; i++){
		var tmp = dateSel;
		var sel_class = "&nbsp;";
		var sel_value = "";
		var sel_str = "";
		
		if(i == 0){
			tmp = tmp.replace("*DATE_SHOWTYPE*","");
			sel_value = DateAry[i];
			sel_str = top.showtoday;
		}else if((i+1) == dateList){
			tmp = tmp.replace("*DATE_SHOWTYPE*","BU");
			sel_value = DateAry[i]+"|"+DateAry[i+1]+"|"+DateAry[i+2]+"|"+DateAry[i+3]+"|"+DateAry[i+4]+"|"+DateAry[i+5];
			sel_str = top.showfuture;
		}else{
			tmp = tmp.replace("*DATE_SHOWTYPE*","BU");
			sel_value = DateAry[i];
			sel_str = chgDateStr(DateAry[i]);
		}
		
		if(top.sel_gd=="today" && i==0){
			sel_class = "day_text_red";
		}else{
			var tAry = top.sel_gd.split("|");
			if((tAry.length > 1) && ((i+1) == dateList)){
				sel_class = "day_text_red";
			}else if(sel_value == top.sel_gd){
				sel_class = "day_text_red";
			}
		}
		
		tmp = tmp.replace("*DATE_CLASS*",sel_class);
		tmp = tmp.replace("*DATE_VALUE*",sel_value);
		tmp = tmp.replace("*DATE_SEL*",sel_str);
		
		tmpShow += tmp;
	}
	
	showDateSel.innerHTML = tmpShow;
}


function showDateSel_Future(){
	var showDateSel = body_browse.document.getElementById("showDateSel");
	var dateSel = body_browse.document.getElementById("dateSel").innerHTML;
	var tmpShow = "";
	
	//初始化選擇的日期
	top.sel_gd = g_date;
	//g_date = DateAry[0];
	
	//日期清單要列幾個
	var dateList = 9;
	
	for(var i=0; i<dateList; i++){
		var tmp = dateSel;
		var sel_class = "&nbsp;";
		var sel_value = "";
		var sel_str = "";
		
		if(i == dateList -2){
			tmp = tmp.replace("*DATE_SHOWTYPE*","BU");
			sel_value = DateAry.slice(i).join("|");
			sel_str = top.showfuture;
		}else if(i == dateList -1){
			tmp = tmp.replace("*DATE_SHOWTYPE*","ALL");
			sel_value = "ALL";
			//sel_value = DateAry.join("|");
			sel_str = top.date;
		}else{
			tmp = tmp.replace("*DATE_SHOWTYPE*","BU");
			sel_value = DateAry[i];
			sel_str = chgDateStr(DateAry[i]);
		}
		
		if(sel_value == top.sel_gd){
			sel_class = "day_text_red";
		}else{
			var tAry = top.sel_gd.split("|");
			if((tAry.length > 1) && ((i+1) == DateAry.length)){
				sel_class = "day_text_red";
			}else if(sel_value == top.sel_gd){
				sel_class = "day_text_red";
			}
		}
		
		tmp = tmp.replace("*DATE_CLASS*",sel_class);
		tmp = tmp.replace("*DATE_VALUE*",sel_value);
		tmp = tmp.replace("*DATE_SEL*",sel_str);
		
		tmpShow += tmp;
	}

	showDateSel.innerHTML = tmpShow;
}

function chgDateStr(date){
	var showgdate = date.split("-");
	var tmpsdate = showgdate[1]+"-"+showgdate[2];
	
	if(top.langx=="zh-tw" || top.langx=="zh-cn"){
		if((showgdate[1]*1)< 10)	showgdate[1] = showgdate[1]*1;
		if((showgdate[2]*1)< 10)	showgdate[2] = showgdate[2]*1;
		tmpsdate = showgdate[1]+top.showmonth+showgdate[2]+top.showday;
	}
	
	return tmpsdate;
}

function new_chg_gdate(obj,stype,date){
	g_date = date;
	pg = 0;
	
	//2015-02-09 綜合過關 選日期換色
	var tmpObj = document.getElementById("showDateSel");
	for(var i=0; i<tmpObj.children.length; i++){
		tmpObj.children[i].className = "";
	}
	obj.className = "day_text_red";
	
	parent.display_loading(true);
	
	reload_var("",stype);
}

function reload_fake(){
	//parent.display_loading(true);
	//console.log(" under 10 ");
	reTimeNow = retime;
	ReloadTimeFake = setTimeout("ShowGameList()",200);
}


function reload_chk(time){
		if(ReloadTimeFake){
			clearTimeout(ReloadTimeFake);
		}
		
		var nowReloadSec = new Date().getTime();
		var nowSec = Math.round(nowReloadSec/1000);
		//console.log("now >> "+nowSec);
		
		if(LastReloadSec == 0){
			LastReloadSec = nowSec;
		}else{
			var lastSec = LastReloadSec;
			//console.log("last >> "+lastSec);
			//console.log(" > "+(nowSec-lastSec));
			
			if((nowSec - lastSec) >= time){
				//console.log(" over "+time+" ");
				//LastReloadSec = 0;
				LastReloadSec = nowSec;
				return true
			}else{
				return false;
			}
		}
}

function setleghi(leghight){
	var legview =document.getElementById('legFrame');
	
	if((leghight*1) > 95){
		legview.height = leghight;
	}else{
		
		legview.height = 95;
	}
	
}

function reload_var(Level,p3_sel){
	loading_var = "Y";
	
	var tmp_sel_gtype = sel_gtype;
	var showt = "";
	var l_id ;
	if(rtype == "p3"){
		/*
		tmp_sel_gtype = (top.sel_gd == "today")?"BK":"BU";
		var tmp_s = (top.sel_gd == "today")?"":"BU";
		
		if(p3_sel != undefined){
			if(p3_sel == ""){
				tmp_sel_gtype = "BK";
			}else{
				tmp_sel_gtype = "BU";
			}
			
			tmp_s = p3_sel;
		}
		*/
		//showt = "&showgtype="+tmp_s;
		var tmp = "./body_var.php";
		l_id = parent.FT_lid_type;
	}else{
		if(Level == "up"){
			var tmp = "./"+tmp_sel_gtype+"_browse/body_var.php";
			if(tmp_sel_gtype == "BU"){
				tmp = "./BK_future/body_var.php";
			}
		}else{
			var tmp = "./body_var.php";
		}
		l_id = parent[tmp_sel_gtype+"_lid_type"];
		//l_id = eval("parent."+tmp_sel_gtype+"_lid_type");
	}
	
	if(top.showtype=="hgft" && tmp_sel_gtype=="BU"){
		l_id = 3;
	}
	
	if(top.hot_game == undefined)	top.hot_game = "";
	if(rtype == "p3")	top.hot_game = "";
	
	var homepage = tmp+"?uid="+uid+"&rtype="+rtype+"&langx="+langx+"&mtype="+mtype+"&page_no="+pg+"&league_id="+l_id+"&hot_game="+top.hot_game+showt;
	
	if(tmp_sel_gtype == "BU"){
		homepage += "&g_date="+g_date;
	}
	
	//try{
	//	console.log("homepage >> "+homepage);
	//}catch(E){}
	
	document.getElementById("body_var").contentWindow.location.href = homepage;
	if(rtype=="r") document.getElementById('more_window').style.display='none';
}




var cntTimer;
//倒數自動更新時間
function count_down(){
	if(cntTimer) clearTimeout(cntTimer);
	var rt=document.getElementById('refreshTime');
	cntTimer = setTimeout('count_down()',1000);
	if (retime_flag == 'Y'){
		if(retime <= 0){
			if(loading_var == 'N')
				reload_var("");
				return;
		}
		retime--;
		rt.innerHTML=retime;
		//alert(retime);
		//obj_cd = document.getElementById('cd');
		//obj_cd.innerHTML = retime;
	}
}



//賽事換頁
function chg_pg(mypg){
	if (mypg==pg) {return;}
	pg=mypg;
	reload_var("");
}

function chg_wtype(wtype){
	var l_id = parent[sel_gtype+"_lid_type"];
		//var l_id =eval("parent."+sel_gtype+"_lid_type");
	if(top.showtype=='hgft'&&sel_gtype=="BU"){
		l_id=3;	
	}
	location.href="index.php?uid="+top.uid+"&langx="+top.langx+"&mtype="+ltype+"&rtype="+wtype+"&showtype=&league_id="+l_id;
	
	//<frame name="body_var" scrolling="NO" noresize src="body_var.php?uid=<?echo $uid?>&rtype=<?echo $rtype?>&langx=<?echo $langx?>&mtype=<?echo $mtype;?>&delay=<?echo $delay;?>&league_id=<?echo $league_id?>">
	//<frame name="body_browse" src="body_browse.php?uid=<?echo $uid?>&rtype=<?echo $rtype?>&langx=<?echo $langx?>&mtype=<?echo $mtype;?>&delay=<?echo $delay;?>&showtype=<?echo $showtype?>">
	
	
}

//選擇聯盟
function chg_league(){
//	var legframe= document.getElementById('legFrame');
	var legview =document.getElementById('legView');
	try{	
		legFrame.location.href="./body_var_lid.php?uid="+uid+"&rtype="+rtype+"&langx="+langx+"&mtype="+ltype;
	}catch(e){
		legFrame.src="./body_var_lid.php?uid="+uid+"&rtype="+rtype+"&langx="+langx+"&mtype="+ltype;
 
	}
	legview.style.display='';
	legview.style.top=  document.body.scrollTop+82; //21+34+25+10;
	legview.style.left= 10; //100;
	//self.location="./body_var_lid.php?uid="+uid+"&rtype="+rtype+"&langx="+langx+"&mtype="+ltype;
}
function LegBack(){
	var legview =document.getElementById('legView');
	legview.style.display='none';
	reload_var("");

	}


function unload(){
	clearInterval(ReloadTimeID);
}
window.onunload=unload;

//-----------------------------future------------------------
function selgdate(rtype,cdate){
	//賽事分日期
	var date_opt = "";
	var arrDate =new Array();
	var year ='';
	var nowDate="";	
	if(top.showtype=='hgft'){
		var tmpdate=DateAry[0].split("-");
		for (i = 0; i < hotgdateArr.length; i++) {
			var tmpd =hotgdateArr[i].split("-");
			if(tmpdate[1]*1 > tmpd[0]*1){
				year =tmpdate[0]*1+1;
			}else{
				year =tmpdate[0];
			}
			arrDate =arraySort1(arrDate,year+'-'+hotgdateArr[i]);
		}
		if(cdate=='')cdate ='ALL';
		date_opt = '<select id="g_date" name="g_date" onChange="chg_gdate()">';
		date_opt+= '<option value="ALL" '+((cdate =='ALL')?'selected':'')+'>'+top.alldata+'</option>';
		for (i = 0; i < arrDate.length; i++) {
			nowDate=showdate(arrDate[i]);
			date_opt+= '<option value="'+arrDate[i]+'" '+((cdate ==arrDate[i])?'selected':'')+'>'+nowDate+'</option>';
		}
		date_opt+= "</select>";
	}else{
		arrDate=DateAry ;
		date_opt = "<select id=\"g_date\" name=\"g_date\" onChange=\"chg_gdate()\">";
		date_opt+= "<option value=\"ALL\">"+top.alldata+"</option>";
		//if (rtype == "r_no" ) { 
		//	date_opt+= "<option value=\"1\" "+((cdate =='1')?'SELECTED':'')+" >"+top.S_EM+"</option>";
		//}
		for (i = 0; i < arrDate.length; i++) {
			nowDate=showdate(arrDate[i]);
			date_opt+= "<option value=\""+arrDate[i]+"\" "+((cdate == arrDate[i] )?'SELECTED':'')+">"+nowDate+"</option>";
		}
		date_opt+= "</select>";
	}
	
	document.getElementById("show_date_opt").innerHTML = date_opt;
}
function showdate(sdate){
	var showgdate=sdate.split("-");
	tmpsdate=showgdate[1]+"-"+showgdate[2];
	if(top.langx=="zh-tw"||top.langx=="zh-cn") {
		if((showgdate[1]*1)< 10) showgdate[1]=showgdate[1]*1;
		if((showgdate[2]*1)< 10) showgdate[2]=showgdate[2]*1;
		tmpsdate=showgdate[1]+top.showmonth+showgdate[2]+top.showday;
	}
	return tmpsdate;
}
function arraySort1(array ,data){
	var outarray =new Array();
	var newarray =new Array();
	for(var i=0;i < array.length ;i++){
		if(array[i]<= data){
			outarray.push(array[i]);
		}else{
			newarray.push(array[i]);
		}
	}
	outarray.push(data);
	for(var i=0;i < newarray.length ;i++){
		outarray.push(newarray[i]);		
	}
	return  outarray;
}

//切換日期
function chg_gdate(){
	
	var obj_gdate = document.getElementById("g_date");
	
	g_date=obj_gdate.value;
	pg=0;
	reload_var("");
}

//====== 取表格 TD 的x軸
function GetTD_X(TD_lay,GetTableID){
	alert(GetTableID);
	alert(document.getElementById(GetTableID))
	var TBar = document.getElementById(GetTableID);
	var td_x = TD_lay;
	for(var i=0; i < TBar.rows[0].children.length; i++){
		if (i == TD_lay) { break; }
		td_x += TBar.rows[0].children[i].clientWidth;
	}
	return td_x;
}
//====== 取表格 TD 的y軸
function GetTD_Y(AryIndex,GetTableID){
	var TBar = document.getElementById(GetTableID);
	var td_y = parseInt(AryIndex)+2;
	
	for(var i=0; i <= parseInt(AryIndex)+1; i++){
		try{
			td_y += TBar.rows[i].clientHeight;
		} catch (E){
			td_y += TBar.rows[i-1].clientHeight;
		}
	}
	return td_y;
}




//----------------------------我的最愛  start----------------------------------
function showPicLove(){
	var gtypeNum= StatisticsGty(top.today_gmt,top.now_gmt,getGtypeShowLoveI());
	try{
		document.getElementById("fav_num").style.display = "none";
		document.getElementById("showNull").style.display = "none";
		document.getElementById("showAll").style.display = "none";
		document.getElementById("showMy").style.display = "none";
		if(gtypeNum!=0){
			document.getElementById("live_num").innerHTML =gtypeNum;
			document.getElementById("fav_num").style.display = "block";
		 if(top.hot_game!=""){
				document.getElementById("showMy").style.display = "block";	
		 }else{	
			if(top.swShowLoveI){
				document.getElementById("showAll").style.display = "block";
			}else{
				document.getElementById("showMy").style.display = "block";	
			}
		 }	
		}else{
			document.getElementById("showNull").style.display = "block";
			top.swShowLoveI=false;
		}
	}catch(E){}
}

//我的最愛中的顯示全部
function showAllGame(gtype){
	top.swShowLoveI=false;
	parent[sel_gtype+"_lid_type"] = top[sel_gtype+"_lid"][sel_gtype+"_lid_type"];
	//eval("parent."+sel_gtype+"_lid_type=top."+sel_gtype+"_lid['"+sel_gtype+"_lid_type']");
	reload_var("");
}

//單式盤面點下我的最愛
function showMyLove(gtype){
	top.swShowLoveI =true;
	//精選賽事導回
		if(top.hot_game!=""){
		top.hot_game="";
		document.getElementById("euro_btn").style.display=''; 
		document.getElementById("euro_up").style.display='none';
		}
	//
	pg =0;
	//if (gtype=="FU"){
		parent[sel_gtype+"_lid_type"] = '3';
		//eval("parent."+sel_gtype+"_lid_type='3'");
	//}
	reload_var("");
}


function StatisticsGty(today,now_gmt,gtype){
	var out=0;
	var array =new Array(0,0,0);
	var tmp =today.split("-");
	var newtoday =tmp[1]+"-"+tmp[2];
	var Months =tmp[1]*1;
	tmp =now_gmt.split(":");
	var newgmt=tmp[0]+":"+tmp[1];
	var tmpgday = new Array(0,0);
	var bf = false;
	for (var i=0 ; i < top.ShowLoveIarray[gtype].length ; i++){
		tmpday = top.ShowLoveIarray[gtype][i][1].split("<br>")[0];
		tmpgday = tmpday.split("-");
		tmpgmt =top.ShowLoveIarray[gtype][i][1].split("<br>")[1];
		tmpgmt=time_12_24(tmpgmt);
		if(++tmpgday[0] < Months){ 
			bf = true;
		}else{
			bf = false;
		}
		if(bf){
			array[2]++;
		}else{
			if(newtoday >= tmpday ){
				if((newtoday+" "+newgmt) >= (tmpday+" "+tmpgmt)){
					array[0]++;	//走地	
				}else{	
					array[1]++;	//單式	
				}
			}else if(newtoday < tmpday){
				array[2]++;	//早餐
			}
		}
	}
	if(sel_gtype=="FT"||sel_gtype=="OP"||sel_gtype=="BK"||sel_gtype=="BS"||sel_gtype=="VB"||sel_gtype=="TN"){
		if(rtype=="re"||rtype.match("re")){
			out=array[0];
		}else{	
			out=array[1];
		}
	}else if(sel_gtype=="FU"||sel_gtype=="OM"||sel_gtype=="BU"||sel_gtype=="BSFU"||sel_gtype=="VU"||sel_gtype=="TU"){
		out=array[2];
	}
	
	return out;
}

function time_12_24(stTime){
	var out="";
	var shour =stTime.split(":")[0]*1;
	var smin=stTime.split(":")[1];
	var aop =smin.substr(smin.length-1,1);
	if(aop =="p"){
		if((shour*1)>0)
		shour += 12;
	}
	out=((shour < 10)?"0":"")+shour+":"+smin;
	return out;
}

if (top.keep_LoveI_array_BK==undefined) top.keep_LoveI_array_BK=new Array();
// new array{球類 , new array {gid ,data time ,聯盟,H,C,sw}}
function addShowLoveI(gid,getDateTime,getLid,team_h,team_c){
	var getGtype =getGtypeShowLoveI();
	var getnum =top.ShowLoveIarray[getGtype].length;
	var sw =true;
	for (var i=0 ; i < top.ShowLoveIarray[getGtype].length ; i++){
		if(top.ShowLoveIarray[getGtype][i][0]==gid && top.ShowLoveIarray[getGtype][i][1] == getDateTime)
			sw = false;
	}
	if(sw){
		
		top.ShowLoveIarray[getGtype]= arraySort(top.ShowLoveIarray[getGtype] ,new Array(gid,getDateTime,getLid,team_h,team_c));	
		//單式最愛帶進去滾球
		if(rtype!="re"){
			loveI_has_in=true;
			for (i=0;i < top.keep_LoveI_array_BK.length;i++){
				if(top.keep_LoveI_array_BK[i][0]==gid){
					loveI_has_in=false;
					break;
				}
			}
			if(loveI_has_in){
				tmpd=getDateTime.split("<br>");
				tmpDateTime=tmpd[0]+"<br>"+tmpd[1];
				top.keep_LoveI_array_BK.push(new Array(gid,tmpDateTime,getLid,team_h,team_c));
			}
		}
		chkOKshowLoveI();
	}
	document.getElementById("sp_"+MM_imgId(getDateTime,gid)).innerHTML = "<div class=\"fov_icon_on\" style=\"cursor:hand\" title=\""+top.str_delShowLoveI+"\" onClick=\"chkDelshowLoveI('"+getDateTime+"','"+gid+"');\"></div>";
}

function auto_re_addShowLoveI(Game_Data){
	var getGtype =getGtypeShowLoveI();

	//var tmpAry = new Array();
	//for (var k=0;k < top.keep_LoveI_array_BK.length;k++){	
		//tmpAry[tmpAry.length] = top.keep_LoveI_array_BK[k];
	//}
	for (var i=top.keep_LoveI_array_BK.length-1;i >= 0;i--){
		var tmp=top.keep_LoveI_array_BK[i][1].split("<br>");
		newTime=change_time(tmp[1])+":00";
		var tmp_today_gmt=top.today_gmt.split("-");
		chk_date_time=tmp_today_gmt[0]+"-"+tmp[0]+" "+newTime;
		var tmp_find=false;
		var tmp_gid=top.keep_LoveI_array_BK[i][0];
		if(chk_date_time < top.today_gmt+" "+top.now_gmt){
			//檢查賽程
			for(var a=0;a < Game_Data.length;a++){
				//alert(Game_FT[a][3]+"---"+tmp_gid);
					if(Game_Data[a][3]==tmp_gid){
						tmp_find=true;
						break;
					}
			}
			if(tmp_find){
				top.ShowLoveIarray[getGtype] = arraySort(top.ShowLoveIarray[getGtype] ,top.keep_LoveI_array_BK[i]);
			}
			//tmpAry.splice(i,1);
			Array.prototype.splice.call(top.keep_LoveI_array_BK,i,1);
			
		}
	}
	chkOKshowLoveI();
	//top.keep_LoveI_array_BK = tmpAry;
}
function arraySort(array ,data){
	var outarray =new Array();
	var newarray =new Array();
	for(var i=0;i < array.length ;i++){
		if(array[i][1]<= data[1]){
			outarray.push(array[i]);
		}else{
			newarray.push(array[i]);
		}
	}
	outarray.push(data);
	for(var i=0;i < newarray.length ;i++){
		outarray.push(newarray[i]);		
	}
	return  outarray;
}


function getGtypeShowLoveI(){
	var Gtype;
	var getGtype =sel_gtype;
	var getRtype =rtype;
	Gtype =getGtype;
	if(getRtype=="re"){
		Gtype +="RE";
	}
	/*
	if(getGtype =="FU"||getGtype=="FT"){
		Gtype ="FT";
	}else if(getGtype =="OM"||getGtype=="OP"){
		Gtype ="OP";
	}else if(getGtype =="BU"||getGtype=="BK"){
		Gtype ="BK";
	}else if(getGtype =="BSFU"||getGtype=="BS"){
		Gtype ="BS";
	}else if(getGtype =="VU"||getGtype=="VB"){
		Gtype ="VB";
	}else if(getGtype =="TU"||getGtype=="TN"){
		Gtype ="TN";
	}else {
		Gtype ="FT";
	}
	*/
	
	//alert("in==>"+sel_gtype+",out==>"+Gtype);
	return Gtype;
}
function chkOKshowLoveI(){
	var getGtype = getGtypeShowLoveI();
	var getnum =top.ShowLoveIOKarray[getGtype].length ;
	var ibj="" ;
	top.ShowLoveIOKarray[getGtype]="";
	for (var i=0 ; i < top.ShowLoveIarray[getGtype].length ; i++){
		tmp = top.ShowLoveIarray[getGtype][i][1].split("<br>")[0];
		top.ShowLoveIOKarray[getGtype]+=tmp+top.ShowLoveIarray[getGtype][i][0]+",";
	}
	showPicLove();
}


function chkDelshowLoveI(data2,gid){
	var getGtype = getGtypeShowLoveI();	
	var tmpdata = data2.split("<br>")[0]+gid;
	var tmpdata1 ="";
	var ary = new Array();
	var tmp = new Array();
	tmp = top.ShowLoveIarray[getGtype];
	top.ShowLoveIarray[getGtype]= new Array();
	for (var i=0 ; i < tmp.length ; i++){
		tmpdata1 =tmp[i][1].split("<br>")[0]+tmp[i][0];
		if(tmpdata1 == tmpdata){
			//alert("tmp[i]===>"+tmp[i]);
			ary = tmp[i];
			//var tmpAry = new Array();
			//for (var k=0;k < top.keep_LoveI_array_BK.length;k++){	
			//	tmpAry[tmpAry.length] = top.keep_LoveI_array_BK[k];
			//}
			//alert(data);
			for (var s=0;s < top.keep_LoveI_array_BK.length;s++){
				//alert(top.keep_LoveI_array_BK[s][0]+"---"+gid);
				if(top.keep_LoveI_array_BK[s][0]==gid) Array.prototype.splice.call(top.keep_LoveI_array_BK,s,1);
			}
			//top.keep_LoveI_array_BK=tmpAry;
			continue;
		}
		top.ShowLoveIarray[getGtype].push(tmp[i]);
	}
	chkOKshowLoveI();
	var gtypeNum= StatisticsGty(top.today_gmt,top.now_gmt,getGtypeShowLoveI());
	if(top.swShowLoveI){
		
		var sw=false;
		//alert(top.swShowLoveI+"-"+gtypeNum);
		if(gtypeNum==0){
			top.swShowLoveI=false;
			parent[sel_gtype+"_lid_type"] = top[sel_gtype+"_lid"][sel_gtype+"_lid_type"];
			//eval("parent."+sel_gtype+"_lid_type=top."+sel_gtype+"_lid['"+sel_gtype+"_lid_type']");
			reload_var("");
		}else{
			ShowGameList();
		}
	}else{
		if(gtypeNum==0){ 
			reload_var("");
		}else{
			document.getElementById("sp_"+MM_imgId(ary[1],ary[0])).innerHTML ="<div id='"+MM_imgId(ary[1],ary[0])+"' class=\"fov_icon_out\" style=\"cursor:hand;display:none;\" title=\""+top.str_ShowMyFavorite+"\" onClick=\"addShowLoveI('"+ary[0]+"','"+ary[1]+"','"+ary[2]+"','"+ary[3]+"','"+ary[4]+"'); \"></div>";	
		}
	}
}

function chkDelAllShowLoveI(){
	var getGtype=getGtypeShowLoveI();
	top.ShowLoveIarray[getGtype]= new Array();
	top.ShowLoveIOKarray[getGtype]="";
	if(top.swShowLoveI){
		top.swShowLoveI=false;
		parent[sel_gtype+"_lid_type"] = top[sel_gtype+"_lid"][sel_gtype+"_lid_type"];
		//eval("parent."+sel_gtype+"_lid_type=top."+sel_gtype+"_lid['"+sel_gtype+"_lid_type']");
		pg =0;
		reload_var("");
	}else{
		ShowGameList();
	}
 
}

//檢查所選的最愛賽事是否已經進入滾球或是結束
function checkLoveCount(GameArray){
	
	var getGtype = getGtypeShowLoveI();	
	var tmpdata = "";
	var tmpdata1 ="";
	var ary = new Array();
	var tmp = new Array();
	tmp = top.ShowLoveIarray[getGtype];
	top.ShowLoveIarray[getGtype] = new Array();
	for (s=0;s < GameArray.length;s++){
		//tmpdata=GameArray[s].datetime.split("<br>")[0]+GameArray[s].gidm+"-"+GameArray[s].gnum_h;
		tmpdata=GameArray[s].datetime.split("<br>")[0]+GameArray[s].gidm;
		for (var i=0;i < tmp.length; i++){
			tmpdata1 =tmp[i][1].split("<br>")[0]+tmp[i][0];
			if(tmpdata1 == tmpdata){
				top.ShowLoveIarray[getGtype].push(tmp[i]);
			}
		}
	}	
	chkOKshowLoveI();
}

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

function chkLookShowLoveI(){
	top.swShowLoveI =true;
	parent[sel_gtype+"_lid_type"] = '3';
	//eval("parent."+sel_gtype+"_lid_type='3'");
	pg =0;
	reload_var("");
}

function MM_imgId(time,gid){	
	var tmp = time.split("<br>")[0];
	//alert(tmp+gid);
	return tmp+gid;
}


//----------------------------我的最愛  end----------------------------------




//--------------------------odd_f 	start--------------------
//盤口onclick事件

function ChkOddfDiv(){

	
	var odd_show="<select id=myoddType onchange=chg_odd_type()>";
	var tmp_check="";
	for (i = 0; i < Format.length; i++) {
		//沒盤口選擇時，預設為H(香港變盤)
	if((odd_f_str.indexOf(Format[i][0])!=(-1))&&Format[i][2]=="Y"){
	
	   	if(top.odd_f_type==Format[i][0]){
	   		odd_show+="<option value="+Format[i][0]+tmp_check+" selected>"+Format[i][1]+"</option>";
			}else{
         odd_show+="<option value="+Format[i][0]+tmp_check+">"+Format[i][1]+"</option>"; 
      }
		}
		/*	
		else{
			odd_show+="<option value="+Format[i][0]+tmp_check+">"+Format[i][1]+"</option>";
			}
		*/			
	//}
	}
	odd_show+"</select>";
	document.getElementById("Ordertype").innerHTML=odd_show;

}

//切換盤口
function chg_odd_type(){
	var myOddtype=document.getElementById("myoddType");
	if(top.odd_f_type == myOddtype.options[myOddtype.selectedIndex].value) {
		refreshReload();
		return;
	}
	top.odd_f_type = myOddtype.options[myOddtype.selectedIndex].value;
	var tmp = top.uid.match(/m\d*l\d*$/);
	tmp = tmp[0];
	tmp =	tmp.substring(1,tmp.length).split("l")
	tmp = tmp[0];
	top.CM.set("OddType@"+tmp,top.odd_f_type);
	refreshReload();
}

function show_oddf(){
	for (i = 0; i < Format.length; i++) {
		if(Format[i][0]==top.odd_f_type){
			document.getElementById("oddftext").innerHTML=Format[i][1];
		}
	}
	
}
//--------------------------odd_f 	end--------------------

function change_rtype(){
	top.hot_game="";
  var tmp_date_str="";
	//var myOddtype=document.getElementById("sel_rtype");
	var myG_date=document.getElementById("g_date");
	//rtype=myOddtype.options[myOddtype.selectedIndex].value;
	if(myG_date != null)tmp_date_str="&g_date="+myG_date.options[myG_date.selectedIndex].value;
  location.href="index.php?uid="+top.uid+"&langx="+top.langx+"&mtype="+ltype+"&rtype="+rtype+tmp_date_str;

}
function change_RE_session(){
	top.hot_game="";
	//var myOddtype=document.getElementById("sel_rtype");
	//rtype=myOddtype.options[myOddtype.selectedIndex].value;
	//top.BK_RE_session=rtype;
	reload_var("");
   // location.href="index.php?uid="+top.uid+"&langx="+top.langx+"&mtype="+ltype+"&rtype="+rtype;
}	

var keep_drop_layers;
var dragapproved=false;
var iex;
var iey;
var tempx;
var tempy;
if (document.all){
	document.onmouseup=new Function("dragapproved=false;");
}
function initializedragie(drop_layers){
	return;
	keep_drop_layers=drop_layers;
	iex=event.clientX
	iey=event.clientY
	//tempx = drop_layers.style.pixelLeft;
	//tempy = drop_layers.style.pixelTop;
	eval("tempx="+drop_layers+".style.pixelLeft")
	eval("tempy="+drop_layers+".style.pixelTop")
	dragapproved=true;
	document.onmousemove=drag_dropie;
}
function drag_dropie(){
	if (dragapproved==true){
		eval("document.all."+keep_drop_layers+".style.pixelLeft=tempx+event.clientX-iex");
		eval("document.all."+keep_drop_layers+".style.pixelTop=tempy+event.clientY-iey");
		return false
	}
}

function refreshReload(level){
	document.getElementById("refresh_right").className='refresh_M_on';
	document.getElementById("refresh_btn").className='refresh_on';
	document.getElementById("refresh_down").className='refresh_M_on';
	reload_var(level);
}

function Euro(){
	
	if(top.hot_game!=""){
		top.hot_game="";
		top.swShowLoveI=false;
		document.getElementById("euro_btn").style.display=''; 
		document.getElementById("euro_up").style.display='none';
	}else{
		top.hot_game="HOT_";
		document.getElementById("euro_btn").style.display='none'; 
		document.getElementById("euro_up").style.display='';
	
	}
	pg =0;
	show_page();
	reload_var("");

}

function Eurover(act){
 //alert(act.className)
	if(act.className=="euro_btn"){
		act.className='euro_over';
	}else if(act.className=="euro_up"){
		act.className='euro_up_over';
	}
}
 
function Eurout(act){
	//alert(act.className)
 if(act.className=="euro_over"){
		act.className='euro_btn';
	}else if(act.className=="euro_up_over"){
		act.className='euro_up';
	}
}

function getObjAbsolute(obj){
	var abs = new Object();
	
	abs["left"] = obj.offsetLeft;
	abs["top"] = obj.offsetTop;
	
	while (obj = obj.offsetParent) {
		abs["left"] += obj.offsetLeft;
		abs["top"] += obj.offsetTop;
	}
	
	return abs;
}

function show_lego_sort(Obj,event){
	if(document.getElementById("SortTable").style.display=="none"){
		abs=getObjAbsolute(Obj);
		document.getElementById("SortTable").style.top=abs["top"]+20;
		document.getElementById("SortTable").style.left=abs["left"]+2;
		document.getElementById("SortTable").style.display ="";
		document.getElementById("uid").value=top.uid;
		document.getElementById("langx").value=top.langx;
		document.getElementById("SortForm").action="../setSortType.php";
	}else{
		document.getElementById("SortTable").style.display ="none";
	}
}

function saveSortType(){
	var SortSel=document.getElementById("SortSel");
	if(top.SortType == SortSel.options[SortSel.selectedIndex].value) {
		refreshReload();
		return;
	}
	top.SortType = SortSel.options[SortSel.selectedIndex].value;
	var tmp = top.uid.match(/m\d*l\d*$/);
	tmp = tmp[0];
	tmp =	tmp.substring(1,tmp.length).split("l")
	tmp = tmp[0];
	top.CM.set("SortType@"+tmp,top.SortType);
	refreshReload();
}

function gameSort(){
	if(top.SortType=="") top.SortType="T";
	document.getElementById("SortSel").value = top.SortType;
}
function setMarketPeriod(aRtype){
	if(aRtype=="r_sub"|| aRtype=="re_sub"){Market="All";Period="Hide";}
	else if(aRtype=="r_no" || aRtype=="re_no"){Market="All";Period="View";}
	else if(aRtype=="r_main" || aRtype=="re_main"){Market="Main";Period="View";}
	else if(aRtype=="r_all" || aRtype=="re_all"){Market="Main";Period="Hide";}
	else if(aRtype=="p3" ){Market="Main";Period="View";}
}
function getRtype(aRtype){
	var tmp_str="r";
	if(aRtype.match("re")){
		tmp_str="re"
	}
	if(aRtype.match("p3")){
		tmp_str="p3"
	}
	if(Market=="All" && Period=="Hide"){
		tmp_str= tmp_str+"_sub";
	}
	else if(Market=="All" && Period=="View"){
		tmp_str= tmp_str+"_no";
	}
	else if(Market=="Main" && Period=="View"){
		tmp_str= tmp_str+"_main";
	}
	else if(Market=="Main" && Period=="Hide"){
		tmp_str= tmp_str+"_all";
	}
	return tmp_str
}
function MarketPeriod(){
	try{
		var spanM=document.getElementById("SpanMarket");
		var spanP=document.getElementById("SpanPeriod");
		spanM.innerHTML = top["str_BK_Market_"+Market];
		spanP.innerHTML = top["str_BK_Period_"+Period];
	}catch(e){
		try{console.log("NaN Market");}catch(e){};
	}
}
function chgMarket(event){//Main,All
	if(Market=="Main")Market="All";
	else Market="Main";
	MarketPeriod();
	rtype = getRtype(rtype);
	var tmp = top.uid.match(/m\d*l\d*$/);
	tmp = tmp[0];
	tmp = tmp.substring(1,tmp.length).split("l")
	tmp = tmp[0];
	top.CM.set("BKRtype@"+tmp,rtype.split("_")[1]);
	//日期特早 切換帶回全部
	//if(g_date==1 && rtype != "r_no")g_date="ALL" 
	g_date = "ALL";
	refreshReload();
}

function chgPeriod(event){//View,Hide
	if(Period=="View")Period="Hide";
	else Period="View";
	MarketPeriod();
	rtype = getRtype(rtype);
	var tmp = top.uid.match(/m\d*l\d*$/);
	tmp = tmp[0];
	tmp =	tmp.substring(1,tmp.length).split("l")
	tmp = tmp[0];
	top.CM.set("BKRtype@"+tmp,rtype.split("_")[1]);
	//日期特早 切換帶回全部
	//if(g_date==1 && rtype != "r_no")g_date="ALL"
	refreshReload();
}
onerror = show_onerror;
function show_onerror(msg,url,l){ 
setTimeout('onLoad()',5000); 
return true; 
} 


