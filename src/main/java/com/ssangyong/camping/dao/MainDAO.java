package com.ssangyong.camping.dao;

import java.util.HashMap;
import java.util.List;

import com.ssangyong.camping.vo.CampingInfoVO;
import com.ssangyong.camping.vo.CampingOrderVO;

public interface MainDAO {
	// 캠핑장 리스트 조회
	public List<CampingInfoVO> list(HashMap<String, Object> hashMap) throws Exception;
	// 캠핑장 예약
	public void order(CampingOrderVO orderVO) throws Exception;
//	public List<CampingInfoVO> searchList(String keyword) throws Exception;
	
}
