<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex02 HOME1</title>
		<!-- Bootstrap CSS 파일 링크 -->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
 		<link rel="stylesheet" 
        	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
		<style>
		
		</style>
	</head>
	<body>		
		<div class="container-fluid">
			<header class="jumbotron text-center">
				<h1>메인 페이지</h1>
			</header>
			
			<nav>
				<ul>
				<c:if test="${empty signInUserId}">	<!-- 로그인돼있지 않은 경우 -->
					<li>
						<a href="./user/register">회원 가입</a>
					</li>				
					<li> <!-- TODO -->
						<a href="./user/signin">로그인</a>
					</li>
				</c:if>
				<c:if test="${not empty signInUserId}">	<!-- 로그인 돼있는 경우 -->
					<li> 
						<span>${signInUserId}</span>
						<a href="./user/signout">로그아웃</a>
					</li>
				</c:if>
					<li>
						<a href="./board/main">게시판 메인</a>
					</li>
					<li>
						<a href="./diary/calendar">다이어리</a>
					</li>	
													
				</ul>
			</nav>
			
		</div>
		
		<!-- Bootstrap JavaScript 파일 링크 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>