package com.jachmi.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jachmi.domain.AskCriteriaVO;
import com.jachmi.domain.ProductAskVO;
import com.jachmi.mapper.ProductAskMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductAskServiceImpl implements ProductAskService {
	
	// mapper 의존성 주입
		@Setter(onMethod_ = @Autowired )
		private ProductAskMapper mapper;

		//문의 등록
		@Override
		public void askRegister(ProductAskVO vo) {
			mapper.askInsert(vo);
			
		}

		//문의 글 보기
		@Override
		public List<ProductAskVO> getAskListWithPaging(int product_idx) {
			
			return mapper.getAskListWithPaging(product_idx);
		}

		@Override
		public ProductAskVO read(int ask_idx) {
			
			return mapper.read(ask_idx);
		}

		@Override
		public List<ProductAskVO> getAllListAdmin(AskCriteriaVO cri) {
		
			return mapper.getAllListAdmin(cri);
		}

		@Override
		public int getTotalAsk() {
			return mapper.getTotalAsk();
		}

		@Override
		public void update(ProductAskVO vo) {
			mapper.update(vo);
		}
		
}
