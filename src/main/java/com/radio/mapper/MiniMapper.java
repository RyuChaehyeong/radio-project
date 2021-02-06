package com.radio.mapper;

import java.util.List;

import com.radio.domain.Criteria;
import com.radio.domain.MiniVO;

public interface MiniMapper {

	//@Select("select * from tbl_mini where num > 0")
	public List<MiniVO> getList();
	
	public List<MiniVO> getListWithPaging(Criteria cri);
	
	public void insert(MiniVO mini);
	
	public void insertSelectKey(MiniVO mini);
	
	public int getTotalCount(Criteria cri);
}
