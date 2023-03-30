package com.mino.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@Autowired
	private JavaMailSender mailSender;

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
	//이메일 인증
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheck(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
        Random random = new Random();
        int checkNum = random.nextInt(888888)+111111;
        
        log.info("인증번호"+checkNum);
        
        //이메일 보내기
        String setFrom = "regular2644@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content =
        		"홈페이지를 방문해주셔서 감사합니다." +
        		"<br><br>" + 
        		"인증 번호는"+ checkNum + "입니다." + 
        		"<br>" + 
        		"해당 인증번호를 인증번호 입력란에 기입해주세요.";
        	
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
            helper.setFrom(setFrom);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            
            // true는 html을 사용하겠다는 의미입니다.
            /*
             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             */
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        String num = Integer.toString(checkNum); //ajax를 통한 요청은 String타입만 가능.  형변환 진행
        
        return num; //String으로 형변환된 num 객체 리턴
        
    }
	
	
	
	
}
	

