package com.city.watch.entity;

import java.sql.Timestamp;

public class Rating {
	
     private int rid;
     private int stars;
     private String feedback;
     private Timestamp date;
     private int pid;
     private int uid;
     
	public Rating() {
		super();
	
	}
	public Rating(int rid, int stars, String feedback, Timestamp date, int pid, int uid) {
		super();
		this.rid = rid;
		this.stars = stars;
		this.feedback = feedback;
		this.date = date;
		this.pid = pid;
		this.uid = uid;
	}
	public Rating(int stars, String feedback, Timestamp date, int pid, int uid) {
		super();
		this.stars = stars;
		this.feedback = feedback;
		this.date = date;
		this.pid = pid;
		this.uid = uid;
	}
	public Rating(int stars, String feedback, int pid, int uid) {
		super();
		this.stars = stars;
		this.feedback = feedback;
		this.pid = pid;
		this.uid = uid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
     
     
     
}
