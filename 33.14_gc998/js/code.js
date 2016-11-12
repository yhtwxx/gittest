/**
 * Created by DELL on 2016/5/1.
 */


var code ; //在全局 定义验证码
function createCode()
{
    code = "";
    var codeLength = 4;//验证码的长度
    var checkCode = $(".contact_1 span");
    var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符，当然也可以用中文的

    for(var i=0;i<codeLength;i++)
    {
        var charIndex = Math.floor(Math.random()*36);
        code +=selectChar[charIndex];
    }
//       alert(code);
    if(checkCode)
    {
        checkCode.html(code);
    }
}