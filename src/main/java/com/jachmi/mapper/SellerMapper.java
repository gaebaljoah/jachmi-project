package com.jachmi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jachmi.domain.Criteria;
import com.jachmi.domain.SellerVO;

public interface SellerMapper {
	// 전체 목록 가져오기
	public List<SellerVO> getList();
	public List<SellerVO> getListWithPaging(Criteria cri);
	//테이블 내 전체 데이터 개수 구하기
	public int getTotalConut(Criteria cri);
	//데이터삽입
	public void insert(SellerVO vo);
	//한 개 데이터 가져오기 read(long bno)
	public SellerVO read(long s_num);
	// 데이터 수정 update(BoardVO vo) -> 리턴 int
	// title, content,writer 변경 - 조건 bno
	public int update(SellerVO board);
	// 데이터 삭제 delete(long bno) -> 리턴 int
	public int delete(long s_num);	
	
	//카테고리별 조회 
	public List<SellerVO> category(String s_category);
	
	// 아이디로 내 데이터개수 조회
	public int getTotalConutid(Criteria cri);
	// 아이디로 데이터 조회
	public List<SellerVO> getTotalid(Criteria cri);
	//@Param 알고 있어야
	public void updateReplyCnt(@Param("s_num") long s_num, @Param("amount") int amount);
	
	
	
	
}
