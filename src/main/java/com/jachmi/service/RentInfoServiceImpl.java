package com.jachmi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jachmi.domain.RentInfoVO;
import com.jachmi.mapper.RentInfoMapper;
import com.jachmi.mapper.RentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class RentInfoServiceImpl implements RentInfoService{
	
	@Setter(onMethod_=@Autowired)
	private RentInfoMapper mapper;
	
	@Override
	public void registerInfo(RentInfoVO vo) {
		log.info("registerInfo...." + vo);
		
		mapper.register(vo);
		
	}

	@Override
	public RentInfoVO rentInfoOne(int p_num) {
		log.info("rentInfoOne...." + p_num);
		
		return mapper.selectOne(p_num);
	}

	@Override
	public int update(int p_num) {
		log.info("updatePay..." + p_num);
		
		return mapper.updatePay(p_num);
	}

	@Override
	public RentInfoVO rentInfoYes(String payment) {	
		log.info("paymentYes..." + payment);
		
		return mapper.selectY(payment);
	}

}
