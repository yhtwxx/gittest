var count_win=false;
var winRedirectTimer=45000;
var winRedirect=0;

window.onload = function (){
	document.getElementById("gold").blur();
	document.getElementById("gold").focus();
	if(""+top.resetCheck!="undefined"){
		var reloadTime=document.getElementById("checkOrder");
		reloadTime.checked=top.resetCheck;
	}
	var reloadautoOdd=document.getElementById("autoOdd");
	
	if(""+top.autoOddCheck!="undefined"){
			reloadautoOdd.checked=top.autoOddCheck;
	}else{
		top.autoOddCheck=false;
		reloadautoOdd.checked=top.autoOddCheck;
	}	
	onclickReloadTime();
	resetGold();
	parent.onloadSet(document.body.scrollWidth,document.body.scrollHeight,"bet_order_frame");
//	check_ioradio();
}

//檢查賠率變色
function check_ioradio(){
	var tmp_ior=document.getElementById("ioradio_r_h").value;
	if (top.ioradio==""){
		top.ioradio=tmp_ior;
	}
	if (top.ioradio!=tmp_ior){
		top.ioradio=tmp_ior;
		document.getElementById("ioradio_id").className="lightOn";
	}else{
		document.getElementById("ioradio_id").className="light";
	}
}

//盤面自動重取賠率 start
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
	//回復reload時間
	onclickReloadTime();
}

function resetGold(){
	if (""+top.keepGold!="undefined" && top.keepGold!="" ){
		document.getElementById("gold").value=top.keepGold;
		CountWinGold();
	}
}

function winReload(){
	top.time=top.time+1;
	if(top.time*1000>winRedirectTimer){
		top.time=0;
		Win_Redirect();
	}
	var showTimer=document.getElementById("ODtimer").innerHTML;
	showTimer=showTimer*1-1;
	document.getElementById("ODtimer").innerHTML=showTimer;
	if (showTimer<=0){
		window.location.href=window.location
	}else{
		winRedirect=window.setTimeout("winReload()", 1000);
	}
}

function clearAllTimer(){
	window.clearTimeout(winRedirect);
	winRedirect=window.setTimeout("Win_Redirect()", winRedirectTimer);
}
//盤面自動重取賠率 end


function Win_Redirect(){
	parent.close_bet();
}

function CheckKey(evt){
	var key = window.event ? evt.keyCode : evt.which;	
	if(key == 32){
		return false;
	}
	if(key == 13) {
		CountWinGold();
		SubChk();
	}
	else if((key < 48 || key > 57) && (key > 95 || key < 106)){alert(top.message015); return false;}
}

var isSubmit=true;
function SubChk(){
	var reloadTime=document.getElementById("checkOrder");
	reloadTime.checked=false;
	window.clearTimeout(winRedirect);
	var gmax_s="";
  	var gmax_s=document.all.gmax_single.value.replace(",",'');
	if(document.all.gold.value==''){
		document.all.gold.focus();
		alert(top.message001);  
		return false;
  		
 	}else if(isNaN(document.all.gold.value) == true){
  		document.all.gold.focus();
  		alert(top.message002);
  		return false;
  		
	}else if(eval(document.all.gold.value*1) < (document.all.gmin_single.value.replace(",",'')*1)){
		document.all.gold.focus();
		alert(top.message003+" "+top.mcurrency+" "+document.all.gmin_single.value);
		return false;
     	
	}else if(eval(document.all.gold.value*1) > gmax_s*1){
     	document.all.gold.focus();
     	alert(top.message006+" "+top.mcurrency+" "+document.all.gmax_single.value);
     	return false;
     		
	}else if (document.all.pay_type.value!='1'){	//不檢查現金顧客
    	if(eval(document.all.gold.value*1) > eval(document.all.singleorder.value)){
     		document.all.gold.focus();
     		alert(top.message006+" "+top.mcurrency+" "+document.all.singleorder.value);
     		return false;
     			
    	}
    	if((eval(document.all.restsinglecredit.value)+eval(document.all.gold.value*1)) > eval(document.all.singlecredit.value)){
     		document.all.gold.focus();
     		if (eval(document.all.restsinglecredit.value)==0){
       			alert(top.message007);
     		}else{
       			alert(top.message008+document.all.restsinglecredit.value+top.message009);
     		}
     		return false;
	
    	}
 	}else if(eval(document.all.gold.value*1) > eval(document.all.balance.value)){
 		document.all.gold.focus();
 		alert(top.message010);
 		return false;

    }
	if(!confirm(top.message011+document.all.pc.innerHTML+top.message016)){
		return false;
	}
	document.all.gold.blur();
	document.all.btnCancel.disabled = true;
	document.all.Submit.disabled = true;
	if(isSubmit){
		clearTimeout(winRedirect);
		isSubmit = false;	
		document.forms[0].submit();
	}

}

function CountWinGold(){
	if(document.all.gold.value==''){
		document.all.gold.focus();
		document.all.pc.innerHTML="0";
		top.keepGold="";
	}else{
		top.keepGold=document.getElementById("gold").value;
		var tmp_var=document.all.gold.value * document.all.ioradio_r_h.value-document.all.gold.value;
			
		tmp_var=Math.round(tmp_var*100);
		tmp_var=tmp_var/100;
		tmp_var=addComma(tmp_var);
		tmp_var=printf(tmp_var,2);
		document.all.pc.innerHTML=tmp_var;
		count_win=true;
	}
}

//千分位符號
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

//小數點位數
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