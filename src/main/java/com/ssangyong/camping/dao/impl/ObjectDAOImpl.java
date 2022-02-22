package com.ssangyong.camping.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssangyong.camping.dao.ObjectDAO;
import com.ssangyong.camping.vo.ObjectCartVO;
import com.ssangyong.camping.vo.ObjectVO;

@Repository
public class ObjectDAOImpl implements ObjectDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ObjectVO> objectList(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList("objectMapper.objectList", map);
	}
	
	@Override
	public List<ObjectVO> objectListNew(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList("objectMapper.objectListNew", map);
	}
	
	@Override
	public List<ObjectVO> objectListMax(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList("objectMapper.objectListMax", map);
	}
	
	@Override
	public List<ObjectVO> objectListMin(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList("objectMapper.objectListMin", map);
	}
	
	@Override
	public int searchCnt(String keyword) throws Exception {
		return sqlSession.selectOne("objectMapper.searchCnt", keyword);
	}
	
	@Override
	public ObjectVO objectDetail(String name) throws Exception {
		return sqlSession.selectOne("objectMapper.objectDetail", name);
	}
	
	@Override
	public void objectCartIns(ObjectCartVO vo) throws Exception {
		sqlSession.insert("objectMapper.objectCartIns", vo);
	}
	
	@Override
	public int objectCartCk(HashMap<String, String> map) throws Exception {
		return sqlSession.selectOne("objectMapper.objectCartCk", map);
	}
	
	@Override
	public int objectCartCnt(String id) throws Exception {
		return sqlSession.selectOne("objectMapper.objectCartCnt", id);
	}
}
