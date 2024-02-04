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
									<th scope="col" style="padding-left: 25px;">Total Amount</th>
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
						<form action="" method="post">
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputEmail4">Name</label> <input type="text"
										name="username" value="" class="form-control"
										id="inputEmail4" placeholder="Full Name">
								</div>
								</div>
								<div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputPassword4">Email</label> <input
										value="" name="email" type="email"
										class="form-control" id="inputPassword4" placeholder="Email">
								</div>
							</div>
                          <div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputEmail4">Amount</label> <input
										type="number" name="mobile" value=""
										class="form-control" id="inputEmail4" placeholder="Amount"
										required>
								</div>
								</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile no.</label> <input
										type="number" name="mobile" value=""
										class="form-control" id="inputEmail4" placeholder="Mobile"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Aadhar No</label> <input type="text"
										name="address" class="form-control" id="inputPassword4"
										placeholder="Aadhar number" required>
								</div>
							</div>

							

							<div class="form-group">
								<label for="inputState">Donate For</label> <select
									id="inputState" name="payment" class="form-control">
									<option selected>--Select--</option>
									<option value="">Project1 1</option>
									<option value="">Project1 1</option>
									<option value="">Project1 1</option>
									<option value="">Project1 1</option>
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
  

	<div style="height: 100px"></div>
	
<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>