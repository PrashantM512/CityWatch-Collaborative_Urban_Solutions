package com.city.watch.entity;

import java.util.Date;

public class Recruitment {
	private long recruitmentId;
    private String jobTitle;
    private String description;
    private String applicationEndDate;
    private Date createdAt;
    
	public Recruitment() {
		super();
	}
	public Recruitment(long recruitmentId, String jobTitle, String description, String applicationEndDate,
			Date createdAt) {
		super();
		this.recruitmentId = recruitmentId;
		this.jobTitle = jobTitle;
		this.description = description;
		this.applicationEndDate = applicationEndDate;
		this.createdAt = createdAt;
	}
	public Recruitment(String jobTitle, String description, String applicationEndDate) {
		super();
		this.jobTitle = jobTitle;
		this.description = description;
		this.applicationEndDate = applicationEndDate;
	}
	public long getRecruitmentId() {
		return recruitmentId;
	}
	public void setRecruitmentId(long recruitmentId) {
		this.recruitmentId = recruitmentId;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getApplicationEndDate() {
		return applicationEndDate;
	}
	public void setApplicationEndDate(String applicationEndDate) {
		this.applicationEndDate = applicationEndDate;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
    
}
