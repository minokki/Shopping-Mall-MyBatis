package com.mino.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//아이디 중복 체크
	@PostMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChk(String memberId) throws Exception{
		log.info("아이디체크");
		
		int result = memberservice.memberIdChk(memberId);
		
		if(result != 0) {
			return "fail"; //중복 아이디가 존재
		}else {
			return "success"; // 중복아이디가 없음
		}
	
	}
}
	

