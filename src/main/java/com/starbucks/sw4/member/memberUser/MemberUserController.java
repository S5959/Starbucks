package com.starbucks.sw4.member.memberUser;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.starbucks.sw4.member.MemberDTO;
import com.starbucks.sw4.member.auth.AuthDTO;
import com.starbucks.sw4.member.auth.AuthService;
import com.starbucks.sw4.my.MyDTO;
import com.starbucks.sw4.my.MyService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value="/member/**")
public class MemberUserController {
	
	@Autowired
	private MemberUserService memberUserService;
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private AuthService authService;
	@Autowired
	private MyService myService;
	
	
//**************************************  LOGOUT  *************************************
	@GetMapping("memberLogout")
	public ModelAndView getMemberLogout(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:../");
		return mv;
	}
//*************************************************************************************  
	
	
//***************************************  LOGIN  **************************************
	private int errorCnt = 0;
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberDTO memberDTO, String idRemb, HttpSession session, HttpServletResponse reponse) throws Exception {
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
		long result = memberUserService.getMemberIdCheck(memberDTO);		
		
		if(result > 0) {
			//회원별 접근 구분
			memberDTO = memberUserService.getMemberLogin(memberDTO);
			if(memberDTO != null && memberDTO.getType() == 1) {
				session.setAttribute("member", memberDTO);
				MyDTO myDTO = new MyDTO();
				myDTO.setId(memberDTO.getId());
				session.setAttribute("my", myDTO);


				System.out.println(myDTO.getGrade());


				
				if(memberDTO.getNickName() != null) {
					mv.addObject("msg", memberDTO.getNickName() + " 님 환영합니다!");
				} else {
					mv.addObject("msg", memberDTO.getName() + " 님 환영합니다!");
				}
				mv.addObject("path", "../");
				errorCnt = 0;
			} else if (memberDTO != null && memberDTO.getType() > 1) {
				mv.addObject("msg", "접근 권한이 없는 계정입니다.");
				mv.addObject("path", "./memberLogin");
			} else {	//비밀번호 오류 처리
				errorCnt++;
				if(errorCnt >= 5) {
					mv.addObject("msg", "로그인 5회 이상 오류입니다. 정확한 아이디 혹은 비밀번호를 확인해주세요.");
					//추가작업 (5회이상 오류시 보안문자입력후 로그인 가능)
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
		System.out.println("errorCount : " + errorCnt);
		mv.setViewName("common/result");
		
		return mv;
	}
	
	
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		
		return mv;
	}
	
	
	@PostMapping("kakaoLogin")
	@ResponseBody
	public ModelAndView setKakaoLogin(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("Kakao ID ; " + memberDTO.getId());
		System.out.println("kakao EMAIL ; " + memberDTO.getEmail());
		
		//가입된 회원인지 확인
		long result = memberUserService.getMemberIdCheck(memberDTO);
		result = memberUserService.getMemberEmailCheck(memberDTO);
		
		if(result > 0) {
			memberDTO.setJoinPath("kakao");
			memberDTO = memberUserService.getMemberKakaoLogin(memberDTO);
			System.out.println(memberDTO);
			if(memberDTO != null && memberDTO.getType()==1) {
				session.setAttribute("member", memberDTO);
				MyDTO myDTO = new MyDTO();
				myDTO.setId(memberDTO.getId());
				session.setAttribute("my", myDTO);
				
				mv.addObject("msg", 1);
			} else {
				mv.addObject("msg", 2);
			}
		} else {
			memberDTO.setJoinPath("kakao");
			session.setAttribute("kakao", memberDTO);
			mv.addObject("msg", 0);
		}
		mv.setViewName("common/ajaxResult");
		return mv;
	}
//************************************************************************************* 


//***************************************  JOIN  **************************************
	@GetMapping(value={"memberJoin1", "memberJoin"})
	public ModelAndView setMemberJoin1() throws Exception {
		System.out.println("Controller - 회원가입 111");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin1");
		
		return mv;
	}
	
	
	@GetMapping("memberJoin2")
	public ModelAndView setMemberJoin2(HttpSession session) throws Exception {
		System.out.println("controller - 회원가입 222");
		ModelAndView mv = new ModelAndView();
		
		AuthDTO authDTO = (AuthDTO)session.getAttribute("auth");
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("kakao");
		System.out.println("이메일 인증 : " + authDTO);
		System.out.println("카카오 인증 : " + memberDTO);
		if(memberDTO != null) {
			String kakaoCheck = memberDTO.getJoinPath();
			System.out.println("(190) 카카오로 가입한 회원인지 확인 : " + kakaoCheck);
			mv.addObject("kakaoCheck", kakaoCheck);
		}
		
		if(authDTO == null && memberDTO.getId() == null) {
			mv.addObject("msg", "정보가 유효하지 않습니다. 다시 인증해주세요.");
			mv.addObject("path", "./emailAuthSend");
			mv.setViewName("common/result");
		} else if(authDTO == null && memberDTO != null) {
			System.out.println("(200) 카카오 회원의 가입요청 : " + memberDTO.getEmail());
			mv.addObject("kakao", memberDTO);
			mv.setViewName("member/memberJoin2");
		} else {
			System.out.println("(204) 이메일 인증 회원의 가입요청 : " + authDTO.getEmail());
			mv.addObject("auth", authDTO);
			mv.setViewName("member/memberJoin2");
		}
		
		return mv;
	}
	
	@PostMapping("memberJoin2")
	public ModelAndView setMemberJoin2(MemberDTO memberDTO, HttpSession session) throws Exception {
		System.out.println("controller - 입력한 회원정보로 가입");
		ModelAndView mv = new ModelAndView();
		
		System.out.println("(218)birth : " + memberDTO.getBirth());
		System.out.println("name : " + memberDTO.getName());
		System.out.println("phone : " + memberDTO.getPhone());
		System.out.println("nickName : " + memberDTO.getNickName());
		System.out.println("email : " + memberDTO.getEmail());
		
		int result = memberUserService.setMemberJoin(memberDTO);
		
		if(result > 0) {
			myService.setMemberJoinCard(memberDTO);
			myService.setMemberJoinStar(memberDTO);
			myService.setMemberJoinStore(memberDTO);
			
			if(memberDTO.getNickName() != "") {
				session.setAttribute("joinInfo", memberDTO.getNickName());
				mv.addObject("msg", memberDTO.getNickName() + " 님 환영합니다!");
			} else {
				session.setAttribute("joinInfo", memberDTO.getName());
				mv.addObject("msg", memberDTO.getName() + " 님 환영합니다!");
			}
			mv.addObject("member", memberDTO);
			mv.addObject("path", "./memberJoinResult");
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
//************************************************************************************* 
	
	
//**************************************  EMAIL  **************************************

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
		System.out.println(" 보내는 이메일 : "+authDTO.getEmail());
		/* 인증번호 생성 */
		Random r = new Random();
		r.setSeed(System.currentTimeMillis());
		int authKey = r.nextInt(1000000) + 100000;
		if(authKey > 1000000){
			authKey = authKey - 100000;
		}
		authDTO.setAuthKey(authKey);
        System.out.println("(280) 발급 인증키 : " + authKey);
        
		String sendTime = new SimpleDateFormat("yyyy-MM-dd hh24:mm:ss").format(Calendar.getInstance().getTime());
		sendTime = sendTime.substring(0, 19);
		authDTO.setSendTime(sendTime);
		
		/* 메일 전송 */
        String setfrom = "admin@starbucks.com";
        String tomail = authDTO.getEmail(); 	// 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; 	// 제목
        String content =						// 메일 내용
        	System.getProperty("line.separator") +                        
        	"안녕하세요. 회원님! 저희 홈페이지를 찾아주셔서 감사합니다." +
        	System.getProperty("line.separator") +
        	"인증번호는 '" + authDTO.getAuthKey() + "' 입니다. " + 
        	System.getProperty("line.separator")+
        	"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."+
        	System.getProperty("line.separator")+
        	"본인이 아니실 경우 이 메일은 무시해주시면 됩니다. 감사합니다.";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom); 	// 보내는사람 (생략 불가 -> 에러발생)
            messageHelper.setTo(tomail); 		// 받는사람 이메일
            messageHelper.setSubject(title); 	// 메일 제목 (생략 가능)
            messageHelper.setText(content); 	// 메일 내용
            
            mailSender.send(message);
            
        } catch (Exception e) {
            System.out.println(e);
        }
        /* 메일 발송 end */
        int result = authService.setEmailAuthSend(authDTO);
        
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
	
	
	/* 인증번호 확인 */
	@GetMapping("emailAuth")
	public ModelAndView getEamilAuthCheck() throws Exception {
		System.out.println("controller - 이메일 인증 확인");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/emailAuth");
		return mv;
	}
		
	@PostMapping("emailAuth")
	public ModelAndView getEamilAuthCheck(int authKey, HttpSession session) throws Exception {
		System.out.println("controller - 입력한 인증 번호 일치 확인");
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = new MemberDTO();
		System.out.println("-------------------------------");
		System.out.println(session.getAttribute("auth"));
		
		AuthDTO authDTO  = (AuthDTO) session.getAttribute("auth");
		System.out.println("(338) "+ authDTO.getEmail());
		System.out.println("-------------------------------");
		
		if(authDTO.getEmail() == null) {
			mv.addObject("msg", "이메일이 유효하지 않습니다. 다시 인증해주세요.");
			mv.addObject("path", "./emailAuthSend");
		} else {
			System.out.println("------ 사용자 인증키 : " + authKey);
			System.out.println("------ DB 인증키 : " + authDTO.getAuthKey());
						
			if(authKey == authDTO.getAuthKey()) {
				memberDTO.setEmail(authDTO.getEmail());
				
				//인증이 성공하면 AuthStatus 1로 업데이트
				authDTO.setAuthStatus(1);
				authService.setEmailAuthStatus(authDTO);				
				
				mv.addObject("msg", "인증이 완료되었습니다.");
				mv.addObject("path", "./memberJoin2");
			} else {
				mv.addObject("msg", "인증번호가 일치하지 않습니다. 다시 확인해주세요.");
				mv.addObject("path", "./emailAuth");
			}
			session.setAttribute("auth", authDTO);
		}
		mv.setViewName("common/result");
		return mv;
	}
//************************************************************************************* 
	


//***************************************  CHECK  **************************************
	@PostMapping("memberEmailCheck")
	public ModelAndView getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
		System.out.println("Controller - 이메일 체크");
		ModelAndView mv = new ModelAndView();
		
		long result = memberUserService.getMemberEmailCheck(memberDTO);
		System.out.println("이메일 체크 결과 : " + result);
		if(result > 0) {
			System.out.println("이미 가입된 회원이 가입 시도");
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("memberIdCheck")
	public ModelAndView getMemberIdCheck(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		long result = memberUserService.getMemberIdCheck(memberDTO);
		System.out.println("(390)IdCheck : " + result);
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@PostMapping("memberPhoneCheck")
	public ModelAndView getMemberPhoneCheck(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		long result = memberUserService.getMemberPhoneCheck(memberDTO);
		System.out.println("(403)PhoneCheck : " + result);
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
//************************************************************************************* 
}
