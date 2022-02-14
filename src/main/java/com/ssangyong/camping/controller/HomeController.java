package com.ssangyong.camping.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssangyong.camping.service.MainService;

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
	public String home(Model model) throws Exception{
		logger.info("list");
		
		model.addAttribute("list",service.list());
		return "home.page";
	}
	
	/* 검색창 검색 */
	@PostMapping("/search")
	public String upload(@RequestParam("search") String search,
						 Model d
			            ) {
		System.out.println("내용:"+search);
		
		return "home.page";
	}
	
	/* select 검색 */

	
	
	
	
	
	
	
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
