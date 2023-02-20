package com.jachmi.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jachmi.domain.Criteria;
import com.jachmi.domain.FAQAttachVO;
import com.jachmi.domain.FAQVO;
import com.jachmi.mapper.FAQAttachMapper;
import com.jachmi.mapper.FAQMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FAQServiceImpl implements FAQService{

	@Setter(onMethod_ = @Autowired)
	private FAQMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private FAQAttachMapper attachmapper;
	
	@Override
	public List<FAQVO> faq_getListWithPaging(Criteria cri) {
		log.info("faq_getListWithPaging..." + cri);
		return mapper.faq_getListWithPaging(cri);
	}

	@Override
	public int faq_getTotalCount() {
		log.info("faq_getTotalCount");
		return mapper.faq_getTotalCount();
	}

	@Override
	public void faq_insert(FAQVO vo) {
		log.info("faq_insert.....");
		mapper.faq_insert(vo);
	}

	@Override
	public boolean faq_update(FAQVO vo) {
		log.info("faq_update..." + vo);
		int result = mapper.faq_update(vo);
		return result == 1 ? true : false;
	}

	@Override
	public boolean faq_delete(long faq_idx) {
		log.info("faq_update...." + faq_idx);
		return mapper.faq_delete(faq_idx) == 1;
	}

	@Override
	public List<FAQVO> selFaq_category(FAQVO vo) {
		log.info("selFaq_category...." + vo);
		return mapper.selFaq_category(vo);
	}

	@Override
	public int faq_getSelTotalCount(FAQVO vo) {
		log.info(vo);
		return mapper.faq_getSelTotalCount(vo);
	}

	@Override
	public FAQVO faq_read(long faq_idx) {
		log.info("faq_read....." + faq_idx);
		return mapper.faq_read(faq_idx);
	}

	@Override
	public List<FAQAttachVO> faq_getAttachList(long faq_idx) {
		return attachmapper.n_findByBno(faq_idx);
	}
	
	
	
}
