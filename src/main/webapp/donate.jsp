<%@page import="com.city.watch.entity.Development"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.DevelopmentDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title>Donate</title>
</head>
<body>
     <%@include file="components/check_session.jsp" %>
	<%@include file="components/navbar.jsp"%>
         
<p class="text-center pgeheading">DONATE US</p>

<div class="container">
		<div class="row">

			<div class="col-md-6">
				<div class="card mt-2 h-100" style=" box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
					<div class="card-body">
						<h3 class="text-center text-success">Donate For Good</h3>
						<div class="cart-table-container"
							style="max-height: 400px; overflow-y: auto;">
							<p style=" margin-top: 3px; ">Welcome to our donation platform! Your contribution plays a crucial role in the development and enhancement of our city/village municipal corporation. By donating, you become an integral part of our mission to build a better community and ensure a brighter future for generations to come.

Your generous donations enable us to undertake various initiatives aimed at improving infrastructure, promoting education, enhancing healthcare facilities, and fostering overall development. Whether it's upgrading public facilities, implementing sustainable solutions, or supporting welfare programs, every contribution counts and makes a tangible difference in the lives of our residents.

Together, we can create a more vibrant, inclusive, and sustainable city/village. Join us in our journey towards progress and prosperity. Your support is invaluable, and we deeply appreciate your commitment to making our municipality a better place for all.</p>
						</div>
						<table
							style="margin-top: 45px; font-size: larger; min-width: -webkit-fill-available;">
							<thead class="thead-dark">
								<tr style="background-color: #cfcfcf; height: 40px">
									<th scope="col" style="padding-left: 25px;">Total Donation Till Now</th>
									<th style="text-align: center;" scope="col"> Rs. 10,000</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card mt-2 h-100" style=" box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
					<div class="card-body">
						<h3 class="text-center text-success">Address and Details</h3>
						<form action="DonateServlet" id="donateform" method="post">
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputEmail4">Name</label> <input type="text"
										name="name" value="<%=user.getName() %>" class="form-control"
										id="inputEmail4" placeholder="Full Name" required readonly>
								</div>
								</div>
								<div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputPassword4">Email</label> <input
										value="<%=user.getEmail() %>" name="email" type="email"
										class="form-control" id="inputPassword4" placeholder="Email" readonly required>
								</div>
							</div>
                          <div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputEmail4">Amount</label> <input
										type="number" name="amount" value=""
										class="form-control" id="inputEmail4" placeholder="Amount"
										required>
								</div>
								</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile no.</label> <input
										type="number" name="mobile" value="<%=user.getMobile() %>"
										class="form-control" id="inputEmail4" placeholder="Mobile"
										required readonly>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Aadhar No</label> <input type="text"
										name="aadhar" class="form-control" id="inputPassword4"
										placeholder="Aadhar number" value="<%=user.getAadhar() %>" readonly required>
								</div>
							</div>
							<div class="form-group">
								<label for="inputState">Project You want to donate</label> <select
									id="inputState" name="pid" class="form-control" required>
									<option value="" selected>--Select--</option>
									<%
									DevelopmentDaoImpl dao=new DevelopmentDaoImpl(ConnectionProvider.getConnection());
								    List<Development> list=dao.getAlldevelopments();
									for(Development d:list ){
										if (!d.getStatus().equals("Completed")){
										%>
									<option value="<%=d.getPid()%>"><%=d.getTitle() %> (<%=d.getStatus() %>)</option>
									 <%
										}
									}
									%>
								</select>
							</div>
							<input name="bookname" value="" type="hidden">
							<input name="price" value="" type="hidden">
							<div class="form-row">
								<div class="form-group col-md-6">
									
									<button style="width: inherit;" type="submit"
										class="btn btn-success">Donate Now</button>
									
								</div>
								<div class="form-group col-md-6">
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
  
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
    var paymentId = null;
    document.getElementById('donateform').addEventListener('submit', function(event) {
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
                initiateRazorpay(formData);
            }
        };
        xhrDatabase.onerror = function() {
            console.error('Database storage request failed');
        };
        xhrDatabase.send(new URLSearchParams(formData));
    });

    function initiateRazorpay(formData) {
        var options = {
            "key": "rzp_test_f3AsciOhTsBdEO",
            "amount": formData.get('amount') * 100,
            "currency": "INR",
            "name": "City Watch",
            "description": "Donation",
            "image": "img/cityscape.png",
            "handler": function(response) {
                var paymentId = response.razorpay_payment_id;
                window.location.href = "payment_success.jsp";
                updateDatabase(paymentId);
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
            }
        };
        var rzp = new Razorpay(options);
        rzp.open();
        
        rzp.on('payment.success', function(response) {
            var paymentId = response.razorpay_payment_id;
            window.location.href = "payment_success.jsp";
            updateDatabase(paymentId);
        });
        
        rzp.on('payment.error', function(response) {
            window.location.href = "payment-failed-page.jsp";
        });
    }

    function updateDatabase(paymentId) {
        var xhrUpdateDatabase = new XMLHttpRequest();
        xhrUpdateDatabase.open('POST', 'UpdateDonationDetailsServlet', true); 
        xhrUpdateDatabase.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        var params = 'paymentId=' + encodeURIComponent(paymentId) + '&status=Success';

        xhrUpdateDatabase.onload = function() {
            if (xhrUpdateDatabase.status === 200) {
                console.log('Database updated successfully');
            } else {
                console.error('Database update failed:', xhrUpdateDatabase.statusText);
            }
        };
        xhrUpdateDatabase.onerror = function() {
            console.error('Database update request failed');
        };
        xhrUpdateDatabase.send(params);
    }

</script>
<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>