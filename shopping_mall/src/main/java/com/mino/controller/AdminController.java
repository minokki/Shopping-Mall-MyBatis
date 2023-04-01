package com.mino.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mino.domain.ItemVO;
import com.mino.domain.PageDTO;
import com.mino.domain.Paging;
import com.mino.service.AdminService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@GetMapping("/main")
	public void adminMain() throws Exception{
		log.info("관리자페이지 진입");
	}
	
	// 상품 등록 페이지 접속
    @GetMapping("/shopManage")
    public void shopManageGET(Model m) throws Exception{
    	log.info("상품 등록 페이지 접속");
    	ObjectMapper objm = new ObjectMapper();  // 객체 초기화
    	List list = adminService.cateList();
    	
    	String cateList = objm.writeValueAsString(list);  // String 타입의 JSON형식 데이터로 변환 
    	m.addAttribute("cateList",cateList);
    	log.info("변경전 =" +list);
    	log.info("변경후 =" +cateList);
    }
    
    @PostMapping("/shopManage")
    public String shopManagePost(ItemVO item, RedirectAttributes ra)throws Exception{
    	log.info("상품등록포스트" + item);
    	adminService.itemEnroll(item);

    	ra.addFlashAttribute("manage_result",item.getItemName()); //상품이름이 등록되었음을 알리는 경고창 띄우기위함
    	return "redirect:/admin/shopManage";
    }
    
    // 상품 목록 페이지 접속
    @GetMapping("/shopList")
    public void shopListGet(Paging page, Model model) throws Exception{
    	//상품 리스트 데이터

        log.info("상품 목록 페이지 접속");
    	List list = adminService.shopList(page);
    	
    	if(!list.isEmpty()) {
    		model.addAttribute("list",list);
    	}else {
    		model.addAttribute("listCheck", "empty");
    	}
    	
    	model.addAttribute("pageMaker", new PageDTO(page,adminService.shopTotal(page)));
    	
    }
    
  @GetMapping({"/view" , "/modify"})  //맵핑 배열로 할수 있음.
  public void shopViewGet(int itemId, Paging page, Model model) throws JsonProcessingException {
	  log.info("뷰 진입");
	  ObjectMapper mapper = new ObjectMapper();
	  
	  //카테고리 데이터
	  model.addAttribute("cateList",mapper.writeValueAsString(adminService.cateList()));
	  //페이지 정보
	  model.addAttribute("page", page);
	  //조회 페이지 정보
	  model.addAttribute("viewInfo",adminService.shopView(itemId));
  }
  
  @PostMapping("/modify")
  public String shopModifyPost(ItemVO item,  RedirectAttributes ra) throws Exception{
	  int result = adminService.shopModify(item);
	  
	  ra.addFlashAttribute("modify_result",result);
	  
	  return "redirect:/admin/shopList";
  }
  
  @PostMapping("/delete")
  public String shopDelete(int itemId, RedirectAttributes ra) throws Exception{
	  int result = adminService.shopDelete(itemId);
	  
	  ra.addFlashAttribute("delete_result",result);
	  
	  return "redirect:/admin/shopList";
	  
  }
    
}
