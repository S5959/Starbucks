package com.starbucks.sw4.member.memberUser;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.starbucks.sw4.member.MemberDTO;
import com.starbucks.sw4.member.MemberService;
import com.starbucks.sw4.member.auth.AuthDTO;
import com.starbucks.sw4.member.auth.AuthService;
import com.starbucks.sw4.my.MyDTO;

@Controller
@RequestMapping(value="/member/**")
public class MemberUserController {
	
	@Autowired
	private MemberUserService memberUserService;
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private AuthService authService;
	
	
	
	//*******************  LOGOUT  ********************** 
	@GetMapping("memberLogout")
	public ModelAndView getMemberLogout(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:../");
		return mv;
	}
	//************************************************** 
	
	
	//*******************  LOGIN  ********************** 
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberDTO memberDTO, String idRemb, HttpSession session, HttpServletResponse reponse) throws Exception {
		int errorCnt = 0;
		
		ModelAndView mv = new ModelAndView();
		
		//쿠키 생성
		//쿠키이름 idRemb, 벨류 로그인ID
		if(idRemb != null) {
			Cookie cookie = new Cookie("idRemb", memberDTO.getId());
			reponse.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("idRemb", "");
			cookie.setMaxAge(0);		//쿠키 강제 삭제
			reponse.addCookie(cookie);
		}
		
		//가입된 회원 구분
		long result = memberUserService.getIdCheck(memberDTO);		
		if(result > 0) {
			//회원별 접근 구분
			memberDTO = memberUserService.getMemberLogin(memberDTO);
			
			if(memberDTO != null && memberDTO.getType() == 1) {
				MyDTO myDTO = new MyDTO();
				session.setAttribute("member", memberDTO);
				myDTO.setId(memberDTO.getId());
				session.setAttribute("my", myDTO);
				
				
				if(memberDTO.getNickName() != null) {
					mv.addObject("msg", memberDTO.getNickName() + " 님 환영합니다!");
				} else {
					mv.addObject("msg", memberDTO.getName() + " 님 환영합니다!");
				}
				mv.addObject("path", "../");
				errorCnt = 0;
			} else if (memberDTO != null && memberDTO.getType() > 1) {
				mv.addObject("msg", "접근 권한이 없는 계정입니다.");
				mv.addObject("path", "../admin/adminLogin");
			} else {
				errorCnt++;
				if(errorCnt >= 5) {
					mv.addObject("msg", "로그인 5회 이상 오류입니다. 정확한 아이디 혹은 비밀번호를 확인해주세요.");
					mv.addObject("path", "./memberLogin");
				} else {
					mv.addObject("msg", "정확한 아이디 혹은 비밀번호를 입력해주세요.");
					mv.addObject("path", "./memberLogin");
				}
				
			}
			
		//미가입 회원
		} else {
			mv.addObject("msg", "미가입 회원입니다. 회원가입 하시고 다양한 혜택을 즐겨보세요.");
			mv.addObject("path", "./memberLogin");			
		}
		
		mv.setViewName("common/result");
		
		return mv;
	}
	
	
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		
		return mv;
	}
	//************************************************** 
	
	
	//********************  JOIN  **********************
	@GetMapping(value={"memberJoin1", "memberJoin"})
	public ModelAndView setMemberJoin1() throws Exception {
		System.out.println("MemberUSerJoin1 -- Controller");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin1");
		
		return mv;
	}
	
	
	@GetMapping("memberJoin2")
	public ModelAndView setMemberJoin2() throws Exception {
		System.out.println("MemberUserJoin2 - Controller");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin2");
		
		return mv;
	}
	
	@PostMapping("memberJoin2")
	public ModelAndView setMemberJoin2(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("name" + memberDTO.getName());
		System.out.println("phone" + memberDTO.getPhone());
		System.out.println("email" + memberDTO.getEmail());
		
		int result = memberUserService.setMemberJoin(memberDTO);
		
		if(result > 0) {
			if(memberDTO.getNickName() != "") {
				mv.addObject("msg", memberDTO.getNickName() + " 님 환영합니다!");
			} else {
				mv.addObject("msg", memberDTO.getName() + "님 환영합니다!");
			}
			mv.addObject("path", "../");
		} else {
			mv.addObject("msg", "입력 정보를 다시 확인해주세요.");
			mv.addObject("path", "./memberJoin2");
		}
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("memberJoinResult")
	public ModelAndView getMemberJoinResult() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoinResult");
		return mv;
	}
	//************************************************** 
	
	
	//******************** Email ***********************
	@GetMapping("emailAuthSend")
	public ModelAndView setEmailAuthSend() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/emailAuthSend");
		return mv;
	}
	
	/* 인증 이메일 전송 */
	@PostMapping("emailAuthSend")
	public ModelAndView setEmailAuthSend(AuthDTO authDTO, HttpServletRequest request, HttpServletResponse response, HttpSession session)  throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		/* 인증번호 생성 */
		Random r = new Random();
		r.setSeed(System.currentTimeMillis());
		int authKey = r.nextInt(1000000) % 1000000;
		authDTO.setAuthKey(authKey);
        
		String sendTime = new SimpleDateFormat("yyyy-MM-dd hh24:mm:ss").format(Calendar.getInstance().getTime());
		sendTime = sendTime.substring(0, 19);
		authDTO.setSendTime(sendTime);
		
		/* 메일 전송 */
        String setfrom = "admin@starbucks.com";
        String tomail = authDTO.getEmail(); 	// 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; 	// 제목
        String content =
        	System.getProperty("line.separator") +                        
        	"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다" +
        	System.getProperty("line.separator") +
        	"인증번호는 " + authDTO.getAuthKey() + " 입니다. " + 
        	System.getProperty("line.separator")+
        	"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom); 	// 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); 		// 받는사람 이메일
            messageHelper.setSubject(title); 	// 메일제목은 생략이 가능하다
            messageHelper.setText(content); 	// 메일 내용
            
            mailSender.send(message);
            
        } catch (Exception e) {
            System.out.println(e);
        }
        /* 메일 발송 end */
        int result = authService.setAuthEmailSend(authDTO);
        
        if(result > 0) {
        	session.setAttribute("auth", authDTO);
        	mv.addObject("auth", authDTO);
            mv.setViewName("member/emailAuth");
        } else {
        	mv.addObject("msg", "인증메일이 발송되지 않았습니다. 다시 확인해주시기 바랍니다.");
        	mv.addObject("path", "./memberJoin1");
        	mv.setViewName("common/result");
        }
        
        return mv;
	}
	
	
	@GetMapping("emailAuth")
	public ModelAndView getEamilAuthCheck() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/emailAuth");
		return mv;
	}
	
	/* 인증번호 확인 */
	@PostMapping("emailAuth")
	public ModelAndView getEamilAuthCheck(int authKey, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		AuthDTO authDTO = new AuthDTO();
		MemberDTO memberDTO = new MemberDTO();
		authDTO = (AuthDTO) session.getAttribute("auth");
		
		if(authKey == authDTO.getAuthKey()) {
			memberDTO.setEmail(authDTO.getEmail());
			session.setAttribute("member", memberDTO);
			
			mv.addObject("msg", "인증이 완료되었습니다.");
			mv.addObject("path", "./memberJoin2");
			
		} else {
			mv.addObject("msg", "인증번호가 일치하지 않습니다. 다시 확인해주세요.");
			mv.addObject("path", "./emailAuth");
		}
		
		session.setAttribute("auth", authDTO);
		mv.setViewName("common/result");
		return mv;
	}
	//**************************************************
	
	//***************** Email Check ********************
	@PostMapping("memberEmailCheck")
	public ModelAndView getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		long result = memberUserService.getMemberEmailCheck(memberDTO);
		if(result > 0) {
			System.out.println("이미 가입된 회원이 가입 시도");
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	//**************************************************
}
