package com.jachmi.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {

	private int cart_idx;
	private String cart_product_name;
	private String cart_product_option;
	private int cart_count;
	private	int cart_price;
	private	String cart_img;
	private	String cart_m_id;
	private	String cart_product_idx;
}
