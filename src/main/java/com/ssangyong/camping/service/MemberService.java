package com.ssangyong.camping.service;

import com.ssangyong.camping.vo.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO vo) throws Exception;
	public void register(MemberVO vo) throws Exception;
	public int idChk(MemberVO vo) throws Exception;
}


