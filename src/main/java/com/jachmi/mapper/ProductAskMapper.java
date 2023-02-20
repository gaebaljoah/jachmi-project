package com.jachmi.mapper;

import java.util.List;

import com.jachmi.domain.AskCriteriaVO;
import com.jachmi.domain.ProductAskVO;

public interface ProductAskMapper {
	
	//문의 등록
	public void askInsert(ProductAskVO vo);
	
	//문의 리스트 보여주기
	public List<ProductAskVO> getAskListWithPaging(int product_idx);
	
	//문의 한가지 보여주기
	public ProductAskVO read(int ask_idx);
	
	//문의 전체 보여주기
	public List<ProductAskVO> getAllListAdmin(AskCriteriaVO cri);
	
	//문의사항 총 갯수 가지고오기
	public int getTotalAsk();
	
	//문의사항 업데이트 
	public void update(ProductAskVO vo);
}
	