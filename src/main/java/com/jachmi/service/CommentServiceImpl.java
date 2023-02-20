package com.jachmi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jachmi.domain.CommentVO;
import com.jachmi.mapper.BoardMapper;
import com.jachmi.mapper.CommentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CommentServiceImpl implements CommentService{
	@Setter(onMethod_ = @Autowired)
	private CommentMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper bmapper;
	
	// 댓글 목록
	@Override
	public List<CommentVO> getList(long b_idx) {
		return mapper.getList(b_idx);
	}
	
	// 댓글 읽기
	@Override
	public CommentVO get(long c_idx) {
		log.info("getComment!!!!!!!!!!!!!" + c_idx);
		return mapper.get(c_idx);
	}
	
	// 댓글 삽입
	@Transactional
	@Override
	public int insert(CommentVO cvo) {
		log.info("insertComment!!!!!!!!!!!!!!");
		bmapper.updateReplyCnt(cvo.getB_idx(), 1);
		return mapper.insert(cvo);
	}
	
	// 댓글 수정
	@Override
	public int update(CommentVO cvo) {
		log.info("updateComment!!!!!!!!!!!!!" + cvo);
		return mapper.update(cvo);
	}
	
	// 댓글 삭제
	@Transactional
	@Override
	public int delete(long c_idx) {
		log.info("deleteComment!!!!!!!!!!!!!!!!" + c_idx);
		CommentVO cvo = mapper.get(c_idx);
		bmapper.updateReplyCnt(cvo.getB_idx(), -1);
		return mapper.delete(c_idx);
	}
	
}
