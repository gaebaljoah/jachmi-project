package com.jachmi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jachmi.domain.CommentVO;
import com.jachmi.service.CommentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/replies/")
@RestController
public class CommentController {
	@Setter(onMethod_ = @Autowired)
	private CommentService service;
	
	
	// 댓글 목록
	@GetMapping(value = "/pages/{b_idx}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CommentVO>> getList(@PathVariable("b_idx") long b_idx, @PathVariable("page") int page){
		log.info("getListComment!!!!!!!!!!!!!!");
		List<CommentVO> list = service.getList(b_idx);
		for(CommentVO cvo : list) {
			log.error(cvo.getC_date());
		}
		return new ResponseEntity<List<CommentVO>>(list, HttpStatus.OK);
	}
	
	// 댓글 조회
	@GetMapping(value = "/{c_idx}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<CommentVO> getComment(@PathVariable("c_idx") long c_idx){
		log.info("getComment!!!!!!!!!!!!!!!!" + c_idx);
		
		return new ResponseEntity<CommentVO>(service.get(c_idx), HttpStatus.OK);
	}
	
	// 댓글 등록
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertComment(@RequestBody CommentVO cvo){
		log.info("commentVO!!!!!!!!!!!!" + cvo);
		int insertCount = service.insert(cvo);
		log.info("Comment Insert Count!!!!!!!!!! : " + insertCount);
		return insertCount == 1? 
				new ResponseEntity<String>("success", HttpStatus.OK) : 
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{c_idx}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateComment(@RequestBody CommentVO cvo, @PathVariable("c_idx") long c_idx){
		log.info("c_idx!!!!!!!!!!!!!!" + c_idx);
		log.info("updateComment!!!!!!!!!!!!!!!!" + cvo);
		int updateCount = service.update(cvo);
		log.info("CommentUpdateCount!!!!!!!!!!!!!! : " + updateCount);
		return updateCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : 
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 삭제
	@DeleteMapping(value = "/{c_idx}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteComment(@PathVariable("c_idx") long c_idx){
		log.info("deleteComment!!!!!!!!!!!!!!!!" + c_idx);
		return service.delete(c_idx) == 1 ?
				new ResponseEntity<String>("success", HttpStatus.OK) : 
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
