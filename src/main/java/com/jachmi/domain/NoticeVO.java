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
public class NoticeVO {
	private int n_idx;
	private String n_title, n_content, id;
	private Date n_regdate;
	
	private List<NoticeAttachVO> nAttachList;
}
