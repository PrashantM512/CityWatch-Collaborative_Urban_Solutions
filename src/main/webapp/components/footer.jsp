
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<footer class="footer ft">
	<ul class="social-icon">
		<li class="social-icon__item"><a class="social-icon__link"
			href="#"> <ion-icon name="logo-facebook"></ion-icon>
		</a></li>
		<li class="social-icon__item"><a class="social-icon__link"
			href="#"> <ion-icon name="logo-twitter"></ion-icon>
		</a></li>
		<li class="social-icon__item"><a class="social-icon__link"
			href="#"> <ion-icon name="logo-github"></ion-icon>
		</a></li>
		<li class="social-icon__item"><a class="social-icon__link"
			href="#"> <ion-icon name="logo-instagram"></ion-icon>
		</a></li>
	</ul>
	<p>&copy;2024 Developed By Prashant Morade</p>
</footer>
<script>
  const storedFormData = JSON.parse(localStorage.getItem('formData'));
  if (storedFormData) {
    
      document.getElementById('registerName').value = storedFormData.name || '';
      document.getElementById('registerEmail').value = storedFormData.email || '';
      document.getElementById('registerMobile').value = storedFormData.mobile || '';
      document.getElementById('registerAadhar').value = storedFormData.aadhar || '';
      document.getElementById('registerPassword').value = storedFormData.password || '';
      document.getElementById('registerGender').checked = storedFormData.gender === 'female' ? true : false; // Check the radio button based on stored value
      document.getElementById('registerZone').value = storedFormData.zone || '';
  }

	  document.getElementById('forms').addEventListener('submit', function(event) {
	    
	      const formData = {
	          name: document.getElementById('registerName').value,
	          email: document.getElementById('registerEmail').value,
	          mobile: document.getElementById('registerMobile').value,
	          aadhar: document.getElementById('registerAadhar').value,
	          password: document.getElementById('registerPassword').value,
	          gender: document.querySelector('input[name="gender"]:checked')?.value,
	          zone: document.getElementById('registerZone').value
	      };

	      localStorage.setItem('formData', JSON.stringify(formData));
  });

	</script>

<c:if test="${registerSuccess eq 'true'}">
	<script>
	localStorage.removeItem('formData');
	</script>
	<c:remove var="registerSuccess" scope="session" />
</c:if>

<script>
	window.onload = function() {
	    var formData = sessionStorage.getItem("formData");
	    if (formData) {
	        var user = JSON.parse(formData);
	        document.getElementById("exampleInputEmail1").value = user.email;
	        document.getElementById("exampleInputPassword1").value = user.password;
	      
	    }
	};

	document.getElementById("myForm").addEventListener("submit", function(event) {
	  
	    var formData = {
	        email: document.getElementById("exampleInputEmail1").value,
	        password: document.getElementById("exampleInputPassword1").value
	      
	    };
	    
	    sessionStorage.setItem("formData", JSON.stringify(formData));
	});

	</script>
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>