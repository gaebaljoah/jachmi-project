package com.jachmi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jachmi.service.ChatService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/chat/*")
@Log4j
public class ChatMoveController {
	
	private ChatService service;
	
	@GetMapping("/chatting")
	public String chat() {
		return "/chat/chatting";
	}
	
	@GetMapping("/chat_list")
	public String chatList(Model model){
		model.addAttribute("list", service.chatList());
		return "chat/chat_list";
	}
	
	@PostMapping("/chat_admin")
	public String admin_chat(@RequestParam("sender") String sender, Model model) {
		model.addAttribute("sender", sender);
		System.out.println("chatid...." + sender);
		service.admin_chat(sender);
		return "/chat/chat_admin";
	}
}
