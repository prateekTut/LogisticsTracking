<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
      <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Complete Logistics</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


       <script>
            
            function registerValidation() {
              let x = document.forms["register"]["name"].value;
              if (x.length < 3) {
                alert("Name should be greater than 3 character");
                return false;
              }
              
      
            }
         
       
 
    </script>
    </head>
    <body>
  <jsp:include page="header.jsp"></jsp:include>
    <div class="jumbotron jumbotron-fluid mb-5">
        <div class="container text-center py-5">
            <h1 class="text-primary mb-4">Safe & Faster</h1>
            <h1 class="text-white display-3 mb-5">Partner Registration</h1>
        </div>
    </div>
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row align-items-center">
       
                
                <%
                    String success = (String) session.getAttribute("success-message");
                    if (success != null) {
                        session.removeAttribute("success-message");
                %>
                <div class='alert alert-success' id='success' style="width: 680px;">Customer
                    Register Successfully.</div>
                    <%
                        }
                        String fail = (String) session.getAttribute("fail-message");
                        if (fail != null) {
                            session.removeAttribute("fail-message");
                    %>
                <div class="alert alert-danger" id='danger' style="width: 680px;">Customer
                    Registration Fail,Please try again</div>
                    <%
                        }
                    %>
                <form name = "register" action="AddCustomer" method="post" onsubmit="return registerValidation()">
                    <div class="form-group">
                        <h4>Your Name :</h4>
                        <input type="text" class="form-control" placeholder="Your Name" required="" style="width: 680px;" name="name">
                    </div>
                    <div class="form-group">
                        <h4>Email :</h4>
                        <input type="text" class="form-control" placeholder="Type here" required="" style="width: 680px;" name="email">
                    </div>
                    <div class="form-group">
                        <h4>Password :</h4>
                        <input type="password" class="form-control" placeholder="Password" required="" style="width: 680px;" name="password">
                    </div>
                    <div class="form-group">
                        <h4>Phone :</h4>
                        <input type="text" class="form-control" placeholder="Type here" required="" style="width: 680px;" name="mobile">
                    </div>
                   
                    <input type="submit" class ="btn btn-primary" value="REGISTER NOW" style="width: 680px;">
                     <p>
            <a href="customer-login.jsp">Existing Customer? Log In</a>
        </p>
                </form>
            </div>
            
        </div>
     
    </div>
  
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js."></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
    </body>
</html>