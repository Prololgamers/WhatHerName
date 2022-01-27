package egovframework.bareun.cop.mnu.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.bareun.cop.bbs.service.BrdVO;
import egovframework.bareun.cop.bbs.service.impl.BrdMapper;
import egovframework.bareun.cop.mnu.service.MnuService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mnuService")
public class MnuServiceImpl extends EgovAbstractServiceImpl implements MnuService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MnuServiceImpl.class);
	
	
	@Resource(name="brdMapper")
	private BrdMapper brdMapper;
	
	@Resource(name="mnuMapper")
	private MnuMapper mnuMapper;

	
	
	
	
}
	
