package com.jachmi.mapper;

import java.util.List;

import com.jachmi.domain.RentVO;

public interface RentMapper {
	public List<RentVO> getList(int p_category);
	public void register(RentVO vo);
	public int getTotal();
	public int getNum();
	public int getCategory();
	public RentVO read(int p_num);
	public int Update(RentVO vo);
	public int remove(int p_num);
}
