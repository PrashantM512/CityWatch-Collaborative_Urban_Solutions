package com.city.watch.entity;

public class Pins {
       private int id;
       private String name;
       private String category;
       private String location;
       private String link;
       
	public Pins() {
		super();
		
	}
	public Pins(int id, String name, String category, String location, String link) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.location = location;
		this.link = link;
	}

	public Pins(String name, String category, String location, String link) {
		super();
		this.name = name;
		this.category = category;
		this.location = location;
		this.link = link;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
       
}
