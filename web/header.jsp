<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a href="index.html" class="navbar-brand ml-lg-3">
                <h1 class="m-0 display-5 text-uppercase text-primary"><i class="fa fa-truck mr-2"></i>C Logistics</h1>
                </a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                        
                          <%
                                if ((String) session.getAttribute("name") != null) {
                          %>
                        <li class="nav-item">
                            <a href="my-orders.jsp" class="nav-link">My Orders</a>
                        </li>
                        <li class="nav-item">
                            <a href="logout.jsp" class="nav-link">Logout</a>
                        </li>
                        
                         <%
                            } else {
                         %>
            
                      
                        <li class="nav-item"><a class="nav-link" href="customer-register.jsp">Partner Registration</a></li>
                         <li class="nav-item"><a class="nav-link" href="admin-login.jsp">Partner Login</a></li>
                         
                         <%
                                }
                         %>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Navigation -->
</header>