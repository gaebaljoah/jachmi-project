package com.jachmi.service;

import java.util.List;


import com.jachmi.domain.ProductCriteriaVO;
import com.jachmi.domain.MemberVO;
import com.jachmi.domain.ProductCategoryVO;
import com.jachmi.domain.ShopProductVO;

public interface ProductService {
	//상품등록
	public void register(ShopProductVO vo);
	//페이징 처리된 상품 리스트
	public List<ShopProductVO> getListWithPaging(ProductCriteriaVO cri);
	//페이지 총 개수 가지고 오기
	public int getTotal();
	//상품 디테일 페이지
	public ShopProductVO getDetailView(int product_idx);
	//리뷰 등록시 작성자 id 가져오기
	public MemberVO getReviewId(String id);
	//페이징 처리된 카테고리별 상품 리스트
	public List<ShopProductVO> get_list_by_category_with_paging(ProductCriteriaVO cri);
	//public List<ShopProductVO> get_list_by_category_with_paging(@RequestParam("pageNum") int pageNum,@RequestParam("amount") int amount,int category_idx);
	//public List<ShopProductVO> get_list_by_category_with_paging(Criteria cri,int category_idx);
	// 카테고리별 리스트의 테이블 내 전체 데이터 개수 구하기
	public int getTotalCount_list_by_category_with_paging(int category_idx);

	//카테고리명 가져오기
		public ProductCategoryVO getCategoryName(int category_idx);
}
