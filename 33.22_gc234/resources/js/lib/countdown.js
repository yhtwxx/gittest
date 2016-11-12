var timeID;
var fnTimeCountDownDay = function(d, o){

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
            	day:"0",
                sec: "00",
                mini: "00",
                hour: "00"

            };
            if(mss > 0){
            	pms.day = Math.floor((dur / 3600)) > 0? parseInt(Math.floor((dur / 3600)) / 24,10) : "0";
            	pms.sec = f.zero(dur % 60);
                pms.mini = Math.floor((dur / 60)) > 0? f.zero(Math.floor((dur / 60)) % 60) : "00";
                pms.hour = Math.floor((dur / 3600)) > 0? f.zero(Math.floor((dur / 3600)) % 24) : "00";

            }else{
                pms.hour=pms.mini=pms.sec="00";
                pms.day = "0天";
                // $("#order-box").hide();
                //return pms;
            }
            return pms;
        },
        ui: function(){
        	if(o.day){
                o.day.html(f.dv().day+"天");
            }
            if(o.sec){
                o.sec.html(f.dv().sec);
            }
            if(o.mini){
                o.mini.html(f.dv().mini);
            }
            if(o.hour){
                o.hour.html(f.dv().hour);
            }
            timeID = setTimeout(f.ui, 1000);
        }
    };
    f.ui();
};

var fnTimeCountDown = function(d, o){

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
                pms.hour = Math.floor((dur / 3600)) > 0? f.zero(Math.floor((dur / 3600)) % 24) : "00";

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
            timeID = setTimeout(f.ui, 1000);
        }
    };
    f.ui();
};

function stopCount()
{
    clearTimeout(timeID);
}
