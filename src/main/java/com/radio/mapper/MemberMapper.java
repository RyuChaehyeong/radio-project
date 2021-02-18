package com.radio.mapper;

import org.apache.ibatis.annotations.Param;

import com.radio.domain.AuthVO;
import com.radio.domain.MemberVO;

public interface MemberMapper {
	

	public MemberVO read(String id);
	
	public int register(MemberVO vo);
	
	public int registerAuth(AuthVO authVo);
	
	public String get(String email);
	
	public int updatePw(
			@Param("id") String id, 
			@Param("password") String password);
	
	public String check_id(String id);
	
	public String check_email(String email);
}
