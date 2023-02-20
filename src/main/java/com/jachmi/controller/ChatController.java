package com.jachmi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jachmi.domain.ChatVO;
import com.jachmi.service.ChatService;

import lombok.Setter;

@RestController
public class ChatController {
	
	@Setter(onMethod_ = @Autowired)
	private ChatService service;

	@RequestMapping("/chat.json")
	public List<ChatVO> list(ChatVO vo){
		String id = vo.getSender();
		System.out.println("id....." + id);
		return service.list(id);
	}	
	
	@RequestMapping(value="/chat/insert",method=RequestMethod.POST)
	public void chat_insert(ChatVO vo){
		service.chat_insert(vo);
	}
	
	@RequestMapping(value="/chat/admin_insert",method=RequestMethod.POST)
	public void admin_insert(ChatVO vo){
		service.admin_insert(vo);
	}
	
	@RequestMapping("/admin.json")
	public List<ChatVO> admin_chat(ChatVO vo){
		String id = vo.getSender();
		System.out.println("ajax id....." + id);
		return service.admin_chat(id);
	}	
}