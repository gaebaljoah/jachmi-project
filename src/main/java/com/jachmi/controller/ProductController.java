package com.jachmi.controller;

import java.io.File;

import com.jachmi.domain.ProductCategoryVO;
import com.jachmi.domain.ProductCriteriaVO;
import com.jachmi.domain.ProductPageDTO;
import com.jachmi.domain.ProductReviewVO;
import com.jachmi.domain.ReviewAndAskCreteriaVO;
import com.jachmi.domain.ReviewAndAskPageDTO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jachmi.domain.ShopProductVO;
import com.jachmi.service.ProductAskService;
import com.jachmi.service.ProductReviewService;
import com.jachmi.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {

// 메소드의 스트링타입으로 경로를 지정해주자 
// GetMapping 리턴은 jsp
// PostMapping 리턴은 UrlMapping

	private ProductService service;
	private ProductReviewService r_service;
	private ProductAskService a_service;
	// 상품페이지로 이동
	@GetMapping("allList")
	public String selectAllList(ProductCriteriaVO cri,Model model) {
		log.info("list.." + cri);
		int total = service.getTotal();
		log.info("total.." + total);
		model.addAttribute("list",service.getListWithPaging(cri));
		model.addAttribute("pageMaker",new ProductPageDTO(cri,total));
		System.out.println("------------------------------cri pagenum"+cri.getPageNum());
		System.out.println("------------------------------cri amount"+cri.getAmount());
		return "product/1_selectAllListPage";  
	}

	// 카테고리 상품페이지로 이동
	@GetMapping("list_by_category")
	public String get_list_by_category(ProductCriteriaVO cri,@RequestParam("pageNum") int pageNum,@RequestParam("amount") int amount,
			Model model, @RequestParam("category_idx") int category_idx, ProductCategoryVO vo) {
		log.info("list.." + cri);
		int total = service.getTotalCount_list_by_category_with_paging(category_idx);
		log.info("total list_by_category.." + total);
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		//mapper에 여러개의 vo에 담겨있는 parameter값을 넘기려 하니, 오류가 발생했다.
		//그냥 criteria에 필드를 하나 더 생성하여 처리했다.. 
		//mapper에서 여러개의 파라미터 값을 담는 방법이 있지만, 그냥 복잡해서 필드를 추가해서 실행함.
		System.out.println("amount----------------------------------"+cri.getAmount());
		System.out.println("pageNum----------------------------------"+cri.getPageNum());
		System.out.println("category_idx----------------------------------"+cri.getCategory_idx());
		System.out.println("------------------------------cri pagenum2" + cri.getPageNum());
		System.out.println("------------------------------cri amount2" + cri.getAmount());
		
		model.addAttribute("list", service.get_list_by_category_with_paging(cri));
		model.addAttribute("pageMaker", new ProductPageDTO(cri, total));
		model.addAttribute("category_name",service.getCategoryName(category_idx));
		System.out.println("카테고리이름1............"+service.getCategoryName(category_idx));
		System.out.println("카테고리이름2............"+vo.getProduct_category_name());
		return "product/1_selectAllListPage";
	}

	// 상품등록 클릭시 상품등록 페이지로이동
	@GetMapping("register")
	public String productRegister() {
		return "product/3_productRegisterPage";
	}

	// 상품등록페이지에 실제 상품등록시 insert
	@PostMapping("register")
	public String productRegister(ProductCriteriaVO cri, ShopProductVO vo, 
			@RequestParam("product_p_img") MultipartFile file1,
			@RequestParam("product_p_img_desc1") MultipartFile file2,
			@RequestParam("product_p_img_desc2") MultipartFile file3,
			@RequestParam("product_p_img_desc3") MultipartFile file4,
			RedirectAttributes rttr) {

		//multipart와 multypartrequest 차이 알아보기
		// 이미지 저장 폴더 생성
		String uploadFolder = "C:\\uploadImages";
		// 파일 이름 가져오기
		String uploadFileName = file1.getOriginalFilename();
		String uploadFileName1 = file2.getOriginalFilename();
		String uploadFileName2 = file3.getOriginalFilename();
		String uploadFileName3 = file4.getOriginalFilename();
		// 파일저장
		File saveFile = new File(uploadFolder, uploadFileName);
		File saveFile1 = new File(uploadFolder, uploadFileName1);
		File saveFile2 = new File(uploadFolder, uploadFileName2);
		File saveFile3 = new File(uploadFolder, uploadFileName3);
		
		String uploadPath = saveFile.getPath();
		// 해당위치 //해당파일
		try {
			file1.transferTo(saveFile);
			file2.transferTo(saveFile1);
			file3.transferTo(saveFile2);
			file4.transferTo(saveFile3);
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		log.info(vo);
		log.info(uploadPath);
		vo.setProduct_img(uploadFileName);
		vo.setProduct_img_desc1(uploadFileName1);
		vo.setProduct_img_desc2(uploadFileName2);
		vo.setProduct_img_desc3(uploadFileName3);
		service.register(vo);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/product/allList";
		//404에러 해결하기
	}

	//상품상세보기 
	//나중에 id값 넣어서 써야함
	//리뷰 리스트까지 출력
	@GetMapping("detail_view")
	public String detailView(ReviewAndAskCreteriaVO cri,@RequestParam("id") String id, @RequestParam("product_idx") int p_idx, Model model) {

		model.addAttribute("pvo",service.getDetailView(p_idx));
		model.addAttribute("mvo",service.getReviewId(id));

		cri.setProduct_idx(p_idx);

		int total = r_service.getReviewTotalCount(cri.getProduct_idx());	
		model.addAttribute("rvo",r_service.getReviewListWithPaging(cri));
		model.addAttribute("pageMaker",new ReviewAndAskPageDTO(cri,total));
		
		model.addAttribute("avo",a_service.getAskListWithPaging(p_idx));
		return "product/2_selectOneListPage";
	}
	
}
