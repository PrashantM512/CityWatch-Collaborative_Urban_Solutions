    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page isELIgnored="false"%>
    
    <%@include file="check_session.jsp" %>
   <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
                <a href="index.jsp" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                 <form class="d-none d-md-flex ms-4" action="../SearchPinServlet" method="post">
                    <input class="form-control border-0" name="key" type="search" placeholder="Search">
                </form>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                    </div>
                <div class="nav-item dropdown" style="display: contents;">
                        <a href="" class="nav-link" data-bs-toggle="dropdown">
                            <i class="fa fa-home me-lg-2"></i>
                            <span class=" d-lg-inline-flex"><a href="index.jsp">Home</a></span>
                        </a>
                    </div>
                     <div class="nav-item dropdown" style="display: contents;">
                        <a href="" class="nav-link" data-bs-toggle="dropdown">
                            <i class="fas fa-globe-americas"></i>
                            <span class=" d-lg-inline-flex"><a href="../index.jsp">Main Website</a></span>
                        </a>
                    </div>
                    
                     <div class="nav-item dropdown" style="display: contents;">
                        <a href="" class="nav-link" data-bs-toggle="dropdown">
                            <i class="fas fa-sign-out-alt me-lg-2"></i>
                            <span class=" d-lg-inline-flex"><a href="../DepartmentLogoutServlet">Logout</a></span>
                        </a>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link" data-bs-toggle="dropdown">
                            <img class="me-lg-2" src="img/indgov.png" alt="" style="width: 40px; height: 42px;">
                            <c:if test="${not empty dept}">
                            <span class="d-none d-lg-inline-flex"><b><%=dept.getDept_id() %></b></span>
                            </c:if>
                        </a>
                    </div>
                </div>
            </nav>