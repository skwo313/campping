package com.ssangyong.camping.dao;

import com.ssangyong.camping.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(MemberVO vo) throws Exception;
	public void register(MemberVO vo) throws Exception;
	public int idChk(MemberVO vo) throws Exception;
}