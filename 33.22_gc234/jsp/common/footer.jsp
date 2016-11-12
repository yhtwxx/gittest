<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-8 none">
                <a href="${ctx}/about.do"><spring:message code="public.aboutUs"/></a>
                <a href="${ctx}/contact.do"><spring:message code="public.contactUs"/></a>
                <a href="${ctx}/law.do"><spring:message code="public.legalStatement"/></a>
                <a href="${ctx}/howcun.do"><spring:message code="public.howToDeposit"/></a>
                <a href="${ctx}/howqu.do"><spring:message code="public.howToWithdrawMoney"/></a>
                <a href="${ctx}/partner.do"><spring:message code="public.partners"/></a>
                <a href="${ctx}/notice.do"><spring:message code="public.latestAnnouncement"/></a>
                <a href="${ctx}/faq.do"><spring:message code="public.commonProblem"/></a>
                <a href="${ctx}/download.do"><spring:message code="public.softwareDownload"/></a>
                <a href="${ctx}/line.do"><spring:message code="public.lineDetection"/></a>
            </div>
            <div class="col-md-4 text-right copyright">
                <spring:message code="public.copyright"/>© 2015 gc234.com All Rights Reserved
            </div>
        </div>
    </div>
</footer>

    <!-- ============= 低版本浏览器兼容性提示 ============= -->
    <link rel="stylesheet" href="${ctx}/plugin/outdatedbrowser/outdatedbrowser.min.css">
    <div id="outdated"></div>


    <!-- javascript includes -->
    <script src="${ctx}/plugin/outdatedbrowser/outdatedbrowser.min.js"></script>

    <!-- plugin call -->
    <script>
        //event listener form DOM ready
        function addLoadEvent(func) {
            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = func;
            } else {
                window.onload = function() {
                    if (oldonload) {
                        oldonload();
                    }
                    func();
                }
            }
        }
        //call function after DOM ready
        addLoadEvent(function(){
            outdatedBrowser({
                bgColor: '#f25648',
                color: '#ffffff',
                lowerThan: 'transform',
                languagePath: '${ctx}/plugin/outdatedbrowser/lang/zh-cn.html'
            })
        });
    </script>