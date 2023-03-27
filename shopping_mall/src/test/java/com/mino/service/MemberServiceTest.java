package com.mino.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mino.domain.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberServiceTest {
	
	@Autowired
	MemberService memberService;
	
	//회원가입 테스트
	@Test
	public void memberSignTest() throws Exception {
		MemberVO member1 = new MemberVO();
		
		member1.setMemberId("서비스테스트");
		member1.setMemberPw("서비스테스트");
		member1.setMemberName("서비스테스트");
		member1.setMemberMail("서비스테스트");
		member1.setMemberAddr1("서비스테스트");
		member1.setMemberAddr2("서비스테스트");
		member1.setMemberAddr3("서비스테스트");
		
		memberService.memberSign(member1);
	}

}
