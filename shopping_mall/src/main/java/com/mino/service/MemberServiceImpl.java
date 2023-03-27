package com.mino.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mino.domain.MemberVO;
import com.mino.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired 
	MemberMapper memberMapper;

	//회원가입
	@Override
	public void memberSign(MemberVO member) throws Exception {
		
		memberMapper.memberSign(member);
	}
	

}
