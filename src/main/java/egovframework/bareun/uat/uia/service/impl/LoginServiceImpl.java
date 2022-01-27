package egovframework.bareun.uat.uia.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.bareun.cmmn.LoginVO;
import egovframework.bareun.cop.bbs.service.impl.BrdMapper;
import egovframework.bareun.uat.uia.service.LoginService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("loginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoginServiceImpl.class);
	
	@Resource(name="loginMapper")
	private LoginMapper loginMapper;
	
	/** 로그인  */
	public LoginVO selectOneUsr(LoginVO vo) throws Exception{
		
		return  (LoginVO) loginMapper.selectOneUsr(vo);	
	}
	
	/** 전체 유저 조회  */
	public List<Map<String, Object>> selectListUsr() throws Exception{
		return (List<Map<String, Object>>) loginMapper.selectListUsr();
	}
	
	/** 전체 권한, 권한코드 조회  */
	public List<Map<String, Object>> selectListAuth() throws Exception{
		return (List<Map<String, Object>>) loginMapper.selectListAuth();
	}
	
	/** 사용자 권한, 사용여부 수정  */
	public int updateUsr(LoginVO vo) throws Exception{
		return loginMapper.updateUsr(vo);
	}  
	
}
	
