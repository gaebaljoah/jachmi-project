package com.jachmi.mapper;

import java.util.List;

import com.jachmi.domain.BuyerVO;
import com.jachmi.domain.Criteria;
import com.jachmi.domain.SellerVO;

public interface BuyerMapper {
		//데이터삽입
		public void insertb(BuyerVO vo);
		//데이터리스트
		public List<BuyerVO> getList();
		//한 개 데이터 가져오기 read(long bno)
		public BuyerVO read(long s_num);
		//수정
		public int bmodify(BuyerVO vo);
		//삭제
		public int delete(BuyerVO vo);
		// 게시물에 맞는 참가자목록 가져오기
		public List<BuyerVO> guestList(long b_num);
		// 아이디로 내 데이터 조회
		public int totalCountid(Criteria cri);
		// 아이디로 데이터 조회
		public List<BuyerVO> totalid(Criteria cri);
		// s_num에 개수세기
		public BuyerVO countsnum(long s_num);
		
}