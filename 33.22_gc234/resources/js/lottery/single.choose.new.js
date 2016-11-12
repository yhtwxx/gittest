(function(factory){

    define(
        ['jquery', 'observable', 'Chooses', 'lang', 'Sound',
            'JSON', 'math_extension', 'jquery.pages'],
        factory
    );

})(function($, observable, Chooses, l, Sound){
    'use strict';

    function format_gold(gold){
        return Pitaya.filter_gold(gold);
    }

    var _class = function($view, chooses){
        var ui = this;

        observable.call(ui);

        // 存放子物件
        ui._$view = $view;
        ui._chooses = chooses;
        ui._pages = false;

        // 金額欄位
        ui._$view_inputs = $view.find('input[name^=orders\\[]');

        $view
            .on('keyup', 'input[name^=orders\\[]', function(){
                var el = this;
                el.value = format_gold(el.value);
                ui.notice(null, 'gold_change');
            })
            .on('change', 'input[name^=orders\\[]', function(){
                var el = this;
                el.value = format_gold(el.value);
                ui.notice(null, 'gold_change');
            });

        // 分頁功能
        if ($view.find('#locate-box').length) {
            ui._pages = true;
            $view.pages({
                onchange: function($btn, $current, $previous){
                    ui._$view
                        .removeClass(function(){
                            var toReturn = '',
                                classes = this.className.split(' ');
                            for (var i = 0; i < classes.length; i ++) {
                                if (/tabs-view-(.*)/.test(classes[i])) {
                                    toReturn += classes[i] + ' ';
                                }
                            }
                            return toReturn;
                        })
                        .addClass('tabs-view-' + $btn.attr('tabs'));

                    if ($previous) {
                        ui.reset($previous);
                    }
                }
            });
        }

        // 刷新畫面
        if (chooses.isInit()) {
            ui.render($view);
        }

        chooses
            .register(function(){
                // 初始化賠率
                ui.render($view);
            }, Chooses.EVENT_INIT)

            .register(function(odds){
                // 賠率異動
                $view.find('.choose-item').each(function(){
                    var $el = $(this),
                        $input = $el.find('input[name^=orders\\[]'),
                        $odds = $el.find('.odds'),
                        key = $input.attr('name').match(/orders\[([^\]]+)\]/)[1];

                    if (odds.hasOwnProperty(key)) {
                        if (! chooses.isEnable(key) || chooses.odds(key) < 1) {
                            $odds.hide();
                            $input.attr('disabled', 'disabled').val('');
                        } else {
                            $odds.show().addClass('odds-changed').html(Pitaya.format_odds(chooses.odds(key)));
                            $input.removeAttr('disabled');
                            setTimeout(function(){
                                $odds.removeClass('odds-changed');
                            }, 5000);
                        }
                    }
                });

                ui.notice(null, 'gold_change');
            }, Chooses.EVENT_ODDS_CHANGE)

            .register(function(odds){
                // 賠率封牌
                $view.find('.choose-item').each(function(){
                    var $el = $(this),
                        $input = $el.find('input[name^=orders\\[]'),
                        $odds = $el.find('.odds'),
                        key = $input.attr('name').match(/orders\[([^\]]+)\]/)[1];

                    if (odds.hasOwnProperty(key)) {
                        if (odds[key]) {
                            $odds.hide();
                            $input.attr('disabled', 'disabled').val('');
                        } else {
                            $odds.show().html(Pitaya.format_odds(chooses.odds(key)));
                            $input.removeAttr('disabled');
                        }
                    }
                });

                ui.notice(null, 'gold_change');
            }, Chooses.EVENT_DISABLED_CHANGE);
    };

    _class.prototype = {
        verify: function(errors){
            var ui = this, ret = true;
            errors = errors || [];
            if (! ui.gold()) {
                ret = false;
                errors.push(l('PleaseEnterTheAmount'));
            }
            return ret;
        },

        gold: function(){
            var ui = this, gold = 0;
            ui._$view_inputs
                .filter(function(){
                    return this.value !== "";
                })
                .each(function(){
                    gold += (parseInt(this.value, 10) || 0);
                });
            return gold;
        },

        effective: function(){
            return this.gold() ? 1 : 0;
        },

        getBets: function(){
            var ui = this,
                chooses = ui._chooses,
                ret = {};

            ui._$view_inputs
                .filter(function(){
                    return this.value !== "";
                })
                .each(function(){
                    var key = this.name.match(/orders\[([^\]]+)\]/)[1];
                    var gold = format_gold((parseInt(this.value, 10) || 0));
                    var odds = chooses.odds(key);
                    ret[key] = JSON.stringify({
                        gold: gold,
                        odds: odds
                    });
                });
            return ret;
        },

        // 給需取得目前視圖的業務邏輯
        getView: function() {
            var ui = this;
            return (ui._$view.data('tabs-active')) ?
                ui._$view.data('tabs_data').views[ui._$view.data('tabs-active')] : ui._$view;
        },

        render: function($view){
            var ui = this,
                chooses = ui._chooses;

            $view = $view || ui._$view;

            $view.find('.choose-item').each(function(){
                var $el = $(this),
                    $input = $el.find('input[name^=orders\\[]'),
                    $odds = $el.find('.odds'),
                    key = $input.attr('name').match(/orders\[([^\]]+)\]/)[1];

                if (chooses.isEnable(key)) {
                    $odds.html(Pitaya.format_odds(chooses.odds(key)));
                    $input.removeAttr('disabled');
                } else {
                    $odds.hide();
                    $input.attr('disabled', 'disabled').val('');
                }
            });
        },

        reset: function($view){
            var ui = this;
            $view = $view || ui._$view;
            $view.find('.choose-item > input').val('');
            $view.find('.choose-num').removeClass('active');
            ui.notice(null, 'gold_change');
            return ui;
        },

        // 給快選金額用
        getInputs: function(){
            return this._$view_inputs;
        },

        // 長龍快選下注用
        focusItem: function(tag){
            var ui = this,
                $view = ui._$view;

            $view.find('input[name^=orders\\[]').each(function(){
                var key = this.name.match(/orders\[([^\]]+)\]/)[1];
                if (key === tag) {
                    var $el = $(this);
                    var $parent = $el.parent();
                    if (ui._pages) {
                        var $tab_box = $el.parents('[tabs-view]');
                        ui._$view.pages('focus', $tab_box.attr('tabs-view'));
                    }
                    $parent.addClass("longdragon-active");
                    setTimeout(function(){
                        $parent.removeClass("longdragon-active");
                    }, 10000);
                }
            });
        }
    };

    return function($view, chooses){
        return [new _class($view, chooses)];
    };
});
