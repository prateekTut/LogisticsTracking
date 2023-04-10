<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
        <jsp:include page="adminHeader.jsp"></jsp:include>
        <%
            //Checking whether admin in session or not
            if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
        %>
        
        <div class="jumbotron jumbotron-fluid mb-5">
            <div class="container text-center py-5">
                <h1 class="text-primary mb-4">Safe & Faster</h1>
                <h1 class="text-white display-3 mb-5">Add Routes</h1>
            </div>
        </div>
        <div class="container-fluid py-5">
        <div class="container">
            
            
            <%
                String message = (String) session.getAttribute("message");
                String failiure = (String) session.getAttribute("failiure");
                
                if (message != null) {
                    session.removeAttribute("message");
            %>
            <div class="alert alert-danger" id="success">Route added successfully.</div>
            <%
                }else if(failiure != null) {
                    session.removeAttribute("failiure");
                %>
                  <div class="alert alert-danger" id="failiure">Route already exists.</div>
                <%
                }
            %>
            
            
           <div class="row align-items-center">
                <div class="col-md-12">
                    <div class="panel panel-info">
                        <div class="panel-body">
                            
                            
                            <form role="form" action="AddRoute" method="post">
                                <div class="form-group">
                                    <label>Enter Route Name</label> <input class="form-control" type="text" name="route" required />
                                </div>
                                
                              
                                <button type="submit" class="btn btn-success" onclick="return confirm('Are you sure Do you want to add ?');">Add Route</button>
                                <button type="reset" class="btn btn-danger">Reset</button>
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
        <%
            } else {
                response.sendRedirect("admin-login.jsp");
            }
        %>
    </body>
</html>