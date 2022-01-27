package egovframework.bareun.cop.bbs.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.bareun.cop.bbs.service.BrdService;
import egovframework.bareun.cop.bbs.service.BrdVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("brdService")
public class BrdServiceImpl extends EgovAbstractServiceImpl implements BrdService {

	private static final Logger LOGGER = LoggerFactory.getLogger(BrdServiceImpl.class);
	
	@Resource(name="brdMapper")
	private BrdMapper brdMapper;

	
	/** 게시글 작성 */
	@Transactional
	public void insertArticle(BrdVO boardVO) throws Exception{ 
		
		brdMapper.insertArticle(boardVO);
	}
	
	
	/** 게시판 전체조회*/
	public List<Map<String, Object>> selectArticle(BrdVO vo) throws Exception{
		
		List<Map<String, Object>> map = brdMapper.selectArticle(vo);
		return map;
	}
	
	/** 게시글 상세조회*/
	public List<Map<String, Object>> selectOneArticle(BrdVO vo) throws Exception{
		
		List<Map<String, Object>> map = brdMapper.selectOneArticle(vo);
		return map;
	}
	
	/** 게시글 수정 */
	public int updateArticle(BrdVO vo) throws Exception{
		int result = brdMapper.updateArticle(vo);
		return result;
	}
	
}
	
