package com.ssangyong.camping.vo;

public class ReservationsVO {
	private int order_no;
	private String userId;
	private String camping_order_name;
	private String camping_order_image;
	private int camping_order_resultprice;
	private String camping_order_startdate;
	private String camping_order_enddate;
	private String userName;
	private String userPhone;
	
	public ReservationsVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationsVO(int order_no, String userId, String camping_order_name, String camping_order_image,
			int camping_order_resultprice, String camping_order_startdate, String camping_order_enddate) {
		super();
		this.order_no = order_no;
		this.userId = userId;
		this.camping_order_name = camping_order_name;
		this.camping_order_image = camping_order_image;
		this.camping_order_resultprice = camping_order_resultprice;
		this.camping_order_startdate = camping_order_startdate;
		this.camping_order_enddate = camping_order_enddate;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCamping_order_name() {
		return camping_order_name;
	}
	public void setCamping_order_name(String camping_order_name) {
		this.camping_order_name = camping_order_name;
	}
	public String getCamping_order_image() {
		return camping_order_image;
	}
	public void setCamping_order_image(String camping_order_image) {
		this.camping_order_image = camping_order_image;
	}
	public int getCamping_order_resultprice() {
		return camping_order_resultprice;
	}
	public void setCamping_order_resultprice(int camping_order_resultprice) {
		this.camping_order_resultprice = camping_order_resultprice;
	}
	public String getCamping_order_startdate() {
		return camping_order_startdate;
	}
	public void setCamping_order_startdate(String camping_order_startdate) {
		this.camping_order_startdate = camping_order_startdate;
	}
	public String getCamping_order_enddate() {
		return camping_order_enddate;
	}
	public void setCamping_order_enddate(String camping_order_enddate) {
		this.camping_order_enddate = camping_order_enddate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
}
