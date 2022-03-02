package com.ssangyong.camping.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ssangyong.camping.dao.MemberDAO;
import com.ssangyong.camping.service.MemberService;
import com.ssangyong.camping.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	@Override
	public void register(MemberVO vo) throws Exception {
		
		dao.register(vo);
		
	}
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}

}
