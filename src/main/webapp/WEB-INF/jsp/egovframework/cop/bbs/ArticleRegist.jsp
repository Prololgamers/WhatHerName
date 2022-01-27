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
	
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<!-- CK Editor -->
 	<script type="text/javascript" src="${contextPath}/ckeditor/ckeditor.js"></script>
	
	<!-- 부트스트랩 CSS -->
 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 	
</head>
<body>
  
 <c:import url="../../layout/top.jsp" /> 
	<div class="container pt-5 pb-5">
        <div class="content" style="width: 100%">
         <form:form method="post" action="${contextPath}/bbs/insertArticle.do" enctype="multipart/form-data">
            <div class="row justify-content-md-center">
                <div class="col-sm-9">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" >제목</label>
                      </div>            
                      <input type="text" class="form-control" name="title" required>              
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="input-group mb-3">
                        <select class="custom-select" id="inputGroupSelect03" name ="bodCod">
                        <option selected>분류</option>
                        <option value="free">자유게시판</option>
                        <option value="qna">QnA</option>
                        <option value="faq">FAQ</option>
                      </select>  
                    </div>
                </div>            
          	</div>
          
          <hr>
          
          <div class="row justify-content-md-center">
              <div class="col_c" style="margin-bottom: 30px">
                    <div class="input-group">                 
                      <textarea class="form-control" id="contents" name="contents"></textarea>  
                      <script type="text/javascript">          
                       CKEDITOR.replace('contents',
					         {
					            width : 1100 ,        
					            height: 435 ,
					           // 향상된 이미지 업로드를 사용하기 위해 플러그인 추가, 이미지 모서리 부분에서 크기조정 쉽게 가능, 이미지 설명 가능, 이미지 좌 우 중앙 정렬 가능.
					            extraPlugins : 'font',
					           // 서버 탐색, 업로드 , 디렉토리는 Files, Images, Flash가 Default로 생김    
					            filebrowserBrowseUrl : '${contextPath}/ckfinder/ckfinder.html',
					           // 디렉토리에 있는 폴더 중 Images 만 보이게 함.
					           //filebrowserImageBrowseUrl : '${contextPath}/ckfinder/ckfinder.html?Type=Images',
					           // 업로드 탭을 생기게 해주는 Url
					            /* filebrowserUploadUrl : '${contextPath}/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files', */
					           //filebrowserImageUploadUrl : '${contextPath}/fileupload.do',
					           // 서버 전송 누르면 경로에 이미지파일을 저장  Url
					            filebrowserImageUploadUrl : '${contextPath}/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
					            
					            filebrowserWindowWidth : '1000',
					            filebrowserWindowHeight : '700'
					            
					         }); 
                      </script>         
                    </div>
                </div> 
          </div>
          
          <div class="row justify-content-md-center">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">GitHub</span>
                  </div>
                  <input type="text" class="form-control">
                </div>
          </div>
          
          <div class="row justify-content-md-center">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroupFileAddon01">파일첨부</span>
                  </div>
                  <div class="custom-file">                   
                      <input type="file" class="form-control-file" id="exampleFormControlFile1">
                      <label class="custom-file-label" for="exampleFormControlFile1"></label>      
                  </div>
                </div>
          </div>
          
          <div class="row justify-content-md-center">
            <button type="submit" class="btn btn-outline-info"> 등   록  </button>
          </div>
        </form:form>  
      </div><!-- content -->
    </div> <!-- container -->
    
    <c:import url="../../layout/bottom.jsp" />
    
</body>
<script type="text/javascript">
$("input[type='file']").on('change',function(){
    $(this).next('.custom-file-label').html(event.target.files[0].name);
});
</script>
</html>