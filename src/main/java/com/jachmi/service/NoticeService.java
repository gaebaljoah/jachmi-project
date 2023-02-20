package com.jachmi.service;

import java.util.List;
import java.util.Map;

import com.jachmi.domain.Criteria;
import com.jachmi.domain.NoticeAttachVO;
import com.jachmi.domain.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> getListWitgPaging(Criteria cri);
	
	public List<NoticeVO> nSearch(Map<String, Object> smap);
	
	public int getTotal();
	
	public int getTotalSearchCount(Map<String, Object> smap);
	
	public void ninsert(NoticeVO vo);
	
	// 한 개 데이터 가져오기
	public NoticeVO nRead(long n_idx);
	
	// 데이터 수정
	public boolean nUpdate(NoticeVO vo);
	
	// 데이터 삭제
	public boolean nDelete(long n_idx);
	
	public List<NoticeAttachVO> n_getAttachList(long n_idx);
	
	public void n_delete(String uuid);	
	
}
