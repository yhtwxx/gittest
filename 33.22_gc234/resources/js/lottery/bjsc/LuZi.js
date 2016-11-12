$(function() {
    var d = new Date();
    var date = d.getFullYear() + "/" +(d.getMonth() + 1) + "/" + d.getDate();
    //循环输出
    $.ajax({url: "/bjsc/road.do?timeStamp=" + new Date().getTime()+"&resultDate="+date,type: "get",dataType: "json",
        success: function (b) {
            if (0 == b.code) {
                doAction(b.resultList,0,'1','over','dx')
                doAction(b.resultList,0,'1','odd','ds')

                doAction(b.resultList,1,'2','over','dx')
                doAction(b.resultList,1,'2','odd','ds')


                doAction(b.resultList,2,'3','over','dx')
                doAction(b.resultList,2,'3','odd','ds')


                doAction(b.resultList,3,'4','over','dx')
                doAction(b.resultList,3,'4','odd','ds')

                doAction(b.resultList,4,'5','over','dx')
                doAction(b.resultList,4,'5','odd','ds')
                
                doAction(b.resultList,5,'6','over','dx')
                doAction(b.resultList,5,'6','odd','ds')
                
                doAction(b.resultList,6,'7','over','dx')
                doAction(b.resultList,6,'7','odd','ds')
                
                doAction(b.resultList,7,'8','over','dx')
                doAction(b.resultList,7,'8','odd','ds')
                
                doAction(b.resultList,8,'9','over','dx')
                doAction(b.resultList,8,'9','odd','ds')
                
                doAction(b.resultList,9,'10','over','dx')
                doAction(b.resultList,9,'10','odd','ds')

               // console.log(w_over_under);

            } else {

            }
        }
    });
    
    function doAction(resultList,numW,numStr,type,typeStr){

        var isOver = 1;
        var isUnder = 0;
        var x = 1;
        var y = 0;
        var numStrs= new Array();
        var  w_over_under= new Array();
        var dxHtml='';
        var  odd=function (num) {return (num % 2 !== 0)},
        over=function (num) {return (num > 5)}

        for (var i=0;i<resultList.length;i++) {

            if(resultList[i].result){
                    var JSONstr = resultList[i].result;
                    numStrs=JSONstr.split(","); //字符分割
                    var valueInt = parseInt(numStrs[numW], 10);
                    if(type=='odd'){
                        var is =odd(valueInt);
                        var show1 = '<font style="color: #FF6666">单</font>';
                        var show2 = '<font style="color: #66CCCC">双</font>';
                    }else if(type=='over'){
                        var is =over(valueInt);
                        var show1 = '<font style="color: #336699">大</font>';
                        var show2 = '<font style="color: #99CC33">小</font>';
                    }
                    if(is){
                        if(y==0){
                            isOver = 1;
                            dxHtml =show1;
                            // w_over_under.push(isOver?w_over_under[w_over_under.length-1]+'大':'大');
                        }else {
                            if (isOver == 1) {
                                //if()
                                dxHtml += "<br/>" + show1;
                            } else {
                                $("#" + numStr + typeStr + x).html(dxHtml);
                                dxHtml = show1;
                                x++;
                            }
                            isOver = 1;
                            //w_over_under.push(show1);
                        }

                    }else{
                        if(y==0){
                            isOver = 0;
                            dxHtml =show2;
                            // w_over_under.push(isOver?w_over_under[w_over_under.length-1]+'大':'大');
                        }else{
                            if(isOver==0){
                                dxHtml +="<br/>"+show2;
                            }else{
                                $("#"+numStr+typeStr+x).html(dxHtml);
                                dxHtml =show2;
                                x++;
                            }
                            isOver = 0;
                        }

                    }
                    y++;
                }

            };
    }


    function isPrime(n) {
        if (n < 2) return false;
        var q = Math.sqrt(n);
        for (var i = 2; i <= q; i++) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
    var Filter = {

    };
})