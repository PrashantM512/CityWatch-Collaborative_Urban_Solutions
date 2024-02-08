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
     <%@include file="components/check_session.jsp" %>
	<%@include file="components/navbar.jsp"%>
	<div class="container" style="margin-bottom: 90px;">
		<h3 class="text-center mb-3"
			style="margin-top: -25px; margin-bottom: -13px;">
			<img alt="" src="img\UpdateProfile.png" class="pagetitle"><img
				alt="" class="pagetitle-img" src="img/update.png" style=" margin-left: -28px; ">
		</h3>
		<div class="container-fluid pt-4 px-4">
			<div class="row justify-content-center">
				<div class="col-sm-12 col-xl-6">
					<div class="border rounded h-100 p-4"
						style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">

						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="Name">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input
										type="email" class="form-control" id="inputEmail4"
										placeholder="Email">
								</div>
							</div>
							<div class="form-group">
								<label for="inputAddress">Address</label> <input type="text"
									class="form-control" id="inputAddress"
									placeholder="1234 Main St">
							</div>
							<div class="form-group">
								<label for="inputAddress2">Password</label> <input type="password"
									class="form-control" id="inputAddress2"
									placeholder="Password">
									<small id="aadharHelp" class="form-text text-muted">Enter correct password to update your profile</small>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="user_name class="form-label">Mobile</label> <input
										name="mobile" type="number" class="form-control"
										id="user_name" aria-describedby="" placeholder="mobile" maxlength="10"
										oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);">
								</div>
								<div class="form-group col-md-3">
									<label for="inputZip">Ward No.</label> <input type="text"
										class="form-control" placeholder="Ward number" id="inputZip">
								</div>
								<div class="form-group col-md-3">
									<label for="inputZip">Property id</label> <input type="text"
										class="form-control" placeholder="Property id" id="inputZip">
								</div>
								
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="user_name class="form-label">Aadhar No</label> <input
										name="aadhar" type="text" class="form-control" name="aadhar"
										aria-describedby="aadharHelp" maxlength="14"
										pattern="[0-9]{4}\s?[0-9]{4}\s?[0-9]{4}" required
										oninput="formatAadhar(this);" placeholder="Aaadhar number"> <small id="aadharHelp"
										class="form-text text-muted">Please enter a valid
										12-digit Aadhar number.</small>
								</div>
								<div class="form-group col-md-4">
									<label for="inputZip">House Id</label> <input type="text"
										class="form-control" placeholder="House id" id="inputZip">
								</div>
								<div class="form-group col-md-2">
									<label for="inputState">Zone</label> <select id="inputState"
										class="form-control">
										<option selected>Choose...</option>
										<option>East</option>
										<option>West</option>
										<option>South</option>
										<option>North</option>
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
	
	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>