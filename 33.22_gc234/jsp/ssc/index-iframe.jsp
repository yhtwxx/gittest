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
		{id:101, pId:1, name:"重庆时时彩", file:"index.do?poolId=7", iconSkin:"icon101"},
		{id:102, pId:1, name:"天津时时彩", file:"core/simpleData", iconSkin:"icon102"},
		{id:103, pId:1, name:"新疆时时彩", file:"core/noline"},
		{id:104, pId:1, name:"江西时时彩", file:"core/noicon"},
		{id:105, pId:1, name:"云南时时彩", file:"core/custom_icon"},
		{id:106, pId:1, name:"上海时时乐", file:"core/custom_iconSkin"},

		{id:2, pId:0, name:"快乐十分", open:false},
		{id:201, pId:2, name:"广东快乐十分", file:"excheck/checkbox"},
		{id:202, pId:2, name:"天津快乐十分", file:"excheck/checkbox_nocheck"},
		{id:203, pId:2, name:"湖南快乐十分", file:"excheck/checkbox_chkDisabled"},
		{id:204, pId:2, name:"广西快乐十分", file:"excheck/checkbox_halfCheck"},
		{id:205, pId:2, name:"幸运农场", file:"excheck/checkbox_count"},

		{id:3, pId:0, name:"快3", open:false},
		{id:301, pId:3, name:"江苏骰宝(快3)", file:"exedit/drag"},
		{id:302, pId:3, name:"安徽快3", file:"exedit/drag_super"},
		{id:303, pId:3, name:"吉林快3", file:"exedit/drag_fun"},
		{id:304, pId:3, name:"广西快3", file:"exedit/edit"},

		{id:4, pId:0, name:"北京赛车", open:false},
		{id:401, pId:4, name:"北京赛车", file:"bigdata/common"},

		{id:5, pId:0, name:"北京快乐8", open:false},
		{id:501, pId:5, name:"北京快乐8", file:"super/oneroot"},

		{id:6, pId:0, name:"六合彩", open:false},
		{id:601, pId:6, name:"香港六合彩", file:"exhide/common"},
	];

	$(document).ready(function(){
		var t = $("#tree");
		t = $.fn.zTree.init(t, setting, zNodes);
		demoIframe = $("#testIframe");
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
.ztree li span.button.pIcon01_ico_open{margin-right:2px; background: url(../plugin/zTree/img/diy/1_open.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.pIcon01_ico_close{margin-right:2px; background: url(../plugin/zTree/img/diy/1_close.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.pIcon02_ico_open, .ztree li span.button.pIcon02_ico_close{margin-right:2px; background: url(../plugin/zTree/img/diy/2.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon101_ico_docu{margin-right:2px; background: url(../plugin/zTree/img/diy/3.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon102_ico_docu{margin-right:2px; background: url(../plugin/zTree/img/diy/4.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon03_ico_docu{margin-right:2px; background: url(../plugin/zTree/img/diy/5.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon04_ico_docu{margin-right:2px; background: url(../plugin/zTree/img/diy/6.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon05_ico_docu{margin-right:2px; background: url(../plugin/zTree/img/diy/7.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon06_ico_docu{margin-right:2px; background: url(../plugin/zTree/img/diy/8.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
	</style>
</head>

<body>

<!--头部-->
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="caicontainer row">
    <jsp:include page="../common/cainav.jsp"></jsp:include>
    <div class="caicontent .col-xs-9">

    <IFRAME ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO width=100%  height=600px SRC="index.do?poolId=7"></IFRAME>

    </div>
    <div class="clearfix"></div>
</div>

<!--尾部-->
<jsp:include page="../common/footer.jsp"></jsp:include>

<jsp:include page="../common/showSg.jsp"></jsp:include>
<jsp:include page="../common/showGz.jsp"></jsp:include>
</body>
</html>
