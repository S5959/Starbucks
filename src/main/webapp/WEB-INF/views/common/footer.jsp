<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<footer id="footer">
	<div class="footer_wrap">
		<div class="footer_menus">
			<!-- MOBILE GNB 영역 -->
			<ul class="footer_first_menu">
				<li class="footer_menu_ttl">
					<a class="en" href="javascript:void(0);">CUSTOMER SERVICE & IDEAS<span class="footer_arrow_down"></span></a>
				</li>
				<li><a href="https://www.starbucks.co.kr/util/faq.do" target="_blank">자주하는 질문</a></li>
				<li><a href="https://www.starbucks.co.kr/customer/suggestionWrite.do" target="_blank">고객의 소리</a></li>
				<li class="footer_2depth_ttl">
					<a href="javascript:void(0);">스타벅스 이용 팁<span class="footer_arrow_down"></span></a>
					<ul>
						<li><a href="https://www.starbucks.co.kr/util/web_tip.do" target="_blank">홈페이지 이용 팁</a></li>
						<li><a href="https://www.starbucks.co.kr/util/app_tip.do" target="_blank">애플리케이션 이용 팁</a></li>
						<li><a href="https://www.starbucks.co.kr/util/partnership_card.do" target="_blank">제휴카드 안내</a></li>
					</ul>
				</li>
				<li><a href="https://www.starbucks.co.kr/util/online_survey.do" target="_blank">고객경험 설문조사</a></li>
				<li><a href="https://www.starbucks.co.kr/util/guest_eReceipt.do" target="_blank">비회원 전자영수증 조회</a></li>
			</ul>
			<!-- MOBILE GNB 영역 end -->
			<ul>
				<li class="footer_menu_ttl">
					<a class="en" href="javascript:void(0);">COMPANY<span class="footer_arrow_down"></span></a>
				</li>
				<li><a href="https://www.starbucks.co.kr/footer/company/index.do" target="_blank">한눈에 보기</a></li>
				<li><a href="https://www.starbucks.co.kr/footer/company/mission.do" target="_blank">스타벅스 사명</a></li>
				<li class="footer_2depth_ttl">
					<a href="javascript:void(0);">스타벅스 소개<span class="footer_arrow_down"></span></a>
					<ul>
						<li><a href="https://www.starbucks.co.kr/footer/company/starbucks_information.do" target="_blank">스타벅스커피코리아</a></li>
						<li><a href="https://www.starbucks.co.kr/footer/company/starbucks_history.do" target="_blank">연혁 및 외부 수상 내역</a></li>
						<li><a href="https://www.starbucks.co.kr/footer/company/starbucks_story.do" target="_blank">스타벅스 이야기</a></li>
					</ul>
				</li>
				<li><a href="https://www.starbucks.co.kr/footer/company/news_list.do" target="_blank">국내 뉴스룸</a></li>
				<li><a href="https://www.starbucks.com/store-locator?map=39.635307,-101.337891,5z" target="_blank">세계의 스타벅스</a></li>
				<li><a href="https://stories.starbucks.com/" target="_blank">글로벌 뉴스룸</a></li>
			</ul>
			<ul>
				<li class="footer_menu_ttl">
					<a class="en" id="goPage" href="javascript:void(0);">CORPORATE SALES<span class="footer_arrow_down"></span></a>
				</li>
				<li><a href="https://www.starbucks.co.kr/footer/co_sales/index.do" target="_blank">단체 및 기업 구매 안내</a></li>
			</ul>
			<ul>
				<li class="footer_menu_ttl">
					<a class="en" href="javascript:void(0);">PARTNERSHIP<span class="footer_arrow_down"></span></a>
				</li>
				<li><a href="https://www.starbucks.co.kr/footer/partnership/new_partner.do" target="_blank">신규 입점 제의</a></li>
				<li><a href="https://www.starbucks.co.kr/srm/login.do" target="_blank">협력 고객사 등록신청</a></li>
			</ul>
			<ul>
				<li class="footer_menu_ttl">
					<a class="en" href="javascript:void(0);">ONLINE COMMUNITY<span class="footer_arrow_down"></span></a>
				</li>
				<li><a href="https://www.facebook.com/starbuckskorea" target="_blank">페이스북</a></li>
				<li><a href="https://twitter.com/StarbucksKorea" target="_blank">트위터</a></li>
				<li><a href="https://www.youtube.com/user/starbuckskorea" target="_blank">유튜브</a></li>
				<li><a href="http://www.istarbucksblog.co.kr/" target="_blank">블로그</a></li>
				<li><a href="https://instagram.com/starbuckskorea/" target="_blank">인스타그램</a></li>
			</ul>
			<ul>
				<li class="footer_menu_ttl">
					<a class="en" href="javascript:void(0);">RECRUIT<span class="footer_arrow_down"></span></a>
				</li>
				<li><a href="https://www.starbucks.co.kr/footer/recruit/index.do" target="_blank">채용 소개</a></li>
				<li><a href="http://job.shinsegae.com/recruit_info/notice/notice02_view.jsp?notino=2895" target="_blank">채용 지원하기</a></li>
			</ul>
		</div>
	</div>
	<!-- MOBILE GNB 영역 -->
	<div class="footer_util_btn">
		<ul>
			<li><a href="${pageContext.request.contextPath}/">HOME</a></li>
			<li>
				<a href="#" class="sign_in">Sign In</a>
				<a href="#" class="sign_out" style="display: none;">Sign Out</a>
			</li>
			<li class="last"><a href="#">Join Us</a></li>
		</ul>
	</div>
	<!-- MOBILE GNB 영역 end -->
	<!-- 수상내역 -->
	<div class="footer_awards_wrap">
		<div class="footer_awards_wrap_inner">
			<!-- awards BxSlider end -->
			<div class="footer_slider_controller">
				<div class="footer_slider_controls"></div>
				<div class="footer_slider_pagers"></div>
			</div>
		</div>
	</div>
	<!-- 수상내역 end -->
	
	<!-- 이용약관 및 방침 -->
	<aside class="copyright">
		<a href="https://www.starbucks.co.kr/footer/etc/privacy.do" class="c_00b050" target="_blank">개인정보처리방침</a> 
		<a href="https://www.starbucks.co.kr/footer/etc/rules_vod.do" class="mbn" target="_blank">영상정보처리기기 운영관리 방침</a>
		<a href="https://www.starbucks.co.kr/footer/etc/rules.do" target="_blank">홈페이지 이용약관</a> 
		<a href="https://www.starbucks.co.kr/footer/etc/rules_loc.do" class="mbn" target="_blank">위치정보 이용약관</a>
		<a href="https://www.starbucks.co.kr/footer/etc/rules_msr.do" class="mbn" target="_blank">스타벅스 카드 이용약관</a>
		<a href="https://www.starbucks.co.kr/footer/etc/rules_non.do" class="mbn" target="_blank">비회원 이용약관</a>
		<a href="https://www.starbucks.co.kr/footer/etc/rules_mdp.do" target="_blank">My DT Pass 서비스 이용약관</a>
		<a href="https://www.starbucks.co.kr/footer/etc/hotline.do" class="last" target="_blank">윤리경영 핫라인</a>
		<br>
		<a class="btned_link" href="https://www.starbucks.co.kr/footer/etc/coming_route.do" target="_blank">찾아오시는 길</a>
		<a class="btned_link" href="https://www.starbucks.co.kr/footer/partnership/new_partner.do" target="_blank">신규입점제의</a>
		<a class="btned_link" href="https://www.starbucks.co.kr/footer/etc/sitemap.do" target="_blank">사이트 맵</a>
		<br>
		<ul class="copy_menu">
			<li>사업자등록번호 : 201-81-21515</li>
			<li>(주)스타벅스커피 코리아 대표이사 : 송 데이비드 호섭</li>
			<li>TEL : 1522-3232</li>
			<li>개인정보 책임자 : 장석현</li>
		</ul>
		<span class="en">ⓒ 2020 Starbucks Coffee Company. All Rights Reserved.</span>
	</aside>
	<!-- 이용약관 및 방침 -->
</footer>