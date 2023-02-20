package com.jachmi.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jachmi.domain.TestVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/test/*")
public class TestController {
	
	@GetMapping("movePage")
	public String movePage() {
		return "test";
	}
	
	
	
	/*
	 * 1. 스프링에서 기본적인 비동기 방식을 사용할 때 @ResponseBody와 @RequestBody를 사용
	 * 2. 그냥 각 메소드에 @ResponseBody 쓰고 매개변수 중 json 데이터 받을 때 @RequestBody 사용하면 됨
	 * 3. 보내고 받는 데이터의 타입을 각각 명시 해주기
	 * 		-> dataType : json  선언 시 서버에서도 json 형식으로 전달
	 * 
	 * ★★★ 비동기를 사용할 때 메소드의 리턴 타입은 jsp의 경로가 아닌 실제 리턴할 데이터 타입 ★★★
	 */
	 
	
	// 1. 매개 변수 X , 리턴 String
	@GetMapping(value = "/ajaxTest1", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String testMet1() {
		return "ok";
	}
	
	// 2. 매개 변수 1개 , 리턴 String
	@GetMapping(value = "/ajaxTest2", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String testMet2(String param) {
		log.info("param : " + param);
		return "ok";
	}
	
	// 3. 매개 변수 여러 개(json-map) , 리턴 json
	@PostMapping(value = "/ajaxTest3", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<TestVO> testMet3(@RequestBody Map<String, String> param) {
		// 전달 받은 json 객체를 Map으로 받기
		log.info("keySet : " + param.keySet());
		log.info("param1 value = " + param.get("param1"));
		log.info("param2 value = " + param.get("param2"));
		
		// json으로 던질 list 객체 생성
		List<TestVO> list = new ArrayList<TestVO>();
		for(int i=0; i<3; i++) {
			TestVO vo = new TestVO();
			vo.setTno(i+1);
			vo.setTmsg("테스트 내용" + (i+1));
			list.add(vo);
		}
		
		return list;
	}
	
	
	// 4. 매개 변수 여러 개(json-vo) , 리턴 json
	@PostMapping(value = "/ajaxTest4", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<TestVO> testMet4(@RequestBody TestVO param) {
		// 전달 받은 json 객체를 VO으로 받기
		log.info(param);
		
		// json으로 던질 list 객체 생성
		List<TestVO> list = new ArrayList<TestVO>();
		for(int i=0; i<3; i++) {
			TestVO vo = new TestVO();
			vo.setTno(i+1);
			vo.setTmsg("테스트 내용" + (i+1));
			list.add(vo);
		}
		
		return list;
	}
}
