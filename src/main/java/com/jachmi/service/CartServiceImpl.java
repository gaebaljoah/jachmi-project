package com.jachmi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jachmi.domain.CartVO;
import com.jachmi.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CartServiceImpl implements CartService{

	// mapper 의존성 주입
		@Setter(onMethod_ = @Autowired )
		private CartMapper mapper;

		//장바구니 insert
		@Override
		public int cartRegister(CartVO vo) {
		return mapper.cartInsert(vo);
		}

		@Override
		public List<CartVO> getCartList(String c_m_id){ 	
		return mapper.getCartList(c_m_id);
		}

		@Override
		public int countUpdate(CartVO vo) {
			return mapper.countUpdate(vo);
		}

		@Override
		public int remove_cart(int cart_idx) {
			return mapper.remove_cart(cart_idx);
		}

		
		
		
}
