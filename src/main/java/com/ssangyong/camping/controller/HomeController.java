package com.ssangyong.camping.controller;

import java.util.HashMap;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssangyong.camping.service.MainService;
import com.ssangyong.camping.vo.CampingOrderVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	MainService service;
	
	/* 메인화면 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
						@RequestParam(value="select", required=false, defaultValue="") String select,
						Model model) throws Exception{
		logger.info("Home");
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("select",select);
		hashMap.put("keyword",keyword);

		model.addAttribute("list",service.list(hashMap));
		return "home.page";
	}
	/* 검색창 검색 */
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String Search(@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
						@RequestParam(value="select", required=false, defaultValue="") String select,
						Model model) throws Exception{
		logger.info("Search");
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("keyword",keyword);
		hashMap.put("select",select);

		model.addAttribute("list",service.list(hashMap));
		return "home.page";
	}
	/* 캠핑장 예약 */
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String Order(CampingOrderVO orderVO, Model d) throws Exception{
		logger.info("Order");
		/*
		 * HttpSession session = req.getSession(); MemberVO vo =
		 * (MemberVO)session.getAttribute("member"); System.out.println(vo.getUserId());
		 */
		service.order(orderVO);
		return "redirect:/";
	}
	
/*--------------------------------------------------------------*/
	/**
     * Tiles를 사용하지 않은 일반적인 형태
     */    
    @RequestMapping("/test.do")
    public String test() {
        return "test";
    }    
    
    /**
     * Tiles를 사용(header, left, footer 포함)
     */        
    @RequestMapping("/testPage.do")
    public String testPage() {
        return "test.page";
    }
/*--------------------------------------------------------------*/
}
