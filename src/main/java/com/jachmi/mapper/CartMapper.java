package com.jachmi.mapper;

import java.util.List;

import com.jachmi.domain.CartVO;

public interface CartMapper {

	//장바구니 등록
		public int cartInsert(CartVO vo);
	
	//장바구니 리스트 가져오기
		public List<CartVO> getCartList(String cart_m_id);
		
	//장바구니 수량 업데이트
		public int countUpdate(CartVO vo);

	//장바구니 삭제 
		public int remove_cart(int cart_idx);
}
