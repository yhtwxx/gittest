
    function format_gold(gold) {
        return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
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

    var ui = this;
    var $parent = $(".game-box");
    // 存放子物件
    var $view = $parent;
    var  $gold_total = $('#BetGold');
    var  _$parent = $parent;

    // 選取資料
    ui.select = {};
    ui.selected = 0;
    ui._odds = 0;


    //替代上面代码
    var tabs_view = $("#tabs").find(".active").attr("tabs");
    var this_tabs = 'tabs-view='+tabs_view;



    // 賠率欄位
    ui._$view_odds = $("table["+this_tabs+"]").find('.odds');
    // 選取資訊
    ui._$view_info = $("table["+this_tabs+"]").find('.display-bets-info');
    ui._$bet_gold = $("table["+this_tabs+"]").find('.bet-gold');

  //替代上面代码
    var tabs_view1 = 1;
    var this_tabs1 = 'tabs-view=1';
    var tabs_view2 = 2;
    var this_tabs2 = 'tabs-view=2';
    var tabs_view3 = 3;
    var this_tabs3 = 'tabs-view=3';


    // 賠率欄位
    ui._$view_odds1 = $("table["+this_tabs1+"]").find('.odds');
    ui._$view_odds2 = $("table["+this_tabs2+"]").find('.odds');
    ui._$view_odds3 = $("table["+this_tabs3+"]").find('.odds');
    // 選取資訊
    ui._$view_info1 = $("table["+this_tabs1+"]").find('.display-bets-info');
    ui._$bet_gold1 = $("table["+this_tabs1+"]").find('.bet-gold');
    ui._$view_info2 = $("table["+this_tabs2+"]").find('.display-bets-info');
    ui._$bet_gold2 = $("table["+this_tabs2+"]").find('.bet-gold');
    ui._$view_info3 = $("table["+this_tabs3+"]").find('.display-bets-info');
    ui._$bet_gold3 = $("table["+this_tabs3+"]").find('.bet-gold');
    
    ui._$bet_gold2 = $("table[tabs-view=2]").find('.bet-gold');
    ui._$bet_gold3 = $("table[tabs-view=3]").find('.bet-gold');

    // 下注金额栏位
    ui._$view_inputs = ui._$bet_gold.
        on('keyup', function () {
            var el = this;
            el.value = format_gold(el.value);
            $("#BetGold").html(el.value);
            console.log(el.value);
        }).
        on('change', function () {
            var el = this;
            el.value = format_gold(el.value);
            $("#BetGold").html(el.value);
            console.log(el.value);
        });
 // 下注金额栏位
    ui._$view_inputs = ui._$bet_gold2.
        on('keyup', function () {
            var el = this;
            el.value = format_gold(el.value);
            $("#BetGold").html(el.value);
            console.log(el.value);
        }).
        on('change', function () {
            var el = this;
            el.value = format_gold(el.value);
            $("#BetGold").html(el.value);
            console.log(el.value);
        });
 // 下注金额栏位
    ui._$view_inputs = ui._$bet_gold3.
        on('keyup', function () {
            var el = this;
            el.value = format_gold(el.value);
            $("#BetGold").html(el.value);
            console.log(el.value);
        }).
        on('change', function () {
            var el = this;
            el.value = format_gold(el.value);
            $("#BetGold").html(el.value);
            console.log(el.value);
        });


    $("table["+this_tabs1+"]").find('.choose-item').each(function(){
            var $el = $(this), num = $el.attr('num');
            $el.on('click', function(){
                
                var $el = $(this), num = $el.attr('num');
                if (ui.select.hasOwnProperty(num)) {
                    delete ui.select[num];
                } else {
                    ui.select[num] = true;
                }
                
                render1(tabs_view1);
                $el.toggleClass('active');
            });
        });
    
    $("table["+this_tabs2+"]").find('.choose-item').each(function(){
        var $el = $(this), num = $el.attr('num');
        $el.on('click', function(){
            
            var $el = $(this), num = $el.attr('num');
            if (ui.select.hasOwnProperty(num)) {
                delete ui.select[num];
            } else {
                ui.select[num] = true;
            }
            
            render1(tabs_view2);
            $el.toggleClass('active');
        });
    });
    
    $("table["+this_tabs3+"]").find('.choose-item').each(function(){
        var $el = $(this), num = $el.attr('num');
        $el.on('click', function(){
            
            var $el = $(this), num = $el.attr('num');
            if (ui.select.hasOwnProperty(num)) {
                delete ui.select[num];
            } else {
                ui.select[num] = true;
            }
            
            render1(tabs_view3);
            $el.toggleClass('active');
        });
    });


    var allGold = 0;
/*    $("table["+this_tabs+"]").find('.choose-num').each(function(i) {

        var $el = $(this).removeClass('active');
        var num = $el.html();

    })*/


        // 全選

    $('.btn-all-in').on('click', function(){
        var tabs_view = $("#tabs").find(".active").attr("tabs");
        var this_tabs = 'tabs-view='+tabs_view;
        var $s =  $("table["+this_tabs+"]").find('.choose-item');
        $.each($s, function(num, $el){
                ui.select[num] = true;
              $(this).addClass('active');
        });
        render1(tabs_view);

        });
    
    


      var  render =  function(){
            var ui = this

            var data = makeArray(ui.select);
            var nums = data.length;
            var itemcode;
            var itemNo;
            var sumOfOdds = 0, odds = 0, cnt = 0, info = '', bets;

            if (nums > 4) {
                bets = C(data, 2);
                cnt = bets.length;
                // 获取赔率
                odds = config_group3[tabs_view][nums].dds;
                info = ' (:nums)'.replace(/:nums/, data.join(','));
                itemNo = data.join(',');
                itemcode = config_group3[tabs_view][nums].itemCode;
            }

            ui._$view_odds.text(odds);
            ui._$view_info.text(nums + info);
            ui._$bet_gold.attr("data-itemcode",itemcode);
            ui._$bet_gold.attr("data-itemno",itemNo);

            // 更新資料
            ui.odds(odds);
            ui.selected = nums;
        },

        gold=function(){
            return parseInt(this._$view_inputs.val(), 10) || 0;
        },

        odds= function(odds) {
            var ui = this;
            if(odds >= 0) {
                ui._odds = odds;
            }
            return ui._odds;
        },

        effective= function(){
            var ui = this;
            if (! ui.gold()) {
                return 0;
            }
            return 1;
        },

        getBets=function(){
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

        reset= function(){
            var ui = this, items = ui.items;

            $(".choose-item").removeClass('active');
            $(".choose-item").removeClass("selected-bet");
            ui.select = {};
            ui.selected = 0;
            ui._$view_inputs.val('');
            ui._$view_odds.text('0');
            ui._$view_info.text(0);
            ui.odds(0);
            $("#BetGold").html("0");
            $(".bet-gold").val("");
            //ui.notice(null, 'gold_change');
            return ui;
        },

        // 給快選金額用
        getInputs= function(){
            return this._$view_inputs;
        };
