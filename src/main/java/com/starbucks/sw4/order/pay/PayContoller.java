package com.starbucks.sw4.order.pay;

import java.security.PublicKey;
import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.starbucks.sw4.member.MemberDTO;

@Controller
@RequestMapping(value = "/pay/**")
@ResponseBody
public class PayContoller {
	
	@PostMapping("payResult")
	public ModelAndView setInsertPay(PayDTO payDTO, MemberDTO memberDTO) throws ClassNotFoundException, SQLException{
		
		System.out.println("pay controller access");
		ModelAndView mv = new ModelAndView();
		
		System.out.println(payDTO.getMerchant_uid());
		System.out.println(memberDTO.getNum());
		System.out.println(payDTO.getBuyer_tel());
		System.out.println(payDTO.getPg());
		
		mv.setViewName("order/pay/payResult");
		return mv;
		
	}

	@GetMapping("pay")
	public ModelAndView getPay() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("order/payment/pay");
		return mv;
	}
	
}
