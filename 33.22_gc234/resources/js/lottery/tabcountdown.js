/**
 * 
 */

var cainav = {
	obj : function(ui) {
		return {
			sec : ui.find("#second"),
			mini : ui.find("#minute"),
			hour : ui.find("#hour")
		}
	}
};
var timeID = new Array();
$(function() {
	gettimes();
	setTimeout('gettimes()', 10000);
})
function gettimes() {
	$.ajax({
		'url' : "/lottery/getTimes.do?timeStamp=" + new Date().getTime(),
		type : "get",
		dataType : 'json',
		success : function(b) {
			if (b.code == 0) {
				var times = b.gameTimes;
				var now = new Date();
				// 1.重庆时时彩
				// 2.广东快乐10
				// 3.江苏快三 
				// 4.北京赛车10
				// 5.北京快乐8
				// 6.香港六合彩
				// B.天津时时彩
				// C.新疆时时彩
				// D.江西时时彩
				// E.云南时时彩
				var i = 0;
				for ( var key in times) {
					console.debug("timeID["+i+"]====="+timeID[i]);
					var ui = $("#select_sys li#lottery" + key);
					var intDiff = parseInt(times[key]);// 倒计时总秒数量
					if(typeof(timeID[i]) != "undefined"){
						stopCount(timeID[i]);
					}
					if (intDiff > 0) {
						var d = now.getTime() + intDiff * 1000; // 如果未定义时间，则我们设定倒计时日期是2050年1月1日
						timeCountDown(d, cainav.obj(ui),i);
						ui.find("#close").hide();
						ui.find("#times").show();
					} else {
						ui.find("#close").show();
						ui.find("#times").hide();
					}
					i++;
				}
			}
		}
	});
	setTimeout('gettimes()', 10000);
}

var timeCountDown = function(d, o,i){
    var f = {
        zero: function(n){
            var n = parseInt(n, 10);//解析字符串,返回整数
            if(n > 0){
                if(n <= 9){
                    n = "0" + n;
                }
                return String(n);
            }else{
                return "00";
            }
        },
        dv: function(){

          /*  d =  Date.UTC(2015, 6, 3); //如果未定义时间，则我们设定倒计时日期是2050年1月1日
            console.log(d)*/
            var now = new Date();
            //现在将来秒差值
            //alert(future.getTimezoneOffset());
            var dur = (d - now.getTime()) / 1000 , mss = d - now.getTime() ,pms = {

                sec: "00",
                mini: "00",
                hour: "00"

            };
            if(mss > 0){

                pms.sec = f.zero(dur % 60);
                pms.mini = Math.floor((dur / 60)) > 0? f.zero(Math.floor((dur / 60)) % 60) : "00";
                pms.hour = Math.floor((dur / 3600)) > 0? f.zero(Math.floor((dur / 3600))) : "00";

            }else{
                pms.hour=pms.mini=pms.sec="00";
                // $("#order-box").hide();
                //return;
            }
            return pms;
        },
        ui: function(){
        	if(o.sec){
                o.sec.html(f.dv().sec);
            }
            if(o.mini){
                o.mini.html(f.dv().mini);
            }
            if(o.hour){
                o.hour.html(f.dv().hour);
            }
            timeID[i] = setTimeout(f.ui, 1000);
            if(f.dv().sec == "00" && f.dv().mini == "00" && f.dv().hour == "00"){
        		clearTimeout(timeID[i]);
        	}
        }
    };
    f.ui();
};

function stopCount(tims)
{
      clearTimeout(tims);
}