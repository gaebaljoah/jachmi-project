package com.jachmi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jachmi.domain.Criteria;
import com.jachmi.domain.NoticeAttachVO;
import com.jachmi.domain.NoticeVO;
import com.jachmi.domain.PageDTO;
import com.jachmi.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class noticeController {
	
	private NoticeService service;
	
	@GetMapping("/nList")
	public String nList(Criteria cri, Model model) {
		log.info("nList..." + cri);
		
		int total = service.getTotal();
		
		model.addAttribute("nList", service.getListWitgPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "notice/nList";
	}
	
	@GetMapping("/nSearchList")
	public String nSearchList(Model model, @RequestParam("nColumn") String nColumn, @RequestParam("nSearch") String nSearch, @RequestParam("pageNum") int pageNum,
								Criteria cri) {
		log.info("nSearchList..." + cri);
		log.info(nSearch);
		log.info(nColumn);
		
		Map<String, Object> smap = new HashMap<>();
        smap.put("nColumn", nColumn);
        smap.put("nSearch", nSearch);
        smap.put("pageNum", pageNum);
        smap.put("amount", 15);
        
        int total = service.getTotalSearchCount(smap);
        model.addAttribute("nList", service.nSearch(smap));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
        model.addAttribute("nSearch", nSearch); 
		
		
		return "notice/nSearchList";
	}
	
	@GetMapping("/nRegister")
	public String register(Model model, Criteria cri) {
		model.addAttribute("cri",cri);
		return "notice/nRegister";
	}
	
	@PostMapping("/nRegister")
	public String register(NoticeVO vo, RedirectAttributes rttr, Criteria cri) {
		vo.setN_content(vo.getN_content().replace("\r\n", "<br>"));
		log.info("" + vo);
		service.ninsert(vo);
		
		rttr.addFlashAttribute("result", "ok");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());		
		
		return "redirect:/notice/nList";
	}
	
	@GetMapping("/nGet")
	public String get(@RequestParam("n_idx") long n_idx, Model model, Criteria cri) {
		log.info("/nGet");
		model.addAttribute("vo", service.nRead(n_idx));
		model.addAttribute("cri", cri);
		
		return "/notice/nGet";
	}
	
	@GetMapping("/nModify")
	public String nModify(@RequestParam("n_idx") long n_idx, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("/nModify");
		log.info(cri.getAmount());
		log.info(cri.getPageNum());
		model.addAttribute("vo", service.nRead(n_idx));
		return "/notice/nModify";
	}
	
	@PostMapping("/nModify")
	public String nModify(NoticeVO vo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		log.info("nModify..." + vo);
		vo.setN_content(vo.getN_content().replace("\r\n", "<br>"));
		if(service.nUpdate(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/notice/nList";
	}
	
	@GetMapping("/nRemove")
	public String nRemove(@RequestParam("n_idx") long n_idx, Model model) {
		log.info("/remove");
		model.addAttribute("vo", service.nRead(n_idx));
		return "/notice/nRemove";
	}
	
	@PostMapping("/nRemove")
	public String nRemove(@RequestParam("n_idx") long n_idx, RedirectAttributes rttr, 
						Criteria cri, String writer) {
		log.info("remove..." + n_idx);
		
		if(service.nDelete(n_idx)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/notice/nList";
	}	
	
	@GetMapping(value = "/n_getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<NoticeAttachVO>> n_getAttachList(long n_idx){
		log.info("n_getAttachList" + n_idx);
		return new ResponseEntity<List<NoticeAttachVO>>(service.n_getAttachList(n_idx), HttpStatus.OK);
	}
}
