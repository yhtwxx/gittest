var config_group3="";
console.debug(config_group3);
$(function() {
    //循环输出
    $.ajax({url: "../ssc/itemDate.do?timeStamp=" + new Date().getTime()+"&poolId=A",type: "get",dataType: "json",
        success: function(b) {
        	console.debug(b);
            if(0 == b.code){
            	var itmes = b.items_map;
            	console.debug(itmes);
            	var str = ""; 
            	//前三
            	var jsonT = "{";
            	var jsonT1 = "1: {";
            	var num1=5; //最少选4个数开始
            	for (var i=15429; i < 15435; i++) {
            		jsonT1 += num1 + ": {dds:" + itmes[i].odds + ", itemCode:" + itmes[i].itemCode + "}";
            		if(num1 != 10){
            			jsonT1 += ",";
            		}
            		num1++;
            	}
            	jsonT1 += "},";
            	//中三
            	var jsonT2 = "2: {";
            	var num2=5; //最少选4个数开始
				for (var i=15435; i < 15441; i++) {
					jsonT2 += num2 + ": {dds:" + itmes[i].odds + ", itemCode:" + itmes[i].itemCode + "}";
            		if(num2 != 10){
            			jsonT2 += ",";
            		}
            		num2++;        		
				}
				jsonT2 += "},";
            	//后三
            	var jsonT3 = "3: {";
            	var num3=5; //最少选4个数开始
				for (var i=15441; i <= 15446; i++) {
					jsonT3 += num3 + ": {dds:" + itmes[i].odds + ", itemCode:" + itmes[i].itemCode + "}";
            		if(num3 != 10){
            			jsonT3 += ",";
            		}
            		num3++; 
				}
				jsonT3 += "}";
				jsonT += jsonT1+jsonT2+jsonT3+"}";
				var obj = eval('(' + jsonT + ')');
				config_group3 = obj;
            }
        }})
});