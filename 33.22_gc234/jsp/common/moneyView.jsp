<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>目前额度</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
            <li class="tabs-btn active"><a href="moneyView.do">目前额度</a></li>
            <li class="tabs-btn"><a href="moneyCun.do">存款</a></li>
            <li class="tabs-btn"><a href="moneyQu.do">取款</a></li>
            <li class="tabs-btn"><a href="moneyRec.do">存取款记录</a></li>
            <!-- <li class="tabs-btn"><a href="moneyDividend.do">退水记录</a></li> -->
        </ul>
    </div>

<div id="locate-box">
    <table class="MMain" border="1" style="width:900px;margin:20px auto;">
        <tbody>
        <tr>
            <td align="center" colspan="3" ><font style="color:red">账户总余额</font>：<span id="TotalCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;主账户余额：<span id="GCCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
        </tr>
        <tr>
            <td align="right">PT游戏余额：<span id="PTCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right">AG视讯余额：<span id="AGCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right">欧博余额：<span id="ABCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
        </tr>
        <tr>
            <td align="right">新天地余额：<span id="XTDCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right">MG余额：<span id="MGCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right">GD余额：<span id="GDCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
        </tr>
        <tr>
            <td align="right">TBS体育余额：<span id="TBSCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right">BBIN余额：<span id="BBINCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币"></td>
            <td align="right">网络街机余额：<span id="TYDCredit">0.00</span>&nbsp;&nbsp;RMB <img src="${ctx}/img/money_RMB.gif" align="absmiddle" title="人民币" alt="人民币">
            <input type="button" id="tydId" value="全额取" onclick="tydReturn()"/>
            </td>
        </tr>
        </tbody>
    </table>
    <table class="MMain" style="width:900px;margin:20px auto;">
        <thead>
        <tr>
            <th width="30%" align="center">额度转换</th>
            <th width="70%"></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td align="center">转出</td>
            <td><select name="changeFrom" id="changeFrom" class="MFormStyle">
                    <option label="主账户余额" value="gc">主账户余额</option>
                    <option label="PT游戏余额" value="pt">PT游戏余额</option>
                   <option label="TBS体育余额" value="tbs">TBS体育余额</option>
                    <option label="AG视讯余额" value="ag">AG视讯余额</option>
                    <option label="欧博余额" value="ab">欧博余额</option>
                    <option label="新天地余额" value="xtd">新天地余额</option>
                    <option label="MG余额" value="mg">MG余额</option>
                    <option label="GD余额" value="gd">GD余额</option>
                    <option label="BBIN余额" value="bbin">BBIN余额</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="center">转入</td>
            <td><select name="changeTo" id="changeTo" class="MFormStyle">
            		<option label="请选择" value="">请选择</option>
                    <option label="PT游戏余额" value="pt">PT游戏余额</option>
                    <option label="TBS体育余额" value="tbs">TBS体育余额</option>
                    <option label="AG视讯余额" value="ag">AG视讯余额</option>
                    <option label="欧博余额" value="ab">欧博余额</option>
                    <option label="新天地余额" value="xtd">新天地余额</option>
                    <option label="MG余额" value="mg">MG余额</option>
                    <option label="GD余额" value="gd">GD余额</option>
                    <option label="BBIN余额" value="bbin">BBIN余额</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="center">金额</td>
            <td><input type="text" name="switch_amount" value="" id="changeNum" class="MFormStyle">
                <input type="hidden" name="act" value="transfer">
                <input type="button" id="SubmitForm" class="nui-btn nui-btn-theme-main" value="确定">
                <span id="MSwitchResult"></span>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</div>
<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/showBo.css"/>
<script src="${ctx}/js/lib/showBo.js" type="text/javascript"></script>
<script>
    $(function(){
    	
    	function tydReturn(){
       	 $.ajax({url: "../userTYDreturnCredit.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                    if(0 == b.code){
                        getBalance();
                        Showbo.Msg.alert('转账成功!');

                    }else{
                        getBalance();
                        Showbo.Msg.alert(langpackage[b.code]);

                    }
                }});
       }
    	
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
						s = parseFloat((s + "").replace(/[^\d\.-]/g, ""))
								.toFixed(n)
								+ "";
						var l = s.split(".")[0].split("").reverse(), r = s
								.split(".")[1];
						t = "";
						for (i = 0; i < l.length; i++) {
							t += l[i]
									+ ((i + 1) % 3 == 0 && (i + 1) != l.length ? ","
											: "");
						}
						return t.split("").reverse().join("") + "." + r;
					}

        //实时获取余额
        var getBalance = function(){
        	
        	getGCBalance();
        	/* getPTBalance();
        	getAGBalance();
        	getABBalance();
        	getXTDBalance();
        	getMGBalance();
        	getGDBalance();
        	getTBSBalance();
        	getBBINBalance(); */
        	getTYDBalance();
        	
             $.ajax({url: "../api/totalBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                   // if(0 == b.code){
                    	$("#BBINCredit").html(fmoney(b.userBBINBalance));
                    	$("#GDCredit").html(fmoney(b.userGDBalance));
                    	$("#MGCredit").html(fmoney(b.userMGBalance));
                    	$("#XTDCredit").html(fmoney(b.userXTDBalance));
                    	$("#PTCredit").html(fmoney(b.userPTBalance));
                    	$("#TBSCredit").html(fmoney(b.userTBSBalance));
                    	$("#AGCredit").html(fmoney(b.userAGBalance));
                    	$("#ABCredit").html(fmoney(b.userABBalance));
                    	var total  =parseFloat(b.userBBINBalance)+parseFloat(b.userGDBalance)+parseFloat(b.userMGBalance)+parseFloat(b.userXTDBalance)+parseFloat(b.userPTBalance)+parseFloat(b.userTBSBalance)+parseFloat(b.userAGBalance)+parseFloat(b.userABBalance);
                    	 $("#TotalCredit").html(fmoney(parseFloat(b.userGCBalance)/100+total));
                   // }
                   
                }
            }) 
        };
        function getGCBalance(){
        	$.ajax({url: "../userBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                	if(!isNaN(b) && b != null){
                		var balance = b/100;
                        $("#GCCredit").html(fmoney(balance));
                        $("#TotalCredit").html(fmoney(balance));
                        return balance;
                	}
                }
            })
        }
        
        function getBBINBalance(){
        	$.ajax({url: "../userBBINBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                	if(!isNaN(b) && b != null){
                		var balance = b;
                        $("#BBINCredit").html(fmoney(b));
                        return b;
                	}
                }
            })
        }
        function getTYDBalance(){
        	$.ajax({url: "../userTYDBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                	if(!isNaN(b) && b != null){
                		var balance = b;
                		if(b==0){
                			$("#tydId").hide();
                		}else{
                			$("#tydId").show();
                		}
                        $("#TYDCredit").html(fmoney(b));
                        return b;
                	}
                }
            })
        }
        function getGDBalance(){
        	$.ajax({url: "../userGDBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                	if(!isNaN(b) && b != null){
                		var balance = b;
                        $("#GDCredit").html(fmoney(b));
                        return b;
                	}
                }
            })
        }
        function getMGBalance(){
        	$.ajax({url: "../userMGBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                	if(!isNaN(b) && b != null){
                		var balance = b;
                        $("#MGCredit").html(fmoney(b));
                        return b;
                	}
                }
            })
        }
        function getXTDBalance(){
        	$.ajax({url: "../userXTDBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                	if(!isNaN(b) && b != null){
                		var balance = b;
                        $("#XTDCredit").html(fmoney(b));
                        return b;
                	}
                }
            })
        }
        function getPTBalance(){
        	$.ajax({url: "../userPTBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                	if(!isNaN(b) && b != null){
                        $("#PTCredit").html(fmoney(b));
                        return b;
                	}
                }
            })
        }
        function getTBSBalance(){
        	$.ajax({url: "../userTBSBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                	if(!isNaN(b) && b != null){
                        $("#TBSCredit").html(fmoney(b));
                        return b;
                	}
                }
            })
        }
        function getAGBalance(){
        	$.ajax({url: "../userAGBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                	if(!isNaN(b) && b != null){
                        $("#AGCredit").html(fmoney(b));
                        return b;
                	}
                }
            })
        }
        function getABBalance(){
        	$.ajax({url: "../userABBalance.do?timeStamp=" + new Date().getTime(),type: "get",dataType: "json",
                success: function(b) {
                	if(!isNaN(b) && b != null){
                        $("#ABCredit").html(fmoney(b));
                        return b;
                	}
                }
            })
        }
        

        getBalance();

        //window.setInterval(function() {
            //getBalance();
        //}, 5000)



        $("#changeFrom").on('change',function(){
            var v = $(this).val();
            var pthtml = '<option label="主账户余额" value="gc">主账户余额</option>';
            var gchtml = '<option label="请选择" value="">请选择</option><option label="PT游戏余额" value="pt">PT游戏余额</option><option label="AG视讯余额" value="ag">AG视讯余额</option><option label="欧博余额" value="ab">欧博余额</option><option label="新天地余额" value="xtd">新天地余额</option><option label="MG余额" value="mg">MG余额</option><option label="GD余额" value="gd">GD余额</option><option label="TBS体育余额" value="tbs">TBS体育余额</option><option label="BBIN余额" value="bbin">BBIN余额</option>';//
            if(v!=='gc'){
                $("#changeTo").html(pthtml);
            }else{
                $("#changeTo").html(gchtml);
            }

        });




        $("#SubmitForm").on('click',function(){
        	Showbo.Msg.wait();
            var     GCCredit   = $("#GCCredit").html(),
            		AGCredit   = $("#AGCredit").html(),
            		ABCredit   = $("#ABCredit").html(),
            		XTDCredit   = $("#XTDCredit").html(),
            		MGCredit   = $("#MGCredit").html(),
            		GDCredit   = $("#GDCredit").html(),
            		TBSCredit = $("#TBSCredit").html(),
            		BBINCredit = $("#BBINCredit").html(),
                    PTCredit   = $("#PTCredit").html();//
            var     changeTo   = $("#changeTo").val();
            var     changeFrom = $("#changeFrom").val();
            var     changeNum = $("#changeNum").val();
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
                
                /* if(changeTo=="mg"){
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
                } */
                
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
                
                /* if(changeTo=="pt"){
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
                } */
                
                /* if(changeTo=="tbs"){
                	if(changeNum>500){
                		 Showbo.Msg.alert('皇冠体育转账每次最多500');
                         return;
                	}
                	
                	if(TBSCredit>499){
                        Showbo.Msg.alert('皇冠体育余额过多');
                        return;
                    }
                } */
                
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

            }else if(changeFrom=='tbs'){
            	if(TBSCredit<changeNum){
                    Showbo.Msg.alert('TBS体育余额不足!');
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
            }  
            

            $.ajax({url: "../quotaConversion.do?timeStamp=" + new Date().getTime(),data:{'lquota':changeNum,'changeTo':changeTo,'changeFrom':changeFrom},type: "get",dataType: "json",
                success: function(b) {
                    if(0 == b.code){
                        getBalance();
                        Showbo.Msg.alert('转账成功!');

                    }else{
                        getBalance();
                        Showbo.Msg.alert(langpackage[b.code]);

                    }
                }})
        })
    })

    
    
    
</script>




</body>
</html>