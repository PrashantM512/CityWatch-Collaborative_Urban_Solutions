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
<title></title>
</head>
<body>
	<%@include file="components/check_session.jsp"%>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<h3 class="text-center mb-3"
			style="margin-top: -25px; margin-bottom: -13px;">
			<img alt="" src="img\UpdateProfile.png" class="pagetitle"><img
				alt="" class="pagetitle-img" src="img/update.png"
				style="margin-left: -28px;">
		</h3>
		<div class="container-fluid pt-4 px-4">
			<div class="row justify-content-center">
				<div class="col-sm-12 col-xl-6">
					<div class="border rounded h-100 p-4"
						style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">

						<%
						UserDaoImpl dao = new UserDaoImpl(ConnectionProvider.getConnection());
						User usdt = dao.getUserById(user.getUid());
						%>

						<form action="UpdateUserServlet" method="post">
							<div class="form-row">
							    <input value="<%=user.getUid()%>" type="hidden" name="uid">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" value="<%=usdt.getName()%>"
										id="inputPassword4" name="name" placeholder="Name" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" name="email" id="inputEmail4"
										placeholder="Email" value="<%=usdt.getEmail()%>" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="inputAddress">Address</label> <input type="text"
									class="form-control" id="inputAddress" name="address" required
									 value="<%=usdt.getAddress() %>">
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputAddress2">Password</label> <input
										type="password" class="form-control" id="inputAddress2"
										name="password" required> <small id="aadharHelp"
										class="form-text text-muted">Enter correct password to
										update your profile</small>
								</div>
								<div class="form-group col-md-6">
									<div class="mb-3">
										<label for="gender" class="for-gender">Gender</label><br>
										<input type="radio" id="male" name="gender" value="male" required>
										<label for="male">Male</label>&nbsp;&nbsp; <input type="radio"
											id="female" name="gender" value="female" required>
										<label for="female">Female</label>
									</div>

								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="user_name class="form-label">Mobile</label> <input
										name="mobile" type="number" class="form-control"
										value="<%=usdt.getMobile()%>" id="user_name" required
										aria-describedby="" placeholder="mobile" maxlength="10"
										oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);">
								</div>
								<div class="form-group col-md-3">
									<label for="inputZip">Ward No.</label> <input type="text"
										class="form-control" name="wardNo" required
										value="<%=usdt.getWard_no() %>"
										id="inputZip">
								</div>

								<div class="form-group col-md-3">
									<label for="inputZip">Property id</label> <input type="text"
										class="form-control" name="propertyId" required
										value="<%=usdt.getProperty_id() %>"
										id="inputZip">
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="user_name class="form-label">Aadhar No</label> <input
											name="aadhar" type="text" class="form-control" name="aadhar"
											aria-describedby="aadharHelp" maxlength="14"
											value="<%=usdt.getAadhar()%>"
											pattern="[0-9]{4}\s?[0-9]{4}\s?[0-9]{4}" required
											oninput="formatAadhar(this);" placeholder="Aaadhar number">
										<small id="aadharHelp" class="form-text text-muted">Please
											enter a valid 12-digit Aadhar number.</small>
									</div>
									<div class="form-group col-md-4">
										<label for="inputZip">House Id</label> <input type="text"
											class="form-control" name="houseId" required
											value="<%=usdt.getHouse_id() %>"
											id="inputZip">
									</div>

									<div class="form-group col-md-2">
										<label for="inputState">Zone</label> <select id="inputState"
											class="form-control" name="zone" required>
											<option value=""
												<c:if test="${empty usdt.zone}">selected</c:if>>Choose...</option>
											<option value="East"
												<c:if test="${usdt.zone == 'East'}">selected</c:if>>East</option>
											<option value="West"
												<c:if test="${usdt.zone == 'West'}">selected</c:if>>West</option>
											<option value="South"
												<c:if test="${usdt.zone == 'South'}">selected</c:if>>South</option>
											<option value="North"
												<c:if test="${usdt.zone == 'North'}">selected</c:if>>North</option>
										</select>
									</div>
								</div>
								<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style=" width: 138%; margin-left: -181px; ">
	<%@include file="components/footer.jsp"%>
	</div>
	<%@include file="components/all_js.jsp"%>
</body>
</html>