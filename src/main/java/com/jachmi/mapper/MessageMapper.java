package com.jachmi.mapper;

import java.util.List;

import com.jachmi.domain.MessageVO;

public interface MessageMapper {
	
	// 쪽지 목록
	public List<MessageVO> getList(String m_receiver);
	
	// 쪽지 읽기
	public MessageVO get(long m_idx);
	
	// 쪽지 삽입
	public int insert(MessageVO mvo);
	
	// 쪽지 삭제
	public int delete(long m_idx);
	
//	public int getTotalCount();

}
