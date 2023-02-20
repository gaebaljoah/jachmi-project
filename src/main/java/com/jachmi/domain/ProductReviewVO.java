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
public class ProductReviewVO {
	
	private int review_idx; 
	private String review_title; 
	private String review_content; 
	private String review_img;
	private Date review_regdate;
	private int product_idx;
	private String id;
	
}
