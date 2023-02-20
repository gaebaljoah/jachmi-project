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
public class BuyerVO {
	private int s_num,b_num;
	private String id,b_money,phone,b_location,b_equests,s_title;
	private Date b_day;
	
}
