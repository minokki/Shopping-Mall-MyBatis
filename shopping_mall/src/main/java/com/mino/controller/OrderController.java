package com.mino.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.mino.domain.OrderPageDTO;
import com.mino.service.MemberService;
import com.mino.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderService orderService;
	
	

	@GetMapping("/order/{memberId}")
	public String orderPage(@PathVariable("memberId") String memberId, OrderPageDTO order,Model model ) {
		
		System.out.println("memberId = " + memberId);
		System.out.println("orders = " + order.getOrders());
		model.addAttribute("orderList",orderService.getGoodsInfo(order.getOrders()));
		model.addAttribute("memberInfo", memberService.memberInfo(memberId));
		
		return "/order";
	}
}
