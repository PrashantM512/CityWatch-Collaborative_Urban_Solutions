package com.city.watch.entity;

public class TransactionDetails {
     
    private Long id;
    private String userId;
    private String mobile;
    private String email;
    private String propertyTaxId;
    private String propertyType;
    private String orderId;
    private double amount;
    private String paymentId;
    private String receiptId;
    private String status;
    
	public TransactionDetails() {
		super();
	}
	public TransactionDetails(Long id, String userId, String mobile, String email, String propertyTaxId,
			String propertyType, String orderId, double amount, String paymentId, String receiptId, String status) {
		super();
		this.id = id;
		this.userId = userId;
		this.mobile = mobile;
		this.email = email;
		this.propertyTaxId = propertyTaxId;
		this.propertyType = propertyType;
		this.orderId = orderId;
		this.amount = amount;
		this.paymentId = paymentId;
		this.receiptId = receiptId;
		this.status = status;
	}
	public TransactionDetails(String userId, String mobile, String email, String propertyTaxId, String propertyType,
			String orderId, double amount, String paymentId, String receiptId, String status) {
		super();
		this.userId = userId;
		this.mobile = mobile;
		this.email = email;
		this.propertyTaxId = propertyTaxId;
		this.propertyType = propertyType;
		this.orderId = orderId;
		this.amount = amount;
		this.paymentId = paymentId;
		this.receiptId = receiptId;
		this.status = status;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPropertyTaxId() {
		return propertyTaxId;
	}
	public void setPropertyTaxId(String propertyTaxId) {
		this.propertyTaxId = propertyTaxId;
	}
	public String getPropertyType() {
		return propertyType;
	}
	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
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
