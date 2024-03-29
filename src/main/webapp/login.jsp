<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<style>
.footer {
	margin-top: -95px;
}
</style>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="jumbotron primary-colour text-white banner-background"
		style="background-image: linear-gradient(45deg, black, transparent);">

		<main class="align-items-center login-form login-bg"
			style="height: 76vh">

			<div class="conatiner" style="color: black;">
				<div class="row">
					<div class="col-md-4 offset-md-4">
						<div class="card">
							<div class="card-header h4  text-white primary-colour"
								style="background-image: linear-gradient(45deg, #060c2c, transparent) !important;">
								<p style=" margin-bottom: 0.5rem; ">
									<img alt="Small Image" style="width: 30px; height: 30px;" class="img img-fluid notification" src="img/login.png">&nbsp; Login
								</p>

							</div>
							<div class="card-body">
								<form id="myForm" action="LoginServlet" method="post">
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Email
											address</label> <input name="email" required type="email"
											class="form-control" id="exampleInputEmail1"
											aria-describedby="emailHelp">
									</div>
									<div class="mb-3">
										<label for="exampleInputPassword1" class="form-label">Password</label>
										<input name="password" required type="password"
											class="form-control" id="exampleInputPassword1">
									</div>
									<div class="mb-3 form-check">
										<input type="checkbox" name="check" class="form-check-input"
											id="exampleCheck1"> <label class="form-check-label"
											for="exampleCheck1">I am not Robot</label>
									</div>
									<button type="submit" class="btn btn-primary">Submit</button>
									<p class="text-center mt-2 mb-0">
										Governmental Department? <a href="department/index.jsp">&nbsp;
											Click Here</a>
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</main>
	</div>
	
	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>