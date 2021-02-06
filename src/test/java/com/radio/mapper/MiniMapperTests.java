package com.radio.mapper;

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
public class MiniMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MiniMapper mapper;
	
	@Test
	public void testgetList() {
		mapper.getList().forEach(mini -> log.info(mini));
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria(1, 10);
		log.info(mapper.getListWithPaging(cri));
	}
	
	@Test
	public void testInsert() {
		MiniVO mini = new MiniVO();
		mini.setContent("insert test");
		mini.setWriter("user2");
		mapper.insert(mini);
		
		log.info(mini);
	}
	
	@Test
	public void testInsertSelectKey() {
		MiniVO mini = new MiniVO();
		mini.setContent("insert test");
		mini.setWriter("user3");
		mapper.insertSelectKey(mini);
		log.info(mini);
	}

	/*
	@Test
	public void testGetTotalCount() {
		log.info(mapper.getTotalCount());
	}
	*/
}
