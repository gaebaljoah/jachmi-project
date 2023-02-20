package com.jachmi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jachmi.domain.BuyerVO;
import com.jachmi.domain.Criteria;
import com.jachmi.domain.SellerVO;
import com.jachmi.mapper.BuyerMapper;
import com.jachmi.mapper.SellerMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class BuyerServiceImpl implements BuyerService{
	//mapper 의존성 주입
	@Setter(onMethod_ = @Autowired)
	private BuyerMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private SellerMapper boardMapper;
	
	@Transactional 
	@Override
	public void insertb(BuyerVO vo) {
		log.info("register : " + vo);
		log.info("VO.GETS_NUM :: " + vo.getS_num());
		
		
		// replycnt 컬럼 1증가
		boardMapper.updateReplyCnt(vo.getS_num(), 1);
		
		mapper.insertb(vo);
	}

	@Override
	public List<BuyerVO> getList() {
		return mapper.getList();
	}

	@Override
	public BuyerVO read(long s_num) {
		return mapper.read(s_num);
	}

	@Override
	public int bmodify(BuyerVO vo) {
		return mapper.bmodify(vo);
	}
	
	@Transactional
	@Override
	public int delete(BuyerVO vo) {
		
		// replycnt 컬럼 1증가
		boardMapper.updateReplyCnt(vo.getS_num(), -1);
		
		return mapper.delete(vo);
	}

	@Override
	public List<BuyerVO> guestList(long b_num) {
		return mapper.guestList(b_num);
	}

	@Override
	public int totalCountid(Criteria cri) {
		return mapper.totalCountid(cri);
	}

	@Override
	public List<BuyerVO> totalid(Criteria cri) {
		return mapper.totalid(cri);
	}

	@Override
	public BuyerVO countsnum(long s_num) {
		return mapper.countsnum(s_num);
	}
	
	
	
	
	
	
	
	
	
	
	

}
