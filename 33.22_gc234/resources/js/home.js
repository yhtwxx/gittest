
$(function () {
    $("#btn-login").click(function (event) {
        var isFailed = false;
        //$("#LoginName,#Password,#CheckCode").each(function () {
        $("#username,#password").each(function () {
            var this$ = $(this);
            var value = this$.val();
            if (value == "") {
                isFailed = true;
                
             /*   var button = {};
                button[l.OK] = function () {
                    dialog.close();
                    this$.focus();
                };
                dialog.error(l.Message, this$.attr("data-val-required"), button);*/
                
                alert("用户名和密码都不能为空！");
                return false; //break loop
            }
        });
        if (isFailed) {
            event.stopPropagation(); //Cancel form submit
            event.preventDefault();
            return false;
        }

       // $("#login-panel").addClass("login-loading");
    });
});

