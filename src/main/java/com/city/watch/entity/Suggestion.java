package com.city.watch.entity;

import java.sql.Timestamp;

public class Suggestion {
       private int id;
       private int uid;
       private String title;
       private String description;
       private Timestamp date;
       private int age;
       private String education;
       
	public Suggestion() {
		super();
	}
	public Suggestion(int id, int uid, String title, String description, Timestamp date, int age, String education) {
		super();
		this.id = id;
		this.uid = uid;
		this.title = title;
		this.description = description;
		this.date = date;
		this.age = age;
		this.education = education;
	}
	public Suggestion(int uid, String title, String description, Timestamp date, int age, String education) {
		super();
		this.uid = uid;
		this.title = title;
		this.description = description;
		this.date = date;
		this.age = age;
		this.education = education;
	}
	public Suggestion(int uid, String title, String description, int age, String education) {
		super();
		this.uid = uid;
		this.title = title;
		this.description = description;
		this.age = age;
		this.education = education;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
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
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
       
       
       
}
