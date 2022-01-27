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
<title>글 상세 페이지</title>
	
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<!-- CK Editor -->
 	<script type="text/javascript" src="${contextPath}/ckeditor/ckeditor.js"></script>	
	
	<!-- 부트스트랩 CSS -->
 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 	
</head>
<body>
  
 <c:import url="../../layout/top.jsp" />
  <c:forEach var="brd" items="${ArticleList}" varStatus="status" >
	<div class="container pt-5 pb-5">
        <div class="content" style="width: 100%">
         <form:form method="post" action="${contextPath}/bbs/updateOneBrd.do" enctype="multipart/form-data">
            <div class="row justify-content-md-center">
                <div class="col-sm-9">
                	<div class="input-group mb-3">
                    	<div class="input-group-prepend">
                       		<label class="input-group-text" >제목</label>
                      	</div>            
                      <input type="text" class="form-control" id="title" name="title" value='${brd.title}' disabled />
                      <input type="hidden" class="form-control" id="seqNo" name="seqNo" value='${brd.seqNo}' readonly/>              
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="input-group mb-3">
                    	 <label class="input-group-text" >분 류</label>
                    	<select class="custom-select" id="bodCod" name ="bodCod" disabled>
	                        <option selected>분류</option>
	                        <option value="free">자유게시판</option>
	                        <option value="qna">QnA</option>
	                        <option value="faq">FAQ</option>
                      	</select>                     
                    </div>
                </div>
                <script type="text/javascript">
                	window.onload = function() {
                		let option = '${brd.bodCod}';               		
                		$("#bodCod").val(option).attr("selected",true);           		
                	}
                </script>            
          	</div>
          
          <hr>
          
          <div class="row justify-content-md-center mb-3">
                              
                        
                      <textarea class="form-control" id="contents" name="contents" readOnly>${brd.contents}</textarea>  
                      <script type="text/javascript"> 
                      
                       CKEDITOR.replace('contents',
					         {
					            width : 1200 ,        
					            height: 600,
					           // 향상된 이미지 업로드를 사용하기 위해 플러그인 추가, 이미지 모서리 부분에서 크기조정 쉽게 가능, 이미지 설명 가능, 이미지 좌 우 중앙 정렬 가능.
					            extraPlugins : 'image2,font',
					           // 서버 탐색, 업로드 , 디렉토리는 Files, Images, Flash가 Default로 생김    
					            filebrowserBrowseUrl : '${contextPath}/ckfinder/ckfinder.html',
					           
					            filebrowserImageUploadUrl : '${contextPath}/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
					            
					            filebrowserWindowWidth : '1000',
					            filebrowserWindowHeight : '700'
					            
					         }); 
                      </script>                      
          </div>
                  
          <div class="row justify-content-md-center">
	          	<button type="button" class="btn btn-outline-info" id="readOnlyOn" onclick="toggleReadOnly();" style="display:none" > 수정취소 </button>
	    		<button type="button" class="btn btn-outline-info" id="readOnlyOff" onclick="toggleReadOnly( false );" > 수 정 </button>
	          	<button type="submit" class="btn btn-outline-info ml-3" id="update_readOnly"  style="display:none"> 저 장 </button>
	            <button type="button" class="btn btn-outline-info ml-3" onclick="f_list()"> 목 록  </button>           
          </div>
        </form:form>  
      </div><!-- content -->
    </div> <!-- container -->
  </c:forEach> 
  <c:import url="../../layout/bottom.jsp" />
    
</body>
<script type="text/javascript">
	
	
	 var editor;

	    // The instanceReady event is fired when an instance of CKEditor 4 has finished
	    // its initialization.
	    CKEDITOR.on('instanceReady', function(ev) {
	      editor = ev.editor;

	      // Show this "on" button.
	      document.getElementById('readOnlyOn').style.display = 'none';
	      document.getElementById('update_readOnly').style.display = 'none';

	      // Event fired when the readOnly property changes.
	      editor.on('readOnly', function() {
	        document.getElementById('readOnlyOn').style.display = this.readOnly ? 'none' : '';
	        document.getElementById('update_readOnly').style.display = this.readOnly ? 'none' : '';
	        document.getElementById('readOnlyOff').style.display = this.readOnly ? '' : 'none';
	      });
	    });

	    /* 수정 토글 함수 */
	    function toggleReadOnly(isReadOnly) {
	      // Change the read-only state of the editor.
	      // https://ckeditor.com/docs/ckeditor4/latest/api/CKEDITOR_editor.html#method-setReadOnly	      
	      editor.setReadOnly(isReadOnly);
	      f_update(isReadOnly);
	    }
	    
	    /* 목 록  */
		function f_list() {
			location.href = "${contextPath}/bbs/selectBrd.do";
		}
		
		/* 수 정 */
		function f_update(isReadOnly) {
			   
			   /* ( 제목(title), 게시판 분류(bodCod),  ) */
			   let title = document.getElementById('title');
			   let bodCod = document.getElementById('bodCod');
			   
			   if(isReadOnly == false){
			   /* disabled 속성 -> false 로 변환 */
				   title.disabled = false;
				   bodCod.disabled = false;
			   }else{
			   /* disabled 속성 -> true 로 변환 */	
				   title.disabled = true;
				   bodCod.disabled = true;
			   }
			  
		}
		
		/* 수 정 */
		function update(){
			
			var seqNo = document.getElementById("seqNo").value;
			alert(seqNo);
			
			/* $.ajax({
	              url: "${contextPath}/download.do",
	              type: "POST",
	              async: false,
	              data: {	seqNo : seqNo
	            	  	 
	              },		            
	               success: function(data, textStatus, errorThrown) {
	            	   
	            	    	alert('다운로드 완료');
	          	   
	              },
	              error: function(data,jqXHR,exception) {		            	           
	            	    alert('다운로드 할 파일을 선택해주세요');
	            	    console.log(data);
	              }
	          });//end of ajax
	    	 history.go(0); */
	    }   

</script>

</html>