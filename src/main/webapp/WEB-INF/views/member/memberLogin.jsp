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
	<link href="${pageContext.request.contextPath}/resources/css/common/header.css?v=1" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/common/footer.css?v=1" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/member/memberLogin.css?v=2" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/common/jquery.bxslider.css" rel="stylesheet">
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery.bxslider.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		Kakao.init('bb0ff91f0ad80f843c34f48e32746703');
		Kakao.isInitialized();
	</script>
</head>
<body>
	<!-- Header -->
	<c:import url="../common/header.jsp"></c:import>
	<!-- Header End -->

	<!-- Container -->
	<div id="container">
		<div class="login_bg_wrap">
			<!-- 내용 -->
			<div class="find_mem_wrap mem_wrap2">
				<div class="find_mem_inner">
					<form id="frmLogin" action="./memberLogin" method="post">
						<fieldset>
							<strong class="login_ttl">로그인</strong>
							<section class="joinform">
								<p class="find_form_txt">
									<span class="t_006633">Welcome! </span><br class="for_mob"/>스타벅스커피 코리아에 오신 것을 환영합니다.
								</p>

								<div class="login_input_box bd_none">
									<label for="txt_user_id" class="hid">아이디</label>
									<input class="login_id mb10" id="id" name="id" type="text" maxlength="20" placeholder="아이디를 입력해 주세요." value="${cookie.idRemb.value}" />
									<p class="limit_txt user_id_txt"></p>
									
									<label for="txt_user_pwd" class="hid">비밀번호</label>
									<input class="login_pw mb10" id="pw" name="pw" type="password" maxlength="20" placeholder="비밀번호를 입력해 주세요." />
									<p class="limit_txt user_pwd_txt"></p>
									<span class="checkWrap">
										<input type="checkbox" name="idRemb" id="idRemb" class="mem2" value="${cookie.idRemb.value}"/>
										<label for="idRemb">아이디 저장</label>
									</span>
									<!-- <span class="btn_admin_login">
										<a href="../admin/adminLogin">관리자 로그인</a>
									</span> -->
									<p class="btn_mem_login">
										<button type="submit" class="btn_login">로그인</button>
									</p>
									
									<p class="input_warn_text t_006633">
										* 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, 정기적인 비밀번호 변경을 해주시길 바랍니다.<br /> 
										* 관리자의 경우 페이지 이동 후 별도로 로그인 해주시길 바랍니다.
									</p>
									<!-- <div class="btn_mem_sns_login">
										<p class="naver_login">
											<a class="btn_login" href="javascript:void(0);" role="submit">NAVER</a>
										</p>
										<p class="fb_login">
											<a class="btn_login" href="javascript:void(0);" role="submit">FACEBOOK</a>
										</p>
										<p class="kakao_login">
											<a class="btn_login" href="javascript:;" onclick="snsLogin('kakao');">KAKAO</a>
										</p>
									</div> -->
									<div class="btn_mem_sns_login">
										<a id="kakao_login" class="btn_kakao_login">
											<img src="${pageContext.request.contextPath}/resources/images/member/kakao_login.png"/>
										</a>
										<span class="btn_admin_login">
											<a href="../admin/adminLogin">관리자 로그인</a>
										</span>
									</div>
									
								</div>
								<div class="login_btn_wrap">
									<ul>
										<li><a href="${pageContext.request.contextPath}/member/memberJoin1">회원가입</a></li>
										<li><a href="#id_modal" class="id_search" data-toggle="modal" role="button">아이디 찾기</a></li>
										<li class="last"><a href="#" class="pw_search">비밀번호 찾기</a></li>
									</ul>
								</div>
							</section>
							<!-- <section class="joinform mem_captcha" style="display: none;">
								<div class="captcha_infoInput_text">
									<p class="captcha_guidet">
										비밀번호를 5회 이상 잘못 입력하면, 보안문자를 함께 입력하셔야 합니다. 
										<span>아래 이미지의 보안문자를 보이는 대로 입력해주세요.</span>
									</p>
								</div>
								<div class="mem_captcha_frm">
									<fieldset class="mem_captcha_field">
										<legend class="hid">보안문자 입력폼</legend>
										<div class="mem_captcha_input_wrap">
											<dl>
												<dt>
													<label for="captcha">보안문자</label>
												</dt>
												<dd>
													<p class="mem_captcha_img">
														<img alt="">
													</p>
													<a class="btn_login btn_new_captcha"
														href="javascript:void(0);" role="button">새로<br />고침
													</a>
													<input id="captcha" name="captcha" type="text" maxlength="10" />
												</dd>
											</dl>
										</div>
									</fieldset>
								</div>
							</section> -->
						</fieldset>
					</form>
				</div>
			</div>
			<!-- 내용 end -->
		</div>
	</div>
	<!-- Container End -->
	
	<!-- Footer -->
	<c:import url="../common/footer.jsp"></c:import>
	<!-- Footer End -->

	<!-- ID 찾기 모달창 -->
	<div id="id_modal" class="modal fade" role="dialog">
		<div class="modal-dialog" role="document">
		
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">아이디 찾기</h4>
				</div>
				<div class="modal-body">
					<p>가입한 이름과 메일을 적어주세요</p>
					<div class="reserve-info">
						<ul class="reserve-info-wrap">
							<li><span class="tit">이름 </span><input type="text" name="name" class="name"></li>
							<li><span class="tit">이메일 </span> <input type="text" name="email" class="email"></li>
						</ul>
						<button id="find">찾기</button>
						<div id="result"></div>
						<div id="findResult"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			
		</div>
	</div>
	<!-- ID 찾기 모달창 End -->
	
	<script src="${pageContext.request.contextPath}/resources/js/common/header.js?v=1"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/footer.js?v=1"></script>
	<script src="${pageContext.request.contextPath}/resources/js/member/memberLogin.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/member/kakaoLogin.js"></script>
</body>
</html>