/**
 * Created by DELL on 2016/4/30.
 */

$(document).ready(function(){

    createCode();
});

$(document).on("click",".container #tijiao",function(e){
    var guestname = $("#guestname").val();
    var title = $("#title").val();
    var telenumber= $("#telenumber").val();
    var phonenumber = $("#phonenumber").val();
    var instantmessage = $("#instantmessage").val();
    var imnumber = $("#imnumber").val();
    var country = $("#country").val();
    var email =$("#email").val();
    var theme = $("#theme").val();
    var content = $("#content").val();

    var success = "\\u63d0\\u4ea4\\u6210\\u529f";
    var error = "\\u63d0\\u4ea4\\u5931\\u8d25";
    var isnull = "";
    var vodeerror = "\\u8bf7\\u8f93\\u5165\\u9a8c\\u8bc1\\u7801";
    var vodeerror1 ="\\u9a8c\\u8bc1\\u7801\\u4e0d\\u5339\\u914d";

    var vailcode = $("#vailcode").val();
    if(vailcode==""){
        layer.msg(eval("'" + vodeerror + "'"));
        return;
    }else if(vailcode.toLocaleLowerCase() != code.toLocaleLowerCase()){
        layer.msg(eval("'" + vodeerror1 + "'"));
        return;
    }

    var n = $("input[type='checkbox']");
    var favoriteproduct = "";
    for(var j=0, t = n.length; j < t; j++){
        if(n[j].checked){
            favoriteproduct += n[j].value + ",";
        }
    }

    favoriteproduct = favoriteproduct.substring(0,favoriteproduct.length - 1);

    $.ajax({url: "http://rp.gc234.com/guestmsg.action",
        type: "get",
        dataType: "jsonp",
        data:{
            guestname:guestname,
            title:title,
            telenumber:telenumber,
            phonenumber:phonenumber,
            instantmessage:instantmessage,
            imnumber:imnumber,
            country:country,
            favoriteproduct:favoriteproduct,
            email:email,
            theme:theme,
            content:content
        },
        success: function(b) {
            if(0 == b.code){
                layer.msg(eval("'" + success + "'"));
                setTimeout(function(){
                    window.location.reload();
                }, 3000);
            }else{
                layer.msg(eval("'" + error + "'"));
            }
        }
    });
});

$(document).on("click",".contact_1 span",function(e){
    createCode()
});