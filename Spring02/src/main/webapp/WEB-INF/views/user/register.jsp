<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02 REGISTER</title>
		<!-- Bootstrap CSS 파일 링크 -->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
 		<link rel="stylesheet" 
        	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
		<style>
		.valid {
			color: green;
			display: none;
		}
		
		.invalid {
			color: red;
			display: none;
		}
		</style>
	</head>
	<body>		
		<div class="container-fluid">
			<header class="jumbotron text-center">
				<h1>회원 가입 페이지</h1>
			</header>
			
			<nav>	<!-- TODO: 페이지 이동 메뉴 -->
			</nav>
			
			<div>
				<form action="./register" method="post">
					<div>
						<input type="text" id="userid" name="userid" placeholder="아이디" required/>
						<div class="valid">멋진 아이디입니다.</div>
						<div class="invalid">이미 사용중인 아이디입니다.</div>
					</div>					
					<br>
					<div>
						<input type="password" name="pwd" placeholder="비밀번호" required/>
					</div>
					<br>
					<div>
						<input type="email" name="email" placeholder="abc@abc.com" required/>
					</div>
					<br>
					<div>
						<input type="submit" id="btn-complete" value="가입"/>
					</div>
					<br> 
				</form>
			
			</div>
			
		
		</div>
		
		<!-- Bootstrap JavaScript 파일 링크 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script>
		$(document).ready(function(){
			
			// userid 아이디를 갖는 HTML 요소(input)에 변화가 생겼을 때 호출될 이벤트리스너 콜백함수 등록
			$('#userid').change(function(event) {
				// Ajax를 이용해서 아이디 중복 체크
				var params = { userid: $(this).val()};
				$.post('./checkid', params, function(response) {
					if(response == 'valid') {	//사용 가능한 아이디(DB에 없는 아이디)인 경우
						$('.valid').show();
						$('.invalid').hide();
						$('#btn-complete').removeAttr('disabled');	//버튼 활성화
					} else {
						$('.valid').hide();
						$('.invalid').show();
						$('#btn-complete').attr('disabled', 'true');	//버튼 비활성화
					}
					
				});
				
			});
			
			
		});
		</script>
	
	
	</body>
</html>