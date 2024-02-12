<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.UserDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="components/header_links.jsp"%>
    <title>Pay Taxes</title>
</head>
<style>
.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #ffffff;
    background-color: #409730;
}
</style>
<body>
    <%@include file="components/check_session.jsp"%>
    <%@include file="components/navbar.jsp"%>

    <div class="conatiner" style="text-align: -webkit-center;">
        <p class="text-center pgeheading">PAY YOUR TAXES</p>
        <div class="col-sm-8 col-xl-10 text-left">
            <div class="rounded h-100 p-4">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <button class="nav-link active" id="nav-home-tab"
                            data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
                            role="tab" aria-controls="nav-home" aria-selected="true">Home
                            Tax</button>
                        <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-profile" type="button" role="tab"
                            aria-controls="nav-profile" aria-selected="false">Water
                            Tax</button>
                    </div>
                </nav>
                <div class="tab-content pt-3" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home"
                        style="text-align: -webkit-center;" role="tabpanel"
                        aria-labelledby="nav-home-tab">

                        <div class="col-md-8" style="text-align: left;">
                            <div class="card mt-2 h-100" style="border: none;">
                                <div class="card-body">
                                    <h3 class="text-center text-success"></h3>
                                    <form id="paymentForm" action="PaymentServlet" method="post">
                                       <input type="hidden" value="<%=user.getUid() %>" name="uid">
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputEmail4">Name</label> <input type="text"
													name="name" value="<%=user.getName()%>"
													class="form-control" id="inputEmail4"
													placeholder="Full Name" required>
											</div>
											<div class="form-group col-md-6">
												<label for="inputPassword4">Email</label> <input
													value="<%=user.getEmail()%>" name="email" type="email"
													class="form-control" id="inputPassword4"
													placeholder="Email" readonly required>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-12">
												<label for="inputEmail4">Property Tax Account Number
													(PTAN)</label> <input type="number" name="ptan"
													value="<%=user.getProperty_id()%>" class="form-control"
													id="inputEmail4" placeholder="property id" required readonly><small
													id="passwordHelpBlock" class="form-text text-muted">You
													can update your PTA number from settings</small>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-12">
												<label for="inputEmail4">Property address</label> <input
													type="text" name="address" class="form-control" id="inputEmail4"
													placeholder="address" required>
											</div>
										</div>

										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="inputEmail4">Mobile no.</label> <input
													type="number" name="mobile" value="<%=user.getMobile()%>"
													class="form-control" id="inputEmail4" placeholder="Mobile"
													required readonly>
											</div>
											<div class="form-group col-md-3">
												<label for="inputPassword4">Aadhar No</label> <input
													type="text" name="aadhar" class="form-control"
													id="inputPassword4" placeholder="Aadhar number"
													value="<%=user.getAadhar()%>" readonly required>
											</div>
											<div class="form-group col-md-3">
												<label for="inputPassword4">Pan Card No</label> <input
													type="text" name="pan" class="form-control"
													id="inputPassword4" placeholder="Pan number" required>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-12">
												<label for="inputEmail4">Amount</label> <input type="number"
													name="amount" class="form-control"
													id="inputEmail4" placeholder="Amount" required>
											</div>
										</div>
										<div class="form-group">
											<label for="inputState">Property Type</label> <select
												id="inputState" name="ptype" class="form-control" required>
												<option value="" selected disabled>--Select--</option>
												<option value="Resident">Resident</option>
												<option value="Non-Resident">Non-Resident</option>
												<option value="Open Plot">Open Plot</option>
												<option value="Mix">Mix</option>
											</select>
										</div>
										<div class="form-row">
											<div class="form-group col-md-7">
												<button id="submitFormButton" style="width: inherit;" type="submit"
													class="btn btn-success">Proceed To Pay</button>
											</div>
											<div class="form-group col-md-5">
												<a href="index.jsp" style="width: inherit;" type="submit"
													class="btn btn-warning">Cancel</a>
											</div>
										</div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
    document.getElementById('paymentForm').addEventListener('submit', function(event) {
        event.preventDefault();
        var form = this;
        var formData = new FormData(form);
        var xhrDatabase = new XMLHttpRequest();
        xhrDatabase.open('POST', form.action, true);
        xhrDatabase.onload = function() {
            if (xhrDatabase.status === 200) {
                console.log('Form data stored successfully in the database');
                
            } else {
                console.error('Database storage failed:', xhrDatabase.statusText);
                submitPaymentGateway(formData);
            }
        };
        xhrDatabase.onerror = function() {
            console.error('Database storage request failed');
        };
        xhrDatabase.send(new URLSearchParams(formData)); 
        function submitPaymentGateway(formData) {
            var xhrPaymentGateway = new XMLHttpRequest();
            xhrPaymentGateway.open('POST', form.action, true);
            xhrPaymentGateway.onload = function() {
                if (xhrPaymentGateway.status === 200) {
                    var options = {
                    		 "key": "rzp_test_f3AsciOhTsBdEO",
                             "amount": formData.get('amount') * 100,
                             "currency": "INR",
                             "name": "City Watch",
                             "description": "Property Tax Payment",
                             "image": "img/cityscape.png",
                             "handler": function (response){
                                 alert(response.razorpay_payment_id);
                                 alert(response.razorpay_order_id);
                                 alert(response.razorpay_signature)
                             },
                             "prefill": {
                                 "name": formData.get('name'),
                                 "email": formData.get('email'),
                                 "contact": formData.get('mobile')
                             },
                             "notes": {
                                 "address": formData.get('address')
                             },
                             "theme": {
                                 "color": "#1938cf"
                             },
                             "handler": function(response) {
                               
                                 window.location.href = "payment_success.jsp";
                             }
                    };
                    var rzp = new Razorpay(options);
                    rzp.open();
                    
                    rzp.on('payment.error', function(response) {
                        window.location.href = "payment-failed-page.jsp";
                    });
                    
                } else {
                    console.error('Payment gateway submission failed:', xhrPaymentGateway.statusText);
                }
            };
            xhrPaymentGateway.onerror = function() {
                console.error('Payment gateway request failed');
            };
            xhrPaymentGateway.send(formData);
        }
    });
    </script>
    <%@include file="components/footer.jsp"%>
    <%@include file="components/all_js.jsp"%>
</body>
</html>
