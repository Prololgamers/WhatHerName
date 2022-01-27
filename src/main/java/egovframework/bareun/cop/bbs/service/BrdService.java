package egovframework.bareun.cop.bbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;



public interface BrdService {

	void insertArticle(BrdVO vo) throws Exception;
	
    List<Map<String, Object>> selectArticle(BrdVO vo) throws Exception;
    
    List<Map<String, Object>> selectOneArticle(BrdVO vo) throws Exception;
    
    @Transactional
	int updateArticle(BrdVO vo) throws Exception;
	
}
