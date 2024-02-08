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
     <%@include file="components/check_session.jsp" %>
	<%@include file="components/navbar.jsp"%>
	
<div class="conatiner" style=" text-align: -webkit-center; ">
<p class="text-center pgeheading">PAY YOUR TAXES</p>
		<div class="col-sm-8 col-xl-10 text-left">
			<div class="rounded h-100 p-4">
				
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-home-tab"
							data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
							role="tab" aria-controls="nav-home" aria-selected="true">Home Tax</button>
						<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
							data-bs-target="#nav-profile" type="button" role="tab"
							aria-controls="nav-profile" aria-selected="false">Water Tax</button>
						
					</div>
				</nav>
				<div class="tab-content pt-3" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">Diam sea
						sanctus amet clita lorem sit sanctus ea elitr. Lorem rebum est
						elitr eos. Dolores aliquyam sadipscing dolor sadipscing accusam
						voluptua tempor. Sanctus elitr sanctus diam tempor diam aliquyam
						et labore clita, ipsum takimata amet est erat, accusam takimata
						gubergren sea sanctus duo nonumy. Ipsum diam ipsum sit kasd.</div>
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">Sanctus vero sit kasd sea
						gubergren takimata consetetur elitr elitr, consetetur sadipscing
						takimata ipsum dolores. Accusam duo accusam et labore ea elitr
						ipsum tempor sit, dolore aliquyam ipsum sit amet sit. Et dolore
						ipsum labore invidunt rebum. Sed dolore gubergren sanctus vero
						diam lorem rebum elitr, erat diam dolor clita.</div>
				</div>
			</div>
		</div>

	</div>
	<div style="height: 100px"></div>

	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>