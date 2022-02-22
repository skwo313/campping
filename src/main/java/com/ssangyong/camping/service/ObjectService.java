package com.ssangyong.camping.service;

import java.util.HashMap;
import java.util.List;

import com.ssangyong.camping.vo.ObjectCartVO;
import com.ssangyong.camping.vo.ObjectVO;

public interface ObjectService {
	public List<ObjectVO> objectList(HashMap<String, Object> map) throws Exception;
	public List<ObjectVO> objectListNew(HashMap<String, Object> map) throws Exception;
	public List<ObjectVO> objectListMax(HashMap<String, Object> map) throws Exception;
	public List<ObjectVO> objectListMin(HashMap<String, Object> map) throws Exception;
	public int searchCnt(String keyword) throws Exception;
	public ObjectVO objectDetail(String name) throws Exception;
	public void objectCartIns(ObjectCartVO vo) throws Exception;
	public int objectCartCk(HashMap<String, String> map) throws Exception;
	public int objectCartCnt(String id) throws Exception;
}
