<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>

<html>

	<head>
		<meta charset="UTF-8">
		<title>공지글 :: ${notice.title}</title>
		<c:import url="../template/bootstrap.jsp"></c:import>
		<c:import url="../template/commonCSS.jsp"></c:import>
		
		<style type="text/css">

			textarea{
				width: 100%; height: 3rem;
				resize: none;
			}
			
			/* 이미지 크기 벗어남 조절 */
			img{
				width: 100%;
			}

			.url-copy{
				cursor: pointer;
			}

			#notice_contents{
				margin: 25px 2rem 0px;
				border: 1px solid #EAEAEA;
				padding-bottom: 1.3rem;
			}
			
			.info_css{
				font-size: 14px;
				display: inline-block;
				position: relative;
			}
			
			#writer{
				font-size: 14px;
				font-weight: bold;
			}
			
			#select_info{
				font-size: 11px;
				color: #8C8C8C;
			}
			
			#add_info{
				padding-top: 1rem;
				float: right;
			}
			
			#contents-area{
				padding: 2rem 0px;
				margin-bottom: 1.3rem;
			}
			
			#reply > span{
				font-size: 1.1rem;
				font-weight: bold;
			}
			
			#reply_area{
				margin-top: 0.3rem;
				border: 2px solid #EAEAEA;
				border-radius: 5px;
			}
			
			#reply_area > div{
				padding: 0.7rem 0.8rem;
			}
			
			#reply_area > div > span{
				color: #212121;
				font-size: 0.8rem;
				font-weight: bold;
				display: block;
				margin-bottom: 0.3rem;
			}
			
			#reply_text{
				width: 100%; height: 3rem;
				color: #212121;
				font-size: 0.8rem;;
				border: none;
				margin-bottom: 0.5rem;
				display: block;
			}
			
			textarea::placeholder{
				font-size: 0.8rem;
				color: #D5D5D5;
			}
			
			#reply_submit > #send-reply {
				float: right;
				color: #D8D8D8;
				font-weight: bold;
				font-size: 0.8rem;
				cursor: pointer;
			}
			
			.btn-area{
				font-weight:bold;
				font-size: 0.8rem;
				border-radius: 6px;
				padding: 0.7rem 0.8rem;
				background-color: #E7E7E7;
			}

			#btn_area{
				margin: 1rem 2rem 0px;
			}
			
			.left-btn{
				float: left;
				margin-right: 0.5rem;
			}

			#list-btn{
				float: right;
			}

		</style>
		
	</head>
	
	<body class="sb-nav-fixed">
	
		<c:import url="../template/navigation.jsp"></c:import>
		<div id="layoutSidenav">
			
			<!-- template -->
			<c:import url="../template/sidebar.jsp"></c:import>
			
			<div id="layoutSidenav_content">
					
				<main>
					
					<div id="notice_contents">
					
						<div class="container-fluid">
							<h2 class="mt-4">${notice.title}</h2>
							<!-- class="breadcrumb mb-4" -->
							<div id="notice_info">
								<div class="info_css">
									<div id="writer">${notice.writer}</div>
									<div id="select_info">
										${notice.regDate}
										조회 ${notice.hit}
									</div>
								</div>
								<div class="info_css" id="add_info">
									<span class="url-copy">URL 복사</span>
								</div>
							</div>
							<hr>
						</div>
						
						<div class="container-fluid" id="table-area">
							<div id="contents-area">
								${notice.contents}
							</div>
							<hr>
						</div>
						
						<div class="container-fluid">
							<table>
								<tr>

										<td></td>
										<td></td>
									
								</tr>
							</table>
						</div>
						
						<div class="container-fluid" id="reply">
							<span>댓글</span>
							<div id="reply_area">
								<div>
									<span id="login_member">login member id</span>
									<!-- 
									<input type="text" id="reply_text" placeholder="댓글을 입력하세요." name="reply">
									 -->
									<textarea id="reply_text" placeholder="댓글을 입력하세요." name="contents"></textarea>
									<span id="reply_submit">
										<span>&nbsp;&nbsp;</span>
										<span id="send-reply">등록</span>
									</span>
								</div>
							</div>
						</div>
						
					</div>
					
					<div id="btn_area">
						<div class="left-btn">
							<a href="./noticeUpdate?noticeNum=${notice.noticeNum}"><span class="btn-area">글 수정</span></a>
						</div>
						<div class="left-btn">
							<a href="./noticeDelete?noticeNum=${notice.noticeNum}"><span class="btn-area">삭제</span></a>
						</div>
						<div id="list-btn">
							<a href="./noticeList"><span class="btn-area">목록</span></a>
						</div>
					</div>
					
				</main>
	
				<c:import url="../template/footer.jsp"></c:import>
				
			</div>		
		
		</div>
		
		<!-- script template -->
		<c:import url="../template/javascript.jsp"></c:import>
				
		<script type="text/javascript">
		
			$("#send-reply").click(function(){
				
				var noticeNum = ${notice.noticeNum}
				var contents = $("#reply_text").val()
				alert(noticeNum)
				alert(contents)
				
				var comment = showRequest();
				
				if(comment){
					$.post("./replyWrite",{noticeNum:noticeNum, contents:contents}, function(){
						//alert(result);
						$("#reply_text").val("");
					})
				}
				
				/* 
				$.ajax({
					type: "POST",
					url: "./replyWrite",
					data: {
						noticeNum:noticeNum,
						contents:contents
					},
					success: function(){
						alert("success")
						$("#reply_text").val("");
					},
					beforeSend:showRequest(),
					error:function(){
						alert("error");
					}
				}); */
				
			});
			
			// 작성값 확인
			function showRequest(){
				
				alert("show request start")
				var replyContents = $.trim($("#reply_text").val());
				
				if(!replyContents){
					alert("내용을 입력해주세요.");
					$("#reply_text").focus();
					return false;
				}
				
				if(replyContents.length > 200){
					alert("200자를 초과할 수 없습니다.");
					return false;
				}
				
				alert("return: true")
				return true;
				
			}

			// URL 복사
			$(".url-copy").click(function(){
				
				// 클립보드로 복사하기 위해서는 textarea 내에 값이 존재해야함
				var tmp = document.createElement("textarea");
				document.body.appendChild(tmp);
				
				tmp.value = location.href;
				tmp.select();
				
				document.execCommand("copy");
				document.body.removeChild(tmp);
				
				alert("copied");
				
			})
		
		</script>

	</body>
	
</html>