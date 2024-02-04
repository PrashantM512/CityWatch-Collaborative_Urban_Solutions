<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title>Suggest Us</title>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
   <div class="conatiner">
<p class="text-center pgeheading">SUGGEST US YOUR IDEAS FOR BETTER TOMMAROW</p>
   
   <div class="container-fluid pt-4 px-4">
    <div class="row justify-content-center">
        <div class="col-sm-12 col-xl-6">
            <div class="border rounded h-100 p-4" style=" box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; ">

                <form>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Title</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                         </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Suggestion / Ideas</label>
                        <textarea class="form-control" style="height: 130px;" placeholder="Please add location while describing your issue" id="exampleInputPassword1"></textarea>
                         <div id="emailHelp" class="form-text"></div>
                    </div>  
                    
                    <div class="form-row" style="display: flex;">
										<div class="form-group col-md-6"
											>
											<label for="inputEmail4">Your Age</label> <input
												type="number" class="form-control" id="inputEmail4">
										</div>
										<div class="form-group col-md-6" >
											<label for="inputEmail4">Your Education</label> <input type="text"
												class="form-control" id="inputEmail4">
										</div>
									</div>   
                    <button type="submit" class="btn btn-primary" style=" margin-top: 20px;width:25%  ">Submit</button>
                </form>
            </div>
        </div>
    </div>
    </div>
    
   
   
</div>
<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>