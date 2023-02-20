package com.jachmi.mapper;


import java.util.List;

import com.jachmi.domain.MemberVO;

public interface MemberMapper {
	public List<MemberVO> read();
	
	public MemberVO signIn(MemberVO vo);
	
	public void insertM(MemberVO vo);
	
	public int modifyM(MemberVO vo);
	
	public int modifyM2(MemberVO vo);
	
	public int deleteM(MemberVO vo);
	
	public int idCheck(String id);
}
