package com.mino.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mino.domain.ItemVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminServiceTest {
	
	@Autowired
	private AdminService adminService;
	
	@Test
	public void itemEnrollTest() throws Exception{
		ItemVO item = new ItemVO();
		
		item.setItemName("mapper테스트");
		item.setCateCode("1111");
		item.setItemContents("물품 내용");
		item.setItemIntro("물품 소개");
		item.setItemDiscount(0.22);
		item.setItemPrice(10000);
		item.setItemPrice(10000);
		
		adminService.itemEnroll(item);
	}

}
