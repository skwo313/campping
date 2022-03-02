package com.ssangyong.camping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssangyong.camping.service.MemberService;
import com.ssangyong.camping.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginform() throws Exception {
		logger.info("loginform");
		return "loginform.page";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, Model d) throws Exception {
		logger.info("login");

		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);

		if (login == null) {
			session.setAttribute("member", null);
			d.addAttribute("result", "fail");
			return "loginform.page";
		} else {
			session.setAttribute("member", login);
			return "redirect:/";
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		logger.info("Registform");
		return "registform.page";
	}

	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo, RedirectAttributes ra) throws Exception {
		logger.info("Regist");
		int result = service.idChk(vo);
		if(result == 1) {
			ra.addFlashAttribute("result", "N");
			return "/member/register";
		} else if(result == 0) {
			service.register(vo);
			ra.addFlashAttribute("result", "Y");
		}
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	@ResponseBody
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		System.out.println("결과"+result);
		return result;
	}
	
}
