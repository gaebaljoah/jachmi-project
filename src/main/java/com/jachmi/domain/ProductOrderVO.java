package com.jachmi.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ProductOrderVO {

	private int order_idx;
	private int order_count;
	private int order_price;
	private String order_status;
	private String order_option;
	private String order_p_name;
	private String order_recv;
	private String order_addr;
	private String order_addr_detail;
	private String order_tel;
	private String order_email;
	private int order_p_id;
	private String order_m_id;
	private Timestamp order_date;
	private String order_img;
}
