package com.ssangyong.camping.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ssangyong.camping.service.MypageService;
import com.ssangyong.camping.vo.MemberVO;
import com.ssangyong.camping.vo.ObjectCartVO;


@Controller
@SessionAttributes("member")
@RequestMapping("/mypage/*")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@ModelAttribute("member")
	public MemberVO getMember() {
		return new MemberVO();
	}
	
	@Autowired
	private MypageService service;
	
	
	
	
	// 회원정보확인
	@RequestMapping(value = "/userConfirm", method = RequestMethod.GET)
	public String userCk(@RequestParam(value = "pass", required = false) String pass, Model model, 
						 @ModelAttribute("member") MemberVO check) {
		if( pass == null ) {
			return "mypage/userCheck.page";
		} else if( pass.equals(check.getUserPw()) ) {
			return "redirect:userModifyFrm";
		} else {
			model.addAttribute("loginMsg", "현재 비밀번호가 일치하지 않습니다.");
			return "mypage/userCheck.page";
		}
	}
	
	// 회원정보수정 폼
	@RequestMapping(value ="/userModifyFrm", method = RequestMethod.GET)
	public String userModifyFrm(@ModelAttribute("member") MemberVO info, Model model) throws Exception {
		model.addAttribute("member", service.userInfo(info) ); 
		return "mypage/userModify.page";
	}
	
	// 회원정보수정
	@RequestMapping(value ="/userModify", method = RequestMethod.POST)
	public String userModify(@ModelAttribute("member") MemberVO update, Model model) throws Exception {
		service.updatePw(update);
		model.addAttribute("uptMsg", "비밀번호 변경 성공");
		return "mypage/userModify.page";
	}
	
	// 예약내역조회
	@RequestMapping(value = "/reservations", method = RequestMethod.GET)
	public String reservations(@ModelAttribute("member") MemberVO reserve,
							   Model model) throws Exception {
		String userId = "";
		if(reserve.getUserId() != null ) {
			userId = reserve.getUserId();
			model.addAttribute( "reservations", service.reserveInfo(userId) );
		} else {
			model.addAttribute( "reservations", "실패" );
		}
		
		return "mypage/reservations.page";
	}
	
	// 예약상세조회
	@RequestMapping(value = "/reserveDetail", method = RequestMethod.GET)
	public String reserveDetail(@RequestParam(value = "orderno") int order_no, Model model) throws Exception {
		model.addAttribute("detail", service.reserveDetail(order_no));
		model.addAttribute("orderno", order_no);
		return "mypage/reservationDetail.page";
	}
	
	// 예약취소
	@RequestMapping(value = "/reserveCancel", method = RequestMethod.GET)
	public String reserveCancel(@RequestParam(value = "orderno") int order_no, Model model) throws Exception {
		service.reserveCancel(order_no);
		model.addAttribute("cancelMsg", "예약 취소가 완료되었습니다.");
		return "redirect:/mypage/reservations";
	}
	
	// 장바구니 
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(@ModelAttribute("member") MemberVO cart,
						Model model) throws Exception {
		String userId = "";
		if(cart.getUserId() != null ) {
			userId = cart.getUserId();
			model.addAttribute("cartList", service.getCart(userId) );
		} else {
			model.addAttribute("cartList", "실패" );
		}
		
		return "mypage/cart.page";
	}
	
}
