$(function() {

    //循环输出
    $.ajax({url: "../ssc/itemDate.do?timeStamp=" + new Date().getTime()+"&poolId=2",type: "get",dataType: "json",
        success: function(b) {
            if(0 == b.code){
                var html1 = tpl('#contentTpl1', b);
                $("#content1").html(html1);
                var html2 = tpl('#contentTpl2', b);
                $("#content2").html(html2);
                var html3 = tpl('#contentTpl3', b);
                $("#content3").html(html3);
                var html4 = tpl('#contentTpl4', b);
                $("#content4").html(html4);
                var html5 = tpl('#contentTpl5', b);
                $("#content5").html(html5);
                var html6 = tpl('#contentTpl6', b);
                $("#content6").html(html6);
                var html7 = tpl('#contentTpl7', b);
                $("#content7").html(html7);
                var html8 = tpl('#contentTpl8', b);
                $("#content8").html(html8);
                var html9 = tpl('#contentTpl9', b);
                $("#content9").html(html9);
                var html10 = tpl('#contentTpl10', b);
                $("#content10").html(html10);
            }else{
                parent.Showbo.Msg.alert('请登录！')
                window.location.href=ctx+"logout.do";
            }
        }})

    function compose(){
        var dimensions = [], results = [],
            index, max;

        function explore(curDim, prefix){
            var nextDim = dimensions.shift();
            for (var i = 0; i < curDim.length; i ++) {
                if (nextDim) {
                    explore(nextDim, prefix + curDim[i]);
                } else {
                    results.push(prefix + curDim[i]);
                }
            }
            nextDim && dimensions.push(nextDim);
        }

        for (index = 0, max = arguments.length; index < max; ++ index) {
            dimensions.push(arguments[index]);
        }

        explore(dimensions.shift(), "");
        return results;
    }


    var ui = this;
    $parent = $(".game-box");
// 存放子物件
    ui._$view = $parent.find('.quick-bet');
    $gold_total = $('#BetGold');
    ui._$parent = $parent;

// 下注金额栏位
    ui._$view_inputs = ui._$view.find('input').


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



    ui._$view.find('.quick-bet-h, .quick-bet-t').on('click', 'span[type]', function(){
        if ( $("#Gold").val() > 0) {
            $(this).toggleClass('active');
            render();
        } else {
            parent.Showbo.Msg.alert('请输入金额！')
            $("#Gold").focus();
        }
    });



   var render= function(){
       var  $parent = $(".game-box");
// 存放子物件
       var ui = this,
           chooses = ui._chooses,
           head = [],
           tail = [],
           $content;
       var _$view = $parent.find('.quick-bet');
        var $gold_total = $('#BetGold');



        var gold = $("#Gold").val();

        if ($parent.data('tabs-active')) {
            $content =$parent.data('tabs_data').views[$parent.data('tabs-active')];
        } else {
            $content = $parent;
        }
       //替代上面代码
       var tabs_view = $("#tabs").find(".active").attr("tabs");
       var this_tabs = 'tabs-view='+tabs_view;
       $content =  $("table["+this_tabs+"]");
        _$view.find('span[type]').filter('.active').each(function(){
            var $el = $(this);
            switch ($el.attr('type')) {
                case 'h':
                    head.push($el.html());
                    break;
                case 't':
                    tail.push($el.html());
                    break;
                default:
            }
        });
       $("#locate-box").find('input').val('');
        $content.find('.choose-num').removeClass('active');
       var allGold = 0;
        if (head.length > 0 && tail.length > 0) {
            var cps = toJSON(compose(head, tail));
            $content.find('.choose-num').each(function(){
                var $el = $(this),
                    num = $el.html().replace(/X/, ''),
                    $input = $el.next().find('input');
                if (cps.hasOwnProperty(num)) {
                    $el.addClass('active');
                    $input.val(gold);
                    allGold += format_gold(gold);
                }
            });
        } else if (head.length > 0) {
            $.each(head, function(k, v){
                $content.find('.choose-num').each(function(){
                    var $el = $(this);
                    var $input =  $el.next().find('input');

                    if ($el.html().replace(/X/, '').charAt(0) === v) {
                        $el.addClass('active');
                        $input.val(gold);
                        allGold += format_gold(gold);
                    }
                });
            });
        } else if (tail.length > 0) {
            $.each(tail, function(k, v){
                $content.find('.choose-num').each(function(){
                    var $el = $(this);
                    var $input =  $el.next().find('input');

                    if ( $el.html().replace(/X/, '').charAt(1) === v) {
                        $el.addClass('active');
                        $input.val(gold);
                        allGold += format_gold(gold);
                    }
                });
            });
        }
       $gold_total.text(allGold);
       // ui.notice(null, 'gold_change');
        //ui.count();
    };


    function format_gold(gold) {
        return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
    }

    var isEnable = function (choose) {

        var chooses = this,
            item = chooses.get(choose);

        return item && !item.disable() &&
            is_effective_odds(item.odds());
    }


});