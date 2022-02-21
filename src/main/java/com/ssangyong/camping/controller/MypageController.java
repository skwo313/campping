package com.ssangyong.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	// http://localhost:7080/camping/mypage?method=userModify
	@RequestMapping(params="method=userModify")
	public String mypage() {
		return "mypage/userModify.page";
	}
	// http://localhost:7080/camping/mypage?method=userck
	@RequestMapping(params="method=userck")
	public String userck() {
		return "mypage/usercheck.page";
	}
	// http://localhost:7080/camping/mypage?method=reservations
	@RequestMapping(params="method=reservations")
	public String reservation() {
		return "mypage/campsiteList.page";
	}
}
