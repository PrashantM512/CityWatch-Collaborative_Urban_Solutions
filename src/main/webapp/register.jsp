<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<style>
.footer {
	margin-top: -54px;
}
</style>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="jumbotron primary-colour text-white banner-background"
		style="background-image: linear-gradient(45deg, black, transparent); padding-top: 2%;">
		<main>
			<div class="container" style="color: black; margin-bottom: 100px;">
				<div class="col-md-4 offset-md-4">
					<div class="card" style="width: 120%;">
						<div class="card-header h4  text-white primary-colour"
							style="background-image: linear-gradient(45deg, black, transparent) !important;">
							<i class="fa-solid fa-circle-user fa-sm" style="color: #f5f9ff;"></i>&nbsp;Register
						</div>
						<div class="card-body" style="line-height: 1 !important;">
							<form action="RegisterServlet" method="POST">
								<div class="mb-3">
									<label for="user_name class="form-label">Full Name</label> <input
										name="name" type="text" class="form-control" id="name"
										aria-describedby="" required>
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input name="email" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp" required>
								</div>
								<div class="mb-3">
									<label for="user_name class="form-label">Mobile</label> <input
										name="mobile" type="number" class="form-control"
										id="user_name" required aria-describedby="" maxlength="10"
										oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);">
								</div>
								<div class="mb-3">
									<label for="user_name class="form-label">Aadhar No</label> <input
										name="aadhar" type="text" class="form-control" name="aadhar"
										aria-describedby="aadharHelp" maxlength="14"
										pattern="[0-9]{4}\s?[0-9]{4}\s?[0-9]{4}" required
										oninput="formatAadhar(this);"> <small id="aadharHelp"
										class="form-text text-muted">Please enter a valid
										12-digit Aadhar number.</small>
								</div>
								<div class="form-row">
								<div class="form-group col-md-5">
								<div class="mb-3">
									<label for="gender" class="for-gender">Gender</label><br>
									<input type="radio" id="gender" name="gender" value="male" required>&nbsp;Male&nbsp;&nbsp;
									<input type="radio" id="gender" name="gender" value="female" required>&nbsp;Female
                                </div>
								</div>
								<div class="form-group col-md-7">
								<label for="inputState">Zone</label> <select id="inputState"
										class="form-control" name="zone" required>
										<option value="" selected>Choose...</option>
										<option value="East">East</option>
										<option value="West">West</option>
										<option value="South">South</option>
										<option value="North">North</option>
									</select>
									</div>
									</div>

								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name="password" type="password"
										class="form-control" id="exampleInputPassword1" required>
								</div>
								<div class="mb-3 form-check">
									<input name="check" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Agree terms and conditions</label>
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	
			<c:if test="${not empty check_error }">
			<script>
			swal({
				  title: "Error!",
				  text: "Please Accept Terms & Conditions!",
				  icon: "info",
				});
			</script>
			<c:remove var="check_error" scope="session"/>
			</c:if>
			<c:if test="${not empty failed }">
			<script>
			swal({
				  title: "Error!",
				  text: "Something Went Wrong!",
				  icon: "error",
				});
			</script>
			<c:remove var="failed" scope="session"/>
			</c:if>
			<c:if test="${not empty exist }">
			<script>
			swal({
				  title: "Error!",
				  text:'${exist}',
				  icon: "error",
				});
			</script>
			<c:remove var="exist" scope="session"/>
			</c:if>
<div style="height: 100px"></div>

	<%@include file="components/footer.jsp"%>
</body>
</html>