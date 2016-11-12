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
</head>

<body>

<!--头部-->
<jsp:include page="../common/header.jsp"></jsp:include>

    <div class="caicontainer">

    <div class="caicontent" style="width:100%">
    <div class="caihead"><h2>重庆时时彩</h2>
    <h2>重庆时时彩 </h2>

        <jsp:include page="../common/showSg.jsp"></jsp:include>

    <div id="cai-info">
    <span id="cai-num" open-format="第 :num 期" close-format="">第 20150513-059 期</span>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <span id="ui-countdown" style="font: 20px/1.5 'Open Sans Condensed',sans-serif;"><span id="hour_show"></span>:<span id="minute_show"></span>:<span id="second_show"></span></span>
    </div>

    </div>
    <div class="cqsc">
    <div id="order-box" class="order-box-oneword game-state-opening">
    <div id="orders">
    <!-- javascript app 使用 -->

    <div class="game-box" style="display: block;"><div class="tabs-box tabs-view-4"><div class="tabs">
    <ul id="tabs">
    <li tabs="1" class="tabs-btn"><a>前三</a></li>
    <li tabs="2" class="tabs-btn"><a>中三</a></li>
    <li tabs="3" class="tabs-btn"><a>后三</a></li>
    <li tabs="4" class="tabs-btn active"><a>全五</a></li>
    </ul>
    </div>

    <div class="quick-bet tabs-box">
    <span>下注金额：<input type="text"></span>
    <span type="over">大</span>
    <span type="under">小</span>
    <span type="odd">单</span>
    <span type="even">双</span>
    <span type="prime">质</span>
    <span type="compo">合</span>
    </div>

    <div id="tabs-body">
    <table class="order-table tabs-view" tabs-view="1" style="display: none;">
    <thead>
    <tr><th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    </tr></thead>
    <tbody>
    <tr>
    <td class="choose-num">0</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14051'].odds}</span>
    <input type="text" name="orders[0:WORD:1:RANGE:1:2:3]">
    </td>
    <td class="choose-num">1</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14052'].odds}</span>
    <input type="text" name="orders[1:WORD:1:RANGE:1:2:3]">
    </td>
    <td class="choose-num">2</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14053'].odds}</span>
    <input type="text" name="orders[2:WORD:1:RANGE:1:2:3]">
    </td>
    <td class="choose-num">3</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14054'].odds}</span>
    <input type="text" name="orders[3:WORD:1:RANGE:1:2:3]">
    </td>
    <td class="choose-num">4</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14055'].odds}</span>
    <input type="text" name="orders[4:WORD:1:RANGE:1:2:3]">
    </td></tr><tr>
    <td class="choose-num">5</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14056'].odds}</span>
    <input type="text" name="orders[5:WORD:1:RANGE:1:2:3]">
    </td>
    <td class="choose-num">6</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14057'].odds}</span>
    <input type="text" name="orders[6:WORD:1:RANGE:1:2:3]">
    </td>
    <td class="choose-num">7</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14058'].odds}</span>
    <input type="text" name="orders[7:WORD:1:RANGE:1:2:3]">
    </td>
    <td class="choose-num">8</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14059'].odds}</span>
    <input type="text" name="orders[8:WORD:1:RANGE:1:2:3]">
    </td>
    <td class="choose-num">9</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14060'].odds}</span>
    <input type="text" name="orders[9:WORD:1:RANGE:1:2:3]">
    </td></tr><tr>
    </tr>
    </tbody>
    </table>
    <table class="order-table tabs-view" tabs-view="2" style="display: none;">
    <thead>
    <tr><th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    </tr></thead>
    <tbody>
    <tr>
    <td class="choose-num">0</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14061'].odds}</span>
    <input type="text" name="orders[0:WORD:1:RANGE:2:3:4]">
    </td>
    <td class="choose-num">1</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14062'].odds}</span>
    <input type="text" name="orders[1:WORD:1:RANGE:2:3:4]">
    </td>
    <td class="choose-num">2</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14063'].odds}</span>
    <input type="text" name="orders[2:WORD:1:RANGE:2:3:4]">
    </td>
    <td class="choose-num">3</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14064'].odds}</span>
    <input type="text" name="orders[3:WORD:1:RANGE:2:3:4]">
    </td>
    <td class="choose-num">4</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14065'].odds}</span>
    <input type="text" name="orders[4:WORD:1:RANGE:2:3:4]">
    </td></tr><tr>
    <td class="choose-num">5</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14066'].odds}</span>
    <input type="text" name="orders[5:WORD:1:RANGE:2:3:4]">
    </td>
    <td class="choose-num">6</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14067'].odds}</span>
    <input type="text" name="orders[6:WORD:1:RANGE:2:3:4]">
    </td>
    <td class="choose-num">7</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14068'].odds}</span>
    <input type="text" name="orders[7:WORD:1:RANGE:2:3:4]">
    </td>
    <td class="choose-num">8</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14069'].odds}</span>
    <input type="text" name="orders[8:WORD:1:RANGE:2:3:4]">
    </td>
    <td class="choose-num">9</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14070'].odds}</span>
    <input type="text" name="orders[9:WORD:1:RANGE:2:3:4]">
    </td></tr><tr>
    </tr>
    </tbody>
    </table>
    <table class="order-table tabs-view" tabs-view="3" style="display: none;">
    <thead>
    <tr><th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    </tr></thead>
    <tbody>
    <tr>
    <td class="choose-num">0</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14071'].odds}</span>
    <input type="text" name="orders[0:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">1</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14072'].odds}</span>
    <input type="text" name="orders[1:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">2</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14073'].odds}</span>
    <input type="text" name="orders[2:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">3</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14074'].odds}</span>
    <input type="text" name="orders[3:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">4</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14075'].odds}</span>
    <input type="text" name="orders[4:WORD:1:RANGE:3:4:5]">
    </td></tr><tr>
    <td class="choose-num">5</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14076'].odds}</span>
    <input type="text" name="orders[5:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">6</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14077'].odds}</span>
    <input type="text" name="orders[6:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">7</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14078'].odds}</span>
    <input type="text" name="orders[7:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">8</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14079'].odds}</span>
    <input type="text" name="orders[8:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">9</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14080'].odds}</span>
    <input type="text" name="orders[9:WORD:1:RANGE:3:4:5]">
    </td></tr><tr>
    </tr>
    </tbody>
    </table>
    <table class="order-table tabs-view" tabs-view="4" style="display: table;">
    <thead>
    <tr><th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    <th>号码</th>
    <th>金额</th>
    </tr></thead>
    <tbody>
    <tr>
    <td class="choose-num">0</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14081'].odds}</span>
    <input type="text" name="orders[0:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">1</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14082'].odds}</span>
    <input type="text" name="orders[1:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">2</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14083'].odds}</span>
    <input type="text" name="orders[2:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">3</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14084'].odds}</span>
    <input type="text" name="orders[3:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">4</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14085'].odds}</span>
    <input type="text" name="orders[4:WORD:1:RANGE:3:4:5]">
    </td></tr><tr>
    <td class="choose-num">5</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14086'].odds}</span>
    <input type="text" name="orders[5:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">6</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14087'].odds}</span>
    <input type="text" name="orders[6:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">7</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14088'].odds}</span>
    <input type="text" name="orders[7:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">8</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14089'].odds}</span>
    <input type="text" name="orders[8:WORD:1:RANGE:3:4:5]">
    </td>
    <td class="choose-num">9</td>
    <td class="choose-item">
    <span class="odds">${Item.items_map['14090'].odds}</span>
    <input type="text" name="orders[9:WORD:1:RANGE:3:4:5]">
    </td></tr><tr>
    </tr>
    </tbody>
    </table>
    </div></div></div></div>

    <div id="order-info">
    <div class="inner">
    <span>下注金额:<span id="order-info-total">0</span></span>
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
    <!--content-->

<!--尾部-->
<jsp:include page="../common/footer.jsp"></jsp:include>

    <script src="../js/lib/countdown.js" type="text/javascript"></script>
    <script src="../js/lottery/mem_order_cqsc.js?51197755" type="text/javascript"></script>

    <script>
    $(function() {
    var Accordion = function(el, multiple) {
    this.el = el || {};
    this.multiple = multiple || false;

    // Variables privadas
    var links = this.el.find('.link');
    // Evento
    links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
    }

    Accordion.prototype.dropdown = function(e) {
    var $el = e.data.el;
    $this = $(this),
    $next = $this.next();

    $next.slideToggle();
    $this.parent().toggleClass('open');

    if (!e.data.multiple) {
    $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
    };
    }

    var accordion = new Accordion($('#accordion'), false);
    });

    </script>



    <script type="text/javascript">

    $(document).ready(function () {
    $("#tabs li").bind("click", function () {
    var index = $(this).index();
    var divs = $("#tabs-body > table");
    $(this).parent().children("li").attr("class", "tabs-btn");//将所有选项置为未选中
    $(this).attr("class", "tabs-btn active"); //设置当前选中项为选中样式
    divs.hide();//隐藏所有选中项内容
    divs.eq(index).show(); //显示选中项对应内容
    });

    });

    </script>

    </body>
    </html>