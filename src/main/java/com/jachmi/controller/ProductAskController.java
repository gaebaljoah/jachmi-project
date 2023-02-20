package com.jachmi.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jachmi.domain.AskCriteriaVO;
import com.jachmi.domain.AskPageDTO;
import com.jachmi.domain.ProductAskVO;
import com.jachmi.service.ProductAskService;
import com.jachmi.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ask/*")
@AllArgsConstructor
public class ProductAskController {

	private ProductAskService service;
	// private ProductService m_service;

	@PostMapping("register")
	public String askRegister(ProductAskVO vo, @RequestParam("ask_id") String id,
			@RequestParam("ask_product_idx") int p_idx, @RequestParam("pageNum") int pageNum,
			@RequestParam("amount") int amount, RedirectAttributes rttr, Model model) {
		log.info(vo);
		service.askRegister(vo);
		// model.addAttribute("mvo",m_service.getReviewId(id));
		rttr.addAttribute("id", id);
		rttr.addAttribute("product_idx", p_idx);
		rttr.addAttribute("pageNum", pageNum);
		rttr.addAttribute("amount", amount);
		/* return "redirect:/product/detail_view?id="+id+"&product_idx="+p_idx; */
		return "redirect:/product/detail_view";
	}

	@PostMapping(value = "/read", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ProductAskVO askRead(@RequestBody ProductAskVO vo) {
		System.out.println("ask_idx!!!!!!!!!!!!!!비동기" + vo);
		return service.read(vo.getAsk_idx());
	}

	// 상품문의 전체글 보기
	@GetMapping("getAskListAdmin")
	public String getAskListAdmin(AskCriteriaVO cri, Model model) {
		log.info("list..." + cri);

		int total = service.getTotalAsk();
		log.info("total..." + total);
		model.addAttribute("list", service.getAllListAdmin(cri));
		model.addAttribute("pageMaker", new AskPageDTO(cri, total));
		return "product/9_answerPage";
	}

	// 상품문의글 상세보기
	@GetMapping("ask_detail_view")
	public String askDetailView(Model model, @RequestParam("ask_idx") int ask_idx) {
		model.addAttribute("oneList", service.read(ask_idx));
		return "product/10_answerDetailPage";

	}

	// 문의 답변 업데이트
	@PostMapping("update")
	public String updateAnswer(@RequestParam("pageNum") int pageNum, @RequestParam("amount") int amount,ProductAskVO vo,
			RedirectAttributes rttr) {
		
		service.update(vo);
		rttr.addAttribute("pageNum", pageNum);
		rttr.addAttribute("amount", amount);
		return "redirect:/ask/getAskListAdmin";
	}

}
