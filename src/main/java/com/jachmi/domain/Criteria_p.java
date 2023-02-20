package com.jachmi.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Criteria_p {
	
	// Fields
	
	// 현재페이지
	private int pageNum;
	// 한페이지당 보여질 게시물 갯수
	private int amount;
	
	// 검색 타입
	private String type;
	// 검색 키워드
	private String keyword;
	// 카테고리
	private String b_category;
	
	
//	public Criteria_p() {
//		this.pageNum = 1;
//		this.amount = 10;
//		this.type = null;
//		this.keyword = null;
//	}
//	
//	public int getPageStart() {
//		return (this.pageNum - 1)*amount;
//	}
//	public int getPageNum() {
//		return pageNum;
//	}
//	public void setPageNum(int pageNum) {
//		if(pageNum <= 0) {
//			this.pageNum = 1;
//		}else {
//			this.pageNum = pageNum;
//		}
//	}
//
//	public int getAmount() {
//		return amount;
//	}
//	public void setAmount(int amount) {
//		if(amount <=0 || amount > 100) {
//			this.amount = 10;
//		}else {
//			this.amount = amount;
//		}
//	}
//	
//	public String makeQuery() {
//		
//		UriComponentsBuilder uricomponentBuilder = UriComponentsBuilder.newInstance()
//				.queryParam("pageNum", pageNum)
//				.queryParam("amount", this.amount);
//		if (type != null) {
//			uricomponentBuilder
//				.queryParam("type", this.type)
//				.queryParam("keyword", this.keyword);
//		}
//		
//		return uricomponentBuilder.build().encode().toString();
//	}
//	
//	
//	@Override
//	public String toString() {
//		return "Criteria_p [amount=" + amount + ", pageNum=" + pageNum + ", type=" + type + ", keyword=" + keyword + "]";
//	}
//	public Criteria_p() {
//		this(1, 10);
//	}

//	public Criteria_p(int pageNum, int amount) {
//		this.pageNum = pageNum;
//		this.amount = amount;
//	}

//	public String[] getTypeArr() {
//		return type == null ? new String[] {} : type.split("");
//	}
	
	
	

	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount).queryParam("type", this.type).queryParam("keyword", this.keyword);

		return builder.toUriString();
	}


	@Override
	public String toString() {
		return "Criteria_p [pageNum=" +pageNum+", amount="+amount+"type="+type+"keyword="+keyword+"]";
	}
	
}
