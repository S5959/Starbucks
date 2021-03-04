<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header id="header">
	<!-- WEB GNB 영역 -->
	<div id="mstopWrap">
		<div id="gnb">
			<!-- 서브 gnb -->
			<div class="sub_gnb_wrap">
				<div class="sub_gnb_wrap_inner">
					<h1 class="logo">
						<a href="${pageContext.request.contextPath}/" title="스타벅스 메인페이지">스타벅스 코리아</a>
					</h1>
					<nav class="util_nav">
						<ul>
							<!-- 로그인하면 활성화
							<li class="util_nav01 sign_out" style="display:none;"><a href="#">Sign out</a></li> -->
							<c:choose>
								<c:when test="${not empty member}">
									<li class="util_nav01 sign_out"><a href="https://kauth.kakao.com/oauth/logout?client_id=3ac929f4709593497dba068a1f72cc96&logout_redirect_uri=http://localhost${pageContext.request.contextPath}/member/memberLogout&state=logout HTTP/1.1">Sign out</a></li>
									<li class="util_nav02"><a href="${pageContext.request.contextPath}/my/myIndex">My Starbucks</a></li>
								</c:when>
								<c:otherwise>
									<li class="util_nav01 sign_in"><a href="${pageContext.request.contextPath}/member/memberLogin">Sign In</a></li>
									<li class="util_nav02"><a href="${pageContext.request.contextPath}/member/memberLogin">My Starbucks</a></li>
								</c:otherwise>
							</c:choose>
							<li class="util_nav03"><a href="#">Customer Service & Ideas</a></li>
							<li class="util_nav04"><a href="${pageContext.request.contextPath}/store/storeMap">Find a Store</a></li>
						</ul>
					</nav>

					<p class="btn_search">
						<a href="#"><img alt="통합검색" src="${pageContext.request.contextPath}/resources/images/common/header/icon_magnifier_black.png"></a>
						<label for=totalSearch" class="ally">통합 검색</label>
						<input type="text" id="totalSearch" placeholder="통합검색">
					</p>
				</div>
				<nav class="sub_gnb_nav">
					<div class="sub_gnb_nav_inner">
						<ul>
							<!-- COFFEE -->
							<li class="gnb_nav01">
								<h2><a href="#">COFFEE</a></h2>		
								<div class="gnb_sub_wrap" style="display:none;">
									<!-- COFFEE 서브 메뉴 -->
									<div class="gnb_sub">
										<div class="gnb_sub_inner">
											<ul>
												<li class="gnb_sub_ttl"><a href="#">나와 어울리는 커피</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">스타벅스 리저브</a></li>
												<li><a href="#">REWERVE MAGAZINE</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">에스프레소 음료</a></li>
												<li><a href="#">도피오</a></li>
												<li><a href="#">에스프레소 마키아또</a></li>
												<li><a href="#">아메리카노</a></li>
												<li><a href="#">마키아또</a></li>
												<li><a href="#">카푸치노</a></li>
												<li><a href="#">라뗴</a></li>
												<li><a href="#">모카</a></li>
												<li><a href="#">리스트레또 비안코</a></li>
											</ul>
											<ul>
								 				<li class="gnb_sub_ttl"><a href="#">최상의 커피를 즐기는 법</a></li>
												<li><a href="#">커피 프레스</a></li>
												<li><a href="#">푸어 오버</a></li>
												<li><a href="#">아이스 푸어 오버</a></li>
												<li><a href="#">커피 메이커</a></li>
												<li><a href="#">리저브를 매장에서 다양하게 즐기는 법</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">커피이야기</a></li>
												<li><a href="#">스타벅스 로스트 스팩트럼</a></li>
												<li><a href="#">최상의 아라비카 원두</a></li>
												<li><a href="#">한잔의 커피가 완성되기까지</a></li>
												<li><a href="#">클로버® 커피 추출 시스템</a></li>
												<li><a href="#">스타벅스 디카페인</a></li>
											</ul>
										</div>
									</div>
									<!-- coffee 서브 메뉴 end -->
									<!-- 텍스쳐 bg -->
									<div class="gnb_sub_txbg">
										<div class="gnb_sub_tx_inner">
											<div class="gnb_sub_tx_left">
												<h3><a href="#">나와 어울리는 커피 찾기</a></h3>
												<p class="gnb_sub_ex_txt">스타벅스가 여러분에게 어울리는 커피를 찾아드립니다.</p>
												<h3><a href="#">최상의 커피를 즐기는 법</a></h3>
												<p class="gnb_sub_ex_txt">여러가지 방법을 통해 다양한 풍미의 커피를 즐겨보세요.</p>
												</div>
											<div class="gnb_sub_tx_right"></div>
										</div>
									</div>
									<!-- 텍스쳐 bg end -->
								</div>
							</li>							
							<!-- COFFEE end-->
							
							<!-- MENU -->
							<li class="gnb_nav02">
								<h2><a href="${pageContext.request.contextPath}/menu/menuDrink" class="">MENU</a></h2>
								<div class="gnb_sub_wrap" style="display:none;">
									<!-- MENU 서브 메뉴 -->
									<div class="gnb_sub">
										<div class="gnb_sub_inner">
											<ul>
												<li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/menu/menuDrink">음료</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuDrink?category=콜드 브루">콜드 브루</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuDrink?category=브루드 커피">브루드 커피</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuDrink?category=에스프레소">에스프레소</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuDrink?category=프라푸치노">프라푸치노</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuDrink?category=블렌디드">블렌디드</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuDrink?category=스타벅스 피지오">스타벅스 피지오</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuDrink?category=티">티(티바나)</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuDrink?category=기타 제조 음료">기타 제조 음료</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuDrink?category=스타벅스 주스(병음료)">스타벅스 주스(병음료)</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/menu/menuFood">푸드</a></li>	
												<li><a href="${pageContext.request.contextPath}/menu/menuFood?category=브레드">브레드</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuFood?category=케이크">케이크</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuFood?category=샌드위치&샐러드">샌드위치 & 샐러드</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuFood?category=따뜻한 푸드">따뜻한 푸드</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuFood?category=과일&요거트">과일 & 요거트</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuFood?category=스낵&미니디저트">스낵 & 미니디저트</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuFood?category=아이스크림">아이스크림</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/menu/menuProduct">상품</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuProduct?category=머그">머그</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuProduct?category=글라스">글라스</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuProduct?category=플라스틱 텀블러">플라스틱 텀블러</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuProduct?category=스테인리스 텀블러">스테인리스 텀블러</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuProduct?category=보온병">보온병</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuProduct?category=악세서리">악세서리</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuProduct?category=커피 용품">커피 용품</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuProduct?category=패키지 티">패키지 티(티바나)</a></li>
												<li><a href="${pageContext.request.contextPath}/menu/menuProduct?category=스타벅스 플래너">스타벅스 플래너</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">커피</a></li>
												<li><a href="#">스타벅스 원두</a></li>
												<li><a href="#">스타벅스 비아</a></li>
												<li><a href="#">스타벅스 오리가미</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">카드</a></li>
												<li><a href="#">실물카드</a></li>
												<li><a href="#">e-Gift카드</a></li>
											</ul>
										</div>
									</div>
									<!-- MENU 서브 메뉴 end -->
									<!-- 텍스쳐 bg -->
									<div class="gnb_sub_txbg">
										<div class="gnb_sub_tx_inner">
											<div class="gnb_sub_tx_left">
												<h3>
													<a href="#">나이트로 콜드 브루</a>
													<img src="${pageContext.request.contextPath}/resources/images/common/header/icon_gnb_new.png">
												</h3>
												<p class="gnb_sub_ex_txt">나이트로 커피 정통의 물결치듯 흘러내리는 캐스케이딩과 부드러운 크림을 경험하세요.</p>
											</div>
											<div class="gnb_sub_tx_right"></div>
										</div>
									</div>
									<!-- 텍스쳐 bg end -->
								</div>
							</li>
							<!-- MENU end -->

							<!-- STORE -->
							<li class="gnb_nav03">
								<h2><a href="#">STORE</a></h2>
								<div class="gnb_sub_wrap" style="display:none;">
									<!-- STORE 서브 메뉴 -->
									<div class="gnb_sub">
										<div class="gnb_sub_inner">
											<ul>
												<li class="gnb_sub_ttl"><a href="#">매장 찾기</a></li>
												<li><a href="#">퀵 검색</a></li>
												<li><a href="#">지역 검색</a></li>
												<li><a href="#">My 매장</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">드라이브 스루 매장</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">스타벅스 리저브™ 매장</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">커뮤니티 스토어 매장</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">매장 이야기</a></li>
												<li><a href="#">청담스타</a></li>
												<li><a href="#">타바나 바 매장</a></li>
												<li><a href="#">파미에파크</a></li>
											</ul>
										</div>
									</div>
									<!-- STORE 서브 메뉴 end -->
									<!-- 텍스쳐 bg -->
									<div class="gnb_sub_txbg">
										<div class="gnb_sub_tx_inner">
											<div class="gnb_sub_tx_left">
												<h3><a href="#">매장 찾기</a></h3>
												<p class="gnb_sub_ex_txt">보다 빠르게 매장을 찾아보세요</p>
												<h3>
													<a href="#">이대R점</a>
													<img src="${pageContext.request.contextPath}/resources/images/common/header/icon_gnb_new.png" alt="">
												</h3>
												<p class="gnb_sub_ex_txt">1호점 특화 MD와 티바나 티, 최고의 리저브 커피를 만나보세요.</p>
											</div>
											<div class="gnb_sub_tx_right"></div>
										</div>
									</div>
									<!-- 텍스쳐 bg end -->
								</div>
							</li>
							<!-- STORE end -->

							<!-- RESPONSIBILITY -->
							<li class="gnb_nav04">
								<h2><a href="#">RESPONSIBILITY</a></h2>
								<div class="gnb_sub_wrap" style="display:none;">
									<!-- STORE 서브 메뉴 -->
									<div class="gnb_sub">
										<div class="gnb_sub_inner">
											<ul>
												<li class="gnb_sub_ttl"><a href="#">사회 공헌 캠페인 소개</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">지역 사회 참여 활동</a></li>
												<li><a href="#">희망배달 캠페인</a></li>
												<li><a href="#">재능기부 카페 소식</a></li>
												<li><a href="#">커뮤니티 스토어</a></li>
												<li><a href="#">청년인재 양성</a></li>
												<li><a href="#">우리 농산물 사랑 캠페인</a></li>
												<li><a href="#">우리 문화 지키기</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">환경보호 활동</a></li>
												<li><a href="#">환경 발자국 줄이기</a></li>
												<li><a href="#">일회용 컵 없는 매장</a></li>
												<li><a href="#">커피 원두 재활용</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">윤리구매</a></li>
												<li><a href="#">윤리적 원두 구매</a></li>
												<li><a href="#">공정무역 인증</a></li>
												<li><a href="#">커피 농가 지원 활동</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">글로벌 사회 공헌</a></li>
												<li><a href="#">윤리경영 보고서</a></li>
												<li><a href="#">스타벅스 재단</a></li>
												<li><a href="#">지구촌 봉사의 달</a></li>
											</ul>
										</div>
									</div>
									<!-- STORE 서브 메뉴 end -->
									<!-- 텍스쳐 bg -->
									<div class="gnb_sub_txbg">
										<div class="gnb_sub_tx_inner">
											<div class="gnb_sub_tx_left">
												<h3><a href="#">커피원두 재활용</a></h3>
												<p class="gnb_sub_ex_txt">스타벅스 커피 원두를 재활용해 보세요.</p>
											</div>
											<div class="gnb_sub_tx_right"></div>
										</div>
									</div>
									<!-- 텍스쳐 bg end -->
								</div>
							</li>
							<!-- RESPONSIBILITY end -->
							
							<!-- STARBUCKS REWARDS -->
							<li class="gnb_nav05">
								<h2><a href="#">STARBUCKS REWARDS</a></h2>
								<div class="gnb_sub_wrap" style="display:none;">
									<!-- STORE 서브 메뉴 -->
									<div class="gnb_sub">
										<div class="gnb_sub_inner">
											<ul>
												<li class="gnb_sub_ttl"><a href="#">스타벅스 리워드</a></li>
												<li><a href="#">스타벅스 리워드 소개</a></li>
												<li><a href="#">등급 및 혜택</a></li>
												<li><a href="#">스타벅스 별</a></li>
												<li><a href="${pageContext.request.contextPath}/faq/faqRewardList">자주하는 질문</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">스타벅스 카드</a></li>
												<li><a href="#">스타벅스 카드 소개</a></li>
												<li><a href="#">스타벅스 카드 갤러리</a></li>
												<li><a href="#">등급 및 조회</a></li>
												<li><a href="#">충전 및 이용안내</a></li>
												<li><a href="#">분실신고/환불신청</a></li>
												<li><a href="${pageContext.request.contextPath}/faq/faqCardList">자주하는 질문</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">스타벅스 e-Gift Card</a></li>
												<li><a href="#">스타벅스 e-Gift Card 소개</a></li>
												<li><a href="#">이용안내</a></li>
												<li><a href="#">선물하기</a></li>
												<li><a href="${pageContext.request.contextPath}/faq/faqGiftCardList">자주하는 질문</a></li>
											</ul>
										</div>
									</div>
									<!-- STORE 서브 메뉴 end -->
									<!-- 텍스쳐 bg -->
									<div class="gnb_sub_txbg">
										<div class="gnb_sub_tx_inner">
											<div class="gnb_sub_tx_left">
												<h3><a href="#">스타벅스 카드 등록하기</a></h3>
												<p class="gnb_sub_ex_txt">카드 등록 후 리워드 서비스를 누리고 사용내역도 조회해보세요.</p>
											</div>
											<div class="gnb_sub_tx_right"></div>
										</div>
									</div>
									<!-- 텍스쳐 bg end -->
								</div>
							</li>
							<!-- STARBUCKS REWARDS end -->
							
							<!-- WHAT'S NEW -->
							<li class="gnb_nav06">
								<h2><a href="#">WHAT'S NEW</a></h2>
								<div class="gnb_sub_wrap" style="display:none;">
									<!-- STORE 서브 메뉴 -->
									<div class="gnb_sub">
										<div class="gnb_sub_inner">
											<ul>
												<li class="gnb_sub_ttl"><a href="#">프로모션&이벤트</a></li>
												<li><a href="#">전체</a></li>
												<li><a href="#">스타벅스 카드</a></li>
												<li><a href="#">스타벅스 리워드</a></li>
												<li><a href="#">온라인</a></li>
												<li><a href="#">크리스마스 e-프리퀀시 증정품</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">새소식</a></li>
												<li><a href="#">전체</a></li>
												<li><a href="#">상품출시</a></li>
												<li><a href="#">스타벅스와 문화</a></li>
												<li><a href="#">스타벅스 사회공헌</a></li>
												<li><a href="#">스타벅스 카드 출시</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">매장별 이벤트</a></li>
												<li><a href="#">일반 매장</a></li>
												<li><a href="#">신규 매장</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">e-프리퀀시</a></li>
												<li><a href="#">이용안내</a></li>
												<li><a href="#">이용현황</a></li>
											</ul>
											<ul>
												<li class="gnb_sub_ttl"><a href="#">공지사항</a></li>
											</ul>
											<ul style="padding-top:30px; clear:both;">
												<li class="gnb_sub_ttl"><a href="#">월페이퍼</a></li>
											</ul>
										</div>
									</div>
									<!-- STORE 서브 메뉴 end -->
									<!-- 텍스쳐 bg -->
									<div class="gnb_sub_txbg">
										<div class="gnb_sub_tx_inner">
											<div class="gnb_sub_tx_left">
												<h3><a href="#">매장별 이벤트</a></h3>
												<p class="gnb_sub_ex_txt">스타벅스의 매장 이벤트 정보를 확인 하실 수 있습니다.</p>
												<h3><a href="#">월페이퍼</a></h3>
												<p class="gnb_sub_ex_txt">매월 업데이트되는 월페이퍼(PC/Mobile)로 스타벅스를 더욱 가깝게 즐겨보세요!</p>
											</div>
											<div class="gnb_sub_tx_right"></div>
										</div>
									</div>
									<!-- 텍스쳐 bg end -->
								</div>
							</li>
							<!-- WHAT'S NEW end -->
						</ul>
					</div>
				</nav>
			</div>
			<!-- 서브 gnb end -->
		</div>
	</div>	
	<!-- WEB GNB 영역 end -->
	
	<!-- ------------------------------------------------------------------------------------------------------------------------------- -->
	<!-- MOBILE GNB 영역 -->
	<!-- 960 gnb -->
	<div class="tablet_gnb_wrap">
		<h1 class="logo">
			<a href="${pageContext.request.contextPath}/">스타벅스 코리아</a>
		</h1>
		<nav class="tablet_gnb_sep">
			<ul>
				<li class="tablet_gnb01"></li>
				<c:choose>
				<c:when test="${not empty member}">
				<li class="tablet_gnb02">
					<a href="${pageContext.request.contextPath}/my/myIndex"><span class="ally">마이스타벅스</span></a>
				</li>
				</c:when>
				<c:otherwise>
				<li class="tablet_gnb02">
					<a href="${pageContext.request.contextPath}/member/memberLogin"><span class="ally">마이스타벅스</span></a>
				</li>
				</c:otherwise>
				</c:choose>
				<li class="tablet_gnb03">
					<a href="${pageContext.request.contextPath}/store/storeMap"><span class="ally">매장찾기</span></a>
				</li>
				<li class="tablet_gnb04">
					<a href="#"><span class="ally" role="button">메뉴열기</span></a>
				</li>
			</ul>
		</nav>
	</div>
	<!-- 960 gnb end -->

	<!-- 640 gnb -->
	<!-- 메뉴버튼을 눌렀을 때 -->
	<div class="mob_gnb_dimm"></div>
	<div class="mob_gnb_wrap">
		<div class="mob_gnb_wrap_inner">
			<aside class="btn_gnb_close">
				<a href="#" title="메뉴닫기" role="button">닫기</a>
			</aside>
			<div class="mob_gnb_search">
				<div class="mob_gnb_search_inner">
					<label for="search_text" class="ally">검색어</label>
					<input type="text" id="search_text" name="search_text"> <a href="#" class="mob_gnb_search_btn" titie="검색">Search</a>
				</div>
			</div>
			<nav class="mob_gnb_menus">
				<!-- My Starbucks -->
				<ul>
					<li class="mob_gnb_ttl1">
						<a role="button" class="en" href="#">My Starbucks<span class="mob_gnb_arrow_down"></span></a>
					</li>
					<li><a href="#">한눈에 보기</a></li>
					<li>
						<a role="button" href="${pageContext.request.contextPath}/my/myIndex">My 리워드<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#" required="login">리워드 및 혜택</a></li>
							<li><a href="${pageContext.request.contextPath}/my/myStarHistory" required="login">별 히스토리</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">My 스타벅스 카드<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">보유 카드</a></li>
							<li><a href="#">카드 등록</a></li>
							<li><a href="${pageContext.request.contextPath}/my/cardTopup">카드 충전</a></li>
							<li><a href="#">분실신고/잔액이전</a></li>
						</ul></li>
					<li>
						<a role="button" href="#">My 스타벅스 e-Gift Card<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">선물하기</a></li>
							<li><a href="#">선물 내역</a></li>
							<li><a href="#">장바구니 내역</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">My 쿠폰<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">등록하기</a></li>
							<li><a href="#">선물하기</a></li>
							<li><a href="#">사용하기</a></li>
						</ul></li>
					<li><a href="#">My 캘린더</a></li>
					<li><a href="#">My 메뉴</a></li>
					<li><a href="${pageContext.request.contextPath}/my/myStore">My 매장</a></li>
					<li>
						<a role="button" href="#">My e-프리퀀시<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">이용안내</a></li>
							<li><a href="#">이용현황</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/my/vocList">My 고객의 소리</a></li>
					<li><a href="#">전자영수증</a></li>
					<!-- <li class="msRnb_btn"><a href="#" onclick="fn_rewardTumblerMsrCheck();">개인컵 리워드 설정</a></li> -->
					<li><a href="#">My DT Pass</a></li>
					<!-- <li><a href="#">인박스</a></li> -->
					<li>
						<a role="button" href="#">개인정보관리<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/my/updateMyInfo">개인정보확인 및 수정</a></li>
							<li><a href="${pageContext.request.contextPath}/my/myInfoOut">회원 탈퇴</a></li>
							<li><a href="${pageContext.request.contextPath}/my/modifyPW">비밀번호 변경</a></li>
						</ul>
					</li>
				</ul>
				<!-- My Starbucks end -->
				<!-- COFFEE -->
				<ul>
					<li class="mob_gnb_ttl2">
						<a role="button" class="en" href="#">COFFEE<span class="mob_gnb_arrow_down"></span></a>
					</li>
					<li><a href="#">한눈에 보기</a></li>
					<li><a href="#">나와 어울리는 커피</a></li>
					<li>
						<a role="button" href="#">스타벅스 리저브™<span class="mob_gnb_arrow_down"></a>
						<ul>
							<li><a href="#">ABOUT</a></li>
							<li><a href="#">RESERVE MAGAZINE</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">에스프레소 음료<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">도피오</a></li>
							<li><a href="#">에스프레소 마키아또</a></li>
							<li><a href="#">아메리카노</a></li>
							<li><a href="#">마키아또</a></li>
							<li><a href="#">카푸치노</a></li>
							<li><a href="#">라떼</a></li>
							<li><a href="#">모카</a></li>
							<li><a href="#">리스트레또 비안코</a></li>
						</ul></li>
					<li>
						<a role="button" href="#">최상의 커피를 즐기는 법<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">커피 프레스</a></li>
							<li><a href="#">푸어 오버</a></li>
							<li><a href="#">아이스 푸어 오버</a></li>
							<li><a href="#">커피 메이커</a></li>
							<li><a href="#">리저브를 매장에서 다양하게 즐기는 법</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">커피 이야기<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">스타벅스 로스트 스팩트럼</a></li>
							<li><a href="#">최상의 아라비카 원두</a></li>
							<li><a href="#">한 잔의 커피가 완성되기까지</a></li>
							<li><a href="#">클로버® 커피 추출 시스템</a></li>
							<li><a href="#">스타벅스 디카페인</a></li>
						</ul>
					</li>
				</ul>
				<!-- COFFEE end -->
				<!-- MENU -->
				<ul>
					<li class="mob_gnb_ttl2">
						<a role="button" class="en" href="#">MENU<span class="mob_gnb_arrow_down"></span></a>
					</li>
					<li><a href="#">한눈에 보기</a></li>
					<li>
						<a role="button" href="#">음료<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">전체보기</a></li>
							<li><a href="#">콜드 브루</a></li>
							<li><a href="#">브루드 커피</a></li>
							<li><a href="#">에스프레소</a></li>
							<li><a href="#">프라푸치노</a></li>
							<li><a href="#">블렌디드</a></li>
							<li><a href="#">스타벅스 피지오</a></li>
							<li><a href="#">티(티바나)</a></li>
							<li><a href="#">기타 제조 음료</a></li>
							<li><a href="#">스타벅스 주스(병음료)</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">푸드<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">전체보기</a></li>
							<li><a href="#">브레드</a></li>
							<li><a href="#">케이크</a></li>
							<li><a href="#">샌드위치 & 샐러드</a></li>
							<li><a href="#">따뜻한 푸드</a></li>
							<li><a href="#">과일 & 요거트</a></li>
							<li><a href="#">스낵 & 미니 디저트</a></li>
							<li><a href="#">아이스크림</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">상품<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">전체보기</a></li>
							<li><a href="#">머그</a></li>
							<li><a href="#">글라스</a></li>
							<li><a href="#">플라스틱 텀블러</a></li>
							<li><a href="#">스테인리스 텀블러</a></li>
							<li><a href="#">보온병</a></li>
							<li><a href="#">액세서리</a></li>
							<li><a href="#">커피 용품</a></li>
							<li><a href="#">패키지 티(티바나)</a></li>
							<li><a href="#">스타벅스 플래너</a></li>
						</ul>
					</li>
					<li><a role="button" href="#">커피<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">스타벅스 원두</a></li>
							<li><a href="#">스타벅스 비아</a></li>
							<li><a href="#">스타벅스 오리가미</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">카드<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#o">전체보기</a></li>
							<li><a href="#">실물카드</a></li>
							<li><a href="#">e-Gift 카드</a></li>
						</ul>
					</li>
				</ul>
				<!-- MENU end -->
				<!-- STORE -->
				<ul>
					<li class="mob_gnb_ttl2">
						<a role="button" class="en" href="#">STORE<span class="mob_gnb_arrow_down"></span></a>
					</li>
					<li><a href="/store/index.do">한눈에 보기</a></li>
					<li>
						<a role="button" href="#">매장 찾기<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">빠른 검색</a></li>
							<li><a href="#">지역 검색</a></li>
							<li><a href="#">나만의 매장</a></li>
						</ul>
					</li>
					<li><a href="#">드라이브 스루 매장</a></li>
					<li><a href="#">스타벅스 리저브™ 매장</a></li>
					<li><a href="#">커뮤니티 스토어 매장</a></li>
					<li>
						<a role="button" href="#">매장 이야기<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">청담스타</a></li>
							<li><a href="#">티바나 바 매장</a></li>
							<li><a href="#">파미에파크</a></li>
						</ul>
					</li>
				</ul>
				<!-- STORE end -->
				<!-- RESPONSIBILITY -->
				<ul>
					<li class="mob_gnb_ttl2">
						<a role="button" class="en" href="#">RESPONSIBILITY<span class="mob_gnb_arrow_down"></span></a>
					</li>
					<li><a href="#">한눈에 보기</a></li>
					<li><a href="#">사회 공헌 캠페인 소개</a></li>
					<li>
						<a role="button" href="#">지역 사회 참여 활동<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="/responsibility/hope_delivery.do">희망배달 캠페인</a></li>
							<li><a href="/responsibility/talent_donation.do">재능기부 카페 소식</a></li>
							<li><a href="/responsibility/community_store.do">커뮤니티 스토어</a></li>
							<li><a href="/responsibility/youth_resource.do">청년인재 양성</a></li>
							<li><a href="/responsibility/our_agriculture.do">우리 농산물 사랑 캠페인</a></li>
							<li><a href="/responsibility/our_culture_defend.do">우리 문화 지키기</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">환경보호 활동<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">환경 발자국 줄이기</a></li>
							<li><a href="#">일회용 컵 없는 매장</a></li>
							<li><a href="#">커피 원두 재활용</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">윤리 구매<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">윤리적 원두 구매</a></li>
							<li><a href="#">공정무역 인증</a></li>
							<li><a href="#">커피 농가 지원 활동</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">글로벌 사회 공헌<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">윤리경영 보고서</a></li>
							<li><a href="#">스타벅스 재단</a></li>
							<li><a href="#">지구촌 봉사의 달</a></li>
						</ul>
					</li>
				</ul>
				<!-- RESPONSIBILITY end -->
				<!-- Starbucks Rewards -->
				<ul>
					<li class="mob_gnb_ttl2">
						<a role="button" class="en" href="#">Starbucks Rewards<span class="mob_gnb_arrow_down"></span></a>
					</li>
					<li><a href="#">한눈에 보기</a></li>
					<li>
						<a role="button" href="#">스타벅스 리워드<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">스타벅스 리워드 소개</a></li>
							<li><a href="#">등급 및 혜택</a></li>
							<li><a href="#">스타벅스 별</a></li>
							<li><a href="#">자주하는 질문</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">스타벅스 카드<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">스타벅스 카드 소개</a></li>
							<li><a href="#">스타벅스 카드 갤러리</a></li>
							<li><a href="#">등록 및 조회</a></li>
							<li><a href="#">충전 및 이용안내</a></li>
							<li><a href="#">분실신고/환불신청</a></li>
							<li><a href="#">자주하는 질문</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">스타벅스 e-Gift Card<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">스타벅스 e-Gift Card 소개</a></li>
							<li><a href="#">이용안내</a></li>
							<li><a href="#">선물하기</a></li>
							<li><a href="#">자주하는 질문</a></li>
						</ul>
					</li>
				</ul>
				<!-- Starbucks Rewards end -->
				<!-- WHAT'S NEW -->
				<ul>
					<li class="mob_gnb_ttl2">
						<a role="button" class="en" href="#">WHAT'S NEW<span class="mob_gnb_arrow_down"></span></a>
					</li>
					<li><a href="#">한눈에 보기</a></li>
					<li>
						<a role="button" href="#">프로모션 & 이벤트<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">전체</a></li>
							<li><a href="#">스타벅스 카드</a></li>
							<li><a href="#">스타벅스 리워드</a></li>
							<li><a href="#">온라인</a></li>
							<li><a href="#">크리스마스 e-프리퀀시 증정품</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">새소식<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">전체</a></li>
							<li><a href="#">상품 출시</a></li>
							<li><a href="#">스타벅스와 문화</a></li>
							<li><a href="#">스타벅스 사회공헌</a></li>
							<li><a href="#">스타벅스 카드출시</a></li>
						</ul>
					</li>
					<li>
						<a role="button" href="#">매장별 이벤트<span class="mob_gnb_arrow_down"></span></a>
						<ul>
							<li><a href="#">일반 매장</a></li>
							<li><a href="#">신규 매장</a></li>
						</ul>
					</li>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">월페이퍼</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- 640 gnb end -->

	<!-- MOBILE GNB 영역 end -->
</header>