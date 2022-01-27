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
package egovframework.bareun.uat.uia.service.web;



import egovframework.bareun.cmmn.LoginVO;
import egovframework.bareun.cop.bbs.service.BrdService;
import egovframework.bareun.cop.bbs.service.BrdVO;
import egovframework.bareun.uat.uia.service.LoginService;
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
import javax.servlet.http.HttpSession;

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
public class LoginController {

	/** brdService */
	@Resource(name = "loginService")
	private LoginService loginService;
	
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
	 *  로그인
	 *  @param req, res
	 *  @return JSP  
	 */	
	@RequestMapping(value = "/uat/uia/login.do")
	public String login(HttpServletRequest req,HttpServletResponse res,
							Model model) throws Exception {
		
		HttpSession session = req.getSession(false);
		LoginVO input = new LoginVO();
		String url = "";
		// 입력받은 ID, PWD
		String Iid = req.getParameter("user_id");
		String Ipwd = req.getParameter("user_pw");
		input.setUsrId(Iid);
		input.setUsrPwd(Ipwd);
		
		// DB 저장된 유저 조회
		LoginVO loginVO = loginService.selectOneUsr(input);
		
		String usrId = loginVO.getUsrId();
		String usrPwd = loginVO.getUsrPwd();
		
		// DB 조회 값이 Null이 아닐 때 수행	
		/*if (loginVO == null) {
			
			url = "main";
		}
		*/
		//	DB 조회 값이 Null이 아닐 때 수행	
		if (loginVO != null  ) {
			// 입력한 ID,PWD가 DB에 저장된 ID, PWD일치할 때 수행
			if (usrId.equals(Iid) && usrPwd.equals(Ipwd) ) {
				System.out.println("로그인 성공");
				session.setAttribute("LoginInfo", loginVO);
				url = "main";
			}else{					
					session.invalidate();
					url = "main";
				 }
		}		
		return url;
	}
	
	/**  
	 *  로그아웃
	 *  @param req, res
	 *  @return JSP  
	 */	
	@RequestMapping(value = "/uat/uia/logout.do")
	public String logout(HttpServletRequest req,HttpServletResponse res,
							Model model) throws Exception {
		HttpSession session = req.getSession();
		session.invalidate();
		return "main";
	}
	
	/**  
	 *  전체유저 조회
	 *  @param req, res
	 *  @return JSP  
	 */	
	@RequestMapping(value = "/uat/uia/usrList.do")
	public String selectListUsr(HttpServletRequest req,HttpServletResponse res,
							Model model) throws Exception {
		List<Map<String, Object>> usrList = loginService.selectListUsr();
		List<Map<String, Object>> authList = loginService.selectListAuth();
		model.addAttribute("usrList", usrList);	
		model.addAttribute("authList", authList);	
		
		return "uat/uia/AuthList";
	}
	
	/**  
	 *  유저 정보 수정 ( 비밀번호, 권한, 사용여부 )
	 *  @param req, res
	 *  @return JSP  
	 */	
	@RequestMapping(value = "/uat/uia/updateUsr.do")
	public String updateUsr(HttpServletRequest req,HttpServletResponse res,
							@ModelAttribute LoginVO vo,Model model) throws Exception {
			
		loginService.updateUsr(vo);
				
		return "forward:/uat/uia/usrList.do";
	}
	

	/**  
	 *  유저 추가 
	 *  @param req, res
	 *  @return JSP  
	 */	
	@RequestMapping(value = "/uat/uia/insertUsr.do")
	public String insertUsr(HttpServletRequest req,HttpServletResponse res,
							@ModelAttribute LoginVO vo,Model model) throws Exception {
			
		
				
		return "/uat/uia/memberForm";
	}

}
