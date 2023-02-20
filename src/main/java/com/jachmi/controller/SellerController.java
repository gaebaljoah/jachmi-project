package com.jachmi.controller;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jachmi.domain.BuyerVO;
import com.jachmi.domain.Criteria;
import com.jachmi.domain.MailTO;
import com.jachmi.domain.MemberVO;
import com.jachmi.domain.PageDTO;
import com.jachmi.domain.SellerVO;
import com.jachmi.service.BuyerService;
import com.jachmi.service.MailService;
import com.jachmi.service.MemberService;
import com.jachmi.service.SellerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j 
@RequestMapping("/seller/*") //url맵핑과 같은역활
@AllArgsConstructor 	//풀생성자사용으로도 
public class SellerController {
	
	private SellerService service;
	private MemberService member;
	private BuyerService buyer;
	
	@Autowired
    private MailService mailService;
	
	// 전체리스트 
	@GetMapping("/list")	// url맵핑 get방식으로 접근
	public String list(Criteria cri,Model model,HttpSession session) {
		log.info("list : " + cri);
		int total = service.getTotal(cri);
		log.info("total : " +  total);
		log.info("cri : " + cri);
		
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker",new PageDTO(cri, total));
		//model.addAttribute("s_num",buyer.countsnum(s_num));
		//model.addAttribute("categorylist" , service.category(vo.getS_category()));
		
		return "seller/list";
	}
	@GetMapping("/test")	// url맵핑 get방식으로 접근
	public String test() {
		
		return "seller/test";
	}
	
	
	
	// 데이터 삽입창으로 이동
	@GetMapping("/insert")
	public String register(Model model,Criteria cri,HttpServletRequest httpServletRequest) {//리턴타입을 String으로해서 return에 갈곳 명시
		model.addAttribute("cri",cri);
		model.addAttribute("list", service.getListWithPaging(cri));
		
		 String centerAddr = httpServletRequest.getParameter("inputNm");
		 log.info("insertlocation123113212: ..." + centerAddr);
		 model.addAttribute("location", centerAddr);
		 
		
		return "seller/insert";
	}
	
	// 데이터 삽입
	@PostMapping("/insert")
	public String register(SellerVO vo, RedirectAttributes rttr, Criteria cri) {
		log.info("register..." + vo);
		service.register(vo);
		
		rttr.addFlashAttribute("result", "ok"); //경고창을 띄우기위한 코드 
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/seller/list"; //순수화면이동 board/list로 뿌려주겠다.
	}
	
	// 상세페이지
	@GetMapping("/get")
	public String get(@RequestParam("s_num") long s_num, Model model, Criteria cri,RedirectAttributes rttr) {
		log.info("get");
		model.addAttribute("vo", service.get(s_num));
		model.addAttribute("cri",cri);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		model.addAttribute("guest",buyer.guestList(s_num));
		
		
		return "seller/get";
	}
	
	// 수정페이지이동
	@GetMapping("/modify")
	public String modify(@RequestParam("s_num") long s_num, Model model,RedirectAttributes rttr, Criteria cri) {
		log.info("/modify");
		model.addAttribute("vo", service.get(s_num));	// 해당페이지에 vo란 이름으로 보내주기위한 addAttribute
		model.addAttribute("cri",cri);
		rttr.addFlashAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());
		
		return "/seller/modify";
	}
	
	@PostMapping("/modify")
	public String modify(SellerVO vo,RedirectAttributes rttr , Criteria cri) {
		log.info("/modify..." + vo);
		
		if(service.modify(vo)) {
			rttr.addFlashAttribute("result", "sucess");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/seller/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("s_num") long s_num,RedirectAttributes rttr, Criteria cri,String writer) {
		log.info("/remove");
		
		if(service.remove(s_num)) {
			rttr.addFlashAttribute("result", "delete");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/seller/list";
		
	}
	/*내 게시글 확인창 이동 */
	/*내참가서 확인 */
	@PostMapping("/myinsert")
	public String myinsert(Model model,Criteria cri) {
		log.info("myinsert..." );
		int total = service.getTotalConutid(cri);
		log.info("total:" + total);
		log.info("cri : : " + cri);
		
		
		model.addAttribute("list",service.getTotalid(cri));
		model.addAttribute("pageMaker",new PageDTO(cri, total));
		
		return "seller/myinsert";
	}
	
	
	/*--------------------게시물 신고창 이동---------------------------------*/
	@GetMapping("/declaration")
	public String declartion(@RequestParam("s_num") long s_num,Model model) {
		model.addAttribute("s_num",s_num);
		return "seller/declaration";
		
	}
	
	/*게시물 신고*/
	@PostMapping("/declaration")
	public String declartion(MailTO to,@RequestParam("s_num") long s_num,Model model) {
		log.info("to : "+ to );
		log.info("getreportcontent : "+to.getReportContent());
		log.info("getreportTitle : "+to.getReportTitle());
		model.addAttribute("s_num",s_num);
		
		 MailTO mailTO = new MailTO();
		
		 mailTO.setAddress("0623dlalswn@naver.com");
		 mailTO.setTitle("자취미생활 신고관련 메일입니다.");
		mailTO.setReportContent(to.getReportContent());
		mailTO.setReportTitle(to.getReportTitle());
		
		mailService.sendMail(mailTO);
		
		return"ok";
	}
	
	
	
	/*------------------참가자 목록,삽입,수정,삭제-------------------*/
	//참가서작성창으로 이동
	@GetMapping("/attend")
	public String attend(Model model,Criteria cri,@RequestParam("s_num") long s_num,@RequestParam("s_title") String s_title) {//리턴타입을 String으로해서 return에 갈곳 명시
		model.addAttribute("cri",cri);
		model.addAttribute("s_num",s_num);
		model.addAttribute("s_title",s_title);
		return "seller/attend";
	}
	
	//참가서작성 후 삽입
	@PostMapping("/attend")
	public void attend(BuyerVO vo, RedirectAttributes rttr, Criteria cri){
		log.info("register..." + vo);
		buyer.insertb(vo);
	}
	
	/*내참가서 확인 */
	@PostMapping("/myattend")
	public String myattend(Model model,RedirectAttributes rttr, Criteria cri) {
		log.info("myattend..." );
		
		
		int total = buyer.totalCountid(cri);
		
		log.info("total:" + total);
		log.info("cri : : " + cri);
		
		model.addAttribute("list", buyer.totalid(cri));
		
		model.addAttribute("pageMaker",new PageDTO(cri, total));
		
		return "seller/myattend";
	}
	
	/*내참가서 수정창 */
	@GetMapping("/attendmodify")
	public String attendmodify(@RequestParam("b_num") long b_num,Model model) {
		log.info("myatten : ..." );
		
		model.addAttribute("vo", buyer.read(b_num));	
		
		model.addAttribute("list", buyer.getList());
		
		return "seller/attendmodify";
	}
	//수정
	@PostMapping("/attendmodify")
	public String attendmodify(BuyerVO vo) {
		log.info("myattendmodify..." + vo);
		buyer.bmodify(vo);
		
		return "ok";
	}
	
	//삭제
	@PostMapping("/delete")
	public String delete(BuyerVO vo) {
		log.info("delete..." + vo);
		buyer.delete(vo);
		
		return "ok";
	}
	
	//내위치설정 팝업창이동
		@GetMapping("/location")
		public String location() {
			return "seller/location";
		}
	
	//내위치설정값 받아서 메인에넘기기
	@PostMapping("/location")
	public String test1(HttpServletRequest request,@RequestParam("inputNm") String centerAddr,RedirectAttributes rttr,Model model) {
		log.info("test1..." + centerAddr);
		rttr.addAttribute("location", centerAddr);
		model.addAttribute("location",centerAddr);
		
		return "redirect:/seller/insert";
	}
		
}	
