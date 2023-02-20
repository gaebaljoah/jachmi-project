package com.jachmi.domain;

import lombok.Data;

@Data
public class PageDTO_board {
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private boolean prev, next; // 이전, 다음 페이지 이동
	private int total; // 전체 게시물 수
	private Criteria_p cri;
	private int displayPageCnt = 10; // 화면에 보여질 페이지 번호 수

	/*
	 * // 페이지 번호를 10개씩 본다는 가정 public PageDTO(Criteria_p cri, int total) {
	 * 
	 * this.cri = cri; this.total = total;
	 * 
	 * public PageDTO(Criteria_p cri) { this.cri = cri;
	 * 
	 * this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10; // 1 페이지 :
	 * Math.ceil(0.1) * 10 = 10 // 10 페이지 : Math.ceil(1) * 10 = 10 // 11 페이지 :
	 * Math.ceil(1.1) * 10 = 20
	 * 
	 * this.startPage = this.endPage - 9; // 만약 10개씩 보여준다면 시작 번호는 무조건 끝 번호에서 9만큼 빼면
	 * 된다. // ex) 2 3 4 5 6 7 8 9 10 11
	 * 
	 * 
	 * int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount())); if(realEnd <
	 * this.endPage) { this.endPage = realEnd; } // 전체 데이터 수(total)가 80이면 끝
	 * 번호(endPage)는 8이 된다. // 만약 끝 번호(endPage)와 한 페이지당 출력되는 데이터 수(amount)의 곱이 // 전체
	 * 데이터 수(total)보다 크면 ex) 11 * 10 > 80 // 다시 total을 이용해서 다시 계산해야 한다.
	 * 
	 * 
	 * this.prev = this.startPage > 1; // 1 보다 크면 true this.next = this.endPage <
	 * realEnd; // 현재 끝 번호 보다 실제 끝 페이지가 더 크면 true
	 * 
	 * 
	 * }
	 */
	
	// Constructor
//	public PageDTO(Criteria_p cri) {
//		this.cri = cri;
//	}
//	
//	//전체 게시물의 수를 입력 받음
//	public void setTotalCount(int total) {
//		this.total = total;
//		calcData(); 
//	}
//	
//	//startPage, endPage, prev, next 를 계산
//	private void calcData() {
//		int amount = this.cri.getAmount();
//		int pageNum = this.cri.getPageNum();
//		
//		this.endPage = (int)(Math.ceil(pageNum/(double)displayPageCnt)*displayPageCnt);
//	
//		this.startPage = (this.endPage-displayPageCnt) + 1;
//		
//		int tempEndPage = (int)(Math.ceil(total / (double) amount));
//		
//		if(this.endPage > tempEndPage) {
//			this.endPage = tempEndPage;
//		}
//		
//		this.prev = (startPage != 1); // startPage 1이 아니면 false
//		this.next = (endPage * amount < total); //아직 더 보여질 페이지가 있으면 true
//	}
//
//
//	public String makeQuery(int pageNum) {
//		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
//				.queryParam("pageNum", pageNum)
//				.queryParam("amount", this.cri.getAmount());
//		
//		// 검색
//		if (this.cri.getType() != null) {
//			uriComponentsBuilder
//				.queryParam("type", this.cri.getType())
//				.queryParam("keyword", this.cri.getKeyword());
//		}
//		return uriComponentsBuilder.build().encode().toString();
//	}
	public PageDTO_board(Criteria_p cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}
