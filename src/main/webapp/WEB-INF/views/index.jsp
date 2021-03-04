<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telphone=no">	

	<title>Starbucks Coffee Korea</title>

	<link href="${pageContext.request.contextPath}/resources/images/common/favicon.ico" rel="shortcut icon" type="image/ico">
	<link href="${pageContext.request.contextPath}/resources/css/common/reset.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/common/header.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/common/footer.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
	<!-- bxSlider CSS file -->
	<link href="${pageContext.request.contextPath}/resources/css/common/jquery.bxslider.css" rel="stylesheet">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- bxSlider Javascript file -->
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery.bxslider.min.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- Header -->
		<c:import url="./common/header.jsp"></c:import>
		<!-- Header End -->
		
		
		<!-- Main Container -->
		<div id="container">
			<!-- main top -->
			<div id="topWrap">
				<div class="main_visual_wrap">
					<div class="main_visual_inner">
						<div class="main_visual_slogan">
							<img src="${pageContext.request.contextPath}/resources/images/main/2020_xmas_slogan_1.png" alt="CARRY the MERRY" class="pc_slogan" />
							<img src="${pageContext.request.contextPath}/resources/images/main/m_2020_xmas_slogan_1.png" alt="CARRY the MERRY" class="m_slogan" />
						</div>
						<div class="main_visual_set">
							<div class="set_common set_01">
								<a href="#">
									<img src="${pageContext.request.contextPath}/resources/images/main/2020_xmas_latte.png" alt="토피 넛 라떼" class="pc_drink" />
									<img src="${pageContext.request.contextPath}/resources/images/main/m_2020_xmas_latte_1.png" alt="토피 넛 라떼" class="m_drink" />
								</a>
							</div>
							<div class="set_common set_02">
								<a href="#">
									<img src="${pageContext.request.contextPath}/resources/images/main/2020_xmas_popcorn_1.png" alt="토피 넛 팝콘 트리 프라푸치노" class="pc_drink" />
									<img src="${pageContext.request.contextPath}/resources/images/main/m_2020_xmas_popcorn_1.png" alt="토피 넛 팝콘 트리 프라푸치노" class="m_drink" />
								</a>
							</div>
							<div class="set_common set_03">
								<a href="#">
									<img src="${pageContext.request.contextPath}/resources/images/main/2020_xmas_relaxer_1.png" alt="캐모마일 릴렉서" class="pc_drink" />
									<img src="${pageContext.request.contextPath}/resources/images/main/m_2020_xmas_relaxer_1.png" alt="캐모마일 릴렉서" class="m_drink" />
								</a>
							</div>
							<div class="set_common set_04">
								<a href="#"> 
									<img src="${pageContext.request.contextPath}/resources/images/main/2020_xmas_blended.png" alt="다크 초콜릿 블렌디드" class="pc_drink" /> 
									<img src="${pageContext.request.contextPath}/resources/images/main/m_2020_xmas_blended_1.png" alt="다크 초콜릿 블렌디드" class="m_drink" />
								</a>
							</div>
							<div class="set_common set_05">
								<a href="#">
									<img src="${pageContext.request.contextPath}/resources/images/main/2020_xmas_chocolate.png" alt="다크 초콜릿" class="pc_drink" />
									<img src="${pageContext.request.contextPath}/resources/images/main/m_2020_xmas_chocolate_1.png" alt="다크 초콜릿" class="m_drink" />
								</a>
							</div>
						</div>
						<div class="btn_slogan">
							<a href="#"> 자세히 보기 </a>
						</div>
					</div>
				</div>
			</div>
			<!-- main top end -->
			
			<!-- 공지사항 -->
			<section class="line_notice">
				<div class="line_notice_left"></div>
				<div class="line_notice_right"></div>
				<div class="line_notice_bg">
					<div class="line_notice_bgl">
						<div class="line_notice_inner">
							<dl class="line_notice_inner_l">
								<dt class="notice_ttl">
									<img src="${pageContext.request.contextPath}/resources/images/main/notice_ttl.png" alt="공지사항">
								</dt>
								<dd>
									<ul class="news_result">
									</ul>
								</dd>
							</dl>
							<p class="line_notice_inner_r">
								<span><a href="javascript:void(0);" title="공지사항 더보기">더보기</a></span>
							</p>
						</div>
					</div>
					<div class="line_notice_bgr">
						<a href="javascript:void(0);">
							<p class="prom_ttl">스타벅스 프로모션</p>
							<span class="btn_prom">
								<img src="${pageContext.request.contextPath}/resources/images/main/btn_prom_down.png" alt="스타벅스 프로모션 펼쳐보기" role="button" />
							</span>
						</a>
					</div>
				</div>
			</section>
			<!-- 공지사항 end -->
		<%-- 
			<!-- 프로모션 배너 -->
			<section class="main_prom_bnr">
				<div class="main_prom_bnr_swiper slider">
					<ul class="main_prom_bxslider">
					</ul>
					<div class="main_slider_controller">
						<div class="main_slider_controls"></div>
						<div class="main_slider_pagers"></div>
					</div>
					<p class="main_prevBtn">
						<a href="javascript:void(0)"><span class="ally">이전 프로모션</span></a>
					</p>
					<p class="main_nextBtn">
						<a href="javascript:void(0)"><span class="ally">다음 프로모션</span></a>
					</p>
				</div>
			</section>
			<!-- 프로모션 배너 end -->
		--%>
			<!-- 스타벅스 리워드 -->
			<section class="new_rewards_wrap">
				<div class="new_rewards_inner">
					<div class="new_rewards_logo">
						<img src="${pageContext.request.contextPath}/resources/images/main/rewards-logo.png" alt="Starbucks Rewards" />
					</div>

					<div class="new_rewards_conts">
						<div class="info_cont">
							<div class="info_cont_txt">
								<h2>
									스타벅스만의 특별한 혜택,
									<br class="m_br"> <br class="pc_br"> <strong>스타벅스 리워드</strong>
								</h2>
								<p>
									<strong>스타벅스 회원이세요?</strong>
									<br class="m_br"> 로그인을 통해 <br class="pc_br">나만의 리워드를 확인해보세요. <br>
									<strong>스타벅스 회원이 아니세요?</strong>
									<br class="m_br"> <br class="pc_br">가입을 통해 리워드 혜택을 즐기세요.
								</p>
							</div>
							<div class="btn_signin_group">
								<a href="#" class="btn_signin_join">회원가입</a>
								<a href="#" class="btn_signin_login">로그인</a>
							</div>
						</div>

						<div class="gift_cont">
							<div class="gift_cont_txt">
								<p>
									회원 가입 후, 스타벅스 e-Gift Card를 
									<br class="pc_br"> <br class="m_br"> 
									<strong>"나에게 선물하기"로 구매하시고, <br class="m_br">편리하게 등록하세요!
									</strong> <br> 카드를 등록하여 스타벅스 리워드 회원이 되신 후, 
									<br class="pc_br"> <br class="m_br">첫 구매를 하시면 무료 음료쿠폰을 드립니다!
								</p>
							</div>
							<div class="btn_egift">
								<a href="#">e-Gift Card 선물하기</a>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- 스타벅스 리워드 End -->
		
			<!-- 로그인 후 -->
		<%--
			<div class="line_msr">
				<div class="line_msr_wrap msr_new">
					<div class="user_level">
						<p class="level_star_bg en">0</p>
						<div class="msr_info_area">
							<p class="user_level_txt">
								<!-- <strong class="t_ac8432 en">Gold Level</strong><br><strong>무료음료</strong> 획득 별까지<br><strong>3개</strong> 남았습니다. -->
							</p>
							<p class="btn_reward_level">
								<a href="#" title="마이 리워드" class="btn_reward">리워드 및 혜택</a>
							</p>
						</div>
					</div>
					<div class="msr_lead" style="display: none;">
						<a href="#" title="회원 등급별 혜택">
							<p class="icon_msr_cup"></p>
							<div class="msr_info_area">
								<p class="msr_lead_txt">
									<span class="user_greet_txt"> <strong><!-- 스벅매니아 --></strong>님, 안녕하세요!</span> 
									<span class="userNextStarTxt"><em>혜택에 편리함까지 더한</em> 스타벅스 리워드를 즐겨보세요.</span>
								</p>
							</div>
						</a>
					</div>

					<span class="msr_sep_line" aria-hidden="true"></span>

					<div class="msr_card_info w_card_pic">
						<p class="msr_card_area" onclick="location.href = '/my/mycard_index.do';" style="cursor: pointer;" tabindex="0">
							<img alt="카드이름">
						</p>
						<div class="msr_info_area msr_card_txt_area">
							<p class="card_info_txt"> 잔액 <strong class="en balance">0</strong>원 </p>
							<p class="btn_other_more">
								<a href="#">다른 카드 보기</a>
							</p>
						</div>
					</div>
					<div class="msr_card_zone m_card_pic">
						<div class="mycard_area1">
							<img alt="카드이름" onerror="this.src='${pageContext.request.contextPath}/resources/images/main/card_672x423.png';" />
						</div>
						<div class="mycard_area2">
							<img alt="카드이름" src="${pageContext.request.contextPath}/resources/images/main/mycard2.png" />
							<p class="num"></p>
							<p class="barcord"> <!-- <img src="https://image.istarbucks.co.kr/common/img/common/bacord.png" alt=""> --> </p>
						</div>
						<div class="mycard_one">
							<img src="${pageContext.request.contextPath}/resources/images/main/payment_icon1.png" alt="결제하기">
						</div>
						<p class="mycard_money_result">
							잔액 <span class="en balance"> <!-- 550,000 -->
							</span>원
						</p>
						<p class="btn_other_more">
							<a href="#">다른 카드 보기</a>
						</p>
					</div>

					<div class="sb_card_regi">
						<a href="#">
							<p class="icon_add_card" onclick="location.href = '/my/mycard_info_input.do';">
								<img alt="카드등록 아이콘" src="${pageContext.request.contextPath}/resources/images/main/icon_add_card.png">
							</p> <!-- 등록된 카드가 없는 경우 -->
							<p class="sb_card_regi_txt">
								<strong>스타벅스 카드 등록</strong><br>등록된 카드가 없습니다.<br>새로운 카드를 등록하세요.
							</p>
						</a>
						<a class="btn_main_card_regi" href="#">카드등록</a>
						<!-- 등록된 카드가 없는 경우 end -->
					</div>
				</div>
			</div>
		--%>
		
			<!-- 커피 -->
			<section id="main_bean_wrap">
				<div class="main_bean_inner">
					<div class="bean_img_box">
						<img src="${pageContext.request.contextPath}/resources/images/main/2020_xmas_bean.png" alt="크리스마스 블렌드" class="pc_bean" />
						<img src="${pageContext.request.contextPath}/resources/images/main/m_2020_xmas_bean.png" alt="크리스마스 블렌드" class="m_bean" />
					</div>

					<div class="bean_txt_box">
						<img src="${pageContext.request.contextPath}/resources/images/main/2020_xmas_bean_txt.png" alt="크리스마스를 더욱 특별하게 만들어 줄 커피 크리스마스 블렌드" class="pc_bean_txt" />
						<img src="${pageContext.request.contextPath}/resources/images/main/m_2020_xmas_bean_txt.png" alt="크리스마스를 더욱 특별하게 만들어 줄 커피 크리스마스 블렌드" class="m_bean_txt" />
						<div class="btn_bean_detail">
							<a href="#"> 자세히 보기 </a>
						</div>
					</div>
				</div>
			</section>
			<!-- 커피 End -->

			<!-- 리저브 -->
			<section class="reserve_wrap">
				<div class="reserve_inner">
					<div class="reserve_title">
						<img src="${pageContext.request.contextPath}/resources/images/main/reserve_xmas_title.png" alt="RESERVE THE MERRY" class="reserve_visual_pc" />
					</div>

					<div class="reserve_visual">
						<img src="${pageContext.request.contextPath}/resources/images/main/reserve_xmas_beans.png" alt="" class="reserve_visual_pc" />
						<img src="${pageContext.request.contextPath}/resources/images/main/m_reserve_xmas_beans.jpg" alt="" class="reserve_visual_m" />
					</div>

					<div class="reserve_detail_btn">
						<a href="https://www.starbucks.co.kr/whats_new/newsView.do?seq=3948">자세히 보기</a>
					</div>
				</div>
			</section>
			<!-- 리저브 End -->

		 
			<!-- 메뉴 -->
			<section id="favWrap" class="winter_fav_bg">
				<div class="wrap_inner">
					<div class="fav_prod_txt01">PICK YOUR FAVORITE</div>
					<div class="fav_prod_txt02">
						다양한 메뉴를 스타벅스에서 즐겨보세요. 
						스타벅스만의 특별함을 경험할 수 있는 최상의 선택 음료, 
						스타벅스 커피와 완벽한 어울림을 자랑하는 푸드, 
						다양한 시도와 디자인으로 가치를 더하는 상품, 
						소중한 사람에게 마음을 전하는 가장 좋은 방법 스타벅스 카드
					</div>
					<div class="fav_img"></div>
					<div class="btn_fav_prod">
						<a href="#">자세히 보기</a>
					</div>
				</div>
			</section>
			<!-- 메뉴 end -->

			<!-- 리저브 매장 -->
			<section class="reserve3Wrap">
				<div class="reserve3_pc">
					<div class="reserve_left">
						<img src="${pageContext.request.contextPath}/resources/images/main/reserve_visual_pc.png" alt="" />
					</div>
					<div class="reserve_right">
						<img src="${pageContext.request.contextPath}/resources/images/main/reserve_text_pc.png" class="reserve_img_txt" alt="리저브가 선사하는 특별한 경험을 온라인 매거진으로 만나보세요" />
					</div>
				</div>

				<div class="reserve3_m">
					<div class="reserve_top">
						<img src="${pageContext.request.contextPath}/resources/images/main/reserve_visual_mobile.png" alt="" />
					</div>
					<div class="reserve_bottom">
						<img src="${pageContext.request.contextPath}/resources/images/main/reserve_text_mobile.png" class="reserve_img_txt on" alt="리저브가 선사하는 특별한 경험을 온라인 매거진으로 만나보세요" />
					</div>
				</div>

				<div class="look_detail_btn">
					<a href="#">EXPLORE OUR STORY</a>
				</div>
			</section>
			<!-- 리저브매장 end -->

			<!-- 매장 -->
			<section id="storeWrap">
				<div class="wrap_inner">
					<div class="store_exp_img01"></div>
					<div class="store_exp_img02"></div>
					<div class="store_exp_img03"></div>
					<div class="store_exp_img04"></div>
					<div class="store_txt01">
						스타벅스를 가까이에서 경험해보세요. 
						고객님과 가장 가까이 있는 매장을 찾아보세요!
					</div>
					<div class="store_txt02">
						차별화된 커피 경험을 누릴 수 있는 리저브 매장, 
						다양한 방법으로 편리하게 즐길 수 있는 드라이브 스루 매장, 
						함께해서 더 따뜻할수 있는 지역사회 소통 공간 커뮤니티 매장
					</div>
					<div class="store_btn">
						<a href="#">매장 찾기</a>
					</div>
				</div>
			</section>
			<!-- 매장 end -->
		</div>
		<!-- Main Container End -->
		
		<!-- Footer -->
		<c:import url="./common/footer.jsp"></c:import>
		<!-- Footer End -->
		
	</div>

	<script src="${pageContext.request.contextPath}/resources/js/common/header.js?v=1"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/footer.js?v=1"></script>
	
</body>
</html>

