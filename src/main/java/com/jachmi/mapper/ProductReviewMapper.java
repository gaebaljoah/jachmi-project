 package com.jachmi.mapper;


import java.util.List;

import com.jachmi.domain.ProductCriteriaVO;
import com.jachmi.domain.ProductReviewVO;
import com.jachmi.domain.ReviewAndAskCreteriaVO;

public interface ProductReviewMapper {

		//리뷰 등록
		public void reviewInsert(ProductReviewVO vo);
		
		//전체 리뷰 가져오기
		public List<ProductReviewVO> getReviewListWithPaging(ReviewAndAskCreteriaVO cri);
		
		//상품 리뷰 총 갯수 가져오기
		public int getReviewTotalCount(int p_idx);
		
}
