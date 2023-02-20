package com.jachmi.mapper;

import com.jachmi.domain.RentInfoVO;

public interface RentInfoMapper {
	public void register(RentInfoVO vo);
	public RentInfoVO selectOne(int p_num);
	public RentInfoVO selectY(String payment);
	public int updatePay(int p_num);
}
