<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="components/header_links.jsp"%>
<title>Settings</title>
</head>
<style>
</style>
<body>
 <%@include file="components/check_session.jsp" %>
<%@include file="components/navbar.jsp"%>

<div class="container" style="margin-bottom: 90px;">
<h3 class="text-center" style="margin-top: -25px;margin-bottom: -13px;"><img alt="" src="img/Settings.png" class="pagetitle"><img alt="" class="pagetitle-img" src="img/settings2.png"></h3>
		<div class="row p-5" style="">
			<div class="col-md-4 decor">
				<a href="update_profile.jsp" style="text-decoration: none;">
					<div class="card h-100 setbg">
						<div class="card-body text-center text-dark">
							<div class="text-primary">
								<img alt="" class="settingimg img img-fluid" src="img/profile.png">
							</div>
							<h4>Login & Security (Edit Profile)</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="user_payments.jsp" style="text-decoration: none;">
					<div class="card mt-10 h-100 setbg">
						<div class="card-body text-center text-dark">
							<div class="text-primary">
								<img alt="" class="settingimg img img-fluid" src="img/payments.png">
							</div>
							<h4>Your Payments</h4>
							<br>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="user_issues.jsp" style="text-decoration: none;">
					<div class="card mt-10 h-100 setbg">
						<div class="card-body text-center text-dark text-dark">
							<div class="text-primary">
								<img alt="" class="settingimg img img-fluid" src="img/issue2.png">
							</div>
							<h4>Your Issues</h4>
							<br>

						</div>
					</div>
				</a>
			</div>
		</div>

		<div class="row p-5" style=" margin-top: -55px; ">
			<div class="col-md-6">
				<a href="user_suggestions.jsp" style="text-decoration: none;">
					<div class="card h-100 setbg">
						<div class="card-body text-center text-dark">
							<div class="text-danger">
								<img alt="" class="settingimg img img-fluid" src="img/suggestions-img.png">
							</div>
							<h4>Your Suggestions</h4>
							
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="help.jsp" style="text-decoration: none;">
					<div class="card h-100 setbg">
						<div class="card-body text-center text-dark">
							<div class="text-primary">
								<img alt="" class="settingimg img img-fluid" src="img/help.png">
							</div>
							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		
		</div>
</div>


<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>