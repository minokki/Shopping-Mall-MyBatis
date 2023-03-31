package com.mino.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class adminController {

	@GetMapping("/main")
	public void adminMain() throws Exception{
		log.info("관리자페이지 진입");
	}
	
	// 상품 등록 페이지 접속
    @GetMapping("/shopManage")
    public void shopManageGET() throws Exception{
        log.info("상품 등록 페이지 접속");
    }
    
    // 상품 목록 페이지 접속
    @GetMapping("/shopList")
    public void shopListGet() throws Exception{
        log.info("상품 목록 페이지 접속");
    }
    
    // 작가 등록 페이지 접속
    @GetMapping("/author")
    public void authorEnrollGET() throws Exception{
        log.info("작가 등록 페이지 접속");
    }
    
    // 작가 관리 페이지 접속
    @GetMapping("/authorMagage")
    public void authorManageGET() throws Exception{
        log.info("작가 관리 페이지 접속");
    }    
}
