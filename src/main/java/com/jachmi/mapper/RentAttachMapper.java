package com.jachmi.mapper;

import java.util.List;

import com.jachmi.domain.RentAttachVO;

public interface RentAttachMapper {
	public void insert(RentAttachVO vo);
	public void delete(int p_num);
	public List<RentAttachVO> findByPnum(int p_num);
	//public List<RentAttachVO> getAllImg(int p_category);

}
