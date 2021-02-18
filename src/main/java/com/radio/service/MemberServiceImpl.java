package com.radio.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.radio.domain.AuthVO;
import com.radio.domain.MemberVO;
import com.radio.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	public MemberMapper mapper;

	@Override
	public int register(MemberVO vo) {
		return mapper.register(vo);
	}

	@Override
	public int registerAuth(AuthVO authVo) {
		return mapper.registerAuth(authVo);
	}

	@Override
	public String get(String email) {
		return mapper.get(email);
	}

	@Override
	public int updatePw(String id, String password) {
		return mapper.updatePw(id, password);
	}

	@Override
	public String check_email(String email) {
		return mapper.check_email(email);
		
	}
	
	@Override
	public String check_id(String id) {
		return mapper.check_id(id);
		
	}
	
}
