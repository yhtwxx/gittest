<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="order-box" class="order-box-oneword game-state-opening">

	<!--砝码快选-->
	<jsp:include page="../lottoBet.jsp" />

	<div id="orders">
		<!-- javascript app 使用 -->

		<div class="game-box" style="display: block;">
			<div class="tabs-box tabs-view-4">
				<div class="tabs">
					<span class="choose-item-cnt">已选取：0笔</span>
					<ul id="tabs">
						<li tabs="1" class="tabs-btn active"><a>前三</a></li>
						<li tabs="2" class="tabs-btn"><a>中三</a></li>
						<li tabs="3" class="tabs-btn"><a>后三</a></li>
					</ul>
				</div>

				<div class="quick-bet">
					<div class="display-ctl active">
						<span class="menu-icon"></span> <span class="display-ctl-title">快选</span>
						<span class="up-and-down"></span>
					</div>
					<table class="display-area" style="display: none;">
						<tbody>
							<tr>
								<td><span>头</span></td>
								<td><input type="text" name="head-i"></td>
								<td><span>大</span> <input type="radio" name="head"
									value="2"></td>
								<td><span>小</span> <input type="radio" name="head"
									value="3"></td>
								<td><span>单</span> <input type="radio" name="head"
									value="0"></td>
								<td><span>双</span> <input type="radio" name="head"
									value="1"></td>
							</tr>
							<tr>
								<td><span>中</span></td>
								<td><input type="text" name="middle-i"></td>
								<td><span>大</span> <input type="radio" name="middle"
									value="2"></td>
								<td><span>小</span> <input type="radio" name="middle"
									value="3"></td>
								<td><span>单</span> <input type="radio" name="middle"
									value="0"></td>
								<td><span>双</span> <input type="radio" name="middle"
									value="1"></td>
							</tr>
							<tr>
								<td><span>尾</span></td>
								<td><input type="text" name="tail-i"></td>
								<td><span>大</span> <input type="radio" name="tail"
									value="2"></td>
								<td><span>小</span> <input type="radio" name="tail"
									value="3"></td>
								<td><span>单</span> <input type="radio" name="tail"
									value="0"></td>
								<td><span>双</span> <input type="radio" name="tail"
									value="1"></td>
							</tr>
							<tr>
								<td><span>和尾数</span></td>
								<td><input type="text" name="sumTail-i"></td>
								<td><span>大</span> <input type="radio" name="sumTail"
									value="2"></td>
								<td><span>小</span> <input type="radio" name="sumTail"
									value="3"></td>
								<td><span>单</span> <input type="radio" name="sumTail"
									value="0"></td>
								<td><span>双</span> <input type="radio" name="sumTail"
									value="1"></td>
							</tr>
							<tr>
								<td colspan="3"><span>和数值</span> <input type="text"
									name="sum-i"> <span>（0~27, 以逗号作分隔，不能空格）</span></td>
								<td colspan="3"><span>胆</span> <input type="text"
									name="da-i"></td>
							</tr>
							<tr class="check-box-group">
								<td colspan="6">
									<div>
										<label for="odd-sum"><span></span>和单</label>
										<input type="checkbox" name="options" value="0" id="odd-sum">
									</div>
									<div>
										<label for="even-sum"><span></span>和双</label>
										<input type="checkbox" name="options" value="1" id="even-sum">
									</div>
									<div>
										<label for="over-sum"><span></span>和值大</label>
										<input type="checkbox" name="options" value="16" id="over-sum">
									</div>
									<div>
										<label for="under-sum"><span></span>和值小</label>
										<input type="checkbox" name="options" value="17"id="under-sum">
									</div>
									<div>
										<label for="jump"><span></span>跳号</label>
										<input type="checkbox" name="options" value="14" id="jump">
									</div>
									<div>
										<label for="triple-1"><span></span>豹子</label>
										<input type="checkbox" name="options" value="15" id="triple-1">
									</div>
									<div>
										<label for="group-3"><span></span>组三</label>
										<input type="checkbox" name="options" value="12" id="group-3">
									</div>
									<div>
										<label for="group-6"><span></span>组六</label>
										<input type="checkbox" name="options" value="13" id="group-6">
									</div>
									<div>
										<label for="all-odd"> <span></span>全单</label>
										<input type="checkbox" name="options" value="4" id="all-odd">
									</div>
									<div>
										<label for="all-even"><span></span>全双</label>
										<input type="checkbox" name="options" value="5" id="all-even">
									</div>
									<div>
										<label for="odd-2"><span></span>2单1双</label>
										<input type="checkbox" name="options" value="20" id="odd-2">
									</div>
									<div>
										<label for="odd-1"><span></span>2双1单</label>
										<input type="checkbox" name="options" value="21" id="odd-1">
									</div>
									<div>
										<label for="all-over"><span></span>全大</label>
										<input type="checkbox" name="options" value="6" id="all-over">
									</div>
									<div>
										<label for="all-under"><span></span>全小</label>
										<input type="checkbox" name="options" value="7" id="all-under">
									</div>
									<div>
										<label for="over-2-under"><span></span>2大1小</label>
										<input type="checkbox" name="options" value="18" id="over-2-under">
									</div>
									<div>
										<label for="over-1-under"><span></span>2小1大</label>
										<input type="checkbox" name="options" value="19" id="over-1-under">
									</div>
									<div>
										<label for="with-prime"><span></span>含质数</label>
										<input type="checkbox" name="options" value="35" id="with-prime">
									</div>
									<div>
										<label for="without-prime"><span></span>不含质数</label>
										<input type="checkbox" name="options" value="36" id="without-prime">
									</div>
									<div>
										<label for="sum-odd"><span></span>单点</label>
										<input type="checkbox" name="options" value="37" id="sum-odd">
									</div>
									<div>
										<label for="sum-even"><span></span>双点</label>
										<input type="checkbox" name="options" value="38" id="sum-even">
									</div>
									<div>
										<label for="straight"><span></span>三连号</label>
										<input type="checkbox" name="options" value="8" id="straight">
									</div>
									<div>
										<label for="half-straight"><span></span>半连号</label>
										<input type="checkbox" name="options" value="9" id="half-straight">
									</div>
									<div>
										<label for="multi-no"><span></span>连号</label>
										<input type="checkbox" name="options" value="10" id="multi-no">
									</div>
									<div>
										<label for="non-multi-no"><span></span>不连号</label>
										<input type="checkbox" name="options" value="11" id="non-multi-no">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2"><span>余数A</span> <input type="checkbox"
									name="options" value="22"></td>
								<td colspan="2"><span>余数B</span> <input type="checkbox"
									name="options" value="23"></td>
								<td colspan="2"><span>余数C</span> <input type="checkbox"
									name="options" value="24"></td>
							</tr>
							<tr>
								<td><span>二次和尾</span></td>
								<td><span>0</span> <input type="checkbox" name="options"
									value="25"></td>
								<td><span>2</span> <input type="checkbox" name="options"
									value="26"></td>
								<td><span>4</span> <input type="checkbox" name="options"
									value="27"></td>
								<td><span>6</span> <input type="checkbox" name="options"
									value="28"></td>
								<td><span>8</span> <input type="checkbox" name="options"
									value="29"></td>
							</tr>
							<tr>
								<td><span>二次差尾</span></td>
								<td><span>0</span> <input type="checkbox" name="options"
									value="30"></td>
								<td><span>2</span> <input type="checkbox" name="options"
									value="31"></td>
								<td><span>4</span> <input type="checkbox" name="options"
									value="32"></td>
								<td><span>6</span> <input type="checkbox" name="options"
									value="33"></td>
								<td><span>8</span> <input type="checkbox" name="options"
									value="34"></td>
							</tr>
							<tr>
								<td colspan="6"><!-- <span>下注金额：<input type="text"
										name="bet-i" id="Gold" class="itemCode1"></span> -->
									<button class="btn-quick-select">选取</button>
									<button class="btn-quick-reset">清除</button>
									<button class="btn-quick-submit">确认</button></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div id="locate-box">
					<table class="order-table tabs-view active" tabs-view="1"
						style="display: table;">
						<thead>
							<tr>
								<th>号码</th>
								<th>金额</th>
								<th>号码</th>
								<th>金额</th>
								<th>号码</th>
								<th>金额</th>
								<th>号码</th>
								<th>金额</th>
							</tr>
						</thead>
						<tbody id="content1">

						</tbody>

					</table>
					<table class="order-table tabs-view active" tabs-view="2"
						style="display: none;">
						<thead>
							<tr>
								<th>号码</th>
								<th>金额</th>
								<th>号码</th>
								<th>金额</th>
								<th>号码</th>
								<th>金额</th>
								<th>号码</th>
								<th>金额</th>
							</tr>
						</thead>
						<tbody id="content2">

						</tbody>
					</table>
					<table class="order-table tabs-view active" tabs-view="3"
						style="display: none;">
						<thead>
							<tr>
								<th>号码</th>
								<th>金额</th>
								<th>号码</th>
								<th>金额</th>
								<th>号码</th>
								<th>金额</th>
								<th>号码</th>
								<th>金额</th>
							</tr>
						</thead>
						<tbody id="content3">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div id="order-info">
		<div class="inner">
			<span>下注金额:<span id="BetGold">0</span></span>
			<!-- IE 8,9 瀏覽器BUG 在INPUT上按ENTER會被FOCUS到BTN物件觸發CLICK事件 (加上type="reset" 可以避開) -->
			<button type="reset" id="btn-orders-reset" class="btn-cancel"
				onclick="reset()">取消</button>
			<button id="btn-orders-submit" class="btn-submit">确认</button>
		</div>
	</div>
	<jsp:include page="lz.jsp"></jsp:include>
</div>

<script type="text/template" id="contentTpl1">
    <tr>
        <# for(var i=11051; i<12051; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i-2)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl2">
    <tr>
        <# for(var i=12051; i<13051; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i-2)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script type="text/template" id="contentTpl3">
    <tr>
        <# for(var i=13051; i<14051; i++) { #>
        <td class="choose-num"><#=items_map[i].displayNo#></td>
        <td class="choose-item">
            <span class="odds"><#=items_map[i].odds#></span>
            <input type="text"  class="itemCode" value=""  name="itemCode[]" data-itemcode="<#=items_map[i].itemCode#>">
        </td>
        <# if((i-2)%4==0){ #>
    </tr><tr>
        <#}#>
            <#}#>
    </tr>
</script>

<script src="${ctx}/js/lib/tpl.js"></script>
<script src="${ctx}/js/lib/countdown.js"></script>
<script src="${ctx}/js/lottery/shssc/mem_order_shssc.js"></script>
<script src="${ctx}/js/lottery/da.js"></script>
<script src="${ctx}/js/lottery/sumTail.js"></script>
<script src="${ctx}/js/lottery/sum.js"></script>
<script src="${ctx}/js/lottery/options.js"></script>

<script>
$(function() {
    //循环输出
    $.ajax({url: "${ctx}/shssc/itemDate.do?timeStamp=" + new Date().getTime()+"&poolId=3",type: "get",dataType: "json",
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
    ui._$view_inputs = $("#kuaijiexiaju_input").
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

        gold =  $("#kuaijiexiaju_input").val();
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
</script>
