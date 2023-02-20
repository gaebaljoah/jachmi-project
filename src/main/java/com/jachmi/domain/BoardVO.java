package com.jachmi.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private long b_idx;				// 게시판 글번호
	private int b_cnt;				// 게시판 조회수
	private int b_replycnt;			// 게시판 댓글수
	private String b_writer;		// 게시판 작성자
	private String b_category;		// 게시판 카테고리
	private String b_title;			// 게시판 제목
	private String b_content;		// 게시판 내용
	private Date b_date;			// 게시판 등록날짜
	
	private List<BoardAttachVO> attachList;
}
