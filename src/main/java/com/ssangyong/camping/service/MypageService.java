package com.ssangyong.camping.service;

import java.util.List;

import com.ssangyong.camping.vo.MemberVO;
import com.ssangyong.camping.vo.ObjectCartVO;
import com.ssangyong.camping.vo.ReservationsVO;

public interface MypageService {
	public MemberVO userInfo(MemberVO info) throws Exception;
	public void updatePw(MemberVO udpate) throws Exception;
	public List<ReservationsVO> reserveInfo(String userId) throws Exception;
	public ReservationsVO reserveDetail(int order_no) throws Exception;
	public void reserveCancel(int order_no) throws Exception;
	public List<ObjectCartVO> getCart(String userId) throws Exception;
}
