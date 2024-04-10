<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<div class="navgroup">
<div class="container-fluid p-3 uppernav" style="background-color: white;">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3 class="title-font">
				<img alt="Small Image" style="width: 50px; height: 50px;" class="img img-fluid" src="img/cityscape.png"></i>&nbsp;<img alt="" src="img/CityWatch.png" class="title">
				
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="SearchPinServlet"
				method="post">
				<input class="form-control mr-sm-2" type="search" name="key"
					placeholder="Search" aria-label="Search" required>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<div class="col-md-3">
			<a href="notifications.jsp"><img alt="Small Image" style="width: 25px; height: 25px;" class="img img-fluid notification" src="img/notification2.png"></a>
				
				<c:if test="${not empty user }">
				<a class="btn btn-primary text-white" href="update_profile.jsp"><i class="fas fa-user"></i>
					${user.name}</a>
				<a href="LogoutServlet" class="btn btn-success" data-toggle="modal"
					data-target="#exampleModal"><i class="fas fa-sign-out-alt"></i>
					Logout</a>
			</c:if>

			<c:if test="${empty user }">
				<a href="login.jsp" class="btn btn-success">Login</a>
				<a href="register.jsp" class="btn btn-primary">Register</a>
			</c:if>
		</div>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark primary-colour" style="z-index:1">
	<a class="navbar-brand" href="index.jsp"><i
		class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			
			<li class="nav-item active"><a class="nav-link"
				href="issues.jsp">Issues</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="developments.jsp">Developments</a></li>
				<li class="nav-item active"><a class="nav-link"
				href="pay_tax.jsp">Pay Tax</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="donate.jsp">Donate</a></li>
				<li class="nav-item active"><a class="nav-link"
				href="suggestions.jsp">Suggest Us</a></li>
				<li class="nav-item active"><a class="nav-link"
				href="pins.jsp">Pins</a></li>
				<li class="nav-item active"><a class="nav-link"
				href="recruitments.jsp">Recruitments</a></li>

		</ul>
		<form class="form-inline my-2 my-lg-0">
            <c:if test="${not empty user }">
			<a href="admin/index.jsp" class="btn btn-light my-2 my-sm-0 "
				type="submit"><i class="fa-solid fa-user"></i> Admin</a>
				<a href="settings.jsp" class="btn btn-light my-2 my-sm-0 ml-1"
				type="submit" ><i class="fa-solid fa-gear"></i> Settings</a>
			</c:if>
		</form>
	</div>
</nav>
<%@include file="alert.jsp" %>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<b>Do you really want to logout ?</b>
				</div>
				<div class="text-center pt-2">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="LogoutServlet" class="text-white">
						<button type="button" class="btn btn-primary">Logout</button>
					</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
</div>