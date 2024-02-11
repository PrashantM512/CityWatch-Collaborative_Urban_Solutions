<%@page import="java.util.Map"%>
<%@page import="com.city.watch.entity.Rating"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.RatingsDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title>View Feedbacks & Ratings</title>
</head>
<style>
.heading {
	font-size: 25px;
	margin-right: 25px;
}

.fa {
	font-size: 25px;
}

.checked {
	color: orange;
}
</style>

<body>
	<%@include file="components/navbar.jsp"%>

	<div class="conatiner">
		<p class="text-center pgeheading">Ratings & Feedbacks</p>

		<div class="container-fluid pt-4">
			<div class="row justify-content-center">
				<div class="col-sm-12 col-xl-11">
					<div class="border rounded h-100 p-4"
						style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 13px; margin-left: 32px; margin-right: 37px;">
						<div>
							<span class="heading">Public Ratings</span> <span
								id="stars-container"> </span>
							<p id="average-rating"><c:if test="${not empty averageRating}">${averageRating}</c:if> average based on <c:if test="${not empty i}">${i}<c:remove var="i"/></c:if> reviews.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid px-4" style="text-align: -webkit-center;">
		<div class="col-12">
			<div class="rounded h-100">
				<h6 class="mb-4"></h6>
				<div class="table-responsive">
					<table class="table"
						style="border-style: solid; border-color: #e5e5e5; width: 90%;">
						<thead style="height: 42px; background-color: #e5e5e5;">
							<tr>
								<th scope="col">Sr.No.</th>
								<th scope="col">UserName</th>
								<th scope="col">Date</th>
								<th scope="col">Stars</th>
								<th scope="col">Feedback</th>
							</tr>
						</thead>
						<tbody>
							<%
							int pid=Integer.parseInt(request.getParameter("pid"));
							
							RatingsDaoImpl dao = new RatingsDaoImpl(ConnectionProvider.getConnection());
							List<Map<String, Object>> list = dao.getFeedbackDetails();
							int i = 1;
							int stars=0;
							for (Map<String, Object> fd : list) {
								if(((Map<String, Object>) fd.get("development")).get("pid").equals(pid)){
							%>
                                   
							<tr>
								<th scope="row"><%=i%></th>
								<td><%=((Map<String, Object>) fd.get("user")).get("name")%></td>
								<td><%=fd.get("date")%></td>
								<td>
									<%
									int ratingLevel = (int) fd.get("stars");
									for (int j = 0; j < ratingLevel; j++) {
										out.println("<i class=\"fa-solid fa-star\" style=\"color: orange;\"></i>");
									}
									%>
								</td>

								<td><%=fd.get("feedback")%></td>
							</tr>
							<%
							i++;
							stars=stars+ratingLevel;
							 }
							}
							session.setAttribute("i",--i);
							double averageRating = 0;
							if (i > 1) {
								i=i*5;
							    averageRating = (double) stars*5 /i;
							}
							session.setAttribute("averageRating",averageRating);
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		const averageRating = ${averageRating};
		const filledStars = Math.floor(averageRating);
		for (let i = 0; i < filledStars; i++) {
			document.getElementById('stars-container').innerHTML += '<span class="fa fa-star checked"></span>';
		}
		if (averageRating - filledStars >= 0.5) {
			document.getElementById('stars-container').innerHTML += '<span class="fa fa-star-half checked"></span>';
		}
		const unfilledStars = Math.floor(5 - averageRating);

		for (let i = 0; i < unfilledStars; i++) {
			document.getElementById('stars-container').innerHTML += '<span class="fa fa-star"></span>';
		}
	</script> 
	<div style="height: 100px"></div>

	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>