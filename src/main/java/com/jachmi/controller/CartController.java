package com.jachmi.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jachmi.domain.CartVO;
import com.jachmi.service.CartService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart/*")
@AllArgsConstructor
public class CartController {

	private CartService service;

	// 1. 장바구니 등록
	// consumes = 수신할 데이터 포맷 // produces = 출력할 데이터 포맷
	@PostMapping(value = "/register", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> cartInsert(@RequestBody CartVO vo) {
		log.info("cartVO..." + vo);
		int insertCount = service.cartRegister(vo);
		log.info("Reply Insert Count : " + insertCount);

		return insertCount == 1 ? new ResponseEntity<String>(HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 2.장바구니 리스트 가져오기
	@GetMapping("/getCartList")
	public String getCartList(Model model, @RequestParam("cart_m_id") String c_m_id) {
		model.addAttribute("cartList", service.getCartList(c_m_id));
		return "product/4_cart";
	}

	// 3.장바구니 수량 변경 시 금액 변경 ajax
	@PostMapping(value = "/update", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> countUpdate(@RequestBody CartVO vo) {
		log.info("cartVO..." + vo);
		int updateCount = service.countUpdate(vo);
		log.info("Reply update Count : " + updateCount);

		return updateCount == 1 ? new ResponseEntity<String>(HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 4. 체크된 장바구니 삭제
//	      @PostMapping(value = "/delete", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
//	      public ResponseEntity<String> removeCart(@RequestParam("removeArr[]") List<String> remove_chk_c_idx,CartVO vo) {
//	          for(String i : remove_chk_c_idx) {            
//	               System.out.println(i);
//	            int cartNum = Integer.parseInt(i);
//	               vo.setCart_idx(cartNum);
//	               service.remove_cart(cartNum);
//	          }
//	         
//	          int removeCart = 1;
//
//	         return removeCart == 1 ? new ResponseEntity<String>(HttpStatus.OK)
//	               : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
//	      }
	// 체크된 장바구니 삭제
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public int deleteCart(@RequestParam(value = "removeArr[]") List<String> chArr, CartVO cart) {

		int result = 0;
		int cartNum = 0;

		for (String i : chArr) {
			cartNum = Integer.parseInt(i);
			cart.setCart_idx(cartNum);
			service.remove_cart(cartNum);
		}
		result = 1;

		return result;
	}

}
