package com.ssangyong.camping.dao.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssangyong.camping.dao.MainDAO;
import com.ssangyong.camping.vo.CampingInfoVO;

@Repository
public class MainDAOImpl implements MainDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<CampingInfoVO> list(HashMap<String, Object> hashMap) throws Exception{
		System.out.println(hashMap);
		return sqlSession.selectList("mainMapper.list", hashMap);
	}
//	@Override
//	public List<CampingInfoVO> searchList(String keyword) throws Exception{
//		return sqlSession.selectList("mainMapper.searchList", keyword);
//	}
}