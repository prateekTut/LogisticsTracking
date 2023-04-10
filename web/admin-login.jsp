<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
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

</head>
    <body>
    <header class="main-header">
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                     <a href="index.html" class="navbar-brand ml-lg-3">
                <h1 class="m-0 display-5 text-uppercase text-primary"><i class="fa fa-truck mr-2"></i>Complete Logistics</h1>
                </a>
                </div>
                
                 <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                         <li class="nav-item"><a class="nav-link" href="admin-login.jsp">Admin Login</a></li>
        
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <!-- Header Start -->
    <div class="jumbotron jumbotron-fluid mb-5">
        <div class="container text-center py-5">
            <h1 class="text-primary mb-4">Safe & Faster</h1>
            <h1 class="text-white display-3 mb-5">Partner Login</h1>
        </div>
    </div>
          
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="panel panel-danger">

                        <div class="panel-body">
                            <%
                                //Connecting to the database
                                Connection connection = DatabaseConnection.getConnection();
                                Statement statement = connection.createStatement();
                                String credential = (String) session.getAttribute("credential");
                                //Checking creditionals whether there are null or not
                                if (credential != null) {
                                    session.removeAttribute("credential");
                            %>
                            <div class="alert alert-danger" id="danger">You have enter wrong credentials.</div>
                            <%
                                }
                            %>
                            <form action="AdminLogin" method="post">
                                <div class="form-group">
                                    <label>Email Id.:</label> <input type="text" name="email" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Password.:</label> <input type="password" name="upass" class="form-control">
                                </div>
                                <input type="submit" value="Admin Login" class="btn btn-primary">
                                <input type="reset" value="Clear" class="btn btn-danger">
                            </form>
                        </div>
                    </div>
                </div>
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