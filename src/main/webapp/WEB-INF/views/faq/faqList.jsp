<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문 | Starucks Coffee Korea</title>
	<link href="${pageContext.request.contextPath}/resources/css/common/reset.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/common/header.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/myPage/faqList.css?v=1" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
	
	
	<!--subtitle-->
     <div class="ms_sb_tit_bg">
        <div class="ms_sub_tit_inner">
            <h4><img alt="My 음료/매장" src="${pageContext.request.contextPath}/resources/images/myPage/msr_tit2.jpg"></h4>
            <ul class="smap">
                <li><a href="/"><i class="xi-home-o"></i></a></li>
                <li><a href="/"><i class="xi-angle-right-min"></a></i></li>
                <li><a href="/my/index.do">STARBUCKS REWARDS</a></li>
                 <li><a href="/"><i class="xi-angle-right-min"></a></i></li>
					<li><a href="/my/index.do">${board}</a></li>

            </ul>
        </div>
    </div>
    <!-- subtitle end -->
    
     <div id="container">
     <input type="hidden" name="curPage" id="curPage">
        <!--자주하는 질문-->
        <section class="faq_section">
            <p class="msr_t1"><span class="subHeadMnu2">${board}</span>에 대한 궁금점이 많으신가요?고객님의 문의사항에 대한 답변을 빠르게 찾으실 수 있습니다.</p>
            <div class="faq_search">
                <div class="search_input">
                 <form action="./${title}List">
                    <input type="text" id="search" name="search">
                    <button class="btn" type="submit">
                    		검색
                    </button>
                 </form>
                </div>
            </div>

            <!--faq 게시글 부분-->
            <div>
            	<dl class="faq_wrap">
            		<c:forEach items="${list}" var="dto">
            			<dt class="ajaxFaqList on">
            				<ul>
            					<li class="li2">
            						<dl>
            						<dt class="en">Q</dt>
            						<dd>${dto.question}</dd>	
	            					</dl>
    	        				</li>
            				
        	    			</ul>
            			</dt>
            			<dd style="display: none">
            				<ul>
            					<li class="li2">
            						<dl>
            						<dt class="en">A</dt>
            						<dd><a href="#">${dto.answer}</a></dd>
            						</dl>
            					</li>
            				</ul>
            			</dd>
            		
             		</c:forEach>
           		</dl>
             </div>
           
           <!-- pagination -->
           <div class="faq_pagination">
           	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i"> 
				<ul class="pager">
				<a href="./${title}List?curPage=${i}&search=${pager.search}"> ${i}</a> 
				</ul>
			</c:forEach> 
           </div> 
        </section>
    </div>
	
	<script src="${pageContext.request.contextPath}/resources/js/common/header.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/myPage/faq.js"></script>
</body>
</html>