<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>

	<!-- 부트스트랩 CSS -->
 	<link rel="stylesheet" href="${contextPath}/css/egovframework/bootstrap.css">
  	
</head>
<body>
  <%-- <%=request.getRealPath("/") %>
 <input type="button" class="btn btn-default btn-login-submit btn-block m-t-md" value="${contextPath}" /> --%>
<div class="container mt-5 pt-5">
   <div class="row">
     <div class="page-header">
        <div class="col-md-5"></div>
       <h2>Login</h2>
     </div>
     <div class="col-md-4"></div>
     <div class="col-md-3">
       <div class="login-box well">
     <form:form  method="post" action="${contextPath}/uat/uia/login.do">
         <legend>로그인</legend>
         <div class="form-group">
             <label for="username-email">아이디</label>
             <input name="user_id" value='' id="username-email" placeholder="ID" type="text" class="form-control" />
         </div>
         <div class="form-group">
             <label for="password">비밀번호</label>
             <input name="user_pw" id="password" value='' placeholder="Password" type="password" class="form-control" />
         </div>
         <div class="form-group">
             <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="Login" />
         </div>
         <span class='text-center'><a href="/bbs/index.php?mid=index&act=dispMemberFindAccount" class="text-sm">비밀번호 찾기</a></span>
         
         <div class="form-group" style="margin-bottom: auto;">
           <!--   <a href="" class="btn btn-default btn-block m-t-md"> 회원가입</a>  -->
             <a href="${contextPath}/test.do" class="btn btn-default btn-block m-t-md " style="margin-top: 10px;"> 뒤로가기</a>
         </div>
     </form:form>
       </div>
     </div>
   </div>
 </div>

    
</body>
</html>