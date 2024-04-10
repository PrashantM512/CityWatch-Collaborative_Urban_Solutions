<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<c:if test="${not empty alertClass and not empty alertMessage}">
    <div id="alertMessage" class="alert ${alertClass} animate__animated animate__slideInDown" role="alert" style="z-index: 0;">${alertMessage}</div>
    <c:remove var="alertClass" scope="session" />
    <c:remove var="alertMessage" scope="session" />
</c:if>

<script>
document.addEventListener("DOMContentLoaded", function() {
  
    var alertMessage = document.getElementById('alertMessage');
   
    setTimeout(function() {
       
        alertMessage.classList.remove('animate__slideInDown');
        alertMessage.classList.add('animate__slideOutUp');
        
        setTimeout(function() {
            alertMessage.remove();
        }, 1000);
    }, 3000);
});
</script>