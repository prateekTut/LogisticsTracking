<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
         <jsp:include page="adminHeader.jsp"></jsp:include>
        <%
            //Checking whether admin in session or not
            if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
        %>
       
        <div class="jumbotron jumbotron-fluid mb-5">
            <div class="container text-center py-5">
                <h1 class="text-primary mb-4">Safe & Faster</h1>
                <h1 class="text-white display-3 mb-5">View Products</h1>
            </div>
        </div>
            <div class="content-wrapper">
                <div class="container-fluid">
             
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-success">
                  
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Shipment Name</th>
                                                    <th>Routes</th>
                                             
                                                    <th>Team</th>
                                                    <th>Tracking Info</th>
                                                   
                                                </tr>
                                            </thead>
                                        <%
                                            ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from shipments");
                                            while (rs.next()) {
                                        %>
                                        <tbody>
                                            <tr>
                                                <td><%=rs.getInt("id")%></td>
                                                <td><%=rs.getString("shipment_name")%></td>
                                               
                                                 <%
                                                    String idR = rs.getString("routes_id");
                                                    ResultSet routeName = DatabaseConnection.getResultFromSqlQuery("select route_name from routes where routes_id = '" + idR + "'");
                                                    while (routeName.next()) {
                                                %>
                                                <td><%=routeName.getString("route_name")%></td>
                                                <%
                                                    }
                                                %>
                                              
                                                
                                                <%
                                                    String idT = rs.getString("team_id");
                                                    ResultSet teamName = DatabaseConnection.getResultFromSqlQuery("select team_name from teams where team_id = '" + idT + "'");
                                                    while (teamName.next()) {
                                                %>
                                                <td><%=teamName.getString("team_name")%></td>
                                                <%
                                                    }
                                                %>
                                                
                                                
                                                <td><%=rs.getString("tracking_info")%></td>
                                               
                                                <td><a
                                                        href="admin-delete-product.jsp?id=<%=rs.getInt("id")%>"
                                                        class="btn btn-danger" onclick="return confirm('Are you sure Do you want to delete this product?');">Delete</a></td>
                                            </tr>
                                        </tbody>
                                        <%
                                            }
                                        %>
                                    </table>
                                </div>
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