package com.jachmi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jachmi.domain.MessageVO;
import com.jachmi.service.MessageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MessageController {
	
	private MessageService mservice;
	
	
	
	// 쪽지 전체 목록
	@GetMapping("/message/sml")
	public String list(Model model, String m_receiver) {
		log.info("Message!!!!!!!!!!!!!!!");
		log.info(m_receiver);
		
		model.addAttribute("mvo", mservice.getList(m_receiver));
		return "/message/sml";
	}
	
	// 쪽지 등록
	@GetMapping("/messsage/newMessage")
	public String insert(MessageVO mvo, RedirectAttributes rttr) {
		mservice.insert(mvo);
		
		return "redirect:/board/board_list";
	}
	
	// 쪽지 조회
	@GetMapping("/message/getMessage")
	public String getPop(MessageVO mvo, Model model) {
		
		log.info(mvo.getM_idx() + "!!!!!!!!!!!!!!!!");
		
		model.addAttribute("mvo", mservice.get(mvo.getM_idx()));
		
		return "/message/smg";
	}
	
	// 쪽지삭제
	@PostMapping("/message/messageDelete")
	public String delete(@RequestParam("m_idx") long m_idx) {
		log.info(m_idx + "!@!@!@!@!@!@!@!@!@!");
		mservice.delete(m_idx);
		
		return "/message/deletePage";
	}
	
}
