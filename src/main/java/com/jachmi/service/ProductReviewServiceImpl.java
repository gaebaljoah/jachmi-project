package com.jachmi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jachmi.domain.ProductCriteriaVO;
import com.jachmi.domain.ProductReviewVO;
import com.jachmi.domain.ReviewAndAskCreteriaVO;
import com.jachmi.mapper.ProductReviewMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductReviewServiceImpl implements ProductReviewService {

	
	// mapper 의존성 주입
	@Setter(onMethod_ = @Autowired )
	private ProductReviewMapper mapper;
	
	//리뷰등록
	@Override
	public void reviewRegister(ProductReviewVO vo) {
		log.info(vo);
		mapper.reviewInsert(vo);
	}

	//리뷰리스트 가져오기 
	@Override
	public List<ProductReviewVO> getReviewListWithPaging(ReviewAndAskCreteriaVO cri) {
	
		return mapper.getReviewListWithPaging(cri);
	}

	@Override
	public int getReviewTotalCount(int p_idx) {
		
		return mapper.getReviewTotalCount(p_idx);
	}


	
		
	

	
}
