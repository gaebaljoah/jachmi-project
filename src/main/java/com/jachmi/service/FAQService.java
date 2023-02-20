package com.jachmi.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.jachmi.domain.Criteria;
import com.jachmi.domain.FAQAttachVO;
import com.jachmi.domain.FAQVO;
import com.jachmi.domain.NoticeAttachVO;

public interface FAQService {
	public List<FAQVO> faq_getListWithPaging(Criteria cri);
	
	public int faq_getTotalCount();
	
	public void faq_insert(FAQVO vo);
	
	public boolean faq_update(FAQVO vo);
	
	public boolean faq_delete(long faq_idx);
	
	public List<FAQVO> selFaq_category(FAQVO vo); 
	
	public int faq_getSelTotalCount(FAQVO vo);
	
	public FAQVO faq_read(long faq_idx);
	
	public List<FAQAttachVO> faq_getAttachList(long faq_idx);

}
