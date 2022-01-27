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
	
	<!-- CK Editor -->
	<!-- <script type="text/javascript" src="ckeditor/ckeditor.js"></script> -->

	<!-- 부트스트랩 CSS -->
 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 	
</head>
<body>
  
 <c:import url="../../layout/top.jsp" /> 
	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<div class="col-lg-2">

				<h3 class="my-4 text-center">Category</h3>
				<div class="list-group mb-4">
					<a  href="${contextPath}/bbs/selectBrd.do?bodCod=free"
						class="list-group-item list-group-item-info text-center font-weight-bold border border-dark">
						자유 게시판</a>
					<a href="${contextPath}/bbs/selectBrd.do?bodCod=qna"
						class="list-group-item list-group-item-action text-center font-weight-bold border border-dark">
						QnA</a> 
                    <a href="${contextPath}/bbs/selectBrd.do?bodCod=faq"
						class="list-group-item list-group-item-action text-center font-weight-bold border border-dark">
						FAQ</a>
				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
            <!-- 여기서부터 본문내용, 이후 코드는 bottomLayout에서 마무리 -->

            <!-- 테이블 시작 -->
            <table class="table table-hover">
	
                <thead>		
                    <tr>			
                        <th scope="col" class="text-center">제목</th>			
                        <th scope="col" class="text-center">글쓴이</th>			
                        <th scope="col" class="text-center">작성일</th>			
                        <th scope="col" class="text-center">조회수</th>		
                    </tr>	
                </thead>
                <tbody>
                <c:forEach var="List" items="${ArticleList}" varStatus="status" >
					<tr>
						<td style="width: 60%">
                
                            <!-- 게시물 제목, 답글에 대한 인덴트 적용 -->             
                            <a class="text-reset"					
                                href="${contextPath}/bbs/selectOneBrd.do?seqNo=${List.seqNo}&bodCod=${List.bodCod}">
                                 ${List.title}</a>			
                        </td>
						<td style="width: 10%" class="text-center">${List.wrtId}</td>			
                        <td style="width: 20%" class="text-center">${List.wrtYmd}</td>			
                        <td style="width: 10%" class="text-center">${List.nam}</td>	 
																				
					</tr>  
				</c:forEach>			
                    
                    <tr>
                        <td style="width: 60%">
                
                            <!-- 게시물 제목, 답글에 대한 인덴트 적용 -->             
                            <a class="text-reset"					
                                href="#"> 제목입니다</a>			
                        </td>		
                        <!-- 작성자, 작성일, 조회수 -->		
                        <td style="width: 10%" class="text-center">작성자</td>			
                        <td style="width: 20%" class="text-center">yy-mm-dd</td>			
                        <td style="width: 10%" class="text-center">조회수</td>		
                    </tr>	   
                </tbody>
            </table>
            <!-- 새글쓰기 누를 때 -->
            <form action="${contextPath}/bbs/ArticleRegist.do" method="post">
                
                <!-- 새글의 계층 정보 -->
                <input type="hidden" name="bdGroup" value="-1">
                <input type="hidden" name="bdOrder" value="0">
                <input type="hidden" name="bdIndent" value="0">
                <button type="submit" class="btn btn-secondary mb-2 float-right">새글쓰기</button>
                
            </form>     

            <!-- 페이징 목록 처리 -->
            <div class="pt-5">
                <ul class="pagination justify-content-center">
                    <li><a href="#" style="margin-right: 5px;" class="text-secondary">◀</a></li>
                    <li><a href="#" style="margin-right: 5px;" class="text-secondary">1</a></li>
                    <li><a href="#" style="margin-right: 5px;" class="text-secondary">2</a></li>
                    <li><a href="#" style="margin-right: 5px;" class="text-secondary">3</a></li>
                    <li><a href="#" style="margin-right: 5px;" class="text-secondary">4</a></li>
                    <li><a href="#" style="margin-right: 5px;" class="text-secondary">5</a></li>
                    <li><a href="#" style="margin-right: 5px;" class="text-secondary">▶</a></li>
                </ul>       
            </div>
             
                  
        </div>
        <!-- /.col-lg-9 -->
            
        </div>
        <!-- /.row -->
        
            
    </div>
    <!-- /.container -->
	
 <c:import url="../../layout/bottom.jsp" />
    
</body>
</html>