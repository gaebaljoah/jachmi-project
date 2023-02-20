package com.jachmi.mapper;

import java.util.List;
import java.util.Map;

import com.jachmi.domain.Criteria;
import com.jachmi.domain.NoticeVO;


public interface NoticeMapper {
	public List<NoticeVO> getListWitgPaging(Criteria cri);

	public List<NoticeVO> nSearch(Map<String, Object> smap);
	
	public int getTotalCount();
	
	public int getTotalSearchCount(Map<String, Object> smap);
	
	public void ninsert(NoticeVO vo);
	
	public NoticeVO nRead(long n_idx);
	
	public int nUpdate(NoticeVO vo);
	
	public int nDelete(long n_idx); 
	
	public int getN_idx();
}
