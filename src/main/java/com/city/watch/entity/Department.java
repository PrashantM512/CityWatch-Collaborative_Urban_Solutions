package com.city.watch.entity;

public class Department {
       private int id;
       private String dept_id;
       private String password;
       private String state;
       private String dist;
       private String taluka;
       
	public Department() {
		super();
		
	}
	public Department(int id, String dept_id, String password, String state, String dist, String taluka) {
		super();
		this.id = id;
		this.dept_id = dept_id;
		this.password = password;
		this.state = state;
		this.dist = dist;
		this.taluka = taluka;
	}
	public Department(String dept_id, String password, String state, String dist, String taluka) {
		super();
		this.dept_id = dept_id;
		this.password = password;
		this.state = state;
		this.dist = dist;
		this.taluka = taluka;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDist() {
		return dist;
	}
	public void setDist(String dist) {
		this.dist = dist;
	}
	public String getTaluka() {
		return taluka;
	}
	public void setTaluka(String taluka) {
		this.taluka = taluka;
	}
       
       
}
