package com.jachmi.mapper;

import java.util.List;

import com.jachmi.domain.FAQAttachVO;

public interface FAQAttachMapper {
	public void n_insert(FAQAttachVO vo);
	public void n_delete(String uuid);
	public List<FAQAttachVO> n_findByBno(long n_idx);
}
