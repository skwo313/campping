package com.ssangyong.camping.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ssangyong.camping.dao.MypageDAO;
import com.ssangyong.camping.service.MypageService;
import com.ssangyong.camping.vo.MemberVO;
import com.ssangyong.camping.vo.ObjectCartVO;
import com.ssangyong.camping.vo.ReservationsVO;

@Service
public class MypageServiceImpl implements MypageService {
	@Inject
	MypageDAO dao;
	
	@Override
	public MemberVO userInfo(MemberVO info) throws Exception {
		
		return dao.userInfo(info);
	}
	
	@Override
	public void updatePw(MemberVO udpate) throws Exception {
		
		dao.updatePw(udpate);
	}
	
	@Override
	public List<ReservationsVO> reserveInfo(String userId) throws Exception {
		
		return dao.reserveInfo(userId);
	}
	
	@Override
	public ReservationsVO reserveDetail(int order_no) throws Exception {
		
		return dao.reserveDetail(order_no);
	}
	
	@Override
	public void reserveCancel(int order_no) throws Exception {
		
		dao.reserveCancel(order_no);
	}
	
	@Override
	public List<ObjectCartVO> getCart(String userId) throws Exception {
		
		return dao.getCart(userId);
	}
	
}
