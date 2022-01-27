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
<title>권한관리</title>
	<!-- 부트스트랩 CSS -->
 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 	<!-- ajax -->
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
  
 <c:import url="../../layout/top.jsp" /> 
	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<div class="col-lg-2">

				<h3 class="my-4 text-center">Category</h3>
				<div class="list-group mb-4">
					<a  href="${contextPath}/uat/uia/usrList.do"
						class="list-group-item list-group-item-info text-center font-weight-bold border border-dark">
						유저권한관리</a>                 
				</div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9 my-4 mb-4 border border-dark rounded-lg">
            <!-- 여기서부터 본문내용, 이후 코드는 bottomLayout에서 마무리 -->
		
		<form action="${contextPath}/bbs/ArticleRegist.do" method="post">
            <!-- 테이블 시작 -->
            <table class="table table-hover">	
                <thead>		
                    <tr>			
                        <th scope="col" class="text-center">번호</th>			
                        <th scope="col" class="text-center">ID</th>			
                        <th scope="col" class="text-center">권한</th>			
                        <th scope="col" class="text-center">사용여부</th>	
                        <th scope="col" class="text-center">수정</th>		
                    </tr>	
                </thead>
                <tbody>
                <c:forEach var="List" items="${usrList}" varStatus="status" >
					<tr>
						<!-- 글번호 --> 
						<td class="text-center " style="width: 10%">
							<input type = "text" class="form-control text-center" name="seqNo" value = '${List.seqNo}' readOnly/>
						</td>
                        <!-- 사용자 ID --> 
						<td style="width: 30%" class="text-center">
							<input type = "text" class="form-control text-center" name="usrId" value = '${List.usrId}' readOnly/>
							<input type = "hidden" name ="usrNm" value = '${List.usrNm}' />
						</td>
						<!-- 권한 명 ( 셀렉트 박스 )--> 			
                        <td style="width: 35%" class="text-center">                        
                        	<select class="form-control text-center" name="authCod">
                        	<!-- 권한 코드 리스트 -->
                        		<option value = "${List.authCod}">${List.authNm}</option>
                        			<c:forEach var="auth" items="${authList}" varStatus="status" >
                        			<option value = "${auth.authCod}">${auth.authNm}</option>
                           		    </c:forEach>	
                        	</select>                     
                        </td>
                        <!-- 사용여부 ( 체크박스 ) --> 			
                        <td style="width: 15%" class="text-center">
                        <!-- 사용여부 y : 체크 / n : 체크x -->
                        	<c:choose>
								<c:when test="${List.useYn eq 'y'}">		
                        			<input type="checkbox"  class="form-control text-center" name ="useYn" value= "y" checked/>
                        		</c:when>
                        		<c:otherwise>
                        			<input type="checkbox" class="form-control text-center" name = "useYn" value= "n" />
                        		</c:otherwise>
							</c:choose>
                        </td>	 
						<!-- 수정 버튼 -->
						<td style="width: 10%" class="text-center">
							<input type="button" class="form-control text-center" value = "수정" 
								onClick= "update('${List.seqNo}','${List.authCod}','${List.useYn}')"/>
						</td>	  														
					</tr>  
				</c:forEach>			
                    
                     
                </tbody>
            </table>
        </form>
            <!-- 추가 -->
            <form action="${contextPath}/bbs/ArticleRegist.do" method="post">       
                <button type="button" class="btn btn-secondary mb-2 float-right" onclick="insert()">추가</button>
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
<script type="text/javascript">

	function insert(){
		location.href = "${contextPath}/uat/uia/insertUsr.do"
	}
	
	function update(seqNo,authCod,useYn){
		
		/* 수정 요청한 권한 아이디 */
		let a_usrId = document.getElementsByName('usrId')[seqNo-1].value;
		/* 수정 요청한 권한 아이디 */
		let a_usrNm = document.getElementsByName('usrNm')[seqNo-1].value;
		/* 수정 요청한 권한 코드 */
		let a_authCod = document.getElementsByName('authCod')[seqNo-1].value;
		/* 수정 요청한 사용 여부 */
		let checked = document.getElementsByName('useYn')[seqNo-1].checked;
		/* 사용 여부 저장할 변수 */
		let a_useYn = '';
		
		/*  체크 되면  y 아니면 n */
		if (checked) { 
			
			a_useYn = 'y'; 
		
		}else{ 
			
			a_useYn = 'n';
			
		}
		
		/* 변경된게 없을 때 */
		if ( authCod == a_authCod && useYn == a_useYn ){
			
			alert('변경사항이 없습니다');
			return;
		}
		
		
			
		//alert(' 권한코드 : ' + a_authCod + '  사용여부 : ' + a_useYn);
		
		/* ajax 시작 */
		$.ajax({
            url: "${contextPath}/uat/uia/updateUsr.do",
            type: "POST",
            async: false,
            data: {	
            		usrId : a_usrId,
            		authCod : a_authCod, 
            		useYn : a_useYn   	  	 
            	  },		            
             success: function(data, textStatus, errorThrown) {
          	   let text = data.split("++");
          	   
          	   	if(text[0] == 'FileNotFoundException') {
          	    	
          	    	alert('오류 : ' + text[1]);
          	    	
          	    }else if(text[0] == 'SQLException') {
          	    	
          	    	alert('오류 : ' + text[1]);
          	    	
          	    }else if(text[0] == 'Exception') {
          	    	
          	    	alert('오류 : ' + text[1]);
          	    	
          	    }
          	    else{
          	    	alert('수정 완료');
          	    }
          	         	   
            },
            error: function(data,jqXHR,exception) {		            	           
          	    alert('오류');
          	    console.log(data);
            }
        });//end of ajax
  	 history.go(0);
  }  
	
	
</script>
</html>