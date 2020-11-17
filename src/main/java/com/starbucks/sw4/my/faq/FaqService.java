package com.starbucks.sw4.my.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqService {
	@Autowired
	private FaqDAO faqDAO;
	
	public List<FaqDTO> getRewardList(Pager pager) throws Exception {
		System.out.println("service 까지 옴");
		//rownum 계산
		pager.makeRow();
		pager.setType("rewards");
		
		//page 계산
		long totalCount = faqDAO.faqCount(pager);
		pager.setTotalCount(totalCount);
		pager.makePage();
		
		return faqDAO.getRewardList(pager);
	}
	
	public List<FaqDTO> getCardList(Pager pager) throws Exception {
		System.out.println("service card  까지 옴");
		long totalCount = faqDAO.faqCount(pager);
		System.out.println("totalcount: "+totalCount);
		pager.setTotalCount(totalCount);
		return faqDAO.getCardList(pager);
	}
}