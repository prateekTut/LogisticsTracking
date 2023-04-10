
import com.connection.DatabaseConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
@WebServlet("/AddRoute")
public class AddRoute extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Creating session
        HttpSession session = request.getSession();
        
            try {
 
                //String imageName = null;
                String routeName = null;
                
                routeName = request.getParameter("route");
                
                try {
                    String id = (String) session.getAttribute("uname");
                    System.out.println(id);
                    //Querying to insert product in the table
                    var resultCount = DatabaseConnection.getResultFromSqlQuery("select count(*) from routes where route_name = '" + routeName + "'");
                    resultCount.next();
                    int count = resultCount.getInt(1);
                     System.out.println(count);
                    if(count > 1){
                        String success = "Route with same name exists.";
                        //Adding method in session.
                        session.setAttribute("failiure", success);
                        //Response send to the admin-add-product.jsp
                        response.sendRedirect("admin-add-routes.jsp");
                    }else{
                        
                        int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into routes(route_name) values('" + routeName + "')");
                        //If product inserted sucessfully in the database
                        if (i > 0) {
                            String success = "Route added successfully.";
                            //Adding method in session.
                            session.setAttribute("message", success);
                            //Response send to the admin-add-product.jsp
                            response.sendRedirect("admin-add-routes.jsp");
                        
                        }
                    
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
