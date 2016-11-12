<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="lottoBet" class="clear mbtop"
	style="height: 36px; width: 97%; max-width: 97%; margin: 20px 1.5%;">
	<ul id="chiplisttm" class="chiplist l">
		<li id="C50" class="c50" onmousemove="moveOnChips('50');"
			onmouseout="outOnChips('50');" onmousedown="selectChipsBet('50');"
			onmouseup="setChips('50');"></li>
		<li id="C100" class="c100" onmousemove="moveOnChips('100');"
			onmouseout="outOnChips('100');" onmousedown="selectChipsBet('100');"
			onmouseup="setChips('100');"></li>
		<li id="C500" class="c500" onmousemove="moveOnChips('500');"
			onmouseout="outOnChips('500');" onmousedown="selectChipsBet('500');"
			onmouseup="setChips('500');"></li>
		<li id="C1000" class="c1000" onmousemove="moveOnChips('1000');"
			onmouseout="outOnChips('1000');"
			onmousedown="selectChipsBet('1000');" onmouseup="setChips('1000');"></li>
		<li id="C5000" class="c5000" onmousemove="moveOnChips('5000');"
			onmouseout="outOnChips('5000');"
			onmousedown="selectChipsBet('5000');" onmouseup="setChips('5000');"></li>
		<li id="C10000" class="c10000" onmousemove="moveOnChips('10000');"
			onmouseout="outOnChips('10000');"
			onmousedown="selectChipsBet('10000');" onmouseup="setChips('10000');"></li>
	</ul>
	<ul class="r betting-form">
		<li>快速下注</li>
		<li><input name="" type="text" class="input-text width-s1"
			id="kuaijiexiaju_input" maxlength="9" size="9"
			onkeyup="forceInteger(this);" onblur="forceInteger(this);"></li>
		<li><input type="button" class="btn btn-gray width-s5"
			value="取 消" id="reset_top" onclick="cleanBetItmes();"></li>
	</ul>
</div>