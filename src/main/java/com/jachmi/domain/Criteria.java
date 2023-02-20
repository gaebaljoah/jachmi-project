package com.jachmi.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Criteria {
	private int pageNum, amount;
	/*검색 키워드*/
	private String keyword;
	/*카테고리*/
	private String category;
	/*아이디*/
	private String id;
}
