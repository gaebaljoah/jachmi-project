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
public class ProductAskVO {

	private int ask_idx;
	private String ask_title;
	private String ask_content;
	private Date ask_regdate;
	private int ask_product_idx;
	private String ask_id;
	private String answer_content;
	private int answer_chk;
	
}
