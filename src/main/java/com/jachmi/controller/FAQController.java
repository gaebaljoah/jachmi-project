package com.jachmi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jachmi.domain.Criteria;
import com.jachmi.domain.FAQVO;
import com.jachmi.domain.PageDTO;
import com.jachmi.service.FAQService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/faq/*")
@AllArgsConstructor
public class FAQController {
	
	private FAQService service;
	
	@GetMapping("/faq_list")
	public String faq_list(Criteria cri, Model model) {
		log.info("faq_list..." + cri);
		int total = service.faq_getTotalCount();
		
		model.addAttribute("cri", cri);
		model.addAttribute("faq_list", service.faq_getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "faq/faq_list";
	}
	
	@GetMapping("/faq_selectBox")
	public String faq_selectBox(Model model, @RequestParam("faq_category") String faq_category, @ModelAttribute("cri") Criteria cri) {
		log.info("확인용");
		FAQVO vo = new FAQVO();
		int total; 
		
		if(faq_category.equals("전체")) {
			total = service.faq_getTotalCount();
			model.addAttribute("faq_list", service.faq_getListWithPaging(cri));
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			return "faq/faq_list";
		}else {
			vo.setAmount(cri.getAmount());
			vo.setPageNum(cri.getPageNum());
			vo.setFaq_category(faq_category);
			
			log.info(vo.getAmount());
			log.info(vo.getPageNum());
			
			total= service.faq_getSelTotalCount(vo);
			
			model.addAttribute("category", faq_category);
			model.addAttribute("faq_list", service.selFaq_category(vo));
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			
			return "faq/faq_selectBox";
		}
	}	
	
	@GetMapping("/faq_register")
	public String faq_register(Model model, Criteria cri) {
		log.info("register....");
		model.addAttribute("cri", cri);
		return "faq/faq_register";
	}
	
	@PostMapping("/faq_register")
	public String faq_register(FAQVO vo, RedirectAttributes rttr, Criteria cri) {
		vo.setFaq_content(vo.getFaq_content().replace("\r\n", "<br>"));

		log.info("faq_register...." + vo);
		
		service.faq_insert(vo);
		
		rttr.addFlashAttribute("result", "ok");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/faq/faq_list";
	}
	
	@GetMapping("/faq_remove")
	public String faq_remove(@RequestParam("faq_idx") long faq_idx, Model model) {
		log.info("/faq_remove");
		return "/faq/faq_remove";
	}
	
	@PostMapping("/faq_remove")
	public String faq_remove(@RequestParam("faq_idx") long faq_idx, RedirectAttributes rttr,
							Criteria cri) {
		log.info("faq_remove..." + faq_idx);
		
		if(service.faq_delete(faq_idx)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/faq/faq_list";
	}
	
	@GetMapping("/faq_modify")
	public String nModify(@RequestParam("faq_idx") long faq_idx, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("/faq_modify");
		model.addAttribute("faq", service.faq_read(faq_idx));
		return "/faq/faq_modify";
	}
	
	@PostMapping("/faq_modify")
	public String nModify(FAQVO vo, RedirectAttributes rttr, @RequestParam("pageNum") int pageNum, @RequestParam("amount") int amount) {
		log.info("faq_modify..." + vo);
		vo.setFaq_content(vo.getFaq_content().replace("\r\n", "<br>"));
		
		if(service.faq_update(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", pageNum);
		rttr.addAttribute("amount", amount);
		return "redirect:/faq/faq_list";
	}	
}
