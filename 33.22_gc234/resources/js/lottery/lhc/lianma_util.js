/**
 * 
 */

//数字从小到大排序
function argsSort(strs) {
	strs= strs.substring(0,strs.length-1);
	var strArr= new Array();
	strArr=strs.split(","); //字符分割 
	
	for (i = 0; i < strArr.length; i++) {
		for (var int = i + 1; int < strArr.length; int++) {
			if (strArr[i] > strArr[int]) {
				var str = strArr[i];
				strArr[i] = strArr[int];
				strArr[int] = str;
			}
		}
	}
	return strArr;
}

/**
 * 几个基础数字
 * num  
 * 数字数组字符串，排序后的
 * strArr
 */
function argsCombination(num,strArr){
	var result= new ArrayList();
	if (num == 1) {
		for (var int = 0; int < strArr.length; int++) {
			result.add(new Array([strArr[int]]));
		}
	} else if (strArr.length == num) {
		result.add(strArr);
	} else {
		var psource  = new Array(strArr.length - 1);
		for (var i = 0; i < psource.length; i++) {
			psource[i] = strArr[i];
		}
		result = argsCombination(num,psource);
		var tmp= new ArrayList();
		tmp = argsCombination(num - 1,psource);
		for (var i = 0; i < tmp.size(); i++) {
			var rs= new Array(num);
			for (var j = 0; j < num - 1; j++) {
				rs[j] = tmp.get(i)[j];
			}
			rs[num - 1] = strArr[strArr.length - 1];
			result.add(rs);
		}
	}
	return result;
}


