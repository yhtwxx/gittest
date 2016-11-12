/**
 * Created by DELL on 2016/4/30.
 */

$(document).ready(function(){

    createCode();
})

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


    var vailcode = $("#vailcode").val();
    if(vailcode==""){
        layer.msg("verification code must be filled");
        return;
    }else if(vailcode.toLocaleLowerCase() != code.toLocaleLowerCase()){
        layer.msg("Verification code does not match");
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
                layer.msg('success');
                setTimeout(function(){
                    window.location.reload();
                }, 3000);
            }else{
                layer.msg('error');
            }
        }
    });
});


$(document).on("click",".contact_1 span",function(e){
    createCode()
});
