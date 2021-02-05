package com.radio.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.radio.domain.Criteria;
import com.radio.domain.MiniVO;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MiniServiceTests {

	@Setter(onMethod_ = @Autowired)
	private MiniService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		MiniVO mini = new MiniVO();
		mini.setContent("service Test");
		mini.setWriter("user4");
		service.register(mini);
		log.info(mini);
	}
	
	/*
	@Test
	public void testGetList() {
		service.getList().forEach(mini -> log.info(mini));
		
	}
	*/
	
	@Test
	public void testGetListWithPaging() {
		Criteria cri = new Criteria(1, 10);
		service.getListWithPaging(cri);
	}
	
	@Test
	public void testGetTotal() {
		log.info(service.getTotal());
	}
}
