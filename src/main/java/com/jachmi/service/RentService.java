package com.jachmi.service;

import java.util.List;

import com.jachmi.domain.RentAttachVO;
import com.jachmi.domain.RentVO;

public interface RentService {
	public List<RentVO> getList(int p_category);
	public int getTotal();
	public void register(RentVO vo);
	public RentVO get(int p_num);
	public int Modify(RentVO vo);
	public int delete(int p_num);
	
	public List<RentAttachVO> getAttachList(int p_num);
	//public List<RentAttachVO> getAttachAllList();
}
