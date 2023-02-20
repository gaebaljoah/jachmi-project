package com.jachmi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.jachmi.domain.ProductCriteriaVO;
import com.jachmi.domain.MemberVO;
import com.jachmi.domain.ProductCategoryVO;
import com.jachmi.domain.ShopProductVO;
import com.jachmi.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class ProductServiceImpl implements ProductService{

	// mapper 의존성 주입
	@Setter(onMethod_ = @Autowired )
	private ProductMapper mapper;
	
	//상품등록
	@Override
	public void register(ShopProductVO vo) {
	log.info(vo);
	mapper.productInsert(vo);
	}

	//페이징 처리된 상품 리스트 보기
	@Override
	public List<ShopProductVO> getListWithPaging(ProductCriteriaVO cri) {
	log.info("get List with Criteria..." + cri);
	return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal() {
		log.info("getTotalCount...");
		return mapper.getTotalCount();
	}
	//상품 상세페이지
	@Override
	public ShopProductVO getDetailView(int product_idx) {
		return mapper.detailView(product_idx);
	}
	//상품 리뷰 아이디 가져오기
	@Override
	public MemberVO getReviewId(String id) {
		return mapper.getReviewId(id);
	}

	@Override
	public List<ShopProductVO> get_list_by_category_with_paging(ProductCriteriaVO cri) {
	return mapper.get_list_by_category_with_paging(cri);
	}

	@Override
	public int getTotalCount_list_by_category_with_paging(int category_idx) {
	return mapper.getTotalCount_list_by_category_with_paging(category_idx);
	}

	@Override
	public ProductCategoryVO getCategoryName(int category_idx) {
		
		return mapper.getCategoryName(category_idx);
	}

	
	
	

	
	
	
	
	
}
