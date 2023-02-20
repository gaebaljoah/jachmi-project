package com.jachmi.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jachmi.domain.Criteria;
import com.jachmi.domain.SellerVO;

public interface SellerService {
	//전체목록
	//public List<SellerVO> getList();
	public List<SellerVO> getListWithPaging(Criteria cri);
	//테이블 내 전체 데이터 개수 구하기
	public int getTotal(Criteria cri);
	//데이터 삽입
	public void register(SellerVO vo);
	// 데이터가져오기
	public SellerVO get(long s_num);
	// 데이터수정
	public boolean modify(SellerVO vo);
	//데이터삭제
	public boolean remove(long s_num);
	
	//게시판별 카테고리 가져오기
	public List<SellerVO> category(String s_category);
	
	// 아이디로 내 데이터 조회
	public int getTotalConutid(Criteria cri);
	// 아이디로 데이터 조회
	public List<SellerVO> getTotalid(Criteria cri);
	
	
}
