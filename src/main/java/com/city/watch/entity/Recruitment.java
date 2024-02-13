package com.city.watch.entity;

import java.util.Date;

public class Recruitment {
	private long recruitmentId;
    private String jobTitle;
    private String description;
    private String applicationEndDate;
    private Date createdAt;
    private String criteria;
    private String cv_need;
    
	public Recruitment() {
		super();
	}

	public Recruitment(long recruitmentId, String jobTitle, String description, String applicationEndDate,
			Date createdAt, String criteria, String cv_need) {
		super();
		this.recruitmentId = recruitmentId;
		this.jobTitle = jobTitle;
		this.description = description;
		this.applicationEndDate = applicationEndDate;
		this.createdAt = createdAt;
		this.criteria = criteria;
		this.cv_need = cv_need;
	}

	public Recruitment(String jobTitle, String description, String applicationEndDate, String criteria,
			String cv_need) {
		super();
		this.jobTitle = jobTitle;
		this.description = description;
		this.applicationEndDate = applicationEndDate;
		this.criteria = criteria;
		this.cv_need = cv_need;
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

	public String getCriteria() {
		return criteria;
	}

	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}

	public String getCv_need() {
		return cv_need;
	}

	public void setCv_need(String cv_need) {
		this.cv_need = cv_need;
	}
       
}
