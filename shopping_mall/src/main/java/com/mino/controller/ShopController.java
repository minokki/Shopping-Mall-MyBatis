package com.mino.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ShopController {
	
	@RequestMapping("/")
	public String mainPage() {
		
		log.info("메인페이지 진입");
		
		return "/index";
		
	}
	

}
