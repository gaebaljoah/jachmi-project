package com.jachmi.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jachmi.domain.CartVO;
import com.jachmi.domain.ProductOrderVO;
import com.jachmi.service.CartService;
import com.jachmi.service.OrderService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {

	private OrderService service;
	private CartService c_service;
	// 1.주문서에 체크된 장바구니 리스트 가져오기
	@GetMapping("/getcartList")
	public String getCartList(Model model, @RequestParam(value = "cart_idx") List<String> cart_idxArr, int cart_idx,
			CartVO vo) {

		// list의 중복제거
		// 장바구니에서 상품 선택 후 주문하기 눌렀다. 그리고 뒤로가기 버튼 후 다시 장바구니에서 상품 선택 후 주문하면 장바구니 상품들이 중복으로
		// 배열에 넣어졌다.그래서중복제거를 실행해봄
		// List<CartVO> list = new
		// ArrayList<CartVO>().stream().distinct().collect(Collectors.toList());
		// 결국 안됨.

		// 어떻게 하면 좋을까 뒤로가기 버튼 눌렀을때 list비워주기 ?
		List<CartVO> list = new ArrayList<CartVO>();

		// 가져온 각각의 쿼리문들을 배열에 넣어 모델에 저장후 출력해보기 x -> jsp화면에서 c:foreach로 돌렸을때 하나의 값밖에
		// 못가지고옴.
		for (String i : cart_idxArr) {
			cart_idx = Integer.parseInt(i);
			vo.setCart_idx(cart_idx);
			System.out.println("/---------------------" + cart_idx);
			list.add(service.getCartList(cart_idx));
			System.out.println("/------------------------------------------those are cart_idx lists" + list);
		}
		System.out.println("/------------------------------------------this is cart_idx list" + list);
		model.addAttribute("list", list); 
		return "product/5_order";
	}

	// 2. 바로구매 버튼 클릭시 주문서 리스트에 나타내기
	@GetMapping("/getBuyList")
	public String getOrderList(Model model, CartVO cvo, @RequestParam("idx") int idx, @RequestParam("name") String name,
			@RequestParam("count") int count, @RequestParam("price") String price, @RequestParam("img") String img,
			@RequestParam("option") String option) {
		String price1 = price.replace(",", "");
		cvo.setCart_idx(idx);
		cvo.setCart_product_name(name);
		cvo.setCart_product_option(option);
		cvo.setCart_price(Integer.parseInt(price1));
		cvo.setCart_count(count);
		cvo.setCart_img(img);
		model.addAttribute("buyList", cvo);
		return "product/6_buyOrder";
	}

	// 3.즉시구매 주문서 결제하기버튼 insert
	@PostMapping("/register")
	public String orderRegister(Model model, ProductOrderVO ovo, RedirectAttributes rttr) {
		log.info("getOrder..........." + ovo.getOrder_count());
		service.insertOrder(ovo);
		rttr.addAttribute("order_m_id", ovo.getOrder_m_id());
		return "redirect:/order/getOrderList";
	}

	// 4.장바구니로부터의 주문 결제하기 버튼 insert
	
	@PostMapping("/registerFromCart")
	public String getOrderListFromCart(HttpServletRequest request, ProductOrderVO vo, RedirectAttributes rttr) {

		// 어떻게 하면 좋을까 뒤로가기 버튼 눌렀을때 list비워주기 ?
		String[] allCartIdxArr = request.getParameterValues("all_cart_idx");
		String[] allCountArr = request.getParameterValues("all_order_count");
		String[] allPriceArr = request.getParameterValues("all_order_price");
		String[] allOptionArr = request.getParameterValues("all_order_option");
		String[] allPnameArr = request.getParameterValues("all_order_p_name");
		String[] allPidArr = request.getParameterValues("all_order_p_id");
		String[] allImgArr = request.getParameterValues("all_order_img");

		
		
		for (int i = 0; i < allCountArr.length; i++) {
			vo.setOrder_count(Integer.parseInt(allCountArr[i]));
			vo.setOrder_price(Integer.parseInt(allPriceArr[i]));
			vo.setOrder_option(allOptionArr[i]);
			vo.setOrder_p_name(allPnameArr[i]);
			vo.setOrder_p_id(Integer.parseInt(allPidArr[i]));
			vo.setOrder_img(allImgArr[i]);
			service.insertOrder(vo);
			rttr.addAttribute("order_m_id", vo.getOrder_m_id());
		}
		for (int i = 0; i < allCartIdxArr.length; i++) {
			int cart_idx = Integer.parseInt(allCartIdxArr[i]);
			c_service.remove_cart(cart_idx);
		}
		return "redirect:/order/getOrderList";
	}

	//5.주문완료 페이지 이동
	@GetMapping("/getOrderList")
	public String getOrderList(Model model, ProductOrderVO vo) {

		model.addAttribute("orderAllList", service.getOrderList(vo.getOrder_m_id()));

		model.addAttribute("allStatus", service.allStatus(vo.getOrder_m_id()));
		model.addAttribute("status1", service.status1(vo.getOrder_m_id()));
		model.addAttribute("status2", service.status2(vo.getOrder_m_id()));
		model.addAttribute("status3", service.status3(vo.getOrder_m_id()));

		return "product/7_orderAllList";
	}
	
	//6.주문 상세내역 보여주기
	@GetMapping("/getOrderOneList")
	public String getOrderOneList(Model model, ProductOrderVO vo, @RequestParam("order_date") Timestamp order_date) {
		model.addAttribute("oneListInfo",service.getOrderInfo(order_date));
		model.addAttribute("oneList",service.getOrderOneList(order_date));
		return "product/8_orderOneList";
	}
	
	//7.주문상세내역 취소
	@PostMapping("/remove")
	public String removeList(Model model, @RequestParam("order_m_id") String order_m_id,@RequestParam("order_date") Timestamp order_date, RedirectAttributes rttr) {
		service.removeList(order_date);
		rttr.addAttribute("order_m_id",order_m_id);
		return"redirect:/order/getOrderList";
	}
}
