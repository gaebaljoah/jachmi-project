package com.jachmi.domain;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String addr;
	private String addr_ck;
	private String phone;
	private String auth;
	private int chatid;
}
