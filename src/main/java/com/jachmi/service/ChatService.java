package com.jachmi.service;


import java.util.List;

import com.jachmi.domain.ChatVO;

public interface ChatService {
	public List<ChatVO> list(String id);
	
	public int chat_insert(ChatVO vo);
	
	public int admin_insert(ChatVO vo);
	
	public List<ChatVO> chatList();
	
	public List<ChatVO> admin_chat(String id);
}
