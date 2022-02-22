package com.ssangyong.camping.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssangyong.camping.dao.ObjectDAO;
import com.ssangyong.camping.service.ObjectService;
import com.ssangyong.camping.vo.ObjectCartVO;
import com.ssangyong.camping.vo.ObjectVO;

@Service
public class ObjectServiceImpl implements ObjectService {

	@Autowired
	private ObjectDAO dao;
	
	@Override
	public List<ObjectVO> objectList(HashMap<String, Object> map) throws Exception {
		return dao.objectList(map);
	}
	
	@Override
	public List<ObjectVO> objectListNew(HashMap<String, Object> map) throws Exception {
		return dao.objectListNew(map);
	}
	
	@Override
	public List<ObjectVO> objectListMax(HashMap<String, Object> map) throws Exception {
		return dao.objectListMax(map);
	}
	
	@Override
	public List<ObjectVO> objectListMin(HashMap<String, Object> map) throws Exception {
		return dao.objectListMin(map);
	}
	
	@Override
	public int searchCnt(String keyword) throws Exception {
		return dao.searchCnt(keyword);
	}
	
	@Override
	public ObjectVO objectDetail(String name) throws Exception {
		return dao.objectDetail(name);
	}
	
	@Override
	public void objectCartIns(ObjectCartVO vo) throws Exception {
		dao.objectCartIns(vo);
	}
	
	@Override
	public int objectCartCk(HashMap<String, String> map) throws Exception {
		return dao.objectCartCk(map);
	}
	
	@Override
	public int objectCartCnt(String id) throws Exception {
		return dao.objectCartCnt(id);
	}
}
