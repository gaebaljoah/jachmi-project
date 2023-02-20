package com.jachmi.service;

import java.util.List;

import com.jachmi.domain.NoticeAttachVO;


public interface NoticeAttachService {
	public void n_insert(NoticeAttachVO vo);
	public void n_delete(String uuid);
	public List<NoticeAttachVO> n_findByBno(long n_idx);
}
