package com.radio.service;

import com.radio.domain.AuthVO;
import com.radio.domain.MemberVO;

public interface MemberService {
	
	public int register(MemberVO vo);
	
	public int registerAuth(AuthVO authVo);

	public String get(String email);
	
	public int updatePw(String id, String password);
	
	public String check_email(String email);
	
	public String check_id(String id);
}
