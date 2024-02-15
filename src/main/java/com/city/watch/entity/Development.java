package com.city.watch.entity;

public class Development {
    private int pid;
    private String title;
    private String description;
    private String location;
    private String sDate;
    private String eDate;
    private String status;
    private String need;
    private String photo;
    private int donationCount;
    
	public Development() {
		super();
	}
	public Development(int pid, String title, String description, String location, String sDate, String eDate,
			String status, String need, String photo) {
		super();
		this.pid = pid;
		this.title = title;
		this.description = description;
		this.location = location;
		this.sDate = sDate;
		this.eDate = eDate;
		this.status = status;
		this.need = need;
		this.photo = photo;
	}
	public Development(String title, String description, String location, String sDate, String eDate, String status,
			String need, String photo) {
		super();
		this.title = title;
		this.description = description;
		this.location = location;
		this.sDate = sDate;
		this.eDate = eDate;
		this.status = status;
		this.need = need;
		this.photo = photo;
	}
	
	public Development(int pid, String title, String description, String location, String sDate, String eDate,
			String status, String need, String photo, int donationCount) {
		super();
		this.pid = pid;
		this.title = title;
		this.description = description;
		this.location = location;
		this.sDate = sDate;
		this.eDate = eDate;
		this.status = status;
		this.need = need;
		this.photo = photo;
		this.donationCount = donationCount;
	}
	
	public Development(String title, String description, String location, String sDate, String eDate, String status,
			String need) {
		super();
		this.title = title;
		this.description = description;
		this.location = location;
		this.sDate = sDate;
		this.eDate = eDate;
		this.status = status;
		this.need = need;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNeed() {
		return need;
	}
	public void setNeed(String need) {
		this.need = need;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getDonationCount() {
		return donationCount;
	}

	public void setDonationCount(int donationCount) {
		this.donationCount = donationCount;
	}
    
}
