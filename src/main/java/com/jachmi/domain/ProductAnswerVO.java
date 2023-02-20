package com.jachmi.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ProductAnswerVO {

	private int answer_idx;
	private String answer_content;
	private String answer_ask_idx;
	private Date answer_regdate;
	private int answer_product_idx;
	
}
