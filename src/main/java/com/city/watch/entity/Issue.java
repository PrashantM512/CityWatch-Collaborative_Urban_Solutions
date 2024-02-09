package com.city.watch.entity;

import java.sql.Timestamp;

public class Issue {
     
	private int id;
	private String title;
	private String description;
	private String photo;
	private String Type;
	private Timestamp date;
	private String status;
	private int userId;
	
	public Issue() {
		super();	
	}

	public Issue(int id, String title, String description, String photo, String type, Timestamp date, String status,
			int userId) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.photo = photo;
		Type = type;
		this.date = date;
		this.status = status;
		this.userId = userId;
	}

	public Issue(String title, String description, String photo, String type, Timestamp date, String status,
			int userId) {
		super();
		this.title = title;
		this.description = description;
		this.photo = photo;
		Type = type;
		this.date = date;
		this.status = status;
		this.userId = userId;
	}

	public Issue(String title, String description, String photo, String type, int userId) {
		super();
		this.title = title;
		this.description = description;
		this.photo = photo;
		Type = type;
		this.userId = userId;
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
    
	
	
}
