package com.jachmi.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BoardAttachVO {
	private String b_uuid, b_uploadPath, b_fileName;
	private boolean b_fileType;
	private long b_idx;
}
