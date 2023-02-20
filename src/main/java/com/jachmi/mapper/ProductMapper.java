package com.jachmi.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.jachmi.domain.ProductCriteriaVO;
import com.jachmi.domain.MemberVO;
import com.jachmi.domain.ProductCategoryVO;
import com.jachmi.domain.ShopProductVO;

public interface ProductMapper {

	//상품등록
	public void productInsert(ShopProductVO vo);
	
	//페이징 처리된 상품 리스트
	public List<ShopProductVO> getListWithPaging(ProductCriteriaVO cri);
	
	// 테이블 내 전체 데이터 개수 구하기
	public int getTotalCount();
	
	//상품 디테일 페이지
	public ShopProductVO detailView(int product_idx);
	
	//리뷰 등록시 작성자 id 가져오기
	public MemberVO getReviewId(String id);
	
	//페이징 처리된 카테고리별 상품 리스트
	public List<ShopProductVO> get_list_by_category_with_paging(ProductCriteriaVO cri);
	
	// 카테고리별 리스트의 테이블 내 전체 데이터 개수 구하기
	public int getTotalCount_list_by_category_with_paging(int category_idx);
	
	//카테고리명 가져오기
	public ProductCategoryVO getCategoryName(int category_idx);
}
