package com.jachmi.service;

import java.util.List;

import com.jachmi.domain.FAQAttachVO;

public interface FAQAttachService {
	public void faq_insert(FAQAttachVO vo);
	public void faq_delete(String uuid);
	public List<FAQAttachVO> faq_findByBno(long n_idx);
}
