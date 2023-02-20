package com.jachmi.service;

import com.jachmi.domain.RentInfoVO;

public interface RentInfoService {
	public void registerInfo(RentInfoVO vo);
	public RentInfoVO rentInfoOne(int p_num);
	public RentInfoVO rentInfoYes(String payment);
	public int update(int p_num);
}
