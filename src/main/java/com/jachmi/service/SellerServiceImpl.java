package com.jachmi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jachmi.domain.Criteria;
import com.jachmi.domain.SellerVO;
import com.jachmi.mapper.SellerMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SellerServiceImpl implements SellerService{
	// mapper 의존성 주입 
	@Setter(onMethod_ = @Autowired)
	private SellerMapper mapper;

/*	@Override
	public List<SellerVO> getList() {
		log.info("getList....");
		return mapper.getList();
	}*/
	
	

	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotalConut....");
		return mapper.getTotalConut(cri);
	}

	@Override
	public List<SellerVO> getListWithPaging(Criteria cri) {
		log.info("get List with Criteria..." + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public void register(SellerVO vo) {
		log.info("register..." + vo);
		mapper.insert(vo);
	}
	@Override
	public SellerVO get(long s_num) {
		log.info("get..." + s_num);
		return mapper.read(s_num);
	}
	//데이터 수정
	@Override
	public boolean modify(SellerVO vo) {
		log.info("modify..."+ vo);
		int result = mapper.update(vo);
		return result == 1 ? true : false;
	}
	
	@Override
	public boolean remove(long s_num) {
		log.info("remove..."+ s_num);
		return mapper.delete(s_num) == 1;
	}

	@Override
	public List<SellerVO> category(String s_category) {
		return mapper.category(s_category);
	}

	@Override
	public int getTotalConutid(Criteria cri) {
		return mapper.getTotalConutid(cri);
	}

	@Override
	public List<SellerVO> getTotalid(Criteria cri) {
		return mapper.getTotalid(cri);
	}
	
	
	
	
	

	
	
	
	

}
