<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex01</title>
		<!-- Bootstrap CSS 파일 링크 -->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
 		<link rel="stylesheet" 
        	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
		<style>
		
		</style>
	</head>
	<body>		
		<h1>새 글 작성</h1>
		<div>
			<form method="post">
				<input type="number" name="bno" placeholder="글 번호 입력" />
				<br>
				<input type="text" name="title" placeholder="글 제목 입력"  />
				<br>
				<input type="submit" value="작성완료" /> 
			</form>
					
		</div>
		
		<!-- Bootstrap JavaScript 파일 링크 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>