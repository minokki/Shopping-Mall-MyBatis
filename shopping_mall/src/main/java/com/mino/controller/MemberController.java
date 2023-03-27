package com.mino.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mino.domain.MemberVO;
import com.mino.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	@Autowired
	private MemberService memberservice;

	//로그인 페이지 이동
	@GetMapping("/login")
	public void joinGET() {
		
		log.info("로그인 페이지 진입");
		
	}
	
	//회원가입 페이지 이동
	@GetMapping("/sign")
	public void loginGET() {
		
		log.info("회원가입 페이지 진입");
		
	}
	
	//회원가입
	@PostMapping("/sign")
	public String joinPOST(MemberVO member) throws Exception{

		memberservice.memberSign(member);
		
		return "redirect:/";
		
	}
}
	

