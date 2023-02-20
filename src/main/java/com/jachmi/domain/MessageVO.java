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
public class MessageVO {

	private long m_idx, gubun;
	private String m_id, m_receiver, m_content;
	private Date m_date;
}
