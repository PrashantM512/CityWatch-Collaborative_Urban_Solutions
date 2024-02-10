package com.city.watch.entity;

import java.sql.Timestamp;

public class Notification {
    private int id;
    private String title;
    private String description;
    private  String frm;
    private Timestamp date;
    private String target;
    
	public Notification() {
		super();
	}

	public Notification(int id, String title, String description, String frm, Timestamp date, String target) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.frm = frm;
		this.date = date;
		this.target = target;
	}

	public Notification(String title, String description, String frm, Timestamp date, String target) {
		super();
		this.title = title;
		this.description = description;
		this.frm = frm;
		this.date = date;
		this.target = target;
	}

	public Notification(String title, String description, String frm, String target) {
		super();
		this.title = title;
		this.description = description;
		this.frm = frm;
		this.target = target;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFrm() {
		return frm;
	}

	public void setFrm(String frm) {
		this.frm = frm;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}
    
    
} 
