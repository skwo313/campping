package com.ssangyong.camping.vo;

public class CampingInfoVO {
	private int camping_no;
	private String camping_name;
	private int camping_price;
	private String camping_image;
	private String camping_des;
	private String camping_loc;
	private String camping_locationx;
	private String camping_locationy;
	public CampingInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CampingInfoVO(int camping_no, String camping_name, int camping_price, String camping_image,
			String camping_des, String camping_loc, String camping_locationx, String camping_locationy) {
		super();
		this.camping_no = camping_no;
		this.camping_name = camping_name;
		this.camping_price = camping_price;
		this.camping_image = camping_image;
		this.camping_des = camping_des;
		this.camping_loc = camping_loc;
		this.camping_locationx = camping_locationx;
		this.camping_locationy = camping_locationy;
	}
	public int getCamping_no() {
		return camping_no;
	}
	public void setCamping_no(int camping_no) {
		this.camping_no = camping_no;
	}
	public String getCamping_name() {
		return camping_name;
	}
	public void setCamping_name(String camping_name) {
		this.camping_name = camping_name;
	}
	public int getCamping_price() {
		return camping_price;
	}
	public void setCamping_price(int camping_price) {
		this.camping_price = camping_price;
	}
	public String getCamping_image() {
		return camping_image;
	}
	public void setCamping_image(String camping_image) {
		this.camping_image = camping_image;
	}
	public String getCamping_des() {
		return camping_des;
	}
	public void setCamping_des(String camping_des) {
		this.camping_des = camping_des;
	}
	public String getCamping_loc() {
		return camping_loc;
	}
	public void setCamping_loc(String camping_loc) {
		this.camping_loc = camping_loc;
	}
	public String getCamping_locationx() {
		return camping_locationx;
	}
	public void setCamping_locationx(String camping_locationx) {
		this.camping_locationx = camping_locationx;
	}
	public String getCamping_locationy() {
		return camping_locationy;
	}
	public void setCamping_locationy(String camping_locationy) {
		this.camping_locationy = camping_locationy;
	}
	
}