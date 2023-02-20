package com.jachmi.mapper;

import java.util.List;

import com.jachmi.domain.Criteria;
import com.jachmi.domain.FAQVO;

public interface FAQMapper {
	public List<FAQVO> faq_getListWithPaging(Criteria cri);
	
	public int faq_getTotalCount();
	
	public void faq_insert(FAQVO vo);
	
	public int faq_update(FAQVO vo);
	
	public int faq_delete(long faq_idx);
	
	public boolean getFaq_idx();
	
	public List<FAQVO> selFaq_category(FAQVO vo); 
	
	public int faq_getSelTotalCount(FAQVO vo);
	
	public FAQVO faq_read(long faq_idx);
}
