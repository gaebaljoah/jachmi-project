package com.jachmi.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jachmi.domain.Criteria;
import com.jachmi.domain.NoticeAttachVO;
import com.jachmi.domain.NoticeVO;
import com.jachmi.mapper.NoticeAttachMapper;
import com.jachmi.mapper.NoticeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeServiceImpl implements NoticeService{

	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private NoticeAttachMapper attachmapper;
	
	@Override
	public List<NoticeVO> getListWitgPaging(Criteria cri) {
		log.info("get List with Paging..." + cri);
		return mapper.getListWitgPaging(cri);
	}

	@Override
	public int getTotal() {
		log.info("getTotalCount...");
		return mapper.getTotalCount();
	}

	@Override
	public void ninsert(NoticeVO vo) {
		log.info("ninsert.....");
		mapper.ninsert(vo);
		
		int n_idx = mapper.getN_idx();
		System.out.println("n_idx------- :" + n_idx);
		
		if(vo.getNAttachList() != null && vo.getNAttachList().size() > 0) {
			System.out.println("확인용");
			for(NoticeAttachVO vo2 : vo.getNAttachList()) {
				vo2.setN_idx(n_idx);
				attachmapper.n_insert(vo2);
			}
		}
	}

	@Override
	public NoticeVO nRead(long n_idx) {
		log.info("nRead......" + n_idx);
		return mapper.nRead(n_idx);
	}

	@Override
	public boolean nUpdate(NoticeVO vo) {
		log.info("nUpdate....." + vo);
		int result = mapper.nUpdate(vo);
		return result == 1 ? true : false;
	}

	@Override
	public boolean nDelete(long n_idx) {
		log.info("nDelete......." + n_idx);
		return mapper.nDelete(n_idx) == 1;
	}

	@Override
	public List<NoticeAttachVO> n_getAttachList(long n_idx) {
		log.info("n_idx==================" +  n_idx);
		
		return attachmapper.n_findByBno(n_idx);
	}

	@Override
	public void n_delete(String uuid) {
		log.info("n_delete...." + uuid);
		attachmapper.n_delete(uuid);
	}


	@Override
	public List<NoticeVO> nSearch(Map<String, Object> smap) {
		return mapper.nSearch(smap);
	}

	@Override
	public int getTotalSearchCount(Map<String, Object> smap) {
		log.info("getSearchTotalCount.....");
		return mapper.getTotalSearchCount(smap);
	}
	
	
	
}
