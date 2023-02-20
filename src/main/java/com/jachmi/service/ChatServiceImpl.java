package com.jachmi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jachmi.domain.ChatVO;
import com.jachmi.mapper.ChatMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ChatServiceImpl implements ChatService{

	@Setter(onMethod_ = @Autowired)
	private ChatMapper mapper;
	
	@Override
	public int chat_insert(ChatVO vo) {
		log.info("chat_insert......");
		return mapper.chat_insert(vo);
	}

	@Override
	public List<ChatVO> list(String id) {
		return mapper.list(id);
	}

	@Override
	public List<ChatVO> chatList() {
		return mapper.chatList();
	}

	@Override
	public List<ChatVO> admin_chat(String id) {
		return mapper.admin_chat(id);
	}

	@Override
	public int admin_insert(ChatVO vo) {
		return mapper.admin_insert(vo);
	}

	
	
}
