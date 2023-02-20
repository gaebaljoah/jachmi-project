package com.jachmi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jachmi.domain.MemberVO;
import com.jachmi.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{
	// mapper 의존성 주입 
		@Setter(onMethod_ = @Autowired)
		private MemberMapper mapper;

		@Override
		public List<MemberVO> read(){
			log.info("read : ");
			return mapper.read();
		}

		@Override
		public MemberVO signIn(MemberVO vo) {
			log.info("login : " + vo);
			return mapper.signIn(vo);
		}

		@Override
		public void insertMM(MemberVO vo) {
			log.info("join : " + vo);
			mapper.insertM(vo);
		}

		@Override
		public int modifyMM(MemberVO vo) {
			log.info("modify : " + vo);
			return mapper.modifyM(vo);
		}
		
		@Override
		public int modifyMM2(MemberVO vo) {
			log.info("modify2 : " + vo);
			return mapper.modifyM2(vo);
		}

		@Override
		public int deleteMM2(MemberVO vo) {
			log.info("delete : " + vo);
			return mapper.deleteM(vo);
		}

		@Override
		public int idCheckM(String id) {
			log.info("idcheck : " + id);
			return mapper.idCheck(id);
		}




	
	/*	@Override
	public List<SellerVO> getList() {
		log.info("getList....");
		return mapper.getList();
	}*/
	
}
