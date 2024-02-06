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
<style>
.footer {
	margin-top: 81px;
}
 .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
          
        }
        .pgeheading {
            margin-bottom: 20px;
        }
        .map-container {
           width: 99vw;
    max-width: 100%;
    height: 66vh;
    max-height: 600px;
    overflow: hidden;
    border-radius: 4px;
        }
        .map-container iframe {
            width: 100%;
            height: 100%;
            border: 0;
        }
</style>
<body>
	<%@include file="components/navbar.jsp"%>

	 <div class="container">
	 
        <p class="text-center pgeheading">FIND YOUR LOCATION HERE</p>
         <div class="container-fluid pt-4 px-4" style=" margin-top: -21px; ">
    <div class="row justify-content-center">
        <div class="map-container" style="box-shadow: rgba(0, 5, 0, 1.35) 0px 0px 25px;">
             <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3780.989888202424!2d73.94282126415914!3d18.99737625748274!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c0ac00000001%3A0x53fa7d0e89d52dd2!2sSpecified%20Location!5e0!3m2!1sen!2sin!4v1644114216487!5m2!1sen!2sin"
            frameborder="0" allowfullscreen="true" aria-hidden="false" tabindex="0"></iframe>
     </div>
        
        </div>
        </div>
    </div>

	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>