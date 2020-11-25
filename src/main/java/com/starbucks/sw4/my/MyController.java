package com.starbucks.sw4.my;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/my/**")
public class MyController {
	@Autowired
	private MyService myService;
	
	@GetMapping("findStore")
	public ModelAndView getStore(MyDTO myDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(myDTO.getStoreName());
		List<MyDTO> ar= myService.getStore(myDTO);
		
		mv.addObject("list", ar);
		mv.setViewName("my/test");
		return mv;
	}
	
	@PostMapping("myInfoOut")
	public void setMyInfoOut(MyDTO myDTO) throws Exception {
		int result = myService.setMyInfoOut(myDTO);
		//자동로그아웃되게 처리하고, 메인페이지로 이동시키기..
	}
	
	//회원 탈퇴
	@GetMapping("myInfoOut")
	public ModelAndView setMyInfoOut() throws Exception {
		//id를 jsp로 보내서 꺼내주기
		ModelAndView mv = new ModelAndView();
		MyDTO info = myService.getOne();
				
		mv.addObject("myInfo", info);
		mv.setViewName("my/myInfoOut");
				
		return mv;
	}
	//나만의 매장
	@GetMapping("myStore")
	public ModelAndView getMyStore() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<MyDTO> ar= myService.getMyStore();
		
		mv.addObject("list", ar);
		mv.setViewName("my/myStore");
		
		return mv;
	}
	//고객의 소리
	@GetMapping("vocList")
	public ModelAndView setVocList() throws Exception {
		ModelAndView mv = new ModelAndView();
		MyDTO info = myService.getOne();
		String str = info.getEmail();
		int idx = str.indexOf("@");
		String mail1 = str.substring(0, idx);  
		String mail2 = str.substring(idx+1);
		
		mv.addObject("mail1", mail1);
		mv.addObject("mail2", mail2);
		mv.addObject("myInfo", info);
		mv.setViewName("my/vocList");
		
		return mv;
		
	}
	//별 히스토리 db 가져오기
	@GetMapping("myStarHistory")
	public ModelAndView getMyStar() throws Exception {
		ModelAndView mv = new ModelAndView();
		MyDTO myDTO = myService.getMyStar();
		
		mv.addObject("star", myDTO);
		mv.setViewName("my/myStarHistory");
		
		return mv;
	}
	
	//비밀 번호 변경 db처리
	@PostMapping("modifyPW")
	public ModelAndView setNewPw(MyDTO myDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(myDTO.getPw());
		int result = myService.setNewPw(myDTO);
		mv.setViewName("redirect:./myIndex");
		return mv;
	}
	//비밀 번호 변경
	@GetMapping("modifyPW")
	public ModelAndView setNewPw()throws Exception {
		//id를 jsp로 보내서 꺼내줘야하는데
		ModelAndView mv = new ModelAndView();
		MyDTO info = myService.getOne();
		
		mv.addObject("myInfo", info);
		mv.setViewName("my/modifyPW");
		
		return mv;
	}
	
	//개인 정보 수정 후 업데이트
	@PostMapping("updateMyInfo")
	public ModelAndView setUpdate(MyDTO myDTO) throws Exception{
		ModelAndView mv= new ModelAndView();
		System.out.println("update my info post controller");
		int result = myService.setUpdate(myDTO);
		System.out.println(result);
		if(result>0) {
			mv.addObject("msg", "업데이트 성공");
			mv.addObject("path", "./myIndex");
		}else {
			mv.addObject("msg", "업데이트 실패");
			mv.addObject("path", "./updateMyInfo");
		}
		mv.setViewName("common/result");
		return mv;
	}
	
	//개인 정보 수정
	@GetMapping("updateMyInfo")
	public ModelAndView getOne() throws Exception {
		ModelAndView mv = new ModelAndView();
		MyDTO info = myService.getOne();
		
		String birth = info.getBirth();
		String [] date = birth.split("-");
		for(int i=0; i<date.length; i++) {
			System.out.println(date[i]);;
		}
		String years = date[0];
		String months = date[1];
		String days = date[2];
		
		mv.addObject("years", years);
		mv.addObject("months", months);
		mv.addObject("days", days);
		mv.addObject("myInfo", info);
		mv.setViewName("my/updateMyInfo");
		
		return mv;
	}
	
	//마이스타벅스 메인 : myIndex 부분
	@GetMapping("myIndex")
	public ModelAndView myIndex(MyDTO myDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		MyDTO star = myService.getMyIndex();
		
		if(star.getGrade()==2) {
			mv.addObject("grade", "Green level");
		}else if(star.getGrade()==3) {
			mv.addObject("grade", "Gold level");
		}else {
			mv.addObject("grade", "Welcome level");
		}
		mv.addObject("star", star);
		long num = 30 -star.getUseStar();
		mv.addObject("num", num);
		mv.setViewName("my/myIndex");
		
		return mv;
	}
	
	
	
}
