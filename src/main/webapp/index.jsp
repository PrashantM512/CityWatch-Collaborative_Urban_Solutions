<%@page import="com.city.watch.entity.Development"%>
<%@page import="com.city.watch.dao.DevelopmentDaoImpl"%>
<%@page import="com.city.watch.entity.Donation"%>
<%@page import="com.city.watch.dao.DonationDaoImpl"%>
<%@page import="com.city.watch.entity.TransactionDetails"%>
<%@page import="com.city.watch.dao.TransactionDetailsDAOImpl"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.dao.IssueDaoImpl"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.city.watch.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<link rel="stylesheet" href="components/homecard.css">
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
						<a href="#homecards" class="btn btn-outline-light btn-lg">Let's Start</a>
                        <c:if test="${empty user }">
						<a href="login.jsp" class="btn btn-outline-light btn-lg">Login</a>
						</c:if>
						<div id="homecards"></div>
				</div>
			</div>
		</div>
	</div>
 
	<div>
		<section class="wrapper">
			<div class="container">
				<div class="row">
					<div class="col text-center mb-5">
						<h1 class="display-4 font-weight-bolder"></h1>
						<h4 class="lead" style=" color: #767676; font-weight: bold; ">Help Us To Be Better And Bright Future Of Our City</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-6 col-lg-4 mb-4">
						<div class="card text-dark card-has-bg click-col"
							style="background-image: url('https://source.unsplash.com/600x900/?tech,street');">
							<img class="card-img d-none"
								src="https://source.unsplash.com/600x900/?tech,street"
								alt="Creative Manner Design Lorem Ipsum Sit Amet Consectetur dipisi?">
							<div class="card-img-overlay d-flex flex-column">
								<div class="card-body">
									<small class="card-meta mb-2">Issues</small>
									<h4 class="card-title mt-0 ">
										<a class="text-dark text-decoration-none" href="issues.jsp">Hey... Let Us Know Your Issues Or Complaints</a>
									</h4>
									<%
									Date currentDate = new Date();
									SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy");
									String formattedDate = dateFormat.format(currentDate);
									%>
									<small><i class="far fa-clock"></i> <%=formattedDate %></small>
								</div>
								<div class="card-footer">
									<div class="media">
										<img alt="Small Image" style="width: 40px; height: 40px;" class="img img-fluid mr-3" src="img/cityscape.png">
										<div class="media-body">
											<h6 class="my-0 text-dark d-block">Manchar</h6>
											<small>Maharastra 410 503</small>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-6 col-lg-4 mb-4">
						<div class="card text-dark card-has-bg click-col"
							style="background-image: url('https://source.unsplash.com/600x900/?tree,nature');">
							<img class="card-img d-none"
								src="https://source.unsplash.com/600x900/?tree,nature"
								alt="Creative Manner Design Lorem Ipsum Sit Amet Consectetur dipisi?">
							<div class="card-img-overlay d-flex flex-column">
								<div class="card-body">
									<small class="card-meta mb-2">Developments</small>
									<h4 class="card-title mt-0 ">
										<a class="text-dark text-decoration-none" href="developments.jsp">Hey... Let's Explore Development Projects In Our City</a>
									</h4>
									<small><i class="far fa-clock"></i> <%=formattedDate %></small>
								</div>
								<div class="card-footer">
									<div class="media">
										<img alt="Small Image" style="width: 40px; height: 40px;" class="img img-fluid mr-3" src="img/cityscape.png">
										<div class="media-body">
											<h6 class="my-0 text-dark d-block">Manchar</h6>
											<small>Maharastra 410 503</small>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-6 col-lg-4 mb-4">
						<div class="card text-dark card-has-bg click-col"
							style="background-image: url('https://source.unsplash.com/600x900/?computer,design');">
							<img class="card-img d-none"
								src="https://source.unsplash.com/600x900/?computer,design"
								alt="Creative Manner Design Lorem Ipsum Sit Amet Consectetur dipisi?">
							<div class="card-img-overlay d-flex flex-column">
								<div class="card-body">
									<small class="card-meta mb-2">Tax Bills</small>
									<h4 class="card-title mt-0 ">
										<a class="text-dark text-decoration-none" href="pay_tax.jsp" >Hey... Pay Your Pending Tax Bills Here</a>
									</h4>
									<small><i class="far fa-clock"></i> <%=formattedDate %></small>
								</div>
								<div class="card-footer">
									<div class="media">
										<img alt="Small Image" style="width: 40px; height: 40px;" class="img img-fluid mr-3" src="img/cityscape.png">
										<div class="media-body">
											<h6 class="my-0 text-dark d-block">Manchar</h6>
											<small>Maharastra 410 503</small>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<hr>
	<div id="bottomcards">
	<div class="container">
	<div class="row">
					<div class="col text-center mb-5">
						<h1 class="display-4 font-weight-bolder"></h1>
						<h4 class="lead" style=" color: #767676; font-weight: bold; ">Our Analytics</h4>
					</div>
				</div>
    <div class="row">
        <div class="col-md-4 col-xl-3">
            <div class="card2 bg-c-blue order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Total Developments</h6>
							<%
							DevelopmentDaoImpl dao2 = new DevelopmentDaoImpl(ConnectionProvider.getConnection());
							List<Development> list2 = dao2.getAlldevelopments();
							int j = 0;
							for (Development d : list2) {
								j++;
							}
							%>
							<h2 class="text-right"><i class="fa fa-building fa-3x f-left mt-2"></i><span><%=j %></span></h2>
<!--                     <p class="m-b-0">Completed Orders<span class="f-right">351</span></p> -->
                </div>
            </div>
        </div>
        
        <div class="col-md-4 col-xl-3">
            <div class="card2 bg-c-green order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Total Issues</h6>
							<%
							IssueDaoImpl dao = new IssueDaoImpl(ConnectionProvider.getConnection());
							List<Map<String, Object>> list = dao.getPublicIssues();
							int i = 0;
							for (Map<String, Object> getPublicIssues : list) {
								i++;
							}
							%>
							<h2 class="text-right"><i class="fa fa-exclamation-triangle fa-3x mt-2 f-left"></i><span><%=i %></span></h2>
<!--                     <p class="m-b-0">Completed Orders<span class="f-right">351</span></p> -->
                </div>
            </div>
        </div>
        
        <div class="col-md-4 col-xl-3">
            <div class="card2 bg-c-yellow order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Total Donation</h6>
							<%
							DonationDaoImpl dt = new DonationDaoImpl(ConnectionProvider.getConnection());
							List<Donation> donations = dt.getAllDonations();

							double totalAmount = 0;
							for (Donation donation : donations) {
								if (donation.getStatus().equals("Success")) {
									totalAmount += donation.getAmount();
								}
							}
							%>
							<h2 class="text-right"><i class="fa fa-heart fa-3x f-left mt-2"></i><span><%=totalAmount %></span></h2>
<!--                     <p class="m-b-0">Completed Orders<span class="f-right">351</span></p> -->
                </div>
            </div>
        </div>
        
        <div class="col-md-4 col-xl-3">
            <div class="card2 bg-c-pink order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Total Tax Payments</h6>
							<%
							TransactionDetailsDAOImpl transactionDetailsDao = new TransactionDetailsDAOImpl(ConnectionProvider.getConnection());
							List<TransactionDetails> transactionList = transactionDetailsDao.getAllTransactionDetailsWithUser();
							int k = 0;
							for (TransactionDetails transaction : transactionList) {
								k++;
							}
							%>
							<h2 class="text-right"><i class="fa fa-credit-card fa-3x mt-2 f-left"></i><span><%=k %></span></h2>
<!--                     <p class="m-b-0">Completed Orders<span class="f-right">351</span></p> -->
                </div>
            </div>
        </div>
	</div>
</div>
</div>
	
<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>