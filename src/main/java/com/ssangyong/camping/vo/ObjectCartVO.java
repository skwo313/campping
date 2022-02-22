package com.ssangyong.camping.vo;

public class ObjectCartVO {
	private String user_id;
	private String camping_object_name;
	private String camping_object_image;
	private int camping_object_price;
	private int camping_object_tot_price;
	public ObjectCartVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ObjectCartVO(String user_id, String camping_object_name, String camping_object_image,
			int camping_object_price, int camping_object_tot_price) {
		super();
		this.user_id = user_id;
		this.camping_object_name = camping_object_name;
		this.camping_object_image = camping_object_image;
		this.camping_object_price = camping_object_price;
		this.camping_object_tot_price = camping_object_tot_price;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCamping_object_name() {
		return camping_object_name;
	}
	public void setCamping_object_name(String camping_object_name) {
		this.camping_object_name = camping_object_name;
	}
	public String getCamping_object_image() {
		return camping_object_image;
	}
	public void setCamping_object_image(String camping_object_image) {
		this.camping_object_image = camping_object_image;
	}
	public int getCamping_object_price() {
		return camping_object_price;
	}
	public void setCamping_object_price(int camping_object_price) {
		this.camping_object_price = camping_object_price;
	}
	public int getCamping_object_tot_price() {
		return camping_object_tot_price;
	}
	public void setCamping_object_tot_price(int camping_object_tot_price) {
		this.camping_object_tot_price = camping_object_tot_price;
	}
	
}