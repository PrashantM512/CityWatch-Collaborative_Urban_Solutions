<%@page import="com.city.watch.dao.UserDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.dao.RecruitmentDaoImpl"%>
<%@page import="com.city.watch.entity.Recruitment"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<link rel="stylesheet" href="components/upload.css" type="text/css">
<script type="text/javascript" src="components/myjs.js"></script>
<title>Upload CV</title>
</head>
<style>
th, td {
	border-right: solid 2px #e5e5e5;
}
</style>
<body>
	<%@include file="components/check_session.jsp"%>
	<%@include file="components/navbar.jsp"%>
	<div class="conatiner">
		<p class="text-center pgeheading"></p>
		<div class="text-center upcv" style="margin-top: 80px;">
    <h2></h2>
    <p class="lead">
        Upload Your Latest<b> CV</b>
    </p>
    <form id="file-upload-form" class="uploader" action="UploadCVServlet?id=<%=user.getUid()%>" method="post" enctype="multipart/form-data">
        <input id="file-upload" type="file" name="cv" accept=".pdf,.doc,.docx" required/>
        <label for="file-upload" id="file-drag" style="margin-bottom: 19%;">
            <img id="file-image" src="#" alt="Preview" class="hidden">
            <div id="start">
                <i class="fa fa-download" aria-hidden="true"></i>
                <div>Select a file or drag here (.pdf/.doc/.docx)</div>
                <div id="notimage" class="hidden">Please select an image</div>
                <span id="file-upload-btn" class="btn btn-primary">Select a file</span>
                 <button type="submit" class="btn btn-primary">Submit</button>
                    <p id="selected-file-name"></p>
            </div>
            <div id="response" class="hidden">
                <div id="messages"></div>
                <progress class="progress" id="file-progress" value="0">
                 
                    <span>0</span>%
                </progress>
            </div>
        </label>
       
    </form>
</div>

	</div>
	<div style="height: 100px"></div>
	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
	<script>
	document.getElementById('file-upload').addEventListener('change', function(event) {
	    var fileName = event.target.files[0].name;
	    document.getElementById('selected-file-name').innerText = 'Selected File: ' + fileName;
	});

	</script>
</body>
</html>