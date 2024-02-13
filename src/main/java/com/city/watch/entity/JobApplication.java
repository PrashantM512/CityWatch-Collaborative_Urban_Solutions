package com.city.watch.entity;

import java.sql.Timestamp;

public class JobApplication {
	private int applicationId;
    private int recruitmentId;
    private int userId;
    private Timestamp applicationDate;
    
	public JobApplication() {
		super();
	}
	public JobApplication(int applicationId, int recruitmentId, int userId, Timestamp applicationDate) {
		super();
		this.applicationId = applicationId;
		this.recruitmentId = recruitmentId;
		this.userId = userId;
		this.applicationDate = applicationDate;
	}
	public JobApplication(int recruitmentId, int userId) {
		super();
		this.recruitmentId = recruitmentId;
		this.userId = userId;
	}
	public int getApplicationId() {
		return applicationId;
	}
	public void setApplicationId(int applicationId) {
		this.applicationId = applicationId;
	}
	public int getRecruitmentId() {
		return recruitmentId;
	}
	public void setRecruitmentId(int recruitmentId) {
		this.recruitmentId = recruitmentId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Timestamp getApplicationDate() {
		return applicationDate;
	}
	public void setApplicationDate(Timestamp applicationDate) {
		this.applicationDate = applicationDate;
	}
    
    
}
