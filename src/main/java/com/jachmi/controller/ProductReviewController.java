package com.jachmi.controller;

import java.io.File;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jachmi.domain.ProductReviewVO;
import com.jachmi.service.ProductReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ProductReviewController {

	private ProductReviewService service;

	// 리뷰등록
	@PostMapping("register")
	public String reviewRegister(ProductReviewVO vo, @RequestParam("review_img_1") MultipartFile file,
			@RequestParam("id") String id, @RequestParam("product_idx") int p_idx, 
			 @RequestParam("pageNum") int pageNum,  @RequestParam("amount") int amount,
			RedirectAttributes rttr) {
		
		
		// multipart와 multypartrequest 차이 알아보기
		// 이미지 저장 폴더 생성
		String uploadFolder = "C:\\reviewImages";
		// 파일 이름 가져오기
		String uploadFileName = file.getOriginalFilename();
		// 파일저장
		File saveFile = new File(uploadFolder, uploadFileName);
		String uploadPath = saveFile.getPath();
		// 해당위치 //해당파일
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		log.info(vo);
		log.info(uploadPath);
		vo.setReview_img(uploadFileName);
		service.reviewRegister(vo);
		//productController로 파라미터 값 넘기는 법
		rttr.addAttribute("id",id);
		rttr.addAttribute("product_idx",p_idx);
		rttr.addAttribute("pageNum",pageNum);
		rttr.addAttribute("amount",amount);
		return "redirect:/product/detail_view";
		// 404에러 해결하기
	}

	// 리뷰 목록
//	@GetMapping(value = "/getReviewList",consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
//	public ResponseEntity<List<ProductReviewVO>> getRiviewList(@RequestParam("product_idx") int p_idx) {
//		log.info("getList...");
//		return new ResponseEntity<List<ProductReviewVO>>(service.getReviewListWithPaging(p_idx), HttpStatus.OK);
//	}

}
