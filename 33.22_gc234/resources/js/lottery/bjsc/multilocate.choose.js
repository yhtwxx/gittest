$(function() {

    //計算金額
    var count= function()
    {
        var view = this;
        var ret = 0;

        view._each(function(){
            var choose_item = this;
            ret += choose_item.count();
        });

        return ret;
    };
    var  clear=function()
    {
        var view = this;

        view._each(function(){
            var choose_item = this;
            choose_item.clear();
        });

        return view;
    }


    var  _hasChecked=function(locate)
    {
        var choose_item = this;
        var locates = choose_item._checked_locates;

        if (typeof locate == 'undefined') {
            for (var _locate in locates) {
                if (locates[_locate]) {
                    return true;
                }
            }

            return false;
        }

        return false !== locates[locate];
    };

    var _inChecked=function(num)
    {
        var choose_item = this;
        var locates = choose_item._checked_locates;

        for (var locate in locates) {
            if (num === locates[locate]) {
                return true;
            }
        }

        return false;
    };

    var _eachBall= function(callback)
    {

        return 1;
    };

    var _renderBalls=function()
    {
        var choose_item = this;
        var locates = choose_item._checked_locates;
        var has_checked = _hasChecked();

        _eachBall(function(locate, num){
            var $ball = this;
            if (1) {
                $ball.removeClass('disabled');
            } else {
                $ball.addClass('disabled');
            }
        });
    }


    var ui = this;
// 存放子物件
    var $table =  $(".game-box").find('.choose-group-block');
    var gold_total = $('#BetGold');



    $table.delegate('.ball[locate]', 'click', function(){
        var parent = $(this).parent().parent().parent().parent();
        var ball = this;
        var locate = ball.getAttribute('locate'); //当前行标记
        var num = ball.innerHTML;//当前数码标记
        var pid = parent.attr("id");
        var select = $(this).parent().parent().find(".select");
        select.html(num);
        $.each($('#'+pid).find(".select"), function(k, v) {


            if($(v).attr("locate")!==locate) {

                if ($(v).html() == num) {

                    $(v).html("");
                }
            }

        })

            $.each($('#'+pid).find(".ball"), function(k, v) {

                if($(v).attr("locate")==locate){   //同一行

                        if($(v).html()!==num){

                            $(v).addClass('disabled');

                        }else{
                            if(!_hasChecked(pid,locate)){

                                $(v).removeClass('disabled');

                            }
                        }

                }else{

                    if($(v).html()==num){

                        $(v).addClass('disabled');
                    }else{
                        //$(v).removeClass('disabled');

                    }


                }


              hao =   _getHao(pid,locate);

            })

        if(_isHao(pid)){
            $('#'+pid).find(".itemCode").attr("data-itemNo",hao);
        }else{
            $('#'+pid).find(".itemCode").attr("data-itemNo",'');
        }
        //console.log(hao);

    });

     //   count();


    //判断行是否被选择  $d为每个外框pid
    var    _hasChecked= function(pid)
    {

        //var thispan = 'locate='+locate;
        $.each($('#'+pid).find("span[locate]"), function(k, v) {

            if(!$(v).hasClass("disabled")){
                return false;
            }

        })

    }

    //判断hao是否有效  $d为每个外框pid
    var    _isHao= function(pid)
    {

        var is = 0;
        $.each($('#'+pid).find(".select"), function(k, v) {

                if($(v).html()){

                    is = 1;
                    return true;

                }else{
                    is = 0;
                    return false;

                }

        })

        return is;

    }

    //获取框选号  $d为每个外框pid
    var    _getHao= function(pid,locate)
    {

        var hao;
        $.each($('#'+pid).find(".select"), function(k, v) {

            if(!$(v).hasClass("disabled")){
                k>0? hao +=$(v).html()+',':hao = $(v).html()+',';
            }

        })

        return hao;

    }



        var reset=function(){
            var ui =  $(".game-box");
            $(".choose-num").removeClass('active');
            $('#BetGold').html("0");
            ui.find('input:text').val('');
            ui.find('input:checkbox').prop('checked', false);
            ui.find('input:radio').prop('checked', false);
            count();
            return true;
        }

       var getInputs=function(){
            return this._$view_inputs;
        }

    // 统计已选数量
    function count(){

        var nums = $("#locate-box").find(".itemCode")
            .filter(function(){
                return this.value !== "";
            }).size();

        $(".choose-item-cnt").text("已选取："+nums+"笔");
    }


    function format_gold(gold) {
        return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
    }







});