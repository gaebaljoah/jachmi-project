package com.jachmi.mapper;

import java.util.List;

import com.jachmi.domain.CommentVO;

public interface CommentMapper {
	
	// 댓글 목록
	public List<CommentVO> getList(long b_idx);

	// 댓글 읽기
	public CommentVO get(long c_idx);
	
	// 댓글 삽입
	public int insert(CommentVO cvo);
	
	// 댓글 수정
	public int update(CommentVO cvo);
		
	// 댓글 삭제
	public int delete(long c_idx);
	
	// 댓글게시글 삭제
	public void deleteAll(long b_idx);
}
