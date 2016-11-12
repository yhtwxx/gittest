try{
	sel_gtype = myGtypeSet;
	mother = "parent.parent.";
}catch(e){
	try{ console.log("NaN myGtypeSet"); }catch(e){};
	sel_gtype = parent.parent.sel_gtype;
	mother = "parent.parent.parent.";
}

function onLoad(){
	if (""+eval(mother+sel_gtype+"_lid_ary")=="undefined") eval(mother+sel_gtype+"_lid_ary='ALL'");	
	var len =lid_form.elements.length;
	parent.setleghi(document.body.scrollHeight);
	if(eval(mother+sel_gtype+"_lid_ary")=='ALL'){
		lid_form.sall.checked='true';
		for (var i = 1; i < len; i++) {
			var e = lid_form.elements[i];
			if (e.id.substr(0,3)=="LID") e.checked = 'true';
		}
	}else{
		for (var i = 1; i < len; i++) {
			var e = lid_form.elements[i];
			if(e.id.substr(0,3)=="LID"&&e.type=='checkbox') {
				if(eval(mother+sel_gtype+"_lid_ary").indexOf(e.id.substr(3,e.id.length)+"|",0)!=-1){
					e.checked='true';
				}
			}
		}		
	}
	
	
}

function selall(){
	var len =lid_form.elements.length;
	var does=true;
  	does=lid_form.sall.checked;
	for (var i = 1; i < len; i++) {
		var e = lid_form.elements[i];
		if (e.id.substr(0,3)=="LID") e.checked = does;
	} 
}

function select_all(b){
	var len =lid_form.elements.length;
	var does=b;
  	lid_form.sall.checked=does;
	for (var i = 1; i < len; i++) {
		var e = lid_form.elements[i];
		if (e.id.substr(0,3)=="LID") e.checked = does;
	} 
}

function chk_all(e){
	if(!e) lid_form.sall.checked=e;
}

function chk_league(){
	var len =lid_form.elements.length;
	var strlid='';
	var strlname='';
	var tmp='';
	var gcount=0;
  	if(lid_form.sall.checked) {
  		eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lid_type']="+mother+sel_gtype+"_lid_type='"+((top.swShowLoveI)?"3":"")+"'");
  		eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lid_ary']="+mother+sel_gtype+"_lid_ary='ALL'");
  		eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lname_ary']="+mother+sel_gtype+"_lname_ary='ALL'");
  	}else{
		for (var i = 1; i < len; i++) {
			var e = lid_form.elements[i];
			if (e.id.substr(0,3)=="LID"&&e.type=='checkbox'&&e.checked) {
				strlid+=e.id.substr(3,e.id.length)+'|';
				strlname+=e.value+'|';
				tmp+=e.value
			}
		}
		if(tmp==""){
	  		eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lid_type']="+mother+sel_gtype+"_lid_type='"+((top.swShowLoveI)?"3":"")+"'");
	  		eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lid_ary']="+mother+sel_gtype+"_lid_ary='ALL'");
	  		eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lname_ary']="+mother+sel_gtype+"_lname_ary='ALL'");	
		}else{	
			eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lid_type']="+mother+sel_gtype+"_lid_type='2'");
			eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lid_ary']="+mother+sel_gtype+"_lid_ary=strlid");
			eval("top."+sel_gtype+"_lid['"+sel_gtype+"_lname_ary']="+mother+sel_gtype+"_lname_ary=strlname");
		}	
	}
	back();
}

function back(){
	parent.parent.parent.leg_flag="Y";
	parent.LegBack();
}