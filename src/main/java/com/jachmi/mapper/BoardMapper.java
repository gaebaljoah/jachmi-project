package com.jachmi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jachmi.domain.BoardVO;
import com.jachmi.domain.Criteria_p;
import com.jachmi.domain.MemberVO;

public interface BoardMapper {
	
	// 전체 목록
	public List<BoardVO> getList();
	
	// 페이징 처리한 전체목록
	public List<BoardVO> getListWithPaging(Criteria_p cri);
	//제목 검색 목록
//	public List<BoardVO> getListWithPagingAsTitle(Criteria_p cri);
	//작성자 검색 목록
//	public List<BoardVO> getListWithPagingAsWriter(Criteria_p cri);
	
	// 테이블 전체 갯수
	public int getTotalCount(Criteria_p cri);
	//제목 검색 목록
//	public int getTotalCountAsTitle(Criteria_p cri);
	//작성자 검색 목록
//	public int getTotalCountAsWriter(Criteria_p cri);
	
	// 데이터 한개 가져오기
	public BoardVO get(long b_idx);
	
	// 데이터 삽입
	public void insert(BoardVO bvo);
	
	// 데이터 수정
	public int update(BoardVO bvo);
	
	// 데이터 삭제
	public int delete(long b_idx);
	
	// 댓글 갯수 
	public void updateReplyCnt(@Param("b_idx")long b_idx, @Param("amount") int amount);
	
	// 게시글, 댓글관련
	public long getB_idx();
	
	// 조회수
	public int updateHit(long b_idx);
	
	// 마이페이지 관련
	public List<BoardVO> getInfo(String b_writer);
}
