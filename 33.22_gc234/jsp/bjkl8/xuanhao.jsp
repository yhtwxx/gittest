<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>黄金世纪</title>
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
    <!--本页css-->
    <link rel="stylesheet" href="${ctx}/css/lottery/ssc.css" />
    <link rel="stylesheet" href="${ctx}/css/lottery/View.css" />
    <style>.btn-choose-group .odds-box{display: none;}</style>
</head>

<body>

<div class="caicontainer">

    <div class="caicontent" style="width:100%">

        <div class="cqsc">
            <div id="order-box" class="order-box-oneword game-state-opening">

                <!--砝码快选-->
                <jsp:include page="../lottery/gc/lottoBet.jsp" />

                <div id="orders" class="GENERAL" style="display: block;">
                    <!-- javascript app 使用 -->
                    <div class="game-box multi-order" style="display: block;">
                        <div id="button-block">
                            <div class="btn-choose-group CHOOSE-5 active" group="5" itemCode="50001">
                                <table class="choose-group-table">
                                    <tbody><tr>
                                        <td class="choose-group-name">
                                            选5                </td>
                                        <td class="odds-box">
                                            <table>
                                                <tbody><tr class="odds-item">
                                                    <td style="display: table-cell;">
                                                        中5                                <span class="odds" choose="CHOOSE:5:MATCH:5" style="display: inline;" id="odds_50001_1"></span>
                                                    </td>
                                                </tr>
                                                <tr class="odds-item">
                                                    <td style="display: table-cell;">
                                                        中4                                <span class="odds" choose="CHOOSE:5:MATCH:4" style="display: inline;" id="odds_50001_2"></span>
                                                    </td>
                                                </tr>
                                                <tr class="odds-item">
                                                    <td style="display: table-cell;">
                                                        中3                                <span class="odds" choose="CHOOSE:5:MATCH:3" style="display: inline;" id="odds_50001_3"></span>
                                                    </td>
                                                </tr>

                                                </tbody></table>
                                        </td>
                                    </tr>
                                    </tbody></table>
                            </div>

                            <div class="btn-choose-group CHOOSE-4" group="4" itemCode="50002">
                                <table class="choose-group-table">
                                    <tbody><tr>
                                        <td class="choose-group-name">
                                            选4                </td>
                                        <td class="odds-box">
                                            <table>
                                                <tbody><tr class="odds-item">
                                                    <td style="display: table-cell;">
                                                        中4                                <span class="odds" choose="CHOOSE:4:MATCH:4" id="odds_50002_1"></span>
                                                    </td>
                                                </tr>
                                                <tr class="odds-item">
                                                    <td style="display: table-cell;">
                                                        中3                                <span class="odds" choose="CHOOSE:4:MATCH:3" id="odds_50002_2"></span>
                                                    </td>
                                                </tr>
                                                <tr class="odds-item">
                                                    <td style="display: table-cell;">
                                                        中2                                <span class="odds" choose="CHOOSE:4:MATCH:2" id="odds_50002_3"></span>
                                                    </td>
                                                </tr>

                                                </tbody></table>
                                        </td>
                                    </tr>
                                    </tbody></table>
                            </div>

                            <div class="btn-choose-group CHOOSE-3" group="3" itemCode="50003">
                                <table class="choose-group-table">
                                    <tbody><tr>
                                        <td class="choose-group-name">
                                            选3                </td>
                                        <td class="odds-box">
                                            <table>
                                                <tbody><tr class="odds-item">
                                                    <td style="display: table-cell;">
                                                        中3                                <span class="odds" choose="CHOOSE:3:MATCH:3" id="odds_50003_1"></span>
                                                    </td>
                                                </tr>
                                                <tr class="odds-item">
                                                    <td style="display: table-cell;">
                                                        中2                                <span class="odds" choose="CHOOSE:3:MATCH:2" id="odds_50003_2"></span>
                                                    </td>
                                                </tr>

                                                </tbody></table>
                                        </td>
                                    </tr>
                                    </tbody></table>
                            </div>

                            <div class="btn-choose-group CHOOSE-2" group="2" itemCode="50004">
                                <table class="choose-group-table">
                                    <tbody><tr>
                                        <td class="choose-group-name">
                                            选2                </td>
                                        <td class="odds-box">
                                            <table>
                                                <tbody><tr class="odds-item">
                                                    <td style="display: table-cell;">
                                                        中2                                <span class="odds" choose="CHOOSE:2:MATCH:2" id="odds_50004_1"></span>
                                                    </td>
                                                </tr>

                                                </tbody></table>
                                        </td>
                                    </tr>
                                    </tbody></table>
                            </div>

                            <div class="btn-choose-group CHOOSE-1" group="1" itemCode="50005">
                                <table class="choose-group-table">
                                    <tbody><tr>
                                        <td class="choose-group-name">
                                            选1                </td>
                                        <td class="odds-box">
                                                    <span class="odds-item" style="display: inline;">
                                                        中1                        <span class="odds" choose="CHOOSE:1:MATCH:1" id="odds_50005_1"></span>
                                                    </span>
                                        </td>
                                    </tr>
                                    </tbody></table>
                            </div>
                        </div>

                        <div class="ball-bg">
                            <div id="balls-block">
                                <span class="ball">1</span><span class="ball">2</span><span class="ball">3</span><span class="ball">4</span><span class="ball">5</span><span class="ball">6</span><span class="ball">7</span><span class="ball">8</span><span class="ball">9</span><span class="ball">10</span><span class="ball">11</span><span class="ball">12</span><span class="ball">13</span><span class="ball">14</span><span class="ball">15</span><span class="ball">16</span><span class="ball">17</span><span class="ball">18</span><span class="ball">19</span><span class="ball">20</span><span class="ball">21</span><span class="ball">22</span><span class="ball">23</span><span class="ball">24</span><span class="ball">25</span><span class="ball">26</span><span class="ball">27</span><span class="ball">28</span><span class="ball">29</span><span class="ball">30</span><span class="ball">31</span><span class="ball">32</span><span class="ball">33</span><span class="ball">34</span><span class="ball">35</span><span class="ball">36</span><span class="ball">37</span><span class="ball">38</span><span class="ball">39</span><span class="ball">40</span><hr><span class="ball">41</span><span class="ball">42</span><span class="ball">43</span><span class="ball">44</span><span class="ball">45</span><span class="ball">46</span><span class="ball">47</span><span class="ball">48</span><span class="ball">49</span><span class="ball">50</span><span class="ball">51</span><span class="ball">52</span><span class="ball">53</span><span class="ball">54</span><span class="ball">55</span><span class="ball">56</span><span class="ball">57</span><span class="ball">58</span><span class="ball">59</span><span class="ball">60</span><span class="ball">61</span><span class="ball">62</span><span class="ball">63</span><span class="ball">64</span><span class="ball">65</span><span class="ball">66</span><span class="ball">67</span><span class="ball">68</span><span class="ball">69</span><span class="ball">70</span><span class="ball">71</span><span class="ball">72</span><span class="ball">73</span><span class="ball">74</span><span class="ball">75</span><span class="ball">76</span><span class="ball">77</span><span class="ball">78</span><span class="ball">79</span><span class="ball">80</span>
                            </div>
                            <label>
                                每注金額
                                <input type="text" class="itemCode" value="" name="itemCode[]" data-itemcode="50001"  data-itemNo="">
                                有效投注數
                                <span class="display-bets-count">0</span>
                            </label>
                        </div><div class="clear"></div>
                        <div class="display-bets" style="display: none;"></div>
                        <div class="chk-show-bets  checked" style="display: none;">
                            顯示包牌組合</div>
                        <div class="clear"></div>
                    </div>
                </div>

                <div id="order-info">
                    <div class="inner">
                        <span>下注金额:<span id="BetGold">0</span></span>
                        <!-- IE 8,9 瀏覽器BUG 在INPUT上按ENTER會被FOCUS到BTN物件觸發CLICK事件 (加上type="reset" 可以避開) -->
                        <button type="reset" id="btn-orders-reset" class="btn-cancel" onclick="reset()">取消</button>
                        <button id="btn-orders-submit" class="btn-submit">确认</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="clearfix"></div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#button-block div").bind("click", function () {
            var index = $(this).index();
            var divs = $(".odds-box > td");

            $(this).parent().children("div").attr("class", "btn-choose-group");//将所有选项置为未选中
            $(this).attr("class", "btn-choose-group active"); //设置当前选中项为选中样式
            divs.hide();//隐藏所有选中项内容
            divs.eq(index).show(); //显示选中项对应内容

            leftItemCode();
            var num = checknum();
            var p = p_b();

            if(num>=p){
                var limit = count_effective();
                if(limit<200){
                    $(".display-bets-count").html(limit);
                    var allGold = count();
                    $('#BetGold').text(allGold);
                }else{
                    $("#balls-block").find('.ball').each(
                            function(index,t){

                                $(this).removeClass("checked");

                            })
                    $(".display-bets-count").html(0);
                    $('#BetGold').text(0);
                    Showbo.Msg.alert('不能选取更多的号码了!');
                }
            }

        });

    });
</script>

<script src="../js/lib/countdown.js" type="text/javascript"></script>
<script src="${ctx}/js/lottert/common.js" type="text/javascript"></script>
<script src="../js/lottery/bjkl8/member_common_bjkl8.js?51197755" type="text/javascript"></script>
<script src="../js/lottery/bjkl8/multiorder.js?51197755" type="text/javascript"></script>
<script src="../js/lottery/Util.js" type="text/javascript"></script>
<script type="application/javascript">
    //循环输出
    $.ajax({url: "../bjkl8/itemDate.do?timeStamp=" + new Date().getTime()+"&Pid=1",type: "get",dataType: "json",
        success: function(b) {
            if(0 == b.code){
            	 var map = b.items_map;
                 var key="50001";
                 var data=map[key];
                 $("#odds_"+key+"_1").html(data.odds.toFixed(2));
                 $("#odds_"+key+"_2").html(data.odds1.toFixed(2));
                 $("#odds_"+key+"_3").html(data.odds2.toFixed(2));
                 key="50002";
                 data=map[key];
                 $("#odds_"+key+"_1").html(data.odds.toFixed(2));
                 $("#odds_"+key+"_2").html(data.odds1.toFixed(2));
                 $("#odds_"+key+"_3").html(data.odds2.toFixed(2));
                 key="50003";
                 data=map[key];
                 $("#odds_"+key+"_1").html(data.odds.toFixed(2));
                 $("#odds_"+key+"_2").html(data.odds1.toFixed(2));
                 key="50004";
                 data=map[key];
                 $("#odds_"+key+"_1").html(data.odds.toFixed(2));
                 key="50005";
                 data=map[key];
                 $("#odds_"+key+"_1").html(data.odds.toFixed(2));
            }else{
                Showbo.Msg.alert('请登录')
                window.location.href=ctx+"logout.do";
            }
        }})
</script>
</body>
</html>