package com.jachmi.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jachmi.domain.CartVO;
import com.jachmi.domain.ProductOrderVO;
import com.jachmi.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class OrderServiceImpl implements OrderService {
	// mapper 의존성 주입
	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;

	@Override
	public CartVO getCartList(int cart_idx) {

		return mapper.getCartList(cart_idx);
	}

	@Override
	public void insertOrder(ProductOrderVO vo) {

		mapper.insertOrder(vo);
	}

	@Override
	public List<ProductOrderVO> getOrderList(String m_id) {

		return mapper.getOrderList(m_id);
	}

	@Override
	public int allStatus(String order_id) {
		return mapper.allStatus(order_id);
	}

	@Override
	public int status1(String order_id) {
		return mapper.status1(order_id);
	}

	@Override
	public int status2(String order_id) {
		return mapper.status2(order_id);
	}

	@Override
	public int status3(String order_id) {
		return mapper.status3(order_id);
	}

	@Override
	public List<ProductOrderVO> getOrderOneList(Timestamp order_date) {
		return mapper.getOrderOneList(order_date);
	}

	@Override
	public ProductOrderVO getOrderInfo(Timestamp order_date) {
		
		return mapper.getOrderInfo(order_date);
		
		
	}

	@Override
	public int removeList(Timestamp order_date) {
		return mapper.removeList(order_date);
	}

}
