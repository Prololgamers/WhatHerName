package egovframework.bareun.uat.uia.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import egovframework.bareun.cmmn.LoginVO;
import egovframework.bareun.cop.bbs.service.BrdVO;



public interface LoginService {

	/** 로그인  */
	LoginVO selectOneUsr(LoginVO vo) throws Exception;
	/** 전체 유저 조회  */
	List<Map<String, Object>> selectListUsr() throws Exception;
	/** 사용자 권한, 사용여부 수정 */
	@Transactional
	int updateUsr(LoginVO vo) throws Exception;
	/** 전체 권한, 권한코드 조회  */
	List<Map<String, Object>> selectListAuth() throws Exception;
}
