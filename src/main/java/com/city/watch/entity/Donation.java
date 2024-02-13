package com.city.watch.entity;

import java.sql.Timestamp;

public class Donation {
    private int id;
    private String name;
    private String email;
    private Double amount;
    private String mobile;
    private String aadhar;
    private int pid;
    private Timestamp date;
    private String orderId;
    private String paymentId;
    private String  receiptId;
    private String status;
    
	public Donation() {
		super();
		
	}

	public Donation(int id, String name, String email, Double amount, String mobile, String aadhar, int pid,
			Timestamp date, String orderId, String paymentId, String receiptId, String status) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.amount = amount;
		this.mobile = mobile;
		this.aadhar = aadhar;
		this.pid = pid;
		this.date = date;
		this.orderId = orderId;
		this.paymentId = paymentId;
		this.receiptId = receiptId;
		this.status = status;
	}

	public Donation(String name, String email, Double amount, String mobile, String aadhar, int pid, Timestamp date,
			String orderId, String paymentId, String receiptId, String status) {
		super();
		this.name = name;
		this.email = email;
		this.amount = amount;
		this.mobile = mobile;
		this.aadhar = aadhar;
		this.pid = pid;
		this.date = date;
		this.orderId = orderId;
		this.paymentId = paymentId;
		this.receiptId = receiptId;
		this.status = status;
	}

	public Donation(String name, String email, Double amount, String mobile, String aadhar, int pid, String orderId,
			String paymentId, String receiptId, String status) {
		super();
		this.name = name;
		this.email = email;
		this.amount = amount;
		this.mobile = mobile;
		this.aadhar = aadhar;
		this.pid = pid;
		this.orderId = orderId;
		this.paymentId = paymentId;
		this.receiptId = receiptId;
		this.status = status;
	}

	public Donation(String name, String email, Double amount, String mobile, String aadhar, int pid, String orderId,
			String receiptId, String status) {
		super();
		this.name = name;
		this.email = email;
		this.amount = amount;
		this.mobile = mobile;
		this.aadhar = aadhar;
		this.pid = pid;
		this.orderId = orderId;
		this.receiptId = receiptId;
		this.status = status;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAadhar() {
		return aadhar;
	}

	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getReceiptId() {
		return receiptId;
	}

	public void setReceiptId(String receiptId) {
		this.receiptId = receiptId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
