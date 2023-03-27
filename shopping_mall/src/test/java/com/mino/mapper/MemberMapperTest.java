package com.mino.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mino.domain.MemberVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	//회원가입 테스트
	@Test
	public void memberSign() throws Exception{
		
		MemberVO member = new MemberVO();
		
		member.setMemberId("test");			//회원 id
		member.setMemberPw("test");			//회원 비밀번호
		member.setMemberName("test");		//회원 이름
		member.setMemberMail("test");		//회원 메일
		member.setMemberAddr1("test");		//회원 우편번호
		member.setMemberAddr2("test");		//회원 주소
		member.setMemberAddr3("test");		//회원 상세주소
		
		memberMapper.memberSign(member);			//쿼리 메서드 실행
		
	}

}
