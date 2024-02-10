<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="components/ratings.css">
<%@include file="components/header_links.jsp"%>
<title>Ratings & Feedback</title>
</head>
<style>
.footer{
margin-top:0px;
}
</style>
<body>
 <%@include file="components/check_session.jsp" %>
 <%@include file="components/navbar.jsp"%>
<div>
 <div class="containerr">
      <div class="post">
        <div class="text">Thanks for rating us!</div>
        <div class="edit"></div>
      </div>
      <div class="star-widget">
        <input type="radio" name="rate" value="1" id="rate-5">
        <label for="rate-5" class="fas fa-star"></label>
        <input type="radio" name="rate" value="2" id="rate-4">
        <label for="rate-4" class="fas fa-star"></label>
        <input type="radio" name="rate" value="3" id="rate-3">
        <label for="rate-3" class="fas fa-star"></label>
        <input type="radio" name="rate" value="4" id="rate-2">
        <label for="rate-2" class="fas fa-star"></label>
        <input type="radio" name="rate" value="5" id="rate-1">
        <label for="rate-1" class="fas fa-star"></label>
        <form action="#">
          <header></header>
          <div class="textarea">
            <textarea cols="30" placeholder="Give us your valuable feedback..."></textarea>
          </div>
          <div class="btnn">
            <button type="submit">Post</button>
          </div>
        </form>
      </div>
    </div>
</div>
    <script>
      const btn = document.querySelector("button");
      const post = document.querySelector(".post");
      const widget = document.querySelector(".star-widget");
      const editBtn = document.querySelector(".edit");
      btn.onclick = ()=>{
        widget.style.display = "none";
        post.style.display = "block";
        editBtn.onclick = ()=>{
          widget.style.display = "block";
          post.style.display = "none";
        }
        return false;
      }
    </script>
<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>