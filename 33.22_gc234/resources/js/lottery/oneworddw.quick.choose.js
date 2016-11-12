$(function() {


    //循环输出
    $.ajax({url: "../ssc/itemDate.do?timeStamp=" + new Date().getTime()+"&poolId=1",type: "get",dataType: "json",
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
// ui._chooses = chooses;

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

// 快速下注
    $("#order-box").on('click', 'span[type]', function () {
        var $el = $(this), gold = $("#Gold").val(), $content;

        function isPrime(n) {
            if (n < 2) return false;
            var q = Math.sqrt(n);
            for (var i = 2; i <= q; i++) {
                if (n % i == 0) {
                    return false;
                }
            }
            return true;
        }

        var Filter = {
            'odd': function (num) {
                return (num % 2 !== 0);
            },
            'even': function (num) {
                return (num % 2 === 0);
            },
            'over': function (num) {
                return (num > 4);
            },
            'under': function (num) {
                return (num < 5);
            },
            'prime': function (num) {
                return (isPrime(num) || num === '1');
            },
            'compo': function (num) {
                return !(isPrime(num) || num === '1');
            }
        };

        if (gold > 0) {
            $el.siblings('span[type]').removeClass('active');
            var type = $el.addClass('active').attr('type');

            //替代上面代码
            var tabs_view = $("#tabs").find(".active").attr("tabs");
            var this_tabs = 'tabs-view='+tabs_view;
            if (Filter.hasOwnProperty(type)) {
                var allGold = 0;
                $("table["+this_tabs+"]").find('.choose-num').each(function () {
                    var $num = $(this).removeClass('active');
                    var num = $num.html();
                    var $input = $num.next().find('input');
                    if (Filter[type](num)) {
                        $input.val(gold);
                        allGold += format_gold(gold);
                        $num.addClass('active');
                    } else {
                        $input.val('');
                    }
                });
                $("#BetGold").text(allGold);
            }


        } else {
            parent.Showbo.Msg.alert('请输入金额！')
            $("#Gold").focus();
        }
    });

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