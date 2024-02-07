package com.city.watch.entity;

public class User {
       private int uid;
       private String name;
       private String email;
       private String mobile;
       private String gender;
       private String address;
       private String aadhar;
       private String zone;
       private String password;
       private String usertype;
       private String house_id;
       private String ward_no;
       private String property_id;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int uid, String name, String email, String mobile, String gender, String address, String aadhar,
			String zone, String password, String usertype, String house_id, String ward_no, String property_id) {
		super();
		this.uid = uid;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.address = address;
		this.aadhar = aadhar;
		this.zone = zone;
		this.password = password;
		this.usertype = usertype;
		this.house_id = house_id;
		this.ward_no = ward_no;
		this.property_id = property_id;
	}
	public User(String name, String email, String mobile, String gender, String address, String aadhar, String zone,
			String password, String usertype, String house_id, String ward_no, String property_id) {
		super();
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.address = address;
		this.aadhar = aadhar;
		this.zone = zone;
		this.password = password;
		this.usertype = usertype;
		this.house_id = house_id;
		this.ward_no = ward_no;
		this.property_id = property_id;
	}
	public User(String name, String email, String mobile, String gender, String aadhar, String zone, String password) {
		super();
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.aadhar = aadhar;
		this.zone = zone;
		this.password = password;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAadhar() {
		return aadhar;
	}
	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getHouse_id() {
		return house_id;
	}
	public void setHouse_id(String house_id) {
		this.house_id = house_id;
	}
	public String getWard_no() {
		return ward_no;
	}
	public void setWard_no(String ward_no) {
		this.ward_no = ward_no;
	}
	public String getProperty_id() {
		return property_id;
	}
	public void setProperty_id(String property_id) {
		this.property_id = property_id;
	}
       
       
}
