(function(factory){

    define(
        ['jquery', 'observable', 'Chooses', 'lang',
            'business/order/3dsc/filter/sum',
            'business/order/3dsc/filter/sumTail',
            'business/order/3dsc/filter/da',
            'business/order/3dsc/filter/options',
            'JSON', 'math_extension', 'jquery.pages'],
        factory
    );

})(function($, observable, Chooses, l,
            Sum, SumTail, Da, Options){
    'use strict';

    var config = $.extend({}, Sum, SumTail, Da, Options);

    function format_gold(gold){
        return Pitaya.filter_gold(gold);
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

    var _class = function($parent, chooses){
        var ui = this;

        observable.call(ui);

        // 存放子物件
        ui._$view = $parent.find('.quick-bet');
        ui._$parent = $parent;
        ui._chooses = chooses;

        // 統計欄位
        ui.$count = $parent.find('.choose-item-cnt');

        // 快選區塊
        ui.$_area = $parent.find(".display-area").hide();

        // 加入動畫效果
        ui._$view.find('.display-ctl').on('click', function(){
            $(this).toggleClass('active');
            ui.$_area.toggle();
        });

        // 下注金額欄位
        ui._$view_inputs = ui._$view.find("input[name*='bet-i']").
            on('keyup', function(){
                var el = this;
                el.value = format_gold(el.value);
            }).
            on('change', function(){
                var el = this;
                el.value = format_gold(el.value);
            });

        // 頭 輸入欄位
        ui.$headInput = ui._$view.find("input[name*='head-i']");
        // 中 輸入欄位
        ui.$middleInput = ui._$view.find("input[name*='middle-i']");
        // 尾 輸入欄位
        ui.$tailInput = ui._$view.find("input[name*='tail-i']");
        // 和尾 輸入欄位
        ui.$tailSumInput = ui._$view.find("input[name*='sumTail-i']");
        // 和數 輸入欄位
        ui.$sumInput = ui._$view.find("input[name*='sum-i']");
        // 膽 輸入欄位
        ui.$daInput = ui._$view.find("input[name*='da-i']");

        // 頭 radio 輸入欄位
        ui.$headRadio = ui._$view.find("input[name*=head]:radio").change(function(){
            ui.$headInput.val(getTypeItems($(this).val()));
        });

        // 中 radio 輸入欄位
        ui.$middleRadio = ui._$view.find("input[name*=middle]:radio").change(function(){
            ui.$middleInput.val(getTypeItems($(this).val()));
        });

        // 尾 radio 輸入欄位
        ui.$tailRadio = ui._$view.find("input[name*=tail]:radio").change(function(){
            ui.$tailInput.val(getTypeItems($(this).val()));
        });

        // 和尾 radio 輸入欄位
        ui.$tailSumRadio = ui._$view.find("input[name*=sumTail]:radio").change(function(){
            ui.$tailSumInput.val(getTypeItems($(this).val()));
        });

        // checkbox 欄位
        ui.$checkbox = ui._$view.find('input:checkbox');

        // 選取按鈕
        ui._$view.find('.btn-quick-select').on('click', function(){
            ui.render();
        });

        // 清除按鈕
        ui._$view.find('.btn-quick-reset').on('click', function(){
            ui.reset();
            $('#btn-orders-reset').click();
        });

        ui._$view.find('.btn-quick-submit').on('click', function(){
            $('#btn-orders-submit').click();
        });

        $parent.find('.tabs-btn').on('click', function(){
            ui.reset();
            ui.$_area.toggle(false);
            ui.count();
        });

        chooses.
            register(function(odds){
                ui.count();
            }, Chooses.EVENT_ODDS_CHANGE).
            register(function(odds){
                ui.count();
            }, Chooses.EVENT_DISABLED_CHANGE);

        ui._$parent.on('change', 'input[name^=orders\\[]', function(){
            ui.count();
        });

        ui._$parent.on('diff', function(){
            ui.count();
        });

        ui.count();
    };

    _class.prototype = {
        render: function(){
            var ui = this,
                chooses = ui._chooses,
                $content;

            // 過濾條件
            var cHead, cMiddle, cTail, cTailSum, cSum, cDa, cOptions, gold;

            gold = ui._$view_inputs.val();
            cHead = ui.$headInput.val();
            cMiddle = ui.$middleInput.val();
            cTail = ui.$tailInput.val();
            cTailSum = ui.$tailSumInput.val();
            cSum = ui.$sumInput.val();
            cDa = ui.$daInput.val();
            cOptions = ui.$checkbox.filter(":checked").map(function(){
                return this.value;
            }).get();

            if (! ui.check(gold, cHead, cMiddle, cTail, cTailSum, cSum, cDa)) {
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

                $content.find('input').val('');

                $content.find('.choose-num').each(function(){
                    var $el = $(this).removeClass('active');
                    var num = $el.html();
                    var $input =  $el.next().find('input');
                    var key = $input.attr('name').match(/orders\[([^\]]+)\]/)[1];

                    // 檢查是否封牌
                    if(! chooses.isEnable(key)) {
                        return;
                    }

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
                            if (config['ST' + v].hasOwnProperty(num)) {
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
                            if (v !== '' && config.hasOwnProperty('S' + v) &&
                                config['S' + v].hasOwnProperty(num)) {
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
                            if (config['D' + v].hasOwnProperty(num)) {
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
                            isCheck = (isCheck && config[v].hasOwnProperty(num));
                        });

                        if (! isCheck) {
                            return;
                        }
                    }

                    $el.addClass('active').next().find('input').val(gold);
                });

                ui.notice(null, 'gold_change');
            }

            ui.count();
        },

        // 統計已選數量
        count: function(){
            var ui = this;
            var nums = ui._$parent.find('input[name^=orders\\[]')
                .filter(function(){
                    return this.value !== "";
                }).size();

            ui.$count.text(l.render('{%chooses%}').replace(/:nums/, nums));
        },

        // 檢查輸入值
        check: function(gold, cHead, cMiddle, cTail, cTailSum, cSum, cDa){
            var errors = [];
            var isNumber = /^\d+$/;

            if (gold === '' || ! isNumber.test(gold)) {
                errors.push(l('PleaseEnterTheAmount'));
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
                new_alert(errors.join('<br>'));
                return false;
            }

            return true;
        },

        verify: function(errors){
            return true;
        },

        gold: function(){
            return 0;
        },

        effective: function(){
            return 1;
        },

        getBets: function(){
            return false;
        },

        reset: function(){
            var ui = this;
            ui._$view.find('input:text').val('');
            ui._$view.find('input:checkbox').prop('checked', false);
            ui._$view.find('input:radio').prop('checked', false);
            ui.count();
            return true;
        },

        getInputs: function(){
            return this._$view_inputs;
        }
    };

    return function($view, chooses){
        return [new _class($view, chooses)];
    };
});
