$(function() {
    var d = new Date();
    var date = d.getFullYear() + "/" +(d.getMonth() + 1) + "/" + d.getDate();
    //循环输出
    $.ajax({url: ctx + "/jxssc/road.do?timeStamp=" + new Date().getTime()+"&resultDate="+date,type: "get",dataType: "json",
        success: function (b) {
            if (0 == b.code) {
                //万-大小
                doAction(b.resultList,0,'w','over','dx')
                //万-单双
                doAction(b.resultList,0,'w','odd','ds')
                //万-质合
                doAction(b.resultList,0,'w','prime','zh')

                //千-大小
                doAction(b.resultList,1,'q','over','dx')
                //千-单双
                doAction(b.resultList,1,'q','odd','ds')
                //千-质合
                doAction(b.resultList,1,'q','prime','zh')


                //百-大小
                doAction(b.resultList,2,'b','over','dx')
                //百-单双
                doAction(b.resultList,2,'b','odd','ds')
                //百-质合
                doAction(b.resultList,2,'b','prime','zh')


                //十-大小
                doAction(b.resultList,3,'s','over','dx')
                //十-单双
                doAction(b.resultList,3,'s','odd','ds')
                //十-质合
                doAction(b.resultList,3,'s','prime','zh')

                //个-大小
                doAction(b.resultList,4,'g','over','dx')
                //个-单双
                doAction(b.resultList,4,'g','odd','ds')
                //个-质合
                doAction(b.resultList,4,'g','prime','zh')

               // console.log(w_over_under);

            } else {

            }
        }
    });
    //numW  0万 1千 2百 3十 4个
    //numStr  w万 q千 b百 s十 g个
    //type over大小 odd单双 prime质合
    //typeStr  dx   ds  zh
    function doAction(resultList,numW,numStr,type,typeStr){

        var isOver = 1;
        var isUnder = 0;
        var x = 1;
        var y = 0;
        var numStrs= new Array();
        var  w_over_under= new Array();
        var dxHtml='';
        var  odd=function (num) {return (num % 2 !== 0)},
        over=function (num) {return (num > 4)},
        prime=function (num) {return (isPrime(num) || num === '1')}

        for (var i=0;i<resultList.length;i++) {

            if(resultList[i].result){
                    var JSONstr = resultList[i].result;
                    numStrs=JSONstr.split(","); //字符分割

                    if(type=='odd'){
                        var is =odd(numStrs[numW]);
                        var show1 = '<font style="color: #FF6666">单</font>';
                        var show2 = '<font style="color: #66CCCC">双</font>';
                    }else if(type=='over'){
                        var is =over(numStrs[numW]);
                        var show1 = '<font style="color: #336699">大</font>';
                        var show2 = '<font style="color: #99CC33">小</font>';
                    }else if(type=='prime'){
                        var is =prime(numStrs[numW]);
                        var show1 = '<font style="color: #990066">质</font>';
                        var show2 = '<font style="color: #007ec6">合</font>';
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