package com.jachmi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jachmi.domain.RentAttachVO;
import com.jachmi.domain.RentVO;
import com.jachmi.mapper.RentAttachMapper;
import com.jachmi.mapper.RentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RentServiceImpl implements RentService {
	
	@Setter(onMethod_ = @Autowired)
	private RentMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private RentAttachMapper attachmapper;
	

	@Override
	public List<RentVO> getList(int p_category) {
		List<RentVO> list = mapper.getList(p_category);
		
		for (RentVO rentVO : list) {
			List<RentAttachVO> list2 =  attachmapper.findByPnum(rentVO.getP_num());
			//log.info("....p넘 있냐?" + rentVO.getP_num());
			rentVO.setAttachList(list2);
		}
		
		
		log.info("list...");
		return list;
	}
	
	
	@Transactional
	@Override
	public void register(RentVO vo) {
			log.info("register..." + vo);
			mapper.register(vo);
			
			int p_num = mapper.getNum();
			log.info("p_num..." + p_num);
			
			if(vo.getAttachList() != null  && vo.getAttachList().size() > 0) {
				for(RentAttachVO vo2 : vo.getAttachList()) {
					vo2.setP_num(p_num);
					attachmapper.insert(vo2);		
				}
			}
			
	}
	@Override
	public int getTotal() {
		log.info("getTotal....");
		return mapper.getTotal();
	}

	@Override
	public RentVO get(int p_num) {
		log.info("get....");
		return mapper.read(p_num);
	}

	@Override
	public List<RentAttachVO> getAttachList(int p_num) {
		return attachmapper.findByPnum(p_num);
	}


	@Override
	public int Modify(RentVO vo) {
		return mapper.Update(vo);
	}
	
	@Transactional
	@Override
	public int delete(int p_num) {
		
		attachmapper.delete(p_num);
		
		return mapper.remove(p_num);
	}

	/*
	@Override
	public List<RentAttachVO> getAttachAllList() {
		return attachmapper.getAllImg();
	}
	*/

}
