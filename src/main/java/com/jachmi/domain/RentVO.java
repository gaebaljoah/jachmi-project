package com.jachmi.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RentVO {
	private int p_num, p_category,p_price;
	private String p_model, p_content, p_title, region,payment;
	private Date p_start,p_end, p_today;
	
	private List<RentAttachVO> attachList;
	
}
