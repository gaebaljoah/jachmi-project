package com.jachmi.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
public class SellerVO {
	private int s_num,s_person,s_price;
	private String id,s_title,s_location,s_link,s_contents,s_category;
	private Date s_day;
	private Date s_startday;
	private Date s_endday;
	
	private int replyCnt; //추가	
}
