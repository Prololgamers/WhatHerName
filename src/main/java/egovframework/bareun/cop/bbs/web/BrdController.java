/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.bareun.cop.bbs.web;



import egovframework.bareun.cop.bbs.service.BrdService;
import egovframework.bareun.cop.bbs.service.BrdVO;
import egovframework.bareun.sample.service.TestService;

import egovframework.rte.fdl.property.EgovPropertyService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.google.gson.JsonObject;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class BrdController {

	
	/** brdService */
	@Resource(name = "brdService")
	private BrdService brdService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	
	/** 
	 *  게시판 전체 조회
	 *  @param Request,Response, BrdVO, Model
	 *  @return JSP  
	 */	
	@RequestMapping(value = "/bbs/selectBrd.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectBrd(HttpServletRequest Request,HttpServletResponse Response,
			 					@ModelAttribute BrdVO vo, Model model) throws Exception {
	
		List<Map<String, Object>> articleList = (List<Map<String, Object>>) brdService.selectArticle(vo);		
		model.addAttribute("ArticleList", articleList);	
		
		return "cop/bbs/ArticleList";
	}
	
	/** 
	 *  게시물 상세 조회
	 *  @param Request, Response, Model, BrdVO
	 *  @return JSP  
	 */	
	@RequestMapping(value = "/bbs/selectOneBrd.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectOneBrd(HttpServletRequest Request,HttpServletResponse Response,Model model,
								@ModelAttribute BrdVO vo) throws Exception {
	
		List<Map<String, Object>> articleList = (List<Map<String, Object>>) brdService.selectOneArticle(vo);		
		model.addAttribute("ArticleList", articleList);	
		
		return "cop/bbs/ArticleDetail";
	}
	
	/** 
	 *  게시물 수정
	 *  @param x
	 *  @return JSP  
	 */	
	@RequestMapping(value = "/bbs/updateOneBrd.do", method = {RequestMethod.POST})
	public String updateOneBrd(HttpServletRequest Request,HttpServletResponse Response,Model model,
								@ModelAttribute BrdVO vo) throws Exception {
	
		int result = brdService.updateArticle(vo);		
			
		System.out.println(result);
		return "forward:/bbs/selectBrd.do";
	}
	
	
	/** 
	 *  게시글 작성 페이지
	 *  @param x
	 *  @return JSP  
	 */	
	@RequestMapping(value = "/bbs/ArticleRegist.do")
	public String ArticleRegist() throws Exception {
	
		System.out.println("글쓰기 페이지 요청");
		return "cop/bbs/ArticleRegist";
	}
	
	/** 
	 *  게시글 등록 (DB저장)
	 *  @param HttpServletRequest, HttpServletResponse, BrdVO
	 *  @return JSP  
	 */	
	@RequestMapping(value = "/bbs/insertArticle.do", method = RequestMethod.POST)
	public String insertBrd(HttpServletRequest req, HttpServletResponse resp, @ModelAttribute BrdVO vo) throws Exception {
	
		// DB 저장	
		brdService.insertArticle(vo);
		
		return "forward:/bbs/selectBrd.do";
	}
	
	/** 
	 *  로그인 페이지
	 *  @param x
	 *  @return JSP  
	 */
	@RequestMapping(value = "/uat/uia/loginForm.do")
	public String login() throws Exception {
	
		System.out.println("로그인 페이지 요청");
		return "uat/uia/loginForm";
	}
	
	/** 
	 *  파일업로드 페이지
	 *  @param x
	 *  @return JSP  
	 */
	@RequestMapping(value="/fileupload.do", method=RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, 
					@RequestParam MultipartFile upload) throws Exception {
		 
		 
		 String uploadPath = "D:/upload/CkUpload/";
		 System.out.println("uploadPath  : "+uploadPath);
		 // 랜덤 문자 생성
		 UUID uid = UUID.randomUUID();
		 
		 OutputStream out = null;
		 PrintWriter printWriter = null;
		   
		 // 인코딩
		 res.setCharacterEncoding("utf-8");
		 res.setContentType("text/html");
		 
		 try {
		  
		  String fileName =  upload.getOriginalFilename(); // 파일 이름 가져오기
		  byte[] bytes = upload.getBytes();
		  
		  // 업로드 경로
		  String ckUploadPath = uploadPath + File.separator  + fileName;
		  
		  out = new FileOutputStream(new File(ckUploadPath));
		  out.write(bytes);
		  out.flush(); // out에 저장된 데이터를 전송하고 초기화
		  
		  //String callback = req.getParameter("CKEditorFuncNum");
		  printWriter = res.getWriter();
		  String fileUrl = "/upload/"  +fileName; // 작성화면
		    
		  // 업로드시 메시지 출력
		  JsonObject json = new JsonObject();
		  json.addProperty("uploaded", 1);
		  json.addProperty("fileName", uid + "_" +fileName);
		  json.addProperty("url", ckUploadPath);
		  printWriter.println(json);
		  
		  printWriter.flush();
		  System.out.println("test url : "+req.getSession().getServletContext().getRealPath("resouces/ckUpload"));
		  System.out.println("url : "+fileUrl);
		  System.out.println("ckUploadPath : "+ckUploadPath);
		 } catch (IOException e) { e.printStackTrace();
		 } finally {
		  try {
		   if(out != null) { out.close(); }
		   if(printWriter != null) { printWriter.close(); }
		  } catch(IOException e) { e.printStackTrace(); }
		 }
		 
		 return; 
		}
	

}
