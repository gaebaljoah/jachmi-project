package com.jachmi.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jachmi.domain.BoardAttachVO;
import com.jachmi.domain.BoardVO;
import com.jachmi.domain.Criteria_p;
import com.jachmi.domain.MemberVO;
import com.jachmi.mapper.BoardAttachMapper;
import com.jachmi.mapper.BoardMapper;
import com.jachmi.mapper.CommentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper amapper;
	
	@Setter(onMethod_ = @Autowired)
	private CommentMapper cmapper;
	
//	// 전체목록
//	@Override
//	public List<BoardVO> getList() {
//		log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!getList...");
//		return mapper.getList();
//	}
	
	// 페이징 처리한 전체 목록
	@Override
	public List<BoardVO> getListWithPaging(Criteria_p cri) {
		log.info("!!!!!!!!!!!!!!!!getListWithPaging");
		
		return mapper.getListWithPaging(cri);
	}
	
	// 테이블 전체 갯수
	@Override
	public int getTotal(Criteria_p cri) {
		log.info("getTotalCount!!!!!!!!!!!!!!!!!!!!!!!");
		
//		String type = cri.getType();
//		int result = 0;
//		switch(type) {
//		case "" :
//			result = mapper.getTotalCount(cri);
//			break;
//		case "T" :
//			result = mapper.getTotalCount(cri);
//			break;
//		case "W" :
//			result = mapper.getTotalCount(cri);
//			break;
//		}
		return mapper.getTotalCount(cri);
	}
	
	// 데이터 한 개 가져오기
	@Override
	public BoardVO get(long b_idx) {
		log.info("get!!!!!!!!!!!!!!!!" + b_idx);
		return mapper.get(b_idx);
	}

	// 데이터 삽입, 첨부파일
	@Transactional
	@Override
	public void insert(BoardVO bvo) {
		// 게시글 등록(데이터 삽입)
		mapper.insert(bvo);
		log.info("bvo!!!!!!!!!!!!!!!!!" + bvo);
		
		long b_idx = mapper.getB_idx();
		
		if (bvo.getAttachList() != null && bvo.getAttachList().size() > 0) {
			for(BoardAttachVO avo : bvo.getAttachList()) {
				avo.setB_idx(b_idx);
				amapper.insert(avo);
			}
		}
	}

	// 데이터 수정
	@Transactional
	@Override
	public boolean update(BoardVO bvo) {
		log.info("update!!!!!!!!!!!!!!!!!!" + bvo);
		amapper.deleteAll(bvo.getB_idx());
		boolean updateResult = mapper.update(bvo) == 1;
		if (updateResult && bvo.getAttachList() != null && bvo.getAttachList().size() >0) {
			bvo.getAttachList().forEach(attach -> {
				attach.setB_idx(bvo.getB_idx());
				amapper.insert(attach);
			});
		}
		
		int result = mapper.update(bvo);
		return result == 1 ? true : false;
	}

	// 데이터 삭제
	@Override
	public boolean delete(long b_idx) {
		log.info("delete!!!!!!!!!!!!!!" + b_idx);
		// 첨부파일 관련 삭제
		amapper.deleteAll(b_idx);
		// 댓글 관련 삭제
		cmapper.deleteAll(b_idx);
		return mapper.delete(b_idx) == 1;	// 1이면 삭제(true)
	}
	
	// 첨부파일 관련
	@Override
	public List<BoardAttachVO> getAttachList(long b_idx){
		log.info("getAttachList!!!!!!!!!!!!!!!");
		return amapper.findByB_idx(b_idx);
	}
	
	// 조회수
	@Override
	public int updateHit(long b_idx) {
		return mapper.updateHit(b_idx);
	}
	
	// 마이페이지 관련
	@Override
	public List<BoardVO> getInfo(String b_writer) {
		return mapper.getInfo(b_writer);
	}
}
