package com.jachmi.mapper;

import java.util.List;

import com.jachmi.domain.BoardAttachVO;

public interface BoardAttachMapper {
	public void insert(BoardAttachVO avo);
	public void delete(String b_uuid);
	public List<BoardAttachVO> findByB_idx(long b_idx);
	public void deleteAll(long b_idx);
}
