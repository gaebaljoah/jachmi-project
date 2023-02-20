package com.jachmi.service;

import java.sql.Timestamp;
import java.util.List;

import com.jachmi.domain.CartVO;
import com.jachmi.domain.ProductOrderVO;

public interface OrderService {
	// 장바구니 리스트 가져오기
	public CartVO getCartList(int cart_idx);
	// 주문내역 insert
	public void insertOrder(ProductOrderVO vo);

	// 주문내역 전체 list 가져오기
	public List<ProductOrderVO> getOrderList(String m_id);

	// 주문상태 전체 가져오기
	public int allStatus(String order_id);

	// 입금확인중 갯수 가져오기
	public int status1(String order_id);

	// 입금확인중 갯수 가져오기
	public int status2(String order_id);

	// 입금확인중 갯수 가져오기
	public int status3(String order_id);
	
	//주문 상세내역가져오기 
	public List<ProductOrderVO> getOrderOneList(Timestamp order_date);
	
	//주문상세 내역 배송 정보 가져오기
	public ProductOrderVO getOrderInfo(Timestamp order_date);
	
	//주문상세 내역 삭제하기
	public int removeList(Timestamp order_date);
}
