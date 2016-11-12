<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--新版彩票导航Plugin/zTree timi--%>
  <link rel="stylesheet" href="${ctx}/plugin/zTree/zTreeStyle.css" type="text/css">
  <style>
	#testIframe {margin-left: 10px;}
  </style>
<script type="text/javascript" src="${ctx}/plugin/zTree/jquery.ztree.core.js"></script>
  <SCRIPT type="text/javascript" >
  <!--
	var zTree;
	var demoIframe;

	var setting = {
		view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: ""
			}
		},
		callback: {
			beforeClick: function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				if (treeNode.isParent) {
					zTree.expandNode(treeNode);
					return false;
				} else {
					demoIframe.attr("src",treeNode.file);
					return true;
				}
			}
		}
	};

	var zNodes =[
		{id:1, pId:0, name:"时时彩", open:true, iconSkin:"pIcon01"},
		{id:101, pId:1, name:"重庆时时彩", file:"${ctx}/lottery/gc/cqssc.do", iconSkin:"icon101"},
		{id:102, pId:1, name:"天津时时彩", file:"${ctx}/lottery/gc/tjssc.do", iconSkin:"icon102"},
		{id:103, pId:1, name:"新疆时时彩", file:"${ctx}/lottery/gc/xjssc.do", iconSkin:"icon103"},
		{id:104, pId:1, name:"江西时时彩", file:"${ctx}/lottery/gc/jxssc.do", iconSkin:"icon104"},
		{id:105, pId:1, name:"云南时时彩", file:"${ctx}/lottery/gc/ynssc.do", iconSkin:"icon105"},
		{id:106, pId:1, name:"上海时时乐", file:"${ctx}/lottery/gc/shssc.do", iconSkin:"icon106"},

		{id:2, pId:0, name:"快乐十分", open:true, iconSkin:"pIcon02"},
		{id:201, pId:2, name:"广东快乐十分", file:"${ctx}/lottery/gc/gdk10.do", iconSkin:"icon201"},
		{id:202, pId:2, name:"天津快乐十分", file:"${ctx}/lottery/gc/tjk10.do", iconSkin:"icon202"},
		{id:203, pId:2, name:"湖南快乐十分", file:"${ctx}/lottery/gc/hnk10.do", iconSkin:"icon203"},
		{id:204, pId:2, name:"广西快乐十分", file:"${ctx}/lottery/gc/gxk10.do", iconSkin:"icon204"},
		{id:205, pId:2, name:"幸运农场", file:"${ctx}/lottery/gc/xync.do", iconSkin:"icon205"},

		{id:3, pId:0, name:"快3", open:true, iconSkin:"pIcon03"},
		{id:301, pId:3, name:"江苏骰宝(快3)", file:"${ctx}/lottery/gc/jsk3.do", iconSkin:"icon301"},
		{id:302, pId:3, name:"安徽快3", file:"${ctx}/lottery/gc/ahk3.do", iconSkin:"icon302"},
		{id:303, pId:3, name:"吉林快3", file:"${ctx}/lottery/gc/jlk3.do", iconSkin:"icon303"},
		{id:304, pId:3, name:"广西快3", file:"${ctx}/lottery/gc/gxk3.do", iconSkin:"icon304"},

		{id:4, pId:0, name:"北京赛车", file:"${ctx}/lottery/gc/bjsc.do", open:true, iconSkin:"pIcon04"},

		{id:5, pId:0, name:"北京快乐8", file:"${ctx}/lottery/gc/bjk8.do", open:true, iconSkin:"pIcon05"},

		{id:6, pId:0, name:"六合彩", file:"${ctx}/lottery/gc/lhc.do", open:true, iconSkin:"pIcon06"},
	];

	$(document).ready(function(){
		var t = $("#tree");
		t = $.fn.zTree.init(t, setting, zNodes);
		demoIframe = $("#CaiZhongIframe");
		demoIframe.bind("load", loadReady);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("id", 101));

	});

	function loadReady() {
		var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
		htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
		maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
		h = demoIframe.height() >= maxH ? minH:maxH ;
		if (h < 530) h = 530;
		demoIframe.height(h);
	}

  //-->
  </SCRIPT>
	<style type="text/css">
.ztree li span.button.pIcon01_ico_open{margin-right:2px; background: url(${ctx}/plugin/zTree/img/diy/1_open.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.pIcon01_ico_close{margin-right:2px; background: url(${ctx}/plugin/zTree/img/diy/1_close.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.pIcon02_ico_open, .ztree li span.button.pIcon02_ico_close{margin-right:2px; background: url(${ctx}/plugin/zTree/img/diy/2.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon101_ico_docu{margin-right:2px; background: url(${ctx}/plugin/zTree/img/diy/3.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon102_ico_docu{margin-right:2px; background: url(${ctx}/plugin/zTree/img/diy/4.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon103_ico_docu{margin-right:2px; background: url(${ctx}/plugin/zTree/img/diy/5.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon104_ico_docu{margin-right:2px; background: url(${ctx}/plugin/zTree/img/diy/6.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon105_ico_docu{margin-right:2px; background: url(${ctx}/plugin/zTree/img/diy/7.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon106_ico_docu{margin-right:2px; background: url(${ctx}/plugin/zTree/img/diy/8.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
	</style>

<div class="cainav .col-xs-3">
    <ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul>
</div>

    <script type="text/javascript">
		
	    function showTab(obj){
	    	var submenu = $(".submenu");
	    	for(var i=0;i<submenu.length;i++){
	    		var vv = submenu.eq(i).css("display");
	    		if(vv=="block"){
	    			if((i+1)==obj){
	    				return;
	    			}
	    		}
	    	}
	    	
	    	if(obj==1){
	    		window.location.href="${ctx}/ssc/index.do?poolId=7";
	    	}else if(obj==2){
	    		window.location.href="${ctx}/gdsf/zhupan.do";
	    	}else if(obj==3){
	    		window.location.href="${ctx}/jssb/zhupan.do";
	    	}else if(obj==4){
	    		window.location.href="${ctx}/bjsc/zhupan.do";
	    	}else if(obj==5){
	    		window.location.href="${ctx}/bjkl8/xuanhao.do";
	    	}else if(obj==6){
	    		window.location.href="${ctx}/lhc/tbh.do";
	    	}
	    
	    	
	    }

    </script>