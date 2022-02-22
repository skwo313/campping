package com.ssangyong.camping.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssangyong.camping.service.ObjectService;
import com.ssangyong.camping.vo.MemberVO;
import com.ssangyong.camping.vo.ObjectCartVO;
import com.ssangyong.camping.vo.ObjectVO;
import com.ssangyong.camping.vo.PagingVO;

@Controller
public class ObjectController {
	
	@Autowired
	private ObjectService service;
	
	@GetMapping("/object")
	public String object(HttpServletRequest request, @Param("sort") String sort, @RequestParam(value="keyword", defaultValue="") String keyword, PagingVO paging, @RequestParam(value="nowPage", defaultValue="1") String nowPage, Model d) throws Exception {
		int total = service.searchCnt(keyword);
		
		paging = new PagingVO(total, Integer.parseInt(nowPage));
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("CAMPING_NAME", keyword);
		map.put("start", paging.getStart());
		map.put("end", paging.getEnd());
		d.addAttribute("paging", paging);
		
		if(sort==null) {
			d.addAttribute("objlist", service.objectList(map));
		}
		if("Min".equals(sort)) {
			d.addAttribute("objlist", service.objectListMin(map));
		} else if("Max".equals(sort)) {
			d.addAttribute("objlist", service.objectListMax(map));
		} else if("Newest".equals(sort)){
			d.addAttribute("objlist", service.objectListNew(map));
		}
		d.addAttribute("sort", sort);
		d.addAttribute("keyword", keyword);
		d.addAttribute("searchCnt", service.searchCnt(keyword));
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String id = "";
		if(member!=null) {
			id = member.getUserId();
		}
		d.addAttribute("cartCnt", service.objectCartCnt(id));
		
		Cookie[] cookies = request.getCookies();
		List<ObjectVO> objects = new ArrayList<ObjectVO>();
		if(cookies != null) {
			for(int i=cookies.length-1; i>=cookies.length-6; i--) {
				if(i>=0) {
					if(URLDecoder.decode(cookies[i].getName(), "UTF-8").contains("pname")) {
						String name = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
						objects.add(service.objectDetail(name));
					}
				}
			}
			d.addAttribute("objects",objects);
		}
		return "object.page";
	}
	
	@GetMapping("/object/detail")
	public String detailFrm(HttpServletResponse response, HttpServletRequest request, @Param("name") String name, Model d) throws Exception {
		d.addAttribute("obj", service.objectDetail(name));
		String nameE = URLEncoder.encode(name,"UTF-8");
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("pname_"+nameE)) {
					Cookie cookieD = new Cookie("pname_"+nameE, null);
					cookieD.setMaxAge(0);
					response.addCookie(cookieD);
				}
			}
		}
		Cookie cookie = new Cookie("pname_"+nameE, nameE);
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		List<ObjectVO> objects = new ArrayList<ObjectVO>();
		if(cookies != null) {
			for(int i=cookies.length-1; i>=cookies.length-6; i--) {
				if(i>=0) {
					if(URLDecoder.decode(cookies[i].getName(), "UTF-8").contains("pname")) {
						String nameD = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
						objects.add(service.objectDetail(nameD));
					}
				}
			}
			d.addAttribute("objects",objects);
		}
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String id = "";
		if(member!=null) {
			id = member.getUserId();
		}
		d.addAttribute("cartCnt", service.objectCartCnt(id));
		
		return "objectDetail.page";
	}
	
	@PostMapping("/object/detail")
	@ResponseBody
	public boolean detail(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String id = member.getUserId();			
		String name = request.getParameter("camping_object_name");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("user_id", id);
		map.put("camping_object_name", name);
		
		int ck = service.objectCartCk(map);
		if(ck==1) {
			System.out.println("ck : " + ck);
			return false;
		}
	
		String image = request.getParameter("camping_object_image");
		String price = request.getParameter("camping_object_price");
		String priceTot = request.getParameter("camping_object_tot_price");
		
		ObjectCartVO objectcart = new ObjectCartVO(id, name, image, Integer.parseInt(price), Integer.parseInt(priceTot));
		service.objectCartIns(objectcart);
		
		return true;
	}
	
		@PostMapping("/loginCk")
		@ResponseBody
		public boolean loginCk(HttpServletRequest request, MemberVO member) {
			HttpSession session = request.getSession();
			member = (MemberVO) session.getAttribute("member");
			if(member!=null) {
				return true;
			}
			return false;
		}
}
