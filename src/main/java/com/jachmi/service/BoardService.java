package com.jachmi.service;

import java.util.List;

import com.jachmi.domain.BoardAttachVO;
import com.jachmi.domain.BoardVO;
import com.jachmi.domain.Criteria_p;

public interface BoardService {

//	// 전체 목록
//	public List<BoardVO> getList();
	
	// 페이징 처리한 전체 목록
	public List<BoardVO> getListWithPaging(Criteria_p cri);
	
	// 테이블 전체 갯수
	public int getTotal(Criteria_p cri);

	// 데이터 한 개 가져오기
	public BoardVO get(long b_idx);
	
	// 데이터 삽입
	public void insert(BoardVO bvo);
	  
	// 데이터 수정
	public boolean update(BoardVO bvo);
	
	// 데이터 삭제
	public boolean delete(long b_idx);
	
	// 첨부파일 관련
	public List<BoardAttachVO> getAttachList(long b_idx);
	
	// 조회수
	public int updateHit(long b_idx);
	
	// 마이페이지
	public List<BoardVO> getInfo(String b_writer);
	
}
