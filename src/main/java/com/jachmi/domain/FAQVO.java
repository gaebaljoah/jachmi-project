package com.jachmi.domain;


import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class FAQVO {
	private long faq_idx; 
	private String faq_title, faq_content, id, faq_category;
	private Date faq_date;
	private List<FAQAttachVO> faqAttachList;
	
	private int pageNum, amount;

}
