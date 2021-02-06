package com.radio.service;

import java.util.List;

import com.radio.domain.Criteria;
import com.radio.domain.MiniVO;

public interface MiniService {
	
	//public List<MiniVO> getList();
	public List<MiniVO> getListWithPaging(Criteria cri);
	
	public void register(MiniVO mini);
	
	public int getTotal(Criteria cri);

}
