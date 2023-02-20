package com.jachmi.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ShopProductVO {

	private int product_idx;
	private String product_name;
	private String product_price;
	private Date product_regdate;
	private String product_desc;
	private String product_option1;
	private String product_option2;
	private String product_option_price1;
	private String product_option_price2;
	private String product_img;
	private String product_img_desc1;
	private String product_img_desc2;
	private String product_img_desc3;
	private int product_category_idx;

}
