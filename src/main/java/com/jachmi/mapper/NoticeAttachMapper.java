package com.jachmi.mapper;

import java.util.List;

import com.jachmi.domain.NoticeAttachVO;


public interface NoticeAttachMapper {
	public void n_insert(NoticeAttachVO vo);
	public void n_delete(String uuid);
	public List<NoticeAttachVO> n_findByBno(long n_idx);
}
