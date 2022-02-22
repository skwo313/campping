package com.ssangyong.camping.vo;
//com.ssangyong.camping.vo.object_VO
import java.util.Date;

public class ObjectVO {
	private String camping_name;
	private int camping_price;
	private Date camping_reg_date;
	private String camping_image;
	private String camping_image_detail;
	public ObjectVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ObjectVO(String camping_name, int camping_price, Date camping_reg_date, String camping_image,
			String camping_image_detail) {
		super();
		this.camping_name = camping_name;
		this.camping_price = camping_price;
		this.camping_reg_date = camping_reg_date;
		this.camping_image = camping_image;
		this.camping_image_detail = camping_image_detail;
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
	public Date getCamping_reg_date() {
		return camping_reg_date;
	}
	public void setCamping_reg_date(Date camping_reg_date) {
		this.camping_reg_date = camping_reg_date;
	}
	public String getCamping_image() {
		return camping_image;
	}
	public void setCamping_image(String camping_image) {
		this.camping_image = camping_image;
	}
	public String getCamping_image_detail() {
		return camping_image_detail;
	}
	public void setCamping_image_detail(String camping_image_detail) {
		this.camping_image_detail = camping_image_detail;
	}
	
}
