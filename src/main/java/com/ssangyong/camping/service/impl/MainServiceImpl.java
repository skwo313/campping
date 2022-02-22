package com.ssangyong.camping.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ssangyong.camping.dao.MainDAO;
import com.ssangyong.camping.service.MainService;
import com.ssangyong.camping.vo.CampingInfoVO;
import com.ssangyong.camping.vo.CampingOrderVO;

@Service
public class MainServiceImpl implements MainService{
	@Inject
	private MainDAO dao;
	
	// 캠핑장 목록 조회
	@Override
	public List<CampingInfoVO> list(HashMap<String, Object> hashMap) throws Exception{
		System.out.println(hashMap);
		return dao.list(hashMap);
	}
	// 캠핑 예약
	@Override
	public void order(CampingOrderVO orderVO) throws Exception{
		dao.order(orderVO);
	}
	// 캠핑장 검색 조회
//	@Override
//	public List<CampingInfoVO> searchList(String keyword) throws Exception{
//		return dao.searchList(keyword);
//	}
}
