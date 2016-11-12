var count_win=false;
//alert(self.name);
//window.setTimeout("Win_Redirect()", 45000);
var winRedirectTimer=45000;
var winRedirect=0;

window.onload = function (){
	//top.keepGold="";
	document.getElementById("gold").blur();
	document.getElementById("gold").focus();
	if(""+top.resetCheck!="undefined"){
		var reloadTime=document.getElementById("checkOrder");
		reloadTime.checked=top.resetCheck;
	}
	/*
	if(""+top.autoOddCheck!="undefined"){
		var reloadautoOdd=document.getElementById("autoOdd");
		reloadautoOdd.checked=top.autoOddCheck;
	}
	*/
	onclickReloadTime();
	resetGold();
	parent.onloadSet(document.body.scrollWidth,document.body.scrollHeight,"bet_order_frame");
	LoadSelect();
	check_sel_team();
	chkParlayDate();
	try{
		if (killgid!=""){
			parent.parent.body.killgid(killgid);
		}
	}catch(E){}
}
//妾㈡煡鎵€閬搁殜浼� 鏄惁璁婂嫊閬�
function check_sel_team(){
	//alert(top.scripts)
	if(""+top.scripts!="undefined"){
		try{
			for (i=0;i < scripts.length;i++){
				//scripts[0]=new Array('505643','PRH','H','0','0','1.9');
				
				ms=get_ms(scripts[i][1]);
				gidm_new=parent.parent.body.get_gidm(scripts[i][0],ms);	
				for (s=0;s < top.scripts.length;s++){
					//alert("1");
					ms=get_ms(top.scripts[s][1]);
					gidm_old=parent.parent.body.get_gidm(top.scripts[s][0],ms);
					//鎼滃皨鏈夋矑鍑虹従鍦ㄨ垔鐨刟ry瑁￠潰
					//alert(gidm_old+"----"+gidm_new);
					if (gidm_old==gidm_new&&gidm_old!=""){
						//濡傛灉鎵惧埌鍚実id鍒ゆ柗鏄惁鏈夋敼璁婇亷 rtype
						//alert(scripts[i][1]+"...."+top.scripts[s][1]);	
						if (scripts[i][1]!=top.scripts[s][1]||scripts[i][0]!=top.scripts[s][0]){
							//alert(scripts[i][1]+"---"+top.scripts[s][1]);
							document.getElementById("team"+(i+1)).className="team_ch";
						}
						break;
					}
				}
			}
		}catch(E){
			//alert("err");	
		}		
	}
	top.scripts=scripts;
	
	
}
function get_ms(tmp){
	//alert(tmp+"--"+tmp.length)
	if (tmp.length >= 4){
		if (tmp.substring(0,2)=="HH"||tmp.substring(0,2)=="HP"){
			return "H";	
		}
	}else{
		if (tmp.substring(0,1)=="H"){
			return "H";	
		}
	}
	return "";
}
//鐩ら潰鑷嫊閲嶅彇璩犵巼 start
function onclickReloadTime(){
	var reloadTime=document.getElementById("checkOrder");
	top.resetCheck=reloadTime.checked;
	window.clearTimeout(winRedirect);
	if (!reloadTime.checked){
		//winRedirect=window.setTimeout("Win_Redirect()", winRedirectTimer);
	}else{
		winRedirect=window.setTimeout("winReload()", 1000);
	}
}
function onclickReloadAutoOdd(){
	var reloadautoOdd=document.getElementById("autoOdd");
	top.autoOddCheck=reloadautoOdd.checked;
}
function orderReload(){
	window.location.href=window.location;
}
function resetTimer(){
	//鍥炲京reload鏅傞枔
	onclickReloadTime();
}
function resetGold(){
	if (""+top.keepGold_PR!="undefined" && top.keepGold_PR!="" ){
		document.getElementById("gold").value=top.keepGold_PR;
		if(rtype=="P"){
		   var mode = 0;				
		} else if(rtype=="PR") {
			var mode = 1;
		} else if(rtype=="P3"){
			var mode = 3;
		}
		CountWinGold(iorstr,mode);
	}
}
function winReload(){
	try{
		var showTimer=document.getElementById("ODtimer").innerHTML;
		showTimer=showTimer*1-1;
		document.getElementById("ODtimer").innerHTML=showTimer;

		if (showTimer<=0){
			//鍘诲煼琛岄亷闂滅洡闈�,FT_mem_showgame_p3.js
			//alert(top.ordergid.length);
			try{
				if (top.ordergid.length > 0){
					parent.parent.body.orderParlayParam();
				}else{
					document.getElementById("ODtimer").innerHTML="10";
					winRedirect=window.setTimeout("winReload()", 1000);	
				}
			}catch(E){
				document.getElementById("ODtimer").innerHTML="10";
				winRedirect=window.setTimeout("winReload()", 1000);	
			}
			//window.location.reload();
		}else{
			winRedirect=window.setTimeout("winReload()", 1000);
		}
	}catch(E){
		console.log("No ODtimer error");//20150309 bill 缍滃悎閬庨棞鍙栨秷榛為伕鏅傛矑杓夊叆html 鏈冩矑ODtimer
	}
}
//鐩ら潰鑷嫊閲嶅彇璩犵巼 end


function Win_Redirect(){
	/*
	var i=document.all.uid.value;
	var pdate=document.all.pdate.value;
	var page=document.URL;
	//top.orderArray=new Array();
	//top.ordergid=new Array();

	parent.parent.body.orderRemoveALL();
	go_page="../select.php?uid="+i;
	self.location=go_page;
	*/
	//鍘诲煼琛岄亷闂滅洡闈�,FT_mem_showgame_p3.js
	try{
		parent.parent.body.orderRemoveALL();
	}catch (E) {}
	top.scripts=new Array();
	parent.close_bet();
}
/*
function resort(ary){
	var tempary=new Array();
	for(var i=0;i<ary.length;i++){
		if (ary[i]!=0){
			tempary[tempary.length]=ary[i];
			}
		}
	return tempary;
	}

*/
function delteams(teamid){
	/*
	alert(scripts[teamid-1][0]);
	for(var i=0;i<top.ordergid.length;i++){
	//	alert("gid==>"+top.ordergid[i]);
			var obj=top.orderArray["G"+top.ordergid[i]];
			if (obj.gid==scripts[teamid-1][0] || obj.hgid==scripts[teamid-1][0]){
				top.orderArray["G"+top.ordergid[i]]="undefined";
				top.ordergid[i]=0;
			
				} 
		}
	
		top.ordergid=resort(top.ordergid);
	*/
//alert(parent.parent.body.name)
	//alert(teamid);
	//鍘诲煼琛岄亷闂滅洡闈�,FT_mem_showgame_p3.js
	try{
		parent.parent.body.orderRemoveGid(scripts[teamid-1][0]);
	}catch(E){}
	try{
		parent.parent.body.orderParlayParam();
	}catch(E){}	
	eval("TR"+teamid+".style.display='none'");
	document.all.teamcount.value=document.all.teamcount.value-1;
	scripts[teamid-1][0]="0";
	parent.onloadSet(document.body.scrollWidth,document.body.scrollHeight,"bet_order_frame");
	LoadSelect();
	chkParlayDate();
}

function LoadSelect(){
	if(rtype=="P"){
	   var mode = 0;				
	} else if(rtype=="PR") {
		var mode = 1;
	} else if(rtype=="P3"){
		var mode = 3;
	}
 //if (top.paramData.length == 0){ 
//	 top.paramData=scripts;
 //}else if (top.paramData.length==scripts.length){
 //alert(top.paramData.length+"=="+scripts.length);
 //if (top.paramData.length==scripts.length){
 //top.paramData=scripts;
 	
 	for (s=0;s < scripts.length ;s++){
 		for (i=0;i < parent.parent.paramData.length ;i++){
 			//check GID
 			if (parent.parent.paramData[i][0]==scripts[s][0]){
 				if (parent.parent.paramData[i][3]!=scripts[s][3]||parent.parent.paramData[i][4]!=scripts[s][4]||parent.parent.paramData[i][5]!=scripts[s][5]){
 					//eval("document.getElementById('P"+(s+1)+"').style.background='#FFDFDF'");
 					document.getElementById("P"+(s+1)).className="lightOn";
 					//put gold
 					if(document.all.gold.value==""){
						document.all.gold.value=parent.parent.goldData;
						document.all.gold.focus();
						CountWinGold(iorstr,mode);
				 	}
 				}	
 			}
 		}
 	}
 	parent.parent.paramData=new Array();
 //}
 
	//document.all.wteam.style.display="none"
	//alert("===>"+minlimit);
	if(document.all.teamcount.value <= (minlimit*1-1)){
		//document.all.btnCancel.disabled = true;
		document.all.SUBMIT.disabled = true;
		//document.all.wkind.style.display="none"
		//document.all.wstar.style.display="none"
		document.all.gold.style.display="none"
	}
	if (document.all.teamcount.value <= 0){
		//alert(document.all.teamcount.value);
		Win_Redirect();
		//document.all.wstar.length = 1;
		//document.all.wstar.options[0]=new Option(document.all.teamcount.value+top.message017,document.all.teamcount.value);
	}
	
}

function chiang_wkind(){
	if(document.all.wkind.value == 'M'){
		document.all.wstar.length = document.all.teamcount.value-2;
		for(i=2; i<document.all.teamcount.value; i++)
			document.all.wstar.options[i-2]=new Option(i+top.message017,i);
			document.all.wteam.style.display="block";
			document.all.wteam.length = 1;
			var count=0;
			var start=eval(document.all.wstar.value)+1;
			document.all.wteam.options[count++]=new Option(document.all.teamcount.value+top.message018,document.all.teamcount.value)
	}else{
		document.all.wstar.length = 1;
		document.all.wstar.options[0]=new Option(document.all.teamcount.value+top.message017,document.all.teamcount.value);
		document.all.wteam.style.display="none";
	}
}

function chiang_wstar(){
	if(document.all.wkind.value == 'M'){
		document.all.wteam.style.display="block";
		document.all.wteam.length = 1;
		var count=0;
		var start=eval(document.all.wstar.value)+1;
		document.all.wteam.options[0]=new Option(document.all.teamcount.value+top.message018,document.all.teamcount.value)
	}else{
		document.all.wteam.style.display="none";
	}
}

function CheckKey(evt){
	var key = window.event ? evt.keyCode : evt.which;	
	//alert(key)
	//var keychar = String.fromCharCode(key);
	//alert(keychar)
	
	if(key == 32){
		return false;
		}
	
	if(key == 13) {
		CountWinGold(iorstr,3);
		CheckSubmit();
	}
	else if((key < 48 || key > 57) && (key > 95 || key < 106)){alert(top.message015); return false;}

	//if (isNaN(event.keyCode) == true)){alert(top.message015); return false;}
}

var isSubmit=true;
function CheckSubmit(){
	if (parent.parent.paramData.length == 0||(""+parent.parent.paramData.length=="undefined")){ 
		parent.parent.paramData=scripts;
		//alert("aaa==>"+parent.parent.paramData+"==bbb===>"+scripts);
	}
	
	if(document.all.gold.value==''){
		document.all.gold.focus();
		alert(top.message001);  
		return false;
	}else if(document.all.teamcount.value <= (minlimit*1-1)){
		alert(top.message019+minlimit+top.message020);
		return false;
	}else if(document.all.teamcount.value > maxlimit*1){
		if(top.langx=="en-us") alert(top.message021 + document.all.teamcount.value + top.message022);
		else alert(top.message021 + document.all.teamcount.value + top.message022);
		return false;
	}else if(document.all.gold.value==''){
	  alert(top.message023);
	  document.all.gold.focus();
	  return false;
	}else if(document.all.gold.value*1 < (document.all.gmin_single.value.replace(",",'')*1)){
 	  document.all.gold.focus();
	  alert(top.message003+" "+top.mcurrency+" "+document.all.gmin_single.value+top.point);
	  return false;
	 //妾㈡煡鐝鹃噾椤у
	}else if (document.all.pay_type.value =='1') {
		 if(eval(document.all.gold.value*1) > eval(document.all.gmax_single.value)){
			  document.all.gold.focus();
			  alert(top.message024);
			  return false;
		  }
//	}
//	else if(eval(document.all.gold.value*1) > eval(document.all.restcredit.value)){
//	  document.all.gold.focus();
//	  alert(top.message025);
//	  return false;
	}else if(scripts.length > 1){
		if(parent.parent.body.sel_gtype == "FT"){
			if(!chkParlayDate())	return false;
		}
	}
	
	if(!confirm(top.message011+document.all.pc.innerHTML+top.message016)){
		return false;
	}
  document.all.btnCancel.disabled = true;
  document.all.SUBMIT.disabled = true;
  document.all.gold.readOnly=true;
  document.all.gold.blur();
  document.all.wagerDatas.value="";
  for (kk=0;kk<scripts.length;kk++){
  	if (scripts[kk][0]!="0")  document.all.wagerDatas.value+=scripts[kk].toString()+"|";
  }
 	//灏囬噾椤嶆斁鍒版毇瀛�
	parent.parent.goldData=document.all.gold.value;
	
	//top.orderArray=new Array();
	//top.ordergid=new Array();
	
	if(isSubmit){
		clearTimeout(winRedirect);
		isSubmit = false;	
		document.forms[0].submit();
	}
  parent.parent.body.orderRemoveALL();
}

//2015-02-06 瓒崇悆 缍滃悎閬庨棞 娉ㄥ柈鏃ユ湡涓嶈兘瓒呴亷7澶�
function chkParlayDate(){
	var isOk = true;
	
	if(parent.parent.body.sel_gtype == "FT"){
		try{
			var dateAry = new Array();
			for(var i=0; i<scripts.length; i++){
				dateAry[i] = (scripts[i][6]);
			}
			dateAry.sort();
			
			var fOD = dateAry[0];
			var fD = new Date(fOD);
			if(isNaN(fD)){
				var s = fOD.split("-");
				fD = new Date(s[0]+'/'+s[1]+'/'+s[2]);
			}
			var lD = new Date(fD);
			if(isNaN(lD)){
				var s = fOD.split("-");
				fD = new Date(s[0]+'/'+s[1]+'/'+s[2]);
			}
			lD.setDate(fD.getDate()+7);
			
			var overDate = lD.getFullYear()+"-";
			overDate += (lD.getMonth()+1 < 10)?("0"+(lD.getMonth()+1)+"-"):((lD.getMonth()+1)+"-");
			overDate += (lD.getDate() < 10)?("0"+lD.getDate()):lD.getDate();
			
			var a = 0;
			var errorOrder = new Array();
			for(var i=0; i<scripts.length; i++){
				var tmp = scripts[i][6];
				
				if(tmp >= overDate){
					errorOrder[a] = i;
					isOk = false;
					a++;
				}
			}
		}catch(E){
			console.log("chkParlayDate error");
			isOk = false;
		}
		
		try{
			if(isOk){
				document.getElementById("error7D").style.display = "none";
			}else{
				/*2015-03-03 瓒呴亷7澶╃殑閬僵鎷挎帀
				for(var i=0; i<errorOrder.length; i++){
					var obj = document.getElementById("TR"+(errorOrder[i]+1));
					obj.children[0].className += " day_y_title";
					obj.children[1].className += " day_y";
					obj.children[2].className += " day_y";
				}
				*/
				
				document.getElementById("error7D").style.display = "";
			}
		}catch(E){}
		parent.onloadSet(document.body.scrollWidth,document.body.scrollHeight,"bet_order_frame");
	}
	
	return isOk;
}

//瑷堢畻褰╅噾
function CountWinGold(chk,mode){
   /*------------------------------------------------
   * edit date --- 2005/7/14						*
   * From anson										*
   * Content --- from 202 to 206					*
   -------------------------------------------------*/
	
	chk=chk.split(' ');
	var iortmp="";
	if(document.all.gold.value==''){
		document.getElementById("gold").blur();
		document.getElementById("gold").focus();
		document.all.pc.innerHTML="0";
		top.keepGold_PR="";
		//alert(top.message014);
	}else{
		top.keepGold_PR=document.getElementById("gold").value;
		counttmp=document.all.tcount.value;
		gold1=document.all.gold.value;
		if(counttmp>1){
			tmp=1;
			for(q=0;q<counttmp;q++){
				if (scripts[q][0] != "0"){
					if(mode=="3"||mode=="1"){
						//20090203鏈噾宸茶▓绠�
						//if(scripts[q][1]=="PRH"||scripts[q][1]=="PRC"||scripts[q][1]=="HPRH"||scripts[q][1]=="HPRC"||scripts[q][1]=="POUH"||scripts[q][1]=="POUC"||scripts[q][1]=="HPOUH"||scripts[q][1]=="HPOUC"){
							
						//	tmp*=(1+(parseFloat(chk[q])));
						//}else{
							tmp*=((parseFloat(chk[q])));	
						//}
					}else{	
						tmp*=(mode+(parseFloat(chk[q])));
					}
				}
			}
    	var tmp_var=gold1*tmp-gold1;
    	tmp_var=Math.round(tmp_var*100);
    	tmp_var=tmp_var/100;
	    if (tmp_var*1 > document.getElementById("maxgold").value*1){
	    	document.getElementById("err_div").style.display="";
	    }else{
	    	document.getElementById("err_div").style.display="none";
	    }
	     	
	    parent.onloadSet(document.body.scrollWidth,document.body.scrollHeight,"bet_order_frame");
	    tmp_var=addComma(tmp_var);
	    tmp_var=printf(tmp_var,2);
	    //alert("1");
			document.all.pc.innerHTML=tmp_var;
			//alert("2");
		}
	}
}

//鍗冨垎浣嶇铏�
function addComma(vals){
 var integer = "";
 var decimal = "";
 var tmpval = "";
 var pn = (vals<0)?"-":"";
 vals = ""+Math.abs(vals);
 if(vals.indexOf(".")>=0){
  var valarr = vals.split(".");
  integer = valarr[0];
  decimal = valarr[1];
  tmpval = valarr[0];
 }else{
   integer = vals;
  tmpval = vals;
 }
 for (ii=integer.length;ii>3;ii-=3){
   var comma_index = ii-3;
   var strA = tmpval.substring(0,comma_index);
   var strB = tmpval.substring(comma_index);
   tmpval = strA+","+strB;
 }
 if(vals.indexOf(".")>=0){
  tmpval += "."+decimal;
 }
 tmpval = pn+tmpval;
 return tmpval;
}
//灏忔暩榛炰綅鏁�
function printf(vals, points) {
 vals = "" + vals;
 var cmd = new Array();
 cmd = vals.split(".");
 if (cmd.length > 1){
  for (ii=0; ii<(points-cmd[1].length); ii++) vals = vals + "0";
 }else{
  vals = vals + ".";
  for (ii=0; ii<points; ii++) vals = vals + "0";
 }
 return vals;
}