<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- CK Editor -->
	<script language="javascript" src="ckeditor/ckeditor.js"></script>

	<!-- 부트스트랩 CSS -->
 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 	
</head>
<body>
<c:import url="../../layout/top.jsp" />
	<div class="container pt-5">
        <div class="content" style="width: 70%">
        
            <div class="row justify-content-md-center">
                <div class="col-sm-9">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text">제목</label>
                      </div>            
                      <input type="text" class="form-control">              
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="input-group mb-3">
                        <select class="custom-select" id="inputGroupSelect03">
                        <option selected>분류</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                      </select>  
                    </div>
                </div>            
          	</div>
          
          <hr>
          
          <div class="row justify-content-md-center">
              <div class="col_c" style="margin-bottom: 30px">
                    <div class="input-group">                 
                      <textarea class="form-control" id="p_content"></textarea>
                      <script type="text/javascript">
                      CKEDITOR.replace('p_content'
                                                      , {height: 200                                                
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
                    <span class="input-group-text" id="inputGroupFileAddon01">썸네일</span>
                  </div>
                  <div class="custom-file">
                      &nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1">
                  </div>
                </div>
          </div>
          
          <div class="row justify-content-md-center">
            <button type="button" class="btn btn-outline-info"> 등   록  </button>
          </div>
          
      </div><!-- content -->
    </div> <!-- container -->
    <c:import url="../../layout/bottom.jsp" />
    
</body>
</html>