package com.jachmi.domain;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class CommentVO {
	private long c_idx, b_idx;
	private String c_writer, c_content;
	private Date c_date;
}
