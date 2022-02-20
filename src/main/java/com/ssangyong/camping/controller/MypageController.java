package com.ssangyong.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	// http://localhost:7080/camping/userModify.do
	@RequestMapping("/userModify.do")
	public String mypage() {
		return "mypage/userModify.page";
	}
	@RequestMapping("/userck.do")
	public String userck() {
		return "mypage/usercheck.page";
	}
	@RequestMapping("/reservations")
	public String reservation() {
		return "mypage/campsiteList.page";
	}
}
