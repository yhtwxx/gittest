
$("#balls-block").find('.ball').on('click', function(){


    var num;
    var p = p_b();
    if($(this).hasClass("checked")){
        $(this).removeClass("checked");
    }else{
        $(this).addClass("checked");
    }

    num = checknum();

    if(num>=p){
        var limit = count_effective();
        if(limit<200){
            $(".display-bets-count").html(limit);
        }else{
            $(this).removeClass("checked");
            parent.Showbo.Msg.alert('不能选取更多的号码了!');
        }


    }

    if(parseInt($(".itemCode").val(), 10)){
        var allGold = count();
        $('#BetGold').text(allGold);
    }

    var itemNo = checkitemNo();
    $(".itemCode").attr("data-itemNo",itemNo);



});


//判断选择数

var checknum = function(){
    var num=0;
        $("#balls-block").find('.ball').each(
        function(index,t){

            if($(t).hasClass("checked")){

                num++


            }


        })

return num;

}


//判断选择值

var checkitemNo = function(){
    var itemNo='';
        $("#balls-block").find('.ball').each(
        function(index,t){

            if($(t).hasClass("checked")){
                itemNo += $(t).html()+',';
            }


        })

return itemNo;

}


//判断选择数

var check = function(){
    var num=0;
    $("#balls-block").find('.ball').each(
        function(index,t){

            if($(t).hasClass("checked")){

                num++


            }


        })

    return num;

}

//计算金额
var count = function()
{
    var count_e = count_effective();
    return (parseInt($(".itemCode").val(), 10) || 0) * count_e;
}

//判断左侧选择
var  p_b = function()
{

    var p_b_b = 0;

    $("#button-block").find('.btn-choose-group').each(
        function(index,t){

            if($(t).hasClass("active")){
                p_b_b = $(t).attr("group");
                return false;
            }

        })

    return p_b_b;

}

//判断左侧选择ItemCOde
var  leftItemCode = function()
{
    var c = 50001;
    $("#button-block").find('.btn-choose-group').each(
        function(index,t){

            if($(t).hasClass("active")){
                c = $(t).attr("itemCode");
                return false;
            }

        })

    $(".itemCode").attr("data-itemcode",c);

}




//取得有效投注排列組和数
var  count_effective = function()
{
    var view = this;
    var balls =checknum();
    var per_bet_balls = p_b();

    var limit = (balls < per_bet_balls)
        ? 0
        : factorial(balls, balls - per_bet_balls + 1) / factorial(1, per_bet_balls);

    return limit;
}




function factorial(start, end)
{
    var retval = 1;
    var max = 0;
    var min = 0;
    if (start == end) {
        return start;
    } else if (start > end) {
        max = start;
        min = end;
    } else {
        max = end;
        min = start;
    }

    for (var i = max; i >= min; --i) {
        retval *= i;
    }

    return retval;
}

