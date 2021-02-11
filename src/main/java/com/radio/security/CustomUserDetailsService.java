package com.radio.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.radio.domain.MemberVO;
import com.radio.mapper.MemberMapper;
import com.radio.security.domain.CustomerUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		log.warn("Load user by username: " + id);
		
		//userName means userid
		MemberVO vo = memberMapper.read(id);
		
		log.warn("queried by member mapper: " + vo);
		
		return vo == null? null: new CustomerUser(vo);
				
		
	}

}