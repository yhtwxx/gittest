<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>目前额度</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- 引用公用头部文件（包含公用css和公用js） -->
	<jsp:include page="../common/common_lang.jsp" />
	<script src="${ctx}/js/layer.min.js" type="text/javascript"></script>
    <style type="text/css">
        <!--
        /*共用*/
        input{
            padding-left:6px;
            padding-right:6px;
        }
        body{
            padding:0;
            margin:0;
            color:#272A31;
            background-color: #fff;
            padding: 2px 10px;
            font-family: "Microsoft YaHei", Arial;
            color: #666;
        }
        .tabs li a {text-decoration: none; color: #666; width: 102px;display: block;}

        /*table*/
        table.MMain {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            text-align: left;
            font-size: 12px;
            color: #FFF;
        }
        table.MMain th {
            background: #DFDFDF;
            height: 1.8em;
            color: #333;
            font-weight: normal;
            padding: 6px 8px;
        }
        table.MMain td {
            background: #FFF;
            line-height: 1.5em;
            color: #666;
            padding: 6px 8px;
        }
        table.MMain, table.MMain th, table.MMain td {
            border: 1px solid #CCC;
        }
        table.MMain th.MContent, table.MMain td.MContent {
            word-break: break-all;
            text-align: left;
        }
        table.MMain td.MNumber {
            text-align: right;
        }
        table.MMain td.MNotice {
            color: #555;
        }
        table.MMain td.MBgcolor {
            background: #600;
            color: #FFF;
        }
        table.MMain td.MBgcolor2 {
            background: #006;
            color: #FFF;
        }
        .MSubTitle { font-size: 14px;}
        .tabs{height: 40px;border-bottom: 1px solid #a5a5a5;}
        .tabs li {
            border: 1px solid #a5a5a5;
            border-bottom: none;
            width: 100px;
            height: 26px;
            text-align: center;
            line-height: 26px;
            font-size: 14px;
            background-color: #efefef;
            top: 13px;
            float: left;
            margin-top:13px;
            cursor: pointer;
            list-style: none;
        }
        .tabs .active {border-bottom: 1px solid #fff;background-color: #fff;}
        .MFormStyle {font-family: "Microsoft YaHei", Arial;}

    </style>

</head>

<body>

<div id="MMainData" style="margin-top: 8px;">


    <div class="tabs">
        <ul id="tabs">
            <li class="tabs-btn active"><a href="moneyView.do"><spring:message code="public.member.AmountOfMoney" /></a></li>
            <li class="tabs-btn"><a href="moneyCun.do"><spring:message code="public.deposit"/></a></li>
            <li class="tabs-btn"><a href="moneyQu.do"><spring:message code="public.withdrawal"/></a></li>
            <li class="tabs-btn"><a href="moneyRec.do"><spring:message code="public.DepositWithdrawalRecord"/></a></li>
            <!-- <li class="tabs-btn"><a href="moneyDividend.do">退水记录</a></li> -->
        </ul>
    </div>

<div id="locate-box">
    <table class="MMain" border="1" style="width:900px;margin:20px auto;">
        <tbody>
        <tr>
            <td align="center" colspan="3" >
            	<font style="color:red">
            	<spring:message code="public.member.TotalBalanceOfAccount"/>
				</font>：<span class="balanceSpan" id="TotalCredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币">
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<spring:message code="public.member.MainAccountBalance"/>：<span class="balanceSpan" id="GCCredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币">
           	</td>
        </tr>
        <tr>
            <td align="right"><spring:message code="public.member.PTGameBalance"/>：<span class="balanceSpan" id="PTCredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right"><spring:message code="public.member.AGGameBalance"/>：<span class="balanceSpan" id="AGCredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right"><spring:message code="public.member.ABGameBalance"/>：<span class="balanceSpan" id="ABCredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
        </tr>
        <tr>
            <td align="right"><spring:message code="public.member.XTDGameBalance" />：<span class="balanceSpan" id="XTDCredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right"><spring:message code="public.member.MGGameBalance" />：<span class="balanceSpan" id="MGCredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right"><spring:message code="public.member.GDGameBalance"/>：<span class="balanceSpan" id="GDCredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
        </tr>
        <tr>
            <td align="right"><spring:message code="public.member.TBSGameBalance"/>：<span class="balanceSpan" id="UGCredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right"><spring:message code="public.member.BBINGameBalance"/>：<span class="balanceSpan" id="BBINCredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right"><spring:message code="public.member.IMGameBalance"/>：<span class="balanceSpan" id="IMCredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
        </tr>
        <tr>
        	<td align="right"><spring:message code="public.member.GAGameBalance"/>：<span class="balanceSpan" id="GACredit"><img src="${ctx}/img/loading_mini.gif"></span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
        </tr>
        </tbody>
    </table>
    <table class="MMain" style="width:900px;margin:20px auto;">
        <thead>
        <tr>
            <th width="30%" align="center"><spring:message code="public.AmountOfConversion"/></th>
            <th width="70%"></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td align="center"><spring:message code="public.TransferredOut"/></td>
            <td><select name="changeFrom" id="changeFrom" class="MFormStyle">
                    <option label="<spring:message code="public.member.MainAccountBalance"/>" value="gc"><spring:message code="public.member.MainAccountBalance"/></option>
                    <option label="<spring:message code="public.member.PTGameBalance"/>" value="pt"><spring:message code="public.member.PTGameBalance"/></option>
                   	<option label="<spring:message code="public.member.TBSGameBalance"/>" value="ug"><spring:message code="public.member.TBSGameBalance"/></option>
                    <option label="<spring:message code="public.member.AGGameBalance"/>" value="ag"><spring:message code="public.member.AGGameBalance"/></option>
                    <option label="<spring:message code="public.member.ABGameBalance"/>" value="ab"><spring:message code="public.member.ABGameBalance"/></option>
                    <option label="<spring:message code="public.member.XTDGameBalance" />" value="xtd"><spring:message code="public.member.XTDGameBalance" /></option>
                    <option label="<spring:message code="public.member.MGGameBalance"/>" value="mg"><spring:message code="public.member.MGGameBalance"/></option>
                    <option label="<spring:message code="public.member.GDGameBalance"/>" value="gd"><spring:message code="public.member.GDGameBalance"/></option>
                    <option label="<spring:message code="public.member.BBINGameBalance"/>" value="bbin"><spring:message code="public.member.BBINGameBalance"/></option>
                    <option label="<spring:message code="public.member.IMGameBalance"/>" value="im"><spring:message code="public.member.IMGameBalance"/></option>
                    <option label="<spring:message code="public.member.GAGameBalance"/>" value="ga"><spring:message code="public.member.GAGameBalance"/></option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="center"><spring:message code="public.TransferredInto"/></td>
            <td><select name="changeTo" id="changeTo" class="MFormStyle">
                    <option label="<spring:message code="public.member.PleaseSelect"/>" value=""><spring:message code="public.member.PleaseSelect"/></option>
                    <option label="<spring:message code="public.member.PTGameBalance"/>" value="pt"><spring:message code="public.member.PTGameBalance"/></option>
                    <option label="<spring:message code="public.member.TBSGameBalance"/>" value="ug"><spring:message code="public.member.TBSGameBalance"/></option>
                    <option label="<spring:message code="public.member.AGGameBalance"/>" value="ag"><spring:message code="public.member.AGGameBalance"/></option>
                    <option label="<spring:message code="public.member.ABGameBalance"/>" value="ab"><spring:message code="public.member.ABGameBalance"/></option>
                    <option label="<spring:message code="public.member.XTDGameBalance" />" value="xtd"><spring:message code="public.member.XTDGameBalance" /></option>
                    <option label="<spring:message code="public.member.MGGameBalance"/>" value="mg"><spring:message code="public.member.MGGameBalance"/></option>
                    <option label="<spring:message code="public.member.GDGameBalance"/>" value="gd"><spring:message code="public.member.GDGameBalance"/></option>
                    <option label="<spring:message code="public.member.BBINGameBalance"/>" value="bbin"><spring:message code="public.member.BBINGameBalance"/></option>
                    <option label="<spring:message code="public.member.IMGameBalance"/>" value="im"><spring:message code="public.member.IMGameBalance"/></option>
                	<option label="<spring:message code="public.member.GAGameBalance"/>" value="ga"><spring:message code="public.member.GAGameBalance"/></option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="center"><spring:message code="public.money"/></td>
            <td><input type="text" name="switch_amount" value="" id="changeNum" class="MFormStyle">
                <input type="hidden" name="act" value="transfer">
                <input type="button" id="SubmitForm" class="nui-btn nui-btn-theme-main" value="<spring:message code="public.Confirm" />">
                <span id="MSwitchResult"></span>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</div>

<script>
    var _UserBalance = new Array();
    _UserBalance['GC'] = 0.00;
    _UserBalance['PT'] = 0.00;
    _UserBalance['AG'] = 0.00;
    _UserBalance['AB'] = 0.00;
    _UserBalance['XTD'] = 0.00;
    _UserBalance['MG'] = 0.00;
    _UserBalance['GD'] = 0.00;
    _UserBalance['UG'] = 0.00;
    _UserBalance['BBIN'] = 0.00;
    _UserBalance['IM'] = 0.00;
    _UserBalance['GA'] = 0.00;
    $(function(){
        function format_gold(gold) {
            return ((gold = parseInt(gold, 10)) && 0 < gold) ? gold : '';
        }
        $( document ).on( "change", "#changeNum", function(){
            var el = this;
            el.value = format_gold(el.value);
        }).on( "keyup", "#changeNum", function(){
            var el = this;
            el.value = format_gold(el.value);
        });
        function fmoney(s, n) {
            n = n > 0 && n <= 20 ? n : 2;
            s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
            var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
            t = "";
            for (i = 0; i < l.length; i++) {
                t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
            }
            return t.split("").reverse().join("") + "." + r;
        }

        //实时获取余额
        var getBalance = function(){
        	//加载效果
        	loadBalance();
			//获取余额
            getGCBalance();
            getPTBalance();
            getAGBalance();
            getABBalance();
            getXTDBalance();
            getMGBalance();
            getGDBalance();
            getUGBalance();
            getBBINBalance();
            getIMBalance();
            getGABalance();
        };
        
        //计算总余额
        function getTotalBalance(){
        	var totalBalance = 0.00;
        	for(var key in _UserBalance){  
        		totalBalance += parseFloat(_UserBalance[key]);
        	}  
        	$("#TotalCredit").html(fmoney(totalBalance));
        }
        
        //加载余额动画
        function loadBalance(){
        	$(".balanceSpan").html('<img src="${ctx}/img/loading_mini.gif">');
        }
        
        function getGCBalance(){
            $.ajax({url: "../userBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(!isNaN(b) && b != null){
                        var balance = b/100;
                        $("#GCCredit").html(fmoney(balance));
                        //$("#TotalCredit").html(fmoney(balance));
                        _UserBalance['GC'] = balance;
                      	//计算总余额
                        getTotalBalance();
                    }
                }
            })
        }

        function getBBINBalance(){
            $.ajax({url: "../userBBINBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(!isNaN(b) && b != null){
                        var balance = b;
                        $("#BBINCredit").html(fmoney(balance));
                        _UserBalance['BBIN'] = balance;
                      	//计算总余额
                        getTotalBalance();
                    }
                }
            })
        }
        function getGDBalance(){
            $.ajax({url: "../userGDBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(!isNaN(b) && b != null){
                        var balance = b;
                        $("#GDCredit").html(fmoney(balance));
                        _UserBalance['GD'] = balance;
                      	//计算总余额
                        getTotalBalance();
                    }
                }
            })
        }
        function getMGBalance(){
            $.ajax({url: "../userMGBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(!isNaN(b) && b != null){
                        var balance = b;
                        $("#MGCredit").html(fmoney(balance));
                        _UserBalance['MG'] = balance;
                      	//计算总余额
                        getTotalBalance();
                    }
                }
            })
        }
        function getXTDBalance(){
            $.ajax({url: "../userXTDBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(!isNaN(b) && b != null){
                        var balance = b;
                        $("#XTDCredit").html(fmoney(balance));
                        _UserBalance['XTD'] = balance;
                      	//计算总余额
                        getTotalBalance();
                    }
                }
            })
        }
        function getPTBalance(){
            $.ajax({url: "../userPTBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(!isNaN(b) && b != null){
                        $("#PTCredit").html(fmoney(b));
                        _UserBalance['PT'] = b;
                      	//计算总余额
                        getTotalBalance();
                    }
                }
            })
        }
        function getUGBalance(){
            $.ajax({url: "../userUGBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(!isNaN(b) && b != null){
                        $("#UGCredit").html(fmoney(b));
                        _UserBalance['UG'] = b;
                      	//计算总余额
                        getTotalBalance();
                    }
                }
            })
        }
        function getAGBalance(){
            $.ajax({url: "../userAGBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(!isNaN(b) && b != null){
                        $("#AGCredit").html(fmoney(b));
                        _UserBalance['AG'] = b;
                      	//计算总余额
                        getTotalBalance();
                    }
                }
            })
        }
        function getABBalance(){
            $.ajax({url: "../userABBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(!isNaN(b) && b != null){
                        $("#ABCredit").html(fmoney(b));
                        _UserBalance['AB'] = b;
                      	//计算总余额
                        getTotalBalance();
                    }
                }
            })
        }
        function getIMBalance(){
            $.ajax({url: "../userIMBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(!isNaN(b) && b != null){
                        $("#IMCredit").html(fmoney(b));
                        _UserBalance['IM'] = b;
                      	//计算总余额
                        getTotalBalance();
                    }
                }
            })
        }
        function getGABalance(){
            $.ajax({url: "../userGABalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(b != null){
                    	if(b.code != 0){
                    		Showbo.Msg.alert(b.msg);
                    	}else{
                    		$("#GACredit").html(fmoney(b.balance));
                            _UserBalance['GA'] = b.balance;
                          	//计算总余额
                            getTotalBalance();
                    	}
                    }
                }
            })
        }

        getBalance();

        $("#changeFrom").on('change',function(){
            var v = $(this).val();
            var pthtml = '<option label="<spring:message code="public.member.MainAccountBalance"/>" value="gc"><spring:message code="public.member.MainAccountBalance"/></option>';
           	var gchtml = '<option label="<spring:message code="public.member.PleaseSelect"/>" value=""><spring:message code="public.member.PleaseSelect"/></option>'+
            	         '<option label="<spring:message code="public.member.PTGameBalance"/>" value="pt"><spring:message code="public.member.PTGameBalance"/></option>'+
            	         '<option label="<spring:message code="public.member.AGGameBalance"/>" value="ag"><spring:message code="public.member.AGGameBalance"/></option>'+
            	         '<option label="<spring:message code="public.member.ABGameBalance"/>" value="ab"><spring:message code="public.member.ABGameBalance"/></option>'+
            	         '<option label="<spring:message code="public.member.XTDGameBalance" />" value="xtd"><spring:message code="public.member.XTDGameBalance" /></option>'+
            	         '<option label="<spring:message code="public.member.MGGameBalance"/>" value="mg"><spring:message code="public.member.MGGameBalance"/></option>'+
            	         '<option label="<spring:message code="public.member.GDGameBalance"/>" value="gd"><spring:message code="public.member.GDGameBalance"/></option>'+
            	         '<option label="<spring:message code="public.member.TBSGameBalance"/>" value="ug"><spring:message code="public.member.TBSGameBalance"/></option>'+
            	         '<option label="<spring:message code="public.member.BBINGameBalance"/>" value="bbin"><spring:message code="public.member.BBINGameBalance"/></option>' + 
            	         '<option label="<spring:message code="public.member.IMGameBalance"/>" value="im"><spring:message code="public.member.IMGameBalance"/></option>' +
            	         '<option label="<spring:message code="public.member.GAGameBalance"/>" value="ga"><spring:message code="public.member.GAGameBalance"/></option>';
            if(v!=='gc'){
                $("#changeTo").html(pthtml);
            }else{
                $("#changeTo").html(gchtml);
            }

        });

        $("#SubmitForm").on('click',function(){
            Showbo.Msg.wait();
            var GCCredit = $("#GCCredit").html(),
                AGCredit = $("#AGCredit").html(),
                ABCredit = $("#ABCredit").html(),
                XTDCredit = $("#XTDCredit").html(),
                MGCredit = $("#MGCredit").html(),
                GDCredit = $("#GDCredit").html(),
                UGCredit = $("#UGCredit").html(),
                BBINCredit = $("#BBINCredit").html(),
                PTCredit = $("#PTCredit").html();
            	IMCredit = $("#IMCredit").html();
            	GACredit = $("#GACredit").html();
            var changeTo = $("#changeTo").val();
            var changeFrom = $("#changeFrom").val();
            var changeNum = $("#changeNum").val();
            if(changeNum==null || changeNum == '' || changeNum=='undefined' || changeNum<=0){
                Showbo.Msg.alert('请输入转账金额!');
                return;
            }
            if(changeTo==null || changeTo == '' || changeTo=='undefined'){
                Showbo.Msg.alert('请选择转入账户!');
                return;
            }
            changeNum = parseInt(changeNum,10);


            if(changeFrom=='gc'){
                if(GCCredit<changeNum){
                    Showbo.Msg.alert('主账户余额不足!');
                    return;
                }

				if(changeTo=="mg"){
					if(changeNum>500){
						Showbo.Msg.alert('MG转账每次最多500');
						return;
					}
				
					if(MGCredit>499){
						Showbo.Msg.alert('MG余额过多');
						return;
					}
				}
				
				if(changeTo=="gd"){
					if(changeNum>500){
						Showbo.Msg.alert('GD转账每次最多500');
						return;
					}
				
					if(GDCredit>499){
						Showbo.Msg.alert('GD余额过多');
						return;
					}
				}

                if(changeTo=="bbin"){
                    if(changeNum>500){
                        Showbo.Msg.alert('BBIN转账每次最多500');
                        return;
                    }

                    if(BBINCredit>499){
                        Showbo.Msg.alert('BBIN余额过多');
                        return;
                    }
                }

                if(changeTo=="pt"){
					if(changeNum>500){
						Showbo.Msg.alert('PT转账每次最多500');
						return;
					}
					
					if(PTCredit>499){
						Showbo.Msg.alert('PT余额过多');
						return;
					}
                }

                if(changeTo=="ag"){
					if(changeNum>500){
						Showbo.Msg.alert('AG转账每次最多500');
						return;
					}
					
					if(AGCredit>499){
						Showbo.Msg.alert('AG余额过多');
						return;
					}
                }

				if(changeTo=="ab"){
					if(changeNum>500){
						Showbo.Msg.alert('欧博转账每次最多500');
						return;
					}
				
					if(ABCredit>499){
						Showbo.Msg.alert('欧博余额过多');
						return;
					}
				}

				if(changeTo=="xtd"){
					if(changeNum>500){
						Showbo.Msg.alert('新天地转账每次最多500');
						return;
					}
				
					if(XTDCredit>499){
						Showbo.Msg.alert('新天地余额过多');
						return;
					}
				}

				if(changeTo=="ug"){
					if(changeNum>500){
						Showbo.Msg.alert('皇冠体育转账每次最多500');
						return;
					}
				
					if(UGCredit>499){
						Showbo.Msg.alert('皇冠体育余额过多');
						return;
					}
				}
				
				if(changeTo=="im"){
					if(changeNum>500){
						Showbo.Msg.alert('IM体育每次最多500');
						return;
					}
				
					if(IMCredit>499){
						Showbo.Msg.alert('IM体育余额过多');
						return;
					}
				}
				
				if(changeTo=="ga"){
					if(changeNum>500){
						Showbo.Msg.alert('GA每次最多500');
						return;
					}
				
					if(GACredit>499){
						Showbo.Msg.alert('GA余额过多');
						return;
					}
				}

            }else if(changeFrom=='pt'){
                if(PTCredit<changeNum){
                    Showbo.Msg.alert('PT账户余额不足!');
                    return;

                }

            }else if(changeFrom=='ab'){
                if(ABCredit<changeNum){
                    Showbo.Msg.alert('欧博账户余额不足!');
                    return;

                }

            }else if(changeFrom=='xtd'){
                if(XTDCredit<changeNum){
                    Showbo.Msg.alert('新天地账户余额不足!');
                    return;

                }

            }else if(changeFrom=='mg'){
                if(MGCredit<changeNum){
                    Showbo.Msg.alert('MG账户余额不足!');
                    return;

                }

            }else if(changeFrom=='gd'){
                if(GDCredit<changeNum){
                    Showbo.Msg.alert('GD账户余额不足!');
                    return;

                }

            }else if(changeFrom=='ug'){
                if(UGCredit<changeNum){
                    Showbo.Msg.alert('UG体育余额不足!');
                    return;

                }
            }else if(changeFrom=='ag'){

                if(AGCredit<changeNum){
                    Showbo.Msg.alert('AG账户余额不足!');
                    return;

                }
            }else if(changeFrom=='bbin'){

                if(BBINCredit<changeNum){
                    Showbo.Msg.alert('BBIN账户余额不足!');
                    return;

                }
            }else if(changeFrom=='im'){

                if(IMCredit<changeNum){
                    Showbo.Msg.alert('IM体育账户余额不足!');
                    return;

                }
            }else if(changeFrom=='ga'){

                if(GACredit<changeNum){
                    Showbo.Msg.alert('GA账户余额不足!');
                    return;

                }
            }
            
            $.ajax({url: "../quotaConversion.do?timeStamp=" + new Date().getTime(),data:{'lquota':changeNum,'changeTo':changeTo,'changeFrom':changeFrom},type: "get",dataType: "json",
                success: function(b) {
                    if(0 == b.code){
                        getBalance();
                        Showbo.Msg.alert('转账成功!');
                    }else{
                        getBalance();
                        var msg = langpackage[b.code];
                        if(msg != null && msg != undefined && msg != ""){
                        	Showbo.Msg.alert(msg);
                        }else{
                        	Showbo.Msg.alert(b.msg);
                        }
                    }
                }
            });
        });
    });
</script>
</body>
</html>