package com.jachmi.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.jachmi.domain.BoardAttachVO;
import com.jachmi.domain.BoardVO;
import com.jachmi.domain.CommentVO;
import com.jachmi.domain.Criteria_p;
import com.jachmi.domain.MemberVO;
import com.jachmi.domain.PageDTO_board;
import com.jachmi.service.BoardService;
import com.jachmi.service.CommentService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;

	@Setter(onMethod_ = @Autowired)
	private CommentService cservice;
	
	
	// 페이징 처리한 전체목록
	@GetMapping("/board_list")
	public String list() {
		return "/board/board_list";
	}
	
	// 페이징 처리한 전체목록
	@PostMapping(value = "/board_list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public ResponseEntity<List<BoardVO>> list(@RequestBody Criteria_p cri, Model model) {
		log.info("board_list.............");
		
		System.out.println(cri.getAmount());
		System.out.println(cri.getPageNum());	    
		System.out.println(cri.getKeyword());
		System.out.println(cri.getType());
		System.out.println(cri.getB_category());
		
		List<BoardVO> list = service.getListWithPaging(cri);
		for(BoardVO bvo : list) {
			log.error(bvo.getB_date());
		}
		
		int total = service.getTotal(cri);
		PageDTO_board pdto = new PageDTO_board(cri, total);
		
		//model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", pdto);
		
		return new ResponseEntity<List<BoardVO>>(list, HttpStatus.OK);
	}
	// 페이징 처리한 전체목록 페이지
	@PostMapping(value = "/board_list_page", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public ResponseEntity<PageDTO_board> listPage(@RequestBody Criteria_p cri) {
		
		log.info("board_list_page.............");
		
		
		System.out.println(cri.getAmount() + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(cri.getPageNum() + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		int total = service.getTotal(cri);
		System.out.println(total + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		PageDTO_board pdto = new PageDTO_board(cri, total);
		
		
		return new ResponseEntity<PageDTO_board>(pdto, HttpStatus.OK);
	}
		
	// 게시물 상세보기
	@RequestMapping(value = "/board_get", method = RequestMethod.GET)
	public String get(@RequestParam("b_idx") long b_idx,
			 @ModelAttribute("cri") Criteria_p cri, 
			 Model model) throws Exception{
		log.info("/get!!!!!!!!!!!!!!!!!!");
		log.info("!!!!!!!!!!!!!!!!!!" + b_idx);
		log.info("!!!!!!!!!!!!!!!!!!" + cri.getAmount() + "/" + cri.getPageNum() + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		
		model.addAttribute("bvo", service.get(b_idx));
		model.addAttribute("cri", cri);
		
		// 조회수
		model.addAttribute("C_hit", service.updateHit(b_idx));
		
		// 댓글
		List<CommentVO> cList = cservice.getList(b_idx);
		model.addAttribute("cList", cList);
		
		return "/board/board_get";
	}
	
	// 데이터 삽입
	@PostMapping("/board_insert")
	public String insert(BoardVO bvo, RedirectAttributes rttr, Criteria_p cri) {
		log.info("register!!!!!!!!!!!" + bvo);
		service.insert(bvo);
		
		List<BoardAttachVO> list = bvo.getAttachList();
		
		if (list != null && list.size() > 0) {
			for(BoardAttachVO vo2 : list) {
				log.info("!!!!!!!!!!!filename : " + vo2.getB_fileName());
				log.info("!!!!!!!!!!!path : " + vo2.getB_uploadPath());
				log.info("!!!!!!!!!!!uuid : " + vo2.getB_uuid());
			}
		}
		
		rttr.addFlashAttribute("result", "ok");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/board_list";
	}
	// 데이터 삽입(화면 입력받기 위함)
	@GetMapping("/board_insert")
	public String insert(Model model, Criteria_p cri) {
		log.info("board_register!!!!!!!!!!!!!!");
		model.addAttribute("cri", cri);
		
		log.info(cri.getPageNum() + "!!!!!!!!!!!!!!!!!!!!!" + cri.getAmount());
		return "board/board_insert";
	}
	
	// 데이터 수정
	@PostMapping("/board_update")
	public String update(BoardVO bvo, RedirectAttributes rttr, Criteria_p cri) {
		log.info("update!!!!!!!!!!!!!!!!!!!");
		
		if (service.update(bvo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		log.info("cri.getPageNum................"+cri.getPageNum());
		log.info("cri.getPageNum................"+cri.getPageNum());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/board_list";
	}
	
	// 데이터 수정(화면 입력받기 위함)
	@GetMapping("/board_update")
	public String update(@RequestParam("b_idx") long b_idx, Model model, Criteria_p cri) {
		log.info("update!!!!!!!!!!!!!!!!!!!!!get!!!!!!!!!!!!!!!");
		model.addAttribute("bvo", service.get(b_idx));
		model.addAttribute("cri", cri);
		
		log.info(b_idx + "?!?!?!?!?!?!?!?!?!@#@$%?#^%&*");
		log.info(cri.getPageNum() + "///////" + cri.getAmount());
		return "/board/board_update";
	}
	
	// 데이터 삭제
	@PostMapping("/board_delete")
	public String delete(@RequestParam("b_idx") long b_idx, RedirectAttributes rttr, Criteria_p cri) {
		log.info("delete!!!!!!!!!!!!!!" + b_idx);
		List<BoardAttachVO> attachList = service.getAttachList(b_idx);
		if (service.delete(b_idx)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/board_list";
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) return;
		log.info(attachList);
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\projectUpload\\" + attach.getB_uploadPath() + "\\" + attach.getB_uuid() + "_" + attach.getB_fileName());
				Files.deleteIfExists(file);
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C\\projectUpload\\" + attach.getB_uploadPath() + "\\s_" + attach.getB_uuid() + "_" + attach.getB_fileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error : " + e.getMessage());
			}
		});
	}

	// 첨부파일
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(long b_idx){

		return new ResponseEntity<List<BoardAttachVO>>(service.getAttachList(b_idx), HttpStatus.OK);
	}
	
	
	// 마이페이지 - 내 게시글 조회
	@PostMapping(value = "/board_list_getOne", produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public ResponseEntity<List<BoardVO>> list(String b_writer, HttpSession session) {
		log.info("board_list_One.............");
		
		
		BoardVO bvo = new BoardVO();
		
		MemberVO signIn = (MemberVO) session.getAttribute("signIn");
		log.info("?!?!?!?!?!?!?!?!?!?!?!" + signIn.getId());
		
		String id = signIn.getId();
		
		bvo.setB_writer(id);
		
		log.info(bvo.getB_writer() + "과연!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!");
		
		
		List<BoardVO> mList = null;
		mList = service.getInfo(signIn.getId());
		
		for(BoardVO bvo2 : mList) {
			log.error(bvo2.getB_writer());
		}
		
		return new ResponseEntity<List<BoardVO>>(mList, HttpStatus.OK);
	}
	
	@GetMapping("getOne")
	public String moveGetOne() {
		return "board/board_list_getOne";
	}
}
