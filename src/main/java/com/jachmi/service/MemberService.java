package com.jachmi.service;

import java.util.List;

import com.jachmi.domain.MemberVO;

public interface MemberService {
	public List<MemberVO> read();
	
	public MemberVO signIn(MemberVO vo);
	
	public void insertMM(MemberVO vo);
	
	public int modifyMM(MemberVO vo);
	
	public int modifyMM2(MemberVO vo);
	
	public int deleteMM2(MemberVO vo);
	
	public int idCheckM(String id);
	
}
