<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title>Home</title>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-colour text-white banner-background"
			style="background-image: linear-gradient(45deg, black, transparent);">
			<div class="container">
				<div class="container">
					<h3 class="display-3">Manchar Nagarpanchayat</h3>
					<P>Empowerment starts with you. Take charge of your city's
						future. Each pothole reported, each broken street light addressed,
						is a step towards a safer, cleaner community. Your actions matter.
						Together, let's transform our streets into vibrant, thriving
						spaces we can all be proud of. Be the change you wish to see in
						your city. Join us in creating a brighter tomorrow, one issue at a
						time. Together, we can make a difference. Imagine your city alive
						with possibilities vibrant parks teeming with laughter, streets
						echoing with vibrant conversations, every corner a testament to
						collective care. This isn't a dream, it's within reach.</P>
						<p>
						At CityWatch, we believe responsibility isn't a burden, it's the
						seed of positive change. Together, we can cultivate a city that
						resonates with our collective spirit. A city where responsibility
						isn't an obligation, but an invitation to unleash our potential
						and build a legacy of shared progress. This is our city, and
						CityWatch is the spark that ignites its potential. Join us, become
						a changemaker, and watch your city blossom! 
						</p>
						<a href=""
							class="btn btn-outline-light btn-lg">Let's
						Start</a> <a href="login.jsp"
							class="btn btn-outline-light btn-lg">Login</a>
				</div>
			</div>
		</div>
	</div>
	
	<div style="height: 100px"></div>
	
<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>