<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="pt-5 mb-3">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			
			<a class="navbar-brand " href="${contextPath}/test.do">홈</a>
			
			<a class="navbar-brand ml-5" href="${contextPath}/bbs/selectBrd.do">게시판</a>
			
			<a class="navbar-brand ml-5" href="${contextPath}/uat/uia/usrList.do">권한</a>
			
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
                        <a class="nav-link" href="${contextPath}/test.do">홈
							<span class="sr-only">(current)</span>
					</a></li>
					<c:choose>
						<c:when test="${sessionScope.LoginInfo eq null }">					
							<li class="nav-item"><a class="nav-link" href="${contextPath}/uat/uia/loginForm.do">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="#">${sessionScope.LoginInfo.usrNm}</a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/uat/uia/logout.do">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>