package com.ssangyong.camping.dao;

import java.util.List;

import com.ssangyong.camping.vo.CampingInfoVO;

public interface MainDAO {
	// 캠핑장 리스트 조회
	public List<CampingInfoVO> list() throws Exception;
	
}
