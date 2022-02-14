package com.ssangyong.camping.service;

import java.util.List;

import com.ssangyong.camping.vo.CampingInfoVO;

public interface MainService {
	// 캠핑장 목록 조회
	public List<CampingInfoVO> list() throws Exception;
	
}
