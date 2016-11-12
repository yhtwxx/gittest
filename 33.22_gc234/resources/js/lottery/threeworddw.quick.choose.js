$(function() {


    //循环输出
    $.ajax({url: "../ssc/itemDate.do?timeStamp=" + new Date().getTime()+"&poolId=3",type: "get",dataType: "json",
        success: function(b) {
            if(0 == b.code){
                var html1 = tpl('#contentTpl1', b);
                $("#content1").html(html1);
                var html2 = tpl('#contentTpl2', b);
                $("#content2").html(html2);
                var html3 = tpl('#contentTpl3', b);
                $("#content3").html(html3);
            }else{
                parent.Showbo.Msg.alert('请登录!')
                setTimeout(function(){
                    window.location.href=ctx+"logout.do";
                },1000);
            }
        }})


    var ui = this;
    $parent = $(".game-box");
// 存放子物件
    ui._$view = $parent.find('.quick-bet');
    $gold_total = $('#BetGold');
    ui._$parent = $parent;


// 下注金额栏位
    ui._$view_inputs = $("#Gold").
        on('keyup', function () {
            var el = this;
            el.value = format_gold(el.value);
            console.log(el.value);
        }).
        on('change', function () {
            var el = this;
            el.value = format_gold(el.value);
            console.log(el.value);
        });

    // 头 输入栏位
    ui.$headInput = ui._$view.find("input[name*='head-i']");
    // 中 输入栏位
    ui.$middleInput = ui._$view.find("input[name*='middle-i']");
    // 尾 输入栏位
    ui.$tailInput = ui._$view.find("input[name*='tail-i']");
    // 和尾 输入栏位
    ui.$tailSumInput = ui._$view.find("input[name*='sumTail-i']");
    // 和數 输入栏位
    ui.$sumInput = ui._$view.find("input[name*='sum-i']");
    // 膽 输入栏位
    ui.$daInput = ui._$view.find("input[name*='da-i']");

    // 头 radio 输入栏位
    ui.$headRadio = ui._$view.find("input[name*=head]:radio").change(function(){
        ui.$headInput.val(getTypeItems($(this).val()));
    });

    // 中 radio 输入栏位
    ui.$middleRadio = ui._$view.find("input[name*=middle]:radio").change(function(){
        ui.$middleInput.val(getTypeItems($(this).val()));
    });

    // 尾 radio 输入栏位
    ui.$tailRadio = ui._$view.find("input[name*=tail]:radio").change(function(){
        ui.$tailInput.val(getTypeItems($(this).val()));
    });

    // 和尾 radio 输入栏位
    ui.$tailSumRadio = ui._$view.find("input[name*=sumTail]:radio").change(function(){
        ui.$tailSumInput.val(getTypeItems($(this).val()));
    });

    // checkbox 欄位
    ui.$checkbox = ui._$view.find('input:checkbox');

    // 选取按钮
    ui._$view.find('.btn-quick-select').on('click', function(){
        render();
    });

    // 清除按钮
    ui._$view.find('.btn-quick-reset').on('click', function(){
        reset();
        $('#btn-orders-reset').click();
    });

    ui._$view.find('.btn-quick-submit').on('click', function(){
        $('#btn-orders-submit').click();
    });

    $parent.find('.tabs-btn').on('click', function(){
        reset();
    });

    var render= function(){

        // 过滤条件
        var cHead, cMiddle, cTail, cTailSum, cSum, cDa, cOptions, gold;

        gold =  $("#Gold").val();
        cHead = ui.$headInput.val();
        cMiddle = ui.$middleInput.val();
        cTail = ui.$tailInput.val();
        cTailSum = ui.$tailSumInput.val();
        cSum = ui.$sumInput.val();
        cDa = ui.$daInput.val();
        cOptions = ui.$checkbox.filter(":checked").map(function(){
            return this.value;
        }).get();
        if (! check(gold, cHead, cMiddle, cTail, cTailSum, cSum, cDa)) {
            return false;
        }

        cHead = cHead.split('');
        cMiddle = cMiddle.split('');
        cTail = cTail.split('');
        cTailSum = cTailSum.split('');
        cSum = (cSum !== '')  ? cSum.split(',') : [];
        cDa = cDa.split('');

        if (cHead.length || cMiddle.length || cTail.length || cTailSum.length  ||
            cSum.length || cDa.length || cOptions.length) {

            if (ui._$parent.data('tabs-active')) {
                $content = ui._$parent.data('tabs_data').views[ui._$parent.data('tabs-active')];
            } else {
                $content = ui._$parent;
            }
            //替代上面代码
            var tabs_view = $("#tabs").find(".active").attr("tabs");
            var this_tabs = 'tabs-view='+tabs_view;
            var allGold = 0;
            $("table["+this_tabs+"]").find('.choose-num').each(function(i){

                var $el = $(this).removeClass('active');
                var num = $el.html();
                var $input =  $el.next().find('input');
                //var key = $input.attr('name').match(/orders\[([^\]]+)\]/)[1];

                // 检查是否封牌
                //if(! chooses.isEnable(key)) {
                //    return;
                //}

                if (cHead.length > 0 && $.inArray(num.charAt(0), cHead) < 0) {
                    return;
                }

                if (cMiddle.length > 0 && $.inArray(num.charAt(1), cMiddle) < 0) {
                    return;
                }

                if (cTail.length > 0 && $.inArray(num.charAt(2), cTail) < 0) {
                    return;
                }


                if (cTailSum.length > 0) {
                    var isInTailSum = false;
                    $.each(cTailSum, function(k, v){
                        if (config_sumTail['ST' + v].hasOwnProperty(num)) {
                            isInTailSum = true;
                            return false;
                        }
                    });
                    if (! isInTailSum) {
                        return;
                    }
                }

                if (cSum.length > 0) {
                    var isInSum = false;
                    $.each(cSum, function(k, v){
                        if (v !== '' && config_sum.hasOwnProperty('S' + v) &&
                            config_sum['S' + v].hasOwnProperty(num)) {
                            isInSum = true;
                            return false;
                        }
                    });
                    if (! isInSum) {
                        return;
                    }
                }

                if (cDa.length > 0) {
                    var isInDa = false;
                    $.each(cDa, function(k, v){
                        if (config_da['D' + v].hasOwnProperty(num)) {
                            isInDa = true;
                            return false;
                        }
                    });
                    if (! isInDa) {
                        return;
                    }
                }

                if (cOptions.length > 0) {
                    var isCheck = true;
                    $.each(cOptions, function(k, v){
                        isCheck = (isCheck && config_options[v].hasOwnProperty(num));
                    });

                    if (! isCheck) {
                        return;
                    }
                }
                allGold += format_gold(gold);
                $el.addClass('active').next().find('input').val(gold);
            });
            $gold_total.text(allGold);
            //ui.notice(null, 'gold_change');
        }

        count();
    }

        // 檢查輸入值
         function check(gold, cHead, cMiddle, cTail, cTailSum, cSum, cDa){
            var errors = [];
            var isNumber = /^\d+$/;

            if (gold === '' || ! isNumber.test(gold)) {
                errors.push("请输入投注金额！");
            }

            if (cHead !== '' && ! isNumber.test(cHead)) {
                errors.push(l('MSG_PLZ_CHK_UnChked'));
            }

            if (cMiddle !== '' && ! isNumber.test(cMiddle)) {
                errors.push(l('MSG_PLZ_CHK_UnChked'));
            }

            if (cTail !== '' && ! isNumber.test(cTail)) {
                errors.push(l('MSG_PLZ_CHK_UnChked'));
            }

            if (cTailSum !== '' && ! isNumber.test(cTailSum)) {
                errors.push(l('tailNum_pl_kin_num'));
            }

            if (cSum !== '') {
                var ret = false;
                $.each(cSum.split(','), function(k, v) {
                    if(! isNumber.test(v)) {
                        ret = true;
                    }
                });
                ret && errors.push(l('sumNum_pl_kin_num'));
            }

            if (cDa !== '' && ! isNumber.test(cDa)) {
                errors.push(l('dan_pl_kin_num'));
            }

            if (errors && errors.length) {
                alert(errors.join('<br>'));
                return false;
            }

            return true;
        }

        function verify(errors){
            return true;
        }

        function gold(){
            return 0;
        }

         function effective(){
            return 1;
        }

        var getBets=function(){
            return false;
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

    function getTypeItems(type){
        var ret;
        switch (type) {
            case '0':
                ret = '13579';
                break;
            case '1':
                ret = '02468';
                break;
            case '2':
                ret = '56789';
                break;
            case '3':
                ret = '01234';
                break;
            default:
                ret = '';
        }
        return ret;
    }

    function format_gold(gold) {
        return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
    }







});