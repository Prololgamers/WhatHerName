<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
	
	<!-- 부트스트랩 CSS -->
	<!-- <link rel="stylesheet" href="../../../../css/egovframework/bootstrap.css"> -->
 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 	
</head>
<body>
  
 <c:import url="./layout/top.jsp" /> 
	
	
	<div class="container">
		<div class="row">
			<div class="col-lg-3"></div>

			<div class="col-lg-3">

				<h3 class="my-4 text-center">게시판</h3>
				<div class="list-group mb-4">
					<a  href="${contextPath}/bbs/selectBrd.do?bodCod=free"
						class="list-group-item list-group-item-action text-center font-weight-bold border border-dark">게시판</a>
					<a href="${contextPath}/bbs/selectBrd.do?bodCod=qna"
						class="list-group-item list-group-item-action text-center font-weight-bold border border-dark">
						QnA</a> 
                    <a href="${contextPath}/bbs/selectBrd.do?bodCod=faq"
						class="list-group-item list-group-item-action text-center font-weight-bold border border-dark">
						FAQ</a>
				</div>
			</div>
			<div class="col-lg-3">
				<h3 class="my-4 text-center">권한</h3>
				<div class="list-group mb-4">
					<a  href="${contextPath}/uat/uia/usrList.do" 
						class="list-group-item list-group-item-action text-center font-weight-bold border border-dark">
						유저권한관리</a>					
				</div>
			</div>
			<div class="col-lg-3"></div>
		</div>
	</div>
 
 <c:import url="./layout/bottom.jsp" />
    
</body>
</html>