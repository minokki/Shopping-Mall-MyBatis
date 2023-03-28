package com.mino.mapper;

import com.mino.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void memberSign(MemberVO member);

	//중복 아이디 체크
	public int memberIdChk(String memberId);
	
}
