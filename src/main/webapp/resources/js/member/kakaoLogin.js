	/* 카카오 계정 로그인 */
	Kakao.Auth.createLoginButton({
		container: '#kakao_login',
		success: function(authObj) {
			Kakao.API.request({
				url: '/v2/user/me',
				success: function(res) {
					var kakao = JSON.parse(JSON.stringify(res));
					console.log('kakao');
					$.ajax({
						url: './kakaoLogin',
						dataType: 'json',
						data : {id:kakao.id, email:kakao.kakao_account.email},
						method: 'post',
						contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
						success : function(data) {
							if(data==0) {
								alert('회원가입 후 이용이 가능합니다.');
								location.href="./memberJoin2";
							} else if(data==1) {
								alert('로그인되었습니다. 환영합니다!');
								location.href="../";
							} else {
								alert('카카오로 가입한 회원정보가 없습니다.');								
							}
							
						}
					});
				},
				fail: function(error) {
					alert(
						'login success, but failed to request user information: ' +
						JSON.stringify(error)
					)
				},
			})
		},
		fail: function(err) {
			alert('failed to login: ' + JSON.stringify(err))
		},
	})
	/* 카카오 계정 로그인 end */
	
	
	if (!Kakao.Auth.getAccessToken()) {
		console.log('Not logged in.');
		return;
	}
	Kakao.Auth.logout(function() {
		console.log(Kakao.Auth.getAccessToken());
	});