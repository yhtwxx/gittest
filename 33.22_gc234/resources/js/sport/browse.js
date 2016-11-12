//在body_browse載入
var ReloadTimeID;
var sel_gtype=parent.sel_gtype;

//=============================== 網頁載入 ==================================
function onLoad(){
	obj_layer = document.getElementById('LoadLayer');
	obj_layer.style.display = 'none';
	obj_layer = document.getElementById('controlscroll');
	obj_layer.style.display = 'none';			
	top.swShowLoveI=false;

	if((""+eval("parent."+sel_gtype+"_lname_ary"))=="undefined") eval("parent."+sel_gtype+"_lname_ary='ALL'");
	if((""+eval("parent."+sel_gtype+"_lid_ary"))=="undefined") eval("parent."+sel_gtype+"_lid_ary='ALL'");
	if(parent.ShowType==""||rtype=="r") parent.ShowType = 'OU';
	if(rtype=="hr") parent.ShowType = 'OU';
	if(rtype=="re") parent.ShowType = 'RE';
	if(rtype=="pd") parent.ShowType = 'PD';
	if(rtype=="hpd") parent.ShowType = 'HPD';
	if(rtype=="t") parent.ShowType = 'EO';
	if(rtype=="f") parent.ShowType = 'F';
	//2015-02-04 過關畫面異動
	if(rtype == "p3"){
		try{
			showDateSel_FT(sel_gtype);
		}catch(E){
			
			
		}
	}
	
	if (rtype == "ft_r" || rtype == "ft_pd" || rtype == "ft_f" || rtype == "ft_t"){
		try{
			
			showDateSel_Future();
		}catch(E){}
	}

	if(parent.parent.leg_flag=="Y"){
		parent.parent.leg_flag="N";
		parent.pg=0;
		reload_var("");
	}
	parent.loading = 'N';
	if(parent.loading_var == 'N'){
		parent.ShowGameList();
	}
	if (parent.retime_flag == 'Y'){
		count_down();
	}else{
		var rt=document.getElementById('refreshTime');
		rt.innerHTML=top.refreshTime;	
	}
	document.getElementById("odd_f_window").style.display = "none";
	if(sel_gtype=="FU"){ 
		if (rtype!="r"){
			if(top.showtype!='hgft'){
				selgdate(rtype);
			}
		}
	}
	else if(sel_gtype=="BSFU"){
		if (rtype=="r" || rtype=="pd" || rtype=="t"){
			if(top.showtype!='hgft'){
				selgdate(rtype);
			}
		}
	}
}

function overInfo(){
	document.getElementById("info").style.display = "";
}

function outInf(){
	document.getElementById("info").style.display = "none";
}

function showDateSel_FT(sel_gtype){
	var showDateSel = document.getElementById("showDateSel");
	var dateSel = document.getElementById("dateSel").innerHTML;
	var tmpShow = "";
	
	for(var i=0; i<=DateAry.length; i++){

		var tmp = dateSel;
		var sel_class = "&nbsp;";
		var sel_value = "";
		var sel_str = "";
		
		if(i == 0){
			tmp = tmp.replace("*DATE_SHOWTYPE*","");
			sel_value = DateAry[i];
			sel_str = top.showtoday;
		}else if((i+1) == DateAry.length){
			tmp = tmp.replace("*DATE_SHOWTYPE*",sel_gtype);
			sel_value = 'F';//DateAry[1]+"|"+DateAry[2]+"|"+DateAry[3]+"|"+DateAry[4]+"|"+DateAry[5]+"|"+DateAry[6];
			sel_str = top.showfuture;
		}else if(i == DateAry.length){
			tmp = tmp.replace("*DATE_SHOWTYPE*",sel_gtype);
			sel_value = 'ALL';
			sel_str = top.date;
		}else{
			tmp = tmp.replace("*DATE_SHOWTYPE*",sel_gtype);
			sel_value = DateAry[i];
			sel_str = chgDateStr(DateAry[i]);
		}
		
		if(top.sel_gd=="today" && i==0){
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

function showDateSel_Future(){
	var showDateSel = document.getElementById("showDateSel");
	var dateSel = document.getElementById("dateSel").innerHTML;
	var tmpShow = "";
	
	//初始化選擇的日期
	top.sel_gd = parent.g_date;
	//g_date = DateAry[0];

	//日期清單要列幾個
	var dateList = 9;
	
	for(var i=0; i<dateList; i++){
		
		var tmp = dateSel;
		var sel_class = "&nbsp;";
		var sel_value = "";
		var sel_str = "";
		
		if(i == dateList -2){
			tmp = tmp.replace("*DATE_SHOWTYPE*","FU");
			sel_value = 'F';//DateAry.slice(i).join("|");
			sel_str = top.showfuture;
		}else if(i == dateList -1){
			tmp = tmp.replace("*DATE_SHOWTYPE*","ALL");
			sel_value = "ALL";
			//sel_value = DateAry.join("|");
			sel_str = top.date;
		}else{
			tmp = tmp.replace("*DATE_SHOWTYPE*","FU");
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

window.onscroll = scroll;

function scroll(){
	var refresh_right= document.getElementById('refresh_right');
	refresh_right.style.top=document.body.scrollTop+39;
}

function new_chg_gdate(obj,stype,date){
	parent.g_date = date;
	pg = 0;
	
	//2015-02-09 綜合過關 選日期換色
	var tmpObj = document.getElementById("showDateSel");
	for(var i=0; i<tmpObj.children.length; i++){
		tmpObj.children[i].className = "";
	}
	obj.className = "day_text_red";
	
	//parent.display_loading(true);
	
	reload_var("",stype);
}

//页面展示
function reload_var(Level){
	parent.loading_var = 'Y';
	if(Level=="up"){
		var tmp = "./"+parent.sel_gtype+"_browse/body_var.php";
		if (parent.sel_gtype=="FU"){
			tmp = "./FT_future/body_var.do";
		}
	}if(Level=="L"){
		var tmp = "./body_var.do";
	}else{		
		var tmp = "../body_var.do";
	}
	          
	var l_id =eval("parent.parent."+sel_gtype+"_lid_type");
	if(top.showtype=='hgft'&& (parent.sel_gtype=="FU" || parent.sel_gtype=="BSFU" || parent.sel_gtype=="BU")){
		l_id=3;	
	}
	if(top.showtype=="future"){
		parent.rtype = "ft_"+parent.rtype;
	}
	if(parent.rtype == "p3"){
		top.hot_game="";
		var homepage = tmp+"?rtype="+parent.rtype+"&langx="+parent.langx+"&mtype="+parent.ltype+"&page_no="+parent.pg+"&league_id="+l_id+"&hot_game="+top.hot_game+"&g_date="+parent.g_date;
	}else{
		var homepage = tmp+"?rtype="+parent.rtype+"&langx="+parent.langx+"&mtype="+parent.ltype+"&page_no="+parent.pg+"&league_id="+l_id;
	} 
	
	if (parent.sel_gtype=="FU" || parent.sel_gtype=="BSFU" || parent.sel_gtype=="BU"|| parent.sel_gtype=="TU"|| parent.sel_gtype=="VU"|| parent.sel_gtype=="BMFU"|| parent.sel_gtype=="TTFU"){
		homepage+="&g_date="+parent.g_date;
	}
	
	parent.body_var.location = homepage+"&ftype="+parent.sel_gtype+"&showtype="+top.showtype;
	if(rtype=="r") document.getElementById('more_window').style.display='none';
}

function setleghi(leghight){
	var legview =document.getElementById('legFrame');	
	if((leghight*1) > 95){
		legview.height = leghight;
	}else{	
		legview.height = 95;
	}	
}

//倒數自動更新時間
function count_down(){
	var rt=document.getElementById('refreshTime');
	setTimeout('count_down()',1000);
	if (parent.retime_flag == 'Y'){
		if(parent.retime <= 0){
			if(parent.loading_var == 'N')
				reload_var("");
				return;
		}
		parent.retime--;
		rt.innerHTML=parent.retime;
	}
}

//賽事分日期
function selgdate(rtype,cdate){	
	var date_opt = "";
	var arrDate =new Array();
	var year ='';
	var nowDate="";	
	if(top.showtype=='hgft'){
		var tmpdate=DateAry[0].split("-");
		for (i = 0; i < parent.hotgdateArr.length; i++) {
			var tmpd =parent.hotgdateArr[i].split("-");
			if(tmpdate[1]*1 > tmpd[0]*1){
				year =tmpdate[0]*1+1;
			}else{
				year =tmpdate[0];
			}
			arrDate =arraySort1(arrDate,year+'-'+parent.hotgdateArr[i]);
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
		arrDate= DateAry ;
		date_opt = "<select id=\"g_date\" name=\"g_date\" onChange=\"chg_gdate()\">";
		date_opt+= "<option value=\"ALL\">"+top.alldata+"</option>";
		if (rtype == "r") {
			date_opt+= "<option value=\"1\" >"+top.S_EM+"</option>";
		}
		for (i = 0; i < arrDate.length; i++) {
			nowDate=showdate(arrDate[i]);
			date_opt+= "<option value=\""+arrDate[i]+"\" >"+nowDate+"</option>";
		}
		date_opt+= "</select>";
	}
	
	//document.getElementById("show_date_opt").innerHTML = date_opt;
}

//切換日期
function chg_gdate(){	
	var obj_gdate = document.getElementById("g_date");	
	parent.g_date=obj_gdate.value;
	parent.pg=0;
	reload_var("");
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
//-----------------------------------------------------------------

//賽事換頁
function chg_pg(pg){
	if (pg==parent.pg) {return;}
	parent.pg=pg;
	reload_var("");
}

//選擇聯盟
function chg_league(){
	var legframe= document.getElementById('legFrame');
	var legview =document.getElementById('legView');
	var gtype = parent.sel_gtype;
	var rtype_t = parent.rtype;
	if(top.head_btn=="early"){
		rtype_t="ft";
	}
	else if(top.head_btn=="rb"){
		rtype_t="re";
	}
	else if(top.head_btn=="today"){
		rtype_t="r";
	}
	var url = "../body_var_lid.do?rtype="+rtype_t+"&langx="+parent.langx+"&mtype="+parent.ltype+"&htype="+top.head_btn+"&gtype="+gtype;
	try{	
		legFrame.location.href=url;
	}catch(e){
		legFrame.src=url;
	}
	legview.style.display='';
	//style.top赋值加上"px",IE下用数值是可以的,但其它主流chrome,opera,ff,safari都不能识别,所以必须加"px"
	legview.style.top =  document.body.scrollTop+82+'px'; //21+34+25+10;
	legview.style.left = document.getElementById('myTable').scrollLeft+10+'px';
}

//筛选联盟赛事
function LegBack(){
	var legview =document.getElementById('legView');
	legview.style.display='none';
	reload_var("L");
}


//页面刷新
function refreshReload(){
	document.getElementById("refresh_right").className='refresh_M_on';
	document.getElementById("refresh_btn").className='refresh_on';
	document.getElementById("refresh_down").className='refresh_M_on';
	reload_var("");
}

//波胆全半场切换
function chg_wtype(wtype){
	var l_id =eval("parent.parent."+sel_gtype+"_lid_type");
	if(top.swShowLoveI) l_id=3;
	if(top.showtype=='hgft'&& (parent.sel_gtype=="FU" || parent.sel_gtype=="BSFU" || parent.sel_gtype=="BU")){
		l_id=3;	
	}
	parent.location.href="index.do?langx="+top.langx+"&mtype="+parent.ltype+"&rtype="+wtype+"&showtype="+top.showtype+"&league_id="+l_id;
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
	eval("parent.parent."+parent.sel_gtype+"_lid_type=top."+parent.sel_gtype+"_lid['"+parent.sel_gtype+"_lid_type']");
	reload_var("");
}

//單式盤面點下我的最愛
function showMyLove(gtype){
	top.swShowLoveI =true;
	if(top.hot_game!=""){
		top.hot_game="";
		document.getElementById("euro_btn").style.display=''; 
		document.getElementById("euro_up").style.display='none';
	}
	parent.pg =0;
	eval("parent.parent."+parent.sel_gtype+"_lid_type='3'");
	reload_var("");
}

//我的最爱清空
function chkDelAllShowLoveI(){
	var getGtype=getGtypeShowLoveI();
	top.ShowLoveIarray[getGtype]= new Array();
	top.ShowLoveIOKarray[getGtype]="";
	if(top.swShowLoveI){
		top.swShowLoveI=false;
		eval("parent.parent."+parent.sel_gtype+"_lid_type=top."+parent.sel_gtype+"_lid['"+parent.sel_gtype+"_lid_type']");
		parent.pg =0;
		reload_var("");
	}else{
		parent.ShowGameList();
	}
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
	if(parent.sel_gtype=="FT"||parent.sel_gtype=="OP"||parent.sel_gtype=="BK"||parent.sel_gtype=="BS"||parent.sel_gtype=="VB"||parent.sel_gtype=="TN"){
		if(parent.rtype=="re"){
			out=array[0];
		}else{	
			out=array[1];
		}
	}else if(parent.sel_gtype=="FU"||parent.sel_gtype=="OM"||parent.sel_gtype=="BU"||parent.sel_gtype=="BSFU"||parent.sel_gtype=="VU"||parent.sel_gtype=="TU"){
		out=array[2];
	}
	return out;
}

function getGtypeShowLoveI(){
	var Gtype;
	var getGtype =parent.sel_gtype;
	var getRtype =parent.rtype;
	Gtype =getGtype;
	if(getRtype=="re"){
		Gtype +="RE";
	}
	return Gtype;
}

function time_12_24(stTime){
	var out="";
	var shour =stTime.split(":")[0]*1;
	var smin=stTime.split(":")[1];
	var aop =smin.substr(smin.length-1,1);
	if(aop =="p"){
		if((shour*1)>0 && (shour*1) < 12)
		shour += 12;
	}
	out=((shour < 10)?"0":"")+shour+":"+smin;
	return out;
}

//new array{球類 , new array {gid ,data time ,聯盟,H,C,sw}}
function addShowLoveI(gid,getDateTime,getLid,team_h,team_c){
	var getGtype =getGtypeShowLoveI();
	var getnum =top.ShowLoveIarray[getGtype].length;
	var sw =true;
	for (var i=0 ; i < top.ShowLoveIarray[getGtype].length ; i++){
		if(top.ShowLoveIarray[getGtype][i][0]==gid && top.ShowLoveIarray[getGtype][i][1] == getDateTime)
			sw = false;
	}
	if(sw){
		top.ShowLoveIarray[getGtype] = arraySort(top.ShowLoveIarray[getGtype] ,new Array(gid,getDateTime,getLid,team_h,team_c));	
		chkOKshowLoveI();
	}
	document.getElementById("sp_"+MM_imgId(getDateTime,gid)).innerHTML = "<div class=\"fov_icon_on\" style=\"cursor:hand\" title=\""+top.str_delShowLoveI+"\" onClick=\"chkDelshowLoveI('"+getDateTime+"','"+gid+"');\"></div>";
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

function chkDelshowLoveI(getDateTime,gid){
	var getGtype = getGtypeShowLoveI();	
	var tmpdata = getDateTime.split("<br>")[0]+gid;
	var tmpdata1 ="";
	var ary = new Array();
	var tmp = new Array();
	tmp = top.ShowLoveIarray[getGtype];
	top.ShowLoveIarray[getGtype] = new Array();
	for (var i=0 ; i < tmp.length ; i++){
		tmpdata1 =tmp[i][1].split("<br>")[0]+tmp[i][0];
		if(tmpdata1 == tmpdata){
			ary = tmp[i];
			continue;
		}
		top.ShowLoveIarray[getGtype].push(tmp[i]);
	}
	chkOKshowLoveI();
	var gtypeNum= StatisticsGty(top.today_gmt,top.now_gmt,getGtypeShowLoveI());
	if(top.swShowLoveI){
		
		var sw=false;
		if(gtypeNum==0){
			top.swShowLoveI=false;
			eval("parent.parent."+parent.sel_gtype+"_lid_type=top."+parent.sel_gtype+"_lid['"+parent.sel_gtype+"_lid_type']");
			reload_var("");
		}else{
			parent.ShowGameList();
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
		eval("parent.parent."+parent.sel_gtype+"_lid_type=top."+parent.sel_gtype+"_lid['"+parent.sel_gtype+"_lid_type']");
		parent.pg =0;
		reload_var("");
	}else{
		parent.ShowGameList();
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
		tmpdata=GameArray[s].datetime.split("<br>")[0]+GameArray[s].gnum_h;
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
	eval("parent.parent."+parent.sel_gtype+"_lid_type='3'");
	parent.pg =0;
	reload_var("");
}

function MM_imgId(time,gid){	
	var tmp = time.split("<br>")[0];
	return tmp+gid;
}

//自動加入單式最愛
function auto_re_addShowLoveI(Game_Data){
	if(1==1) return;
	var getGtype =getGtypeShowLoveI();
	for (var i=top.keep_LoveI_array_FT.length-1;i >= 0;i--){
		var tmp=top.keep_LoveI_array_FT[i][1].split("<br>");
		newTime=change_time(tmp[1])+":00";
		var tmp_today_gmt=top.today_gmt.split("-");
		chk_date_time=tmp_today_gmt[0]+"-"+tmp[0]+" "+newTime;
		var tmp_find=false;
		var tmp_gid=top.keep_LoveI_array_FT[i][0];
		if(chk_date_time < top.today_gmt+" "+top.now_gmt){
			//檢查賽程
			for(var a=0;a < Game_Data.length;a++){
				if(Game_Data[a][3]==tmp_gid){
					tmp_find=true;
					break;
				}
			}
			if(tmp_find){
				top.ShowLoveIarray[getGtype] = arraySort(top.ShowLoveIarray[getGtype] ,top.keep_LoveI_array_FT[i]);
			}
			Array.prototype.splice.call(top.keep_LoveI_array_FT,i,1);
		}
	}
	chkOKshowLoveI();
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
//------------------------- 我的最愛  end -------------------------


//--------------------------odd_f盘口 	start--------------------
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
	}
	odd_show+"</select>";
	document.getElementById("Ordertype").innerHTML=odd_show;
}

//切換盤口
function chg_odd_type(){	
	var myOddtype=document.getElementById("myoddType");
	top.odd_f_type=myOddtype.options[myOddtype.selectedIndex].value;
	reload_var("");
}

function show_oddf(){
	for (i = 0; i < Format.length; i++) {
		if(Format[i][0]==top.odd_f_type){
			document.getElementById("oddftext").innerHTML=Format[i][1];
		}
	}
	
}
//--------------------------odd_f盘口 	end--------------------