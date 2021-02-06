package com.radio.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.radio.domain.Criteria;
import com.radio.domain.MiniVO;
import com.radio.mapper.MiniMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MiniSeriviceImpl implements MiniService {

	public MiniMapper mapper;
	
	/*
	@Override
	public List<MiniVO> getList() {
		return mapper.getList();
	}
	*/

	@Override
	public void register(MiniVO mini) {
		mapper.insertSelectKey(mini);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<MiniVO> getListWithPaging(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

}
