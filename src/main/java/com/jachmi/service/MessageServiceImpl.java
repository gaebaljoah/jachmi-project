package com.jachmi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jachmi.domain.MessageVO;
import com.jachmi.mapper.MessageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MessageServiceImpl implements MessageService{
	
	@Setter(onMethod_ = @Autowired)
	private MessageMapper mapper;

	@Override
	public List<MessageVO> getList(String m_receiver) {
		return mapper.getList(m_receiver);
	}

	@Override
	public MessageVO get(long m_idx) {
		return mapper.get(m_idx);
	}

	@Override
	public int insert(MessageVO mvo) {
		return mapper.insert(mvo);
	}

	@Override
	public int delete(long m_idx) {
		return mapper.delete(m_idx);
	}

//	@Override
//	public int getTotal() {
//		return mapper.getTotalCount();
//	}
	
	

}
