<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title>Issues</title>
</head>
<body>
   <%@include file="components/check_session.jsp" %>
	<%@include file="components/navbar.jsp"%>

<div class="conatiner">
<p class="text-center pgeheading">SUBMIT YOUR ISSUES HERE</p>

<div class="text-right" style=" width: 98%; "></div>

 <div class="container-fluid pt-4 px-4">
    <div class="row justify-content-center">
        <div class="col-sm-12 col-xl-6">
            <div class="border rounded h-100 p-4" style=" box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; ">
                      
                 <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Your Issue :</h6>
                         <a href="public_issues.jsp" class="btn btn-success text-white">View Public Issues</a>
                    </div>
                <form action="SubmitIssueServlet" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <c:if test="${not empty user }">
                         <input type="hidden" value="<%=user.getUid() %>" name="uid">
                        </c:if>
                        <label for="exampleInputEmail1" class="form-label">Title</label>
                        <input type="text" class="form-control" name="title" id="exampleInputEmail" aria-describedby="emailHelp">
                         </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Description</label>
                        <textarea class="form-control" style="height: 130px;" name="description" placeholder="Please add location while describing your issue" id="exampleInputPassword"></textarea>
                         <div id="emailHelp" class="form-text"></div>
                    </div>
                     <div class="mb-3">
                                <label for="formFile" class="form-label">Photo</label>
                                <input class="form-control-file form-control" name="photo" type="file" id="formFile">
                            </div>
                            
                          <div class="form-check">
                                <input class="form-check-input" name="type" value="Major" type="radio" name="flexRadioDefault"
                                    id="flexRadioDefault">
                                <label class="form-check-label" for="flexRadioDefault1">
                                    Major Issue
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" name="type" value="Minor" type="radio" name="flexRadioDefault"
                                    id="flexRadioDefault" checked>
                                <label class="form-check-label" for="flexRadioDefault2">
                                    Minor Issue
                                </label>
                            </div>
                    <button type="submit" class="btn btn-primary" style=" margin-top: 20px;  ">Submit</button>
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