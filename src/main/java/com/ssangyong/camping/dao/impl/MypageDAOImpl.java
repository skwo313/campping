package com.ssangyong.camping.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssangyong.camping.dao.MypageDAO;
import com.ssangyong.camping.vo.MemberVO;
import com.ssangyong.camping.vo.ObjectCartVO;
import com.ssangyong.camping.vo.ReservationsVO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Inject
	SqlSession sql;
	
	@Override
	public MemberVO userInfo(MemberVO info) throws Exception {
		
		return sql.selectOne("mypageMapper.userInfo", info);
	}
	
	@Override
	public void updatePw(MemberVO udpate) throws Exception {
		sql.update("mypageMapper.updatePw", udpate);
	}
	
	@Override
	public List<ReservationsVO> reserveInfo(String userId) throws Exception {
		
		return sql.selectList("mypageMapper.reserveInfo", userId);
	}
	
	@Override
	public ReservationsVO reserveDetail(int order_no) throws Exception {
		
		return sql.selectOne("mypageMapper.reserveDetail", order_no);
	}
	
	@Override
	public void reserveCancel(int order_no) throws Exception {
		
		sql.delete("mypageMapper.reserveCancel", order_no);
	}
	
	@Override
	public List<ObjectCartVO> getCart(String userId) throws Exception {
		
		return sql.selectList("mypageMapper.getCart", userId);
	}
}
