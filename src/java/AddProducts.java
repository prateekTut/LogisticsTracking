
import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

@WebServlet("/AddProducts")
public class AddProducts extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Creating session
        HttpSession session = request.getSession();
        
            try {
 
                //String imageName = null;
                String shipmentName = null;
                String routes = null;
               
                String team = null;
                String trackingInfo = null;
    
               
                shipmentName = request.getParameter("sname");
                routes = request.getParameter("routes");
               
                team = request.getParameter("teams");
                trackingInfo = request.getParameter("tracking");
                System.out.println(trackingInfo);
                
                try {
                    String id = (String) session.getAttribute("uname");
                    System.out.println(id);
                    //Querying to insert product in the table
                    int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into shipments(email,shipment_name,routes_id,team_id,tracking_info) values('" + id + "','" + shipmentName + "','" + routes + "','" + team + "','" + trackingInfo + "')");
                    //If product inserted sucessfully in the database
                    if (i > 0) {
                        String success = "Product added successfully.";
                        //Adding method in session.
                        session.setAttribute("message", success);
                        //Response send to the admin-add-product.jsp
                        response.sendRedirect("admin-add-product.jsp");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception ex) {
                //If any occur occured
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }
      
    }
}
