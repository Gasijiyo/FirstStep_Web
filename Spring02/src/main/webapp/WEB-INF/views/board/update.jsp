<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02 UPDATE</title>
		<!-- Bootstrap CSS 파일 링크 -->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
 		<link rel="stylesheet" 
        	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
		<style>
		
		</style>
	</head>
	<body>		
		<div class="container-fliud">
			<header class="jumbotron text-center">
				<h1>게시글 수정 페이지</h1>			
			</header>
		
			<nav>	<!-- 페이지 이동 메뉴 -->
				<ul>
					<li><a href="../">메인</a></li>
					<li><a href="./main">게시판 메인</a></li>
					<li><a id="menu-delete" href="./delete?bno=${board.bno}">삭제</a></li>			
				</ul>			
			</nav>
			
			<div>
				<form action="./update" method="post">
					<div style="display: none;">
						<input type="text" name="bno" value="${board.bno }" readonly />
					</div>
					<div>
						<label for="title">글 제목</label>
						<input type="text" id="title" name="title" value="${board.title}" required autofocus />
					</div>
					<div>
						<label for="content">글 본문</label>
						<textarea rows="5" id="content" name="content" required >${board.content }</textarea>					
					</div>
					<div>
						<label for="userid">작성자 아이디</label>
						<input type="text" id="userid" name="userid" value="${board.userid }" required readonly />
					</div>
					<div>
						<label for="reg_date">최종 수정 시간</label>
						<fmt:formatDate value="${board.reg_date }" pattern="yyyy/MM/dd HH:mm:ss" var="last_update_time"/>
						<input type="text" id="reg_date" name="reg_date" value="${last_update_time}" readonly />					
					</div>
					<div>
						<input type="submit" value="수정" />
					
					</div>
					
				</form>
			</div>
		
		
		</div>
		
		<!-- Bootstrap JavaScript 파일 링크 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script>
		$(document).ready(function() {
			$('#menu-delete').click(function(event) {
				event.preventDefault();	//링크를 클릭했을 때 의 기본 동적인 요청 보내기를 하지 않음.
				var result = confirm('정말 삭제하시겠습니까?');
				if(result) {	//yes 선택 시
					location = $(this).attr('href');	// 원래 이동하려고 했던 요청 주소로 요청 보내기.
				}
			});
			
		});
		
		</script>
		
	</body>
</html>