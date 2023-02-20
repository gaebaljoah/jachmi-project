package com.jachmi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jachmi.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j 
@AllArgsConstructor 	//풀생성자사용으로도e
public class ErrorSettingController {
	    
	 private static Logger LOGGER = LoggerFactory.getLogger(ErrorSettingController.class);
	 
	 //404에러 get ,post-----------------------------------------------------------------
	  @GetMapping("/error404")
	    public String Error404g(HttpServletResponse res, Model model) {
	       // LOGGER.warn("========== ERROR 404 PAGE ==========");
	        model.addAttribute("code", "ERROR_404");
	        return "error/404";
	    }
	  
	  @PostMapping("/error404")
	    public String Error404p(HttpServletResponse res, Model model) {
	       // LOGGER.warn("========== ERROR 404 PAGE ==========");
	        model.addAttribute("code", "ERROR_404");
	        return "error/404";
	    }
	  
	//500에러 get ,post-----------------------------------------------------------------  
	  @GetMapping("/error500")
	    public String Error500g(HttpServletResponse res, Model model) {
	        LOGGER.warn("========== ERROR 500 PAGE ==========");
	        model.addAttribute("code", "ERROR_500");
	        return "error/500";
	    }
	  
	  @PostMapping("/error500")
	    public String Error500p(HttpServletResponse res, Model model) {
	        LOGGER.warn("========== ERROR 500 PAGE ==========");
	        model.addAttribute("code", "ERROR_500");
	        return "error/500";
	    }
	    
	//405에러 get ,post-----------------------------------------------------------------  
	  @GetMapping("/error405")
	    public String Error405g(HttpServletResponse res, Model model) {
	        LOGGER.warn("========== ERROR 500 PAGE ==========");
	        model.addAttribute("code", "ERROR_500");
	        return "error/500";
	    }
	  
	  @PostMapping("/error405")
	    public String Error405p(HttpServletResponse res, Model model) {
	        LOGGER.warn("========== ERROR 500 PAGE ==========");
	        model.addAttribute("code", "ERROR_500");
	        return "error/500";
	    }
		//405에러 get ,post-----------------------------------------------------------------  
	  @GetMapping("/error400")
	    public String Error400g(HttpServletResponse res, Model model) {
	        LOGGER.warn("========== ERROR 500 PAGE ==========");
	        model.addAttribute("code", "ERROR_500");
	        return "error/500";
	    }
	  
	  @PostMapping("/error400")
	    public String Error400p(HttpServletResponse res, Model model) {
	        LOGGER.warn("========== ERROR 500 PAGE ==========");
	        model.addAttribute("code", "ERROR_500");
	        return "error/500";
	    }
	

}

