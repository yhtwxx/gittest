(function(factory){

    define(
        ['jquery', 'observable', 'Chooses', 'lang', 'JSON', 'math_extension', 'jquery.pages'],
        factory
    );

})(function($, observable, Chooses, l){
    'use strict';

    function format_gold(gold){
        return Pitaya.filter_gold(gold);
    }

    function makeArray(obj){
        var ret = [];
        $.each(obj, function(k, v){
            ret.push(k);
        });
        ret.sort();
        return ret;
    }

    function C(arr, num){
        var r = [];
        (function f(t, a, n){
            if (n == 0) {
                return r.push(t);
            }
            for (var i = 0, l = a.length; i <= l - n; i ++) {
                f(t.concat(a[i]), a.slice(i + 1), n - 1);
            }
        })([], arr, num);
        return r;
    }

    var _class = function($view, chooses){
        var ui = this;

        observable.call(ui);

        // 存放子物件
        ui._$view = $view;
        ui._chooses = chooses;
        ui.items = {};

        // 選取資料
        ui.select = {};
        ui.selected = 0;
        ui._odds = 0;

        // 分頁功能
        ui.tabs = {};
        ui.range = '';

        $view.find('[tabs]').each(function(){
            var $tab = $(this).addClass('tabs-btn');
            ui.tabs[$tab.attr('tabs')] = $tab;
        }).on('click', function(){
            var $tab = $(this);
            var tab = $tab.attr('tabs');

            $.each(ui.tabs, function(k, $el){
                (k === tab) ? $el.addClass('active') : $el.removeClass('active');
            });

            switch (tab) {
                case '1':
                    ui.range = '1:2:3';
                    break;
                case '2':
                    ui.range = '2:3:4';
                    break;
                case '3':
                    ui.range = '3:4:5';
                    break;
                default:
                    ui.range = '';
            }
        });

        ui.tabs[1].click();

        // 金額欄位
        ui._$view_inputs = $view.find('.bet-gold').
            on('keyup', function(){
                var $input = $(this);
                $input.val(format_gold($input.val()));
                ui.notice(null, 'gold_change');
            }).
            on('change', function(){
                var $input = $(this);
                $input.val(format_gold($input.val()));
                ui.notice(null, 'gold_change');
            });

        // 賠率欄位
        ui._$view_odds = $view.find('.odds');
        // 選取資訊
        ui._$view_info = $view.find('.display-bets-info');

        $view.find('.choose-item').each(function(){
            var $el = $(this), num = $el.attr('num');

            ui.items[num] = $el;

            $el.on('click', function(){
                var $el = $(this), num = $el.attr('num');
                if (ui.select.hasOwnProperty(num)) {
                    delete ui.select[num];
                } else {
                    ui.select[num] = true;
                }
                $el.toggleClass('active');
                ui.render();
            });
        });

        // 全選
        $view.find('.btn-all-in').on('click', function(){
            $.each(ui.items, function(num, $el){
                ui.select[num] = true;
                $el.addClass('active');
            });
            ui.render();
        });

        // 分頁切換
        $view.find('.tabs-btn').on('click', function(){
            ui.reset();
        });

        // 按鈕取消
        $view.find('#btn-orders-reset').on('click', function(){
            ui.reset();
        });
    };

    _class.prototype = {
        render: function(){
            var ui = this,
                type = ':GROUP:3:RANGE:' + ui.range;

            var data = makeArray(ui.select);
            var nums = data.length;
            var sumOfOdds = 0, odds = 0, cnt = 0, info = '', bets;

            if (nums > 4) {
                bets = C(data, 2);
                cnt = bets.length;

                $.each(bets, function(k, v){
                    var item_key = v.join('') + type;
                    // 取得各賠率加總
                    sumOfOdds += parseFloat(ui._chooses.odds(item_key), 10);
                });

                // 計算平均賠率
                odds = Pitaya.format_odds(sumOfOdds / Math.pow(cnt, 2));
                info = ' (:nums)'.replace(/:nums/, data.join(','));
            }

            ui._$view_odds.text(odds);
            ui._$view_info.text(nums + info);

            // 更新資料
            ui.odds(odds);
            ui.selected = nums;
        },

        verify: function(errors){
            var ui = this,
                ret = true;

            errors = errors || [];

            if (! ui.gold()) {
                ret = false;
                errors.push(l('PleaseEnterTheAmount'));
            }

            if (ui.selected < 5) {
                ret = false;
                errors.push(l('PleaseEnterEnoughNums'));
            }

            if (ui.odds() < 1) {
                ret = false;
                errors.push(l('PleaseCheckTheOdds'));
            }

            return ret;
        },

        gold: function(){
            return parseInt(this._$view_inputs.val(), 10) || 0;
        },

        odds: function(odds) {
            var ui = this;
            if(odds >= 0) {
                ui._odds = odds;
            }
            return ui._odds;
        },

        effective: function(){
            var ui = this;
            if (! ui.gold()) {
                return 0;
            }
            return 1;
        },

        getBets: function(){
            var ret = {};
            if (this.range) {
                var odds = {};
                var type = 'GROUP:3:RANGE:' + this.range;
                odds[type] = this.odds();

                ret[type] = JSON.stringify({
                    num: makeArray(this.select),
                    gold: this.gold(),
                    odds: odds
                });
            } else {
                throw 'range is not definded';
            }
            return ret;
        },

        reset: function(){
            var ui = this, items = ui.items;

            $.each(items, function(num, $el){
                $el.removeClass('active disabled');
            });

            ui.select = {};
            ui.selected = 0;
            ui._$view_inputs.val('');
            ui._$view_odds.text('0');
            ui._$view_info.text(0);
            ui.odds(0);

            ui.notice(null, 'gold_change');
            return ui;
        },

        // 給快選金額用
        getInputs: function(){
            return this._$view_inputs;
        }
    };

    return function($view, chooses){
        return [new _class($view, chooses)];
    };
});
